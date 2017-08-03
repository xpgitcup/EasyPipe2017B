package cn.edu.cup.os4lps

import cn.edu.cup.lps.HydraulicProject
import cn.edu.cup.lps.PipeNetwork
import cn.edu.cup.lps.hydraulic.HydraulicVertex
import grails.converters.JSON
import grails.transaction.Transactional

class Operation4PipeSimulationController {

    //HydraulicVertex===================================================================================================
    /*
    * 统计记录个数
    * */
    def countHydraulicVertex() {
        def count = HydraulicVertex.count()    //这是必须调整的
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
    def listHydraulicVertex() {
        def hydraulicVertexList = HydraulicVertex.list(params)
        if (request.xhr) {
            render(template: 'listHydraulicVertex', model: [hydraulicVertexList: hydraulicVertexList])
        } else {
            respond hydraulicVertexList
        }
    }

    /*
    * 创建对象
    * */

    def createHydraulicVertex() {
        def newHydraulicVertex = new HydraulicVertex()
        if (request.xhr) {
            render(template: 'createHydraulicVertex', model: [hydraulicVertex: newHydraulicVertex])
        } else {
            respond newHydraulicVertex
        }
    }

    /*
    * 保存对象
    * */

    @Transactional
    def deleteHydraulicVertex(HydraulicVertex hydraulicVertex) {
        hydraulicVertex.delete()
        redirect(action: 'index')
    }

    /*
    * 保存对象
    * */

    @Transactional
    def updateHydraulicVertex(HydraulicVertex hydraulicVertex) {
        println("准备更新：${hydraulicVertex}")
        hydraulicVertex.save flush: true
        redirect(action: 'index')
    }

    /*
    * 编辑对象
    * */

    def editHydraulicVertex(HydraulicVertex hydraulicVertex) {
        if (request.xhr) {
            render(template: 'editHydraulicVertex', model: [hydraulicVertex: hydraulicVertex])
        } else {
            respond hydraulicVertex
        }
    }

    //PipeNetwork-------------------------------------------------------------------------------------------------------

    /*
    * 将管道显示为Json格式
    * */
    def showPipeNetworkAsJson(PipeNetwork pipeNetwork) {
        def p = [:]
        p.put("nanme", pipeNetwork.name)
        p.put("nodes", pipeNetwork.hydraulicVertexes)
        p.put("links", pipeNetwork.edges());
        if (request.xhr) {
            render p as JSON
        } else {
            model:[pipeNetwork: p]
        }
    }

    /*
    * 统计记录个数
    * */
    def countPipeNetwork() {
        def count = PipeNetwork.count()    //这是必须调整的
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
    def listPipeNetwork() {
        def pipeNetworkList = PipeNetwork.list(params)
        if (request.xhr) {
            render(template: 'listPipeNetwork', model: [pipeNetworkList: pipeNetworkList])
        } else {
            respond pipeNetworkList
        }
    }

    /*
    * 创建对象
    * */

    def createPipeNetwork(PipeNetwork pipeNetwork) {
        def newPipeNetwork = new PipeNetwork()
        if (request.xhr) {
            render(template: 'createPipeNetwork', model: [pipeNetwork: newPipeNetwork])
        } else {
            respond newPipeNetwork
        }
    }

    /*
    * 保存对象
    * */

    @Transactional
    def deletePipeNetwork(PipeNetwork pipeNetwork) {
        pipeNetwork.delete()
        redirect(action: 'index')
    }

    /*
    * 保存对象
    * */

    @Transactional
    def updatePipeNetwork(PipeNetwork pipeNetwork) {
        println("准备更新：${pipeNetwork}")
        pipeNetwork.save flush: true
        redirect(action: 'index')
    }

    /*
    * 编辑对象
    * */

    def editPipeNetwork(PipeNetwork pipeNetwork) {
        if (request.xhr) {
            render(template: 'editPipeNetwork', model: [pipeNetwork: pipeNetwork])
        } else {
            respond pipeNetwork
        }
    }

    //HydrauliProject---------------------------------------------------------------------------------------------------
    /*
    * 统计记录个数
    * */
    def countHydraulicProject() {
        def count = HydraulicProject.count()    //这是必须调整的
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
    def listHydraulicProject() {
        def hydraulicProjectList = HydraulicProject.list(params)
        if (request.xhr) {
            render(template: 'listHydraulicProject', model: [hydraulicProjectList: hydraulicProjectList])
        } else {
            respond hydraulicProjectList
        }
    }

    /*
    * 创建对象
    * */

    def createHydraulicProject() {
        def newHydraulicProject = new HydraulicProject()
        if (request.xhr) {
            render(template: 'createHydraulicProject', model: [hydraulicProject: newHydraulicProject])
        } else {
            respond newHydraulicProject
        }
    }

    /*
    * 保存对象
    * */

    @Transactional
    def deleteHydraulicProject(HydraulicProject hydraulicProject) {
        hydraulicProject.delete()
        redirect(action: 'index')
    }

    /*
    * 保存对象
    * */

    @Transactional
    def updateHydraulicProject(HydraulicProject hydraulicProject) {
        println("准备更新：${hydraulicProject}")
        hydraulicProject.save flush: true
        redirect(action: 'index')
    }

    /*
    * 编辑对象
    * */

    def editHydraulicProject(HydraulicProject hydraulicProject) {
        if (request.xhr) {
            render(template: 'editHydraulicProject', model: [hydraulicProject: hydraulicProject])
        } else {
            respond hydraulicProject
        }
    }

    def index() { }
}
