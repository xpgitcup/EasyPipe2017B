package cn.edu.cup.os

import cn.edu.cup.dictionary.BaseDataType
import cn.edu.cup.dictionary.DataKey
import grails.converters.JSON

import javax.xml.crypto.Data

class Operation4DataController {

    /*
    * 统计
    * */
    def countDataKey() {
        def baseDataType = BaseDataType.valueOf(params.dataType)
        def value = DataKey.countByDataValueType(baseDataType)
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
        def baseDataType = BaseDataType.valueOf(params.dataType)
        def dataKeyList = DataKey.findAllByDataValueType(baseDataType, params)
        def theModel = [dataKeyList: dataKeyList]
        if (request.xhr) {
            render(template: "listDataKey", model: theModel)
        } else {
            theModel
        }
    }

    /*
    * 第一
    * 首先实现的是对DataKey的列表
    *
    * */


    def index() { }
}
