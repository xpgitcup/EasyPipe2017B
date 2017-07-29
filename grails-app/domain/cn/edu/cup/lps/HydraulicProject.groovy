package cn.edu.cup.lps

class HydraulicProject {

    String name

    PipeNetwork pipeNetwork             //管网
    BoundaryCondition boundaryCondition //边界条件
    InitialCondition initialCondition   //初始条件
    EventSequence eventSequence         //事件序列

    static constraints = {
    }

    String toString() {
        return "${name}[${pipeNetwork}.${eventSequence}]"
    }

}
