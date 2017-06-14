package cn.edu.cup.os

import cn.edu.cup.dictionary.JsFrame
import cn.edu.cup.system.SystemChat
import cn.edu.cup.system.SystemTitle
import cn.edu.cup.system.SystemUser

import static cn.edu.cup.system.SystemChat.*

class HomeController {

    def systemCommonService
    def systemLogService
    def treeViewService

    /*
    * 列出会话对象
    * */
    def listSystemChat() {
        def systemChatList = SystemChat.list(params)
        println("${systemChatList}")
        if (request.xhr) {
            render(template: 'listSystemChat', model: [systemChatList: systemChatList])
        } else {
            respond systemChatList
        }
    }

    /*
    * 列出系统菜单
    * */
    private void listSystemMenu() {
        //根据用户的属性，设置菜单
        params.user = session.systemUser
        def systemMenuList = systemCommonService.getAllTopLevelMenus(params)
        println("${systemMenuList}")
        def subMenuItems = []
        systemMenuList.eachWithIndex { Object entry, int i ->
            def ms = []
            entry.menuItems.each() { e ->
                ms.add(e)
            }
            subMenuItems.add(ms)
        }
        //在会话中保存第二级菜单
        session.subMenuItems = subMenuItems
        //在会话中保存第一级菜单
        session.systemMenuList = systemMenuList
        println("第一次： ${systemMenuList}")

        //新思路
        def systemMenuListAtHome = []
        systemMenuList.each { item->
            def arrayItem = [:]

            def itemName = "systemMenuTree${item.id}"
            def data = item.menuItems
            //println("查询---菜单${data}")
            params.context = "hrefContext"
            params.subItems = "menuItems"
            params.attributes = "id"    //
            params.useMethod = true
            def result = treeViewService.generateNodesString(data, params, JsFrame.EasyUI)

            arrayItem.put(itemName, result)

            systemMenuListAtHome.add(arrayItem)

            //println("${arrayItem}")
        }
        //--------------------------------------------------------------------------------------------------------------
        session.systemMenuListAtHome = "${systemMenuListAtHome}"
        println("session: ${session.systemMenuListAtHome}")
    }

    /*
    * 退出登录
    * */
    def logout() {
        def pscontext = request.session.servletContext
        Map serviceMap = pscontext.getAttribute("systemUserList")
        if (session.user) {
            systemLogService.recordLog(session, request, params)
            serviceMap.remove(session.user.userName)
        }
        session.onlineCount = serviceMap.size()
        def logoutUser = session.user
        session.invalidate()
        //redirect(uri: "/")
        model: [logoutUser: logoutUser]
    }

    /*
    * 登录
    * */
    def login() {
        String userName = params.userName;
        String p = params.password.encodeAsMD5()
        def systemUser = SystemUser.findByUserNameAndPassword(userName, p)
        if (systemUser) {
            println("找到了：${systemUser}")
            session.systemUser = systemUser
            //初始化用户菜单
            listSystemMenu()
            //在会话中登记用户
            registeUserInSession(systemUser)
            systemLogService.recordLog(session, request, params)
            //设置应用程序的布局
            def layout = SystemTitle.last().applicationLayout
            if (layout) {
                session.layout = layout
            }
            redirect(uri: "/home")
        } else {
            flash.message = "用户名或密码错误！"
            redirect(uri: "${createLink(uri: '/')}")
        }
    }

    /*
    * 显示登录界面
    * */
    def loginUI() {}

    /*
    * 登记登录用户
    * */
    def registeUserInSession(user) {
        def pscontext = request.session.servletContext
        Map serviceMap = pscontext.getAttribute("systemUserList")
        if (!serviceMap) {
            def systemUserList = new HashMap()
            pscontext.putAt("systemUserList", systemUserList)
            serviceMap = systemUserList
        }
        //登记用户
        serviceMap.putAt(user.userName, session)

        systemCommonService.updateSystemUserList(request)
    }

    def index() {
        def messageToMe = SystemChat.findAllBySpeakTo("${session.systemUser}", max:5)
        println("交流信息：  ${messageToMe}")
        model:[
                messageToMe: messageToMe
        ]
    }
}
