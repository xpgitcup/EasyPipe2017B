package cn.edu.cup.lps.hydraulic

import cn.edu.cup.lps.PipeNetwork

class HydraulicEdge implements Serializable {

    private static final long serialVersionUID = 1

    HydraulicVertex start
    HydraulicVertex end

    static mapping = {
        id composite: ['start', 'end']
    }

    static constraints = {
    }

    String toString() {
        return "${start}-${end}"
    }
}
