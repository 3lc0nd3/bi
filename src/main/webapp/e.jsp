<%@ page import="java.io.File" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="org.apache.poi.openxml4j.exceptions.InvalidFormatException" %>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFRow" %>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFCell" %>
<%@ page import="org.apache.poi.ss.usermodel.*" %>
<%@ page import="org.apache.poi.xssf.usermodel.XSSFRow" %>
<%@ page import="org.apache.poi.xssf.usermodel.XSSFCell" %>
<%@ page import="co.com.elramireza.bi.dao.HojasCalculo" %>
<%@ page import="java.util.List" %>
<%@ page import="co.com.elramireza.bi.model.ValorExcel" %><%
    Workbook wb = null;
    try {
        wb = WorkbookFactory.create(new File("/home/usuariox/prj/bi/target/bi/files/f-1470958124919.xlsx"));
        System.out.println("wb = " + wb);
        int pages = wb.getNumberOfSheets();
        System.out.println("pages = " + pages);
        Sheet mySheet = wb.getSheetAt(0);
        System.out.println("mySheet = " + mySheet);
        Iterator<Row> rowIter = mySheet.rowIterator();

        List<List<ValorExcel>> lista = HojasCalculo.getDoubleValuesFromWorkbook(wb);

        for (List<ValorExcel> valorExcels : lista) {
            for (ValorExcel valorExcel : valorExcels) {
%>
    <%=valorExcel.vDouble%>
<%
            }
        }

        /*XSSFRow row;
        XSSFCell cell;

        Iterator iterator = mySheet.rowIterator();

        while (iterator.hasNext()) {
            row=(XSSFRow) iterator.next();
            Iterator cellIterator = row.cellIterator();


            while (cellIterator.hasNext()) {
                cell = (XSSFCell) cellIterator.next();

                switch (cell.getCellType()) {
                    case Cell.CELL_TYPE_STRING:
                        System.out.print(cell.getStringCellValue());
                        break;
                    case Cell.CELL_TYPE_BOOLEAN:
                        System.out.print(cell.getBooleanCellValue());
                        break;
                    case Cell.CELL_TYPE_NUMERIC:
                        System.out.print(cell.getNumericCellValue());
                        break;
                }
                System.out.print(" - ");
            }
            System.out.println();
        }*/

    } catch (InvalidFormatException e) {
        e.printStackTrace();
    }
%>