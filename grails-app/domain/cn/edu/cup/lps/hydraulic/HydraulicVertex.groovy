package cn.edu.cup.lps.hydraulic

import cn.edu.cup.lps.PipeNetwork

class HydraulicVertex {

    String name

    static belongsTo = [pipeNetwork: PipeNetwork]

    static constraints = {
    }

    String toString() {
        return "${name}"
    }
}
