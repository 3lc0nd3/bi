package co.com.elramireza.bi.model;

import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.openxmlformats.schemas.spreadsheetml.x2006.main.CTCell;

import java.util.Date;

/**
 * Created by usuariox on 11/08/16.
 */
public class ValorExcel {

    public final static int CELL_TYPE_NUMERIC = 0;
    public final static int CELL_TYPE_STRING = 1;
    public final static int CELL_TYPE_FORMULA = 2;
    public final static int CELL_TYPE_BLANK = 3;
    public final static int CELL_TYPE_BOOLEAN = 4;
    public final static int CELL_TYPE_ERROR = 5;
    public final static int CELL_TYPE_DATE = 6;

    private double vDouble;
    private Date vDate;
    private String vString;
    private boolean vBoolean;

    private int tipo;

    public double getvDouble() {
        return vDouble;
    }

    public void setvDouble(double vDouble) {
        this.vDouble = vDouble;
    }

    public Date getvDate() {
        return vDate;
    }

    public void setvDate(Date vDate) {
        this.vDate = vDate;
    }

    public String getvString() {
        return vString;
    }

    public void setvString(String vString) {
        this.vString = vString;
    }

    public boolean isvBoolean() {
        return vBoolean;
    }

    public void setvBoolean(boolean vBoolean) {
        this.vBoolean = vBoolean;
    }

    public int getTipo() {
        return tipo;
    }

    public void setTipo(int tipo) {
        this.tipo = tipo;
    }
}
