package cn.edu.cup.os

import cn.edu.cup.physical.PhysicalQuantity
import cn.edu.cup.system.SystemUser
import grails.converters.JSON
import grails.transaction.Transactional

@Transactional(readOnly = true)
class Operation4PhysicalController {

    /*
    * 统计记录个数
    * */
    def countPhysicalQuantity() {
        def count = PhysicalQuantity.count()    //这是必须调整的
        println("统计结果：${count}")
        def result = [count: count]
        if (request.xhr) {
            render result as JSON
        } else {
            result
        }
    }

    /*
    * 列出对象
    * */
    def listPhysicalQuantity() {
        def physicalQuantityList = PhysicalQuantity.list(params)
        if (request.xhr) {
            render(template: 'listPhysicalQuantity', model: [physicalQuantityList: physicalQuantityList])
        } else {
            respond physicalQuantityList
        }
    }

    /*
    * 创建对象
    * */
    def createPhysicalQuantity(PhysicalQuantity physicalQuantity) {
        def newPhysicalQuantity = new PhysicalQuantity()
        if (request.xhr) {
            render(template: 'createPhysicalQuantity', model: [physicalQuantity: newPhysicalQuantity])
        } else {
            respond newPhysicalQuantity
        }
    }

    /*
    * 保存对象
    * */
    @Transactional
    def deletePhysicalQuantity(PhysicalQuantity physicalQuantity) {
        physicalQuantity.delete()
        redirect(action: 'index')
    }

    /*
    * 保存对象
    * */
    @Transactional
    def updatePhysicalQuantity(PhysicalQuantity physicalQuantity) {
        println("准备更新：${physicalQuantity}")
        physicalQuantity.save flush:true
        redirect(action: 'index')
    }

    /*
    * 编辑对象
    * */
    def editPhysicalQuantity(PhysicalQuantity physicalQuantity) {
        if (request.xhr) {
            render(template: 'editPhysicalQuantity', model: [PhysicalQuantity: physicalQuantity])
        } else {
            respond physicalQuantity
        }
    }


    /*
    * 获取当前id对应的对象
    * */
    def getPhysicalQuantity(PhysicalQuantity physicalQuantity) {
        def theModel = [PhysicalQuantity: physicalQuantity]
        println("${physicalQuantity}")
        if (request.xhr) {
            render(template: "showPhysicalQuantity", model:theModel)
        } else {
            theModel
        }
    }

    def index() { }
}

