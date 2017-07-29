package cn.edu.cup.lps

import cn.edu.cup.lps.hydraulic.HydraulicEdge
import cn.edu.cup.lps.hydraulic.HydraulicVertex

class PipeNetwork {

    String name

    static hasMany = [hydraulicVertexes: HydraulicVertex, hydraulicEdges: HydraulicEdge]

    static constraints = {
        name(unique: true)
        //hydraulicVertexes(nullable: true)
        //hydraulicEdges(nullable: true)
    }

    String toString() {
        return "${name}/(${hydraulicVertexes?.size()})"
    }
}
