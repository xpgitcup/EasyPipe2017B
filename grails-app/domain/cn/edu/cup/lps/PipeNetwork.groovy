package cn.edu.cup.lps

import cn.edu.cup.lps.hydraulic.HydraulicEdge
import cn.edu.cup.lps.hydraulic.HydraulicVertex

class PipeNetwork {

    String name

    static hasMany = [hydraulicVertexes: HydraulicVertex]

    static constraints = {
        name(unique: true)
        //hydraulicVertexes(nullable: true)
        //hydraulicEdges(nullable: true)
    }

    String toString() {
        return "${name}/(${hydraulicVertexes?.size()})"
    }

    //==================================================================================================================
    def edgesCount() {
        def c = 0
        hydraulicVertexes.each { e->
            c += HydraulicEdge.countByStart(e)
            c += HydraulicEdge.countByEnd(e)
        }
        return c
    }

    def edges() {
        def es = []
        hydraulicVertexes.each { e->
            es.addAll(HydraulicEdge.findAllByStart(e))
            //es.addAll(HydraulicEdge.findAllByEnd(e))
        }
        println("${es}")
        return es
    }
}
