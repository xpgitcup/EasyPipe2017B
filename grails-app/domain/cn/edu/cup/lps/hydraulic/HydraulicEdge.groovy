package cn.edu.cup.lps.hydraulic

class HydraulicEdge {

    HydraulicVertex start
    HydraulicVertex end


    static constraints = {
    }

    String toString() {
        return "${start}-${end}"
    }
}
