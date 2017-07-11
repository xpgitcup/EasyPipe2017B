package cn.edu.cup.os

import cn.edu.cup.dictionary.BaseDataType
import cn.edu.cup.dictionary.DataKey
import grails.converters.JSON

import javax.xml.crypto.Data

class Operation4DataController {

    /*
    * 释放
    * */
    def clearDataKey(DataKey dataKey) {
        switch (dataKey.dataValueType) {
            case BaseDataType.project:
                session.removeAttribute("currentProject")
                session.removeAttribute("currentProjectCase")
                session.removeAttribute("currentDataModel")
                break
            case BaseDataType.projectCase:
                session.removeAttribute("currentProjectCase")
                break
            case BaseDataType.dataModel:
                session.removeAttribute("currentDataModel")
                break
        }
        redirect(action: "index")
    }

    /*
    * 选择
    * */
    def selectDataKey(DataKey dataKey) {
        switch (dataKey.dataValueType) {
            case BaseDataType.project:
                session.currentProject = dataKey
                session.removeAttribute("currentProjectCase")
                session.removeAttribute("currentDataModel")
                break
            case BaseDataType.projectCase:
                if (dataKey.upKey.dataValueType == BaseDataType.project) {
                    session.currentProject = dataKey.upKey
                    session.currentProjectCase = dataKey
                }
                break
            case BaseDataType.dataModel:
                if (dataKey.upKey.dataValueType == BaseDataType.project) {
                    session.currentProject = dataKey.upKey
                    session.currentDataModel = dataKey
                }
                break
        }
        redirect(action: "index")
    }

    /*
    * 统计
    * */

    def countDataKey() {
        def value = DataKey.count()

        if (params.dataType) {
            def baseDataType = BaseDataType.valueOf(params.dataType)
            value = DataKey.countByDataValueType(baseDataType)

            switch (baseDataType) {
                case BaseDataType.project:
                    break;
                case BaseDataType.projectCase:
                    if (session.currentProject) {
                        value = DataKey.countByDataValueTypeAndUpKey(baseDataType, session.currentProject)
                    }
                    break;
                case BaseDataType.dataModel:
                    if (session.currentProject) {
                        value = DataKey.countByDataValueTypeAndUpKey(baseDataType, session.currentProject)
                    }
                    break;
            }
        }


        def result = [count: value]
        if (request.xhr) {
            render result as JSON
        } else {
            result
        }
    }

    /*
    * 查询
    * */

    def listDataKey() {
        //println("${params}")
        def dataKeyList = DataKey.list(params)

        if (params.dataType) {
            def baseDataType = BaseDataType.valueOf(params.dataType)
            dataKeyList = DataKey.findAllByDataValueType(baseDataType, params)

            switch (baseDataType) {
                case BaseDataType.project:
                    break;
                case BaseDataType.projectCase:
                    if (session.currentProject) {
                        dataKeyList = DataKey.findAllByDataValueTypeAndUpKey(baseDataType, session.currentProject)
                    }
                    break;
                case BaseDataType.dataModel:
                    if (session.currentProject) {
                        dataKeyList = DataKey.findAllByDataValueTypeAndUpKey(baseDataType, session.currentProject)
                    }
                    break;
            }
        }

        def theModel = [dataKeyList: dataKeyList]
        if (request.xhr) {
            render(template: "listDataKey", model: theModel)
        } else {
            theModel
        }
    }

    def index() {}
}
