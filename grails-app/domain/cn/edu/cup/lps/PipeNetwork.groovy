package cn.edu.cup.lps

import cn.edu.cup.lps.hydraulic.HydraulicEdge
import cn.edu.cup.lps.hydraulic.HydraulicVertex
import jxl.Cell
import jxl.Sheet
import jxl.Workbook
import jxl.write.Label
import jxl.write.WritableSheet
import jxl.write.WritableWorkbook

class PipeNetwork {

    String name

    static hasMany = [hydraulicVertexes: HydraulicVertex]

    static constraints = {
        name(unique: true)
        //hydraulicVertexes(nullable: true)
        //hydraulicEdges(nullable: true)
        hydraulicVertexes sort: "id"
    }

    String toString() {
        return "${name}/(${hydraulicVertexes?.size()})"
    }

    //==================================================================================================================

    /*
    * 获取边的数量
    * */

    def edgesCount() {
        return edges().size()
    }

    /*
    * 获取当前图的边
    * */

    def edges() {
        def es = []
        hydraulicVertexes.each { e ->
            //es.addAll(HydraulicEdge.findAllByStart(e))
            //es.addAll(HydraulicEdge.findAllByEnd(e))
            def fes = HydraulicEdge.findAllByStart(e)
            fes.each { ee ->
                addUp(es, ee)
            }

            def fee = HydraulicEdge.findAllByEnd(e)
            fee.each { ee ->
                addUp(es, ee)
            }
        }
        println("${es}")
        return es
    }

    /*
    * 增加边，并判断是否重复
    * */

    private void addUp(List<HydraulicEdge> es, HydraulicEdge ee) {
        if (!es.contains(ee)) {
            es.add(ee)
        }
    }

    /*
    * 从Excel文件中导入
    * */

    def importFromExcel(fileName) {
        try {
            File excelFile = new File(fileName)
            if (excelFile) {
                Workbook book = Workbook.getWorkbook(excelFile)
                Sheet sheet = book.getSheet(0)
                //------------------------------------------------------------------------------------------------------
                def m = sheet.rows
                //------------------------------------------------------------------------------------------------------
                Cell[] cells = new Cell[3]
                for (int ii = 1; ii < m; ii++) {
                    for (int j=0; j<3; j++) {
                        cells[j] = sheet.getCell(j, ii)
                    }
                    def n = cells[0].getContents()
                    def mi = Double.parseDouble(cells[1].getContents())
                    def ev = Double.parseDouble(cells[2].getContents())
                    def v = new HydraulicVertex(name: n, mileage: mi, elevation: ev, pipeNetwork: this)
                    v.save(true)
                }
                //------------------------------------------------------------------------------------------------------
                book.close()
            }
        } catch (Exception e) {
            println "importExcelFile error: ${e}";
        }
    }

    /*
    * 导出到Excel文件
    * */

    def exportPipeNetworkToExcel(rootPath) {

        def fileName = rootPath + "pipeNetworks/${this.name}.xls"
        try {
            //  打开文件
            File file = new File(fileName)
            WritableWorkbook book = Workbook.createWorkbook(file);
            //  生成名为“第一页”的工作表，参数0表示这是第一页
            WritableSheet sheet = book.createSheet("${this.name}", 0);

            sheet.addCell(new Label(0, 0, "站点/节点"))
            sheet.addCell(new Label(1, 0, "里程（km）"))
            sheet.addCell(new Label(2, 0, "高程（m）"))

            Label label
            this.hydraulicVertexes.eachWithIndex() { e, i ->
                sheet.addCell(new Label(0, i + 1, e.name));
                sheet.addCell(new Label(1, i + 1, e.mileage));
                sheet.addCell(new Label(2, i + 1, e.elevation));
            }

            //  写入数据并关闭文件
            book.write();
            book.close();

        } catch (Exception e) {
            println "exportExcelFile error: ${e}";
        }
        return fileName
    }

}
