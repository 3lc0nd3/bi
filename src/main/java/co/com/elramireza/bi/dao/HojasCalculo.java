package co.com.elramireza.bi.dao;

import co.com.elramireza.bi.model.ValorExcel;
import org.apache.log4j.Logger;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * Created by usuariox on 11/08/16.
 */
public class HojasCalculo {


    private static Logger logger = Logger.getLogger(BiDAO.class);

    public static List<List<ValorExcel>> getDoubleValuesFromWorkbook(Workbook wb){

        List<List<ValorExcel>> filas = new ArrayList();

        List<ValorExcel> rowList;

        ValorExcel v;

        logger.info("wb = " + wb);
        int pages = wb.getNumberOfSheets();
        logger.info("pages = " + pages);
        Sheet mySheet = wb.getSheetAt(0);
        logger.info("mySheet = " + mySheet);
        Iterator<Row> rowIter = mySheet.rowIterator();
        XSSFRow row;
        XSSFCell cell;

        Iterator iterator = mySheet.rowIterator();

        while (iterator.hasNext()) {
            row=(XSSFRow) iterator.next();
            Iterator cellIterator = row.cellIterator();

            rowList = new ArrayList<ValorExcel>();

            while (cellIterator.hasNext()) {
                cell = (XSSFCell) cellIterator.next();
                v = new ValorExcel();

                switch (cell.getCellType()) {
                    case Cell.CELL_TYPE_STRING:
                        v.setTipo(ValorExcel.CELL_TYPE_STRING);
                        v.setvString(cell.getStringCellValue());
//                        no lo se
//                        v.vString = cell.getRichStringCellValue().toString();
                        break;
                    case Cell.CELL_TYPE_BOOLEAN:
                        v.setTipo(ValorExcel.CELL_TYPE_BOOLEAN);
                        v.setvBoolean(cell.getBooleanCellValue());
                        break;
                    case Cell.CELL_TYPE_NUMERIC:
                        if (DateUtil.isCellDateFormatted(cell)) {
//                            DateFormat sdf = new SimpleDateFormat("dd-MMM-yyyy");
//                            sdf.format(cell.getDateCellValue());
                            v.setTipo(ValorExcel.CELL_TYPE_DATE);
                            v.setvDate(cell.getDateCellValue());
                        } else {
                            v.setTipo(ValorExcel.CELL_TYPE_NUMERIC);
                            v.setvDouble(cell.getNumericCellValue());
                        }
                        break;
                }  //  END SWITCH
                rowList.add(v);
            }  //  END WHILE CELLS
            filas.add(rowList);
        }

        return filas;
    }

}
