package co.com.elramireza.bi.dao;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.directwebremoting.WebContext;
import org.directwebremoting.WebContextFactory;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.dao.support.DataAccessUtils;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.hibernate.criterion.Order;
import co.com.elramireza.bi.model.*;

import javax.servlet.ServletContext;
import java.io.*;
import java.util.Iterator;
import java.util.List;

/**
 * Created by Edward L. Ramirez A.
 * cel 300 554 3367
 * email elramireza@gmail.com
 * User: usuariox
 * Date: Sep 26, 2012
 * Time: 3:43:06 PM
 */
@SuppressWarnings({
        "deprecation", "unchecked"
})
public class BiDAO extends HibernateDaoSupport{

    public String test(String tmp){
        logger.info("tmp = " + tmp);
        return "Hola: " + tmp;
    }


    public Usuario getUsuario(int id){
        return (Usuario) getHibernateTemplate().get(Usuario.class, id);
    }

    public List<I1> getI1List(){
        return getHibernateTemplate().find("from I1 order by id ");
    }

    public I2 getI2(int year,
                    String typeEstudent,
                    String faculty){
        Object o[] = {
                year,
                typeEstudent,
                faculty
        };
        List<I2> i2List = getHibernateTemplate().find(
                "from I2 where year = ? and typeEstudent = ? and faculty = ?", o);
        if(i2List.size()>0){
            return i2List.get(0);
        } else {
            return null;
        }
    }

    public List getYearsI2(){
        List list = getHibernateTemplate().find("select distinct year from I2");
        logger.debug("list = " + list);
        return list;
    }

    public List getTypeEstudentI2(){
        return getHibernateTemplate().find("select distinct typeEstudent from I2");
    }

    public List getFacultyI2(){
        return getHibernateTemplate().find("select distinct faculty from I2");
    }

    public List getInstitutesO4(){
        return getHibernateTemplate().find("select distinct institution from O4Calculado order by institution ");
    }

    public List getYearsO4(){
        return getHibernateTemplate().find("select distinct year from O4Calculado order by year ");
    }

    public List<O4Calculado> getO4CalculadoValues(String institutes[], int year){
        DetachedCriteria criteria = DetachedCriteria.forClass(O4Calculado.class);
        criteria.add(Restrictions.in("institution", institutes));
        criteria.add(Restrictions.eq("year", year));
        criteria.addOrder(Order.asc("institution"));
        List<O4Calculado> calculados = getHibernateTemplate().findByCriteria(criteria);
//        logger.info("calculados.size() = " + calculados.size());
        return calculados;
    }

    public List getYearsI6(){
        return getHibernateTemplate().find("select distinct year from I6 order by year ");
    }

    public List getInstitutesI6(){
        return getHibernateTemplate().find("select distinct institution from I6 order by institution ");
    }

    public List getYearsI7(){
        return getHibernateTemplate().find("select distinct year from I7 order by year ");
    }

    public List getInstitutesI7(){
        return getHibernateTemplate().find("select distinct institution from I7 order by institution ");
    }

    public List<I6> getI6Values(String institutes[], int year){
        DetachedCriteria criteria = DetachedCriteria.forClass(I6.class);
        criteria.add(Restrictions.in("institution", institutes));
        criteria.add(Restrictions.eq("year", year));
        criteria.addOrder(Order.asc("institution"));
        List<I6> values = getHibernateTemplate().findByCriteria(criteria);
//        logger.info("values.size() = " + values.size());
        return values;
    }

    public List<I7> getI7Values(String institutes[], int year){
        DetachedCriteria criteria = DetachedCriteria.forClass(I7.class);
        criteria.add(Restrictions.in("institution", institutes));
        criteria.add(Restrictions.eq("year", year));
        criteria.addOrder(Order.asc("institution"));
        List<I7> values = getHibernateTemplate().findByCriteria(criteria);
//        logger.info("values.size() = " + values.size());
        return values;
    }

    public List<I3Calculado> getI3Calculados(){
        return getHibernateTemplate().find("from I3Calculado ");
    }

    public List<I4> getI4Values(){
        return getHibernateTemplate().find("from I4 ");
    }

    public List<I8Calculado> i8Calculados(){
        return getHibernateTemplate().find("from I8Calculado ");
    }

    public I8Calculado getI8Calculado(int year){
        return (I8Calculado) DataAccessUtils.uniqueResult(getHibernateTemplate().find("from I8Calculado where AYear = ?", year));
    }

    public List<List<ValorExcel>> subeArchivoExcel(byte[] archivoExcel){
        try {
            WebContext wctx = WebContextFactory.get();
            ServletContext context = wctx.getServletContext();
            String path = context.getRealPath("/files");

            String fileName = "f-"+System.currentTimeMillis()+".xlsx";
            String filePath = path + "/" + fileName;

            FileOutputStream outputStream = new FileOutputStream(filePath);
            outputStream.write(archivoExcel);
            outputStream.close();

            Workbook wb = null;
            try {
                wb = WorkbookFactory.create(new File(filePath));
                List<List<ValorExcel>> filas = HojasCalculo.getDoubleValuesFromWorkbook(wb);

                wctx.getSession().setAttribute("filasExcel",filas);

                return filas;

            } catch (InvalidFormatException e) {
                e.printStackTrace();
            }
//            fileIn.close();
//            getHibernateTemplate().update(tipoPremio);
            return null;
        } catch (IOException e) {
            e.printStackTrace();
            logger.debug(e.getMessage());
            return null;
        }
    }

    public MaestroIndicadorEntity getMaestroIndicador(int idMaestroIndicadorEntity){
        MaestroIndicadorEntity maestroIndicadorEntity =
                (MaestroIndicadorEntity) getHibernateTemplate().get(
                        MaestroIndicadorEntity.class, idMaestroIndicadorEntity
                );
        return maestroIndicadorEntity;
    }

    public Indicador getIndicador(int mes, int idIndicador){
        Object o[] = {
                mes,
                idIndicador
        };

        List<Indicador> indicadors = getHibernateTemplate().find(
                "from Indicador where fecha = ? and maestroIndicador.id = ?",
                o
        );
        if(indicadors.size()>0){
            return indicadors.get(0);
        } else {
            return null;
        }
    }
}
