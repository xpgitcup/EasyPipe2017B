package cn.edu.cup.os

import easypipe2017b.Application


class OperationSystemInterceptor {

    def systemCommonService
    def systemLogService

    def OperationSystemInterceptor() {
        def m = matchAll().excludes(controller: "home")
        m.excludes(controller: "systemLog")
        //m.excludes(controller: "operation4SystemLog")
        m.excludes(uri: "/EasyPipe2017B/")  //这一句是关键。发布后显示主页的关键
        m.excludes(uri: "/")                    //开发期间显示主页
    }

    boolean before() {
        println("${controllerName}，动作：${actionName}.之前...")
        if (!session.systemUser) {
            println("跳转...")
            redirect(controller: "home", action: "loginUI")
        } else {
            systemCommonService.updateSystemUserList(request)
            if (params.size()>0) {
                println("记录日志...")
                systemLogService.recordLog(session, request, params)
            }
        }
        //继续执行原来的命令
        true
    }

    boolean after() {
        println("控制器：${controllerName}，动作：${actionName}.之后...")
        true
    }

    void afterView() {
        // no-op
    }
}
