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
import org.springframework.dao.DataAccessException;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.dao.support.DataAccessUtils;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.hibernate.criterion.Order;
import co.com.elramireza.bi.model.*;

import javax.servlet.ServletContext;
import java.io.*;
import java.util.ArrayList;
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

    private OracleDao oracleDAO;

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

    public int saveIndicador(Indicador indicador){
        Indicador indicadorOld = getIndicador(indicador.getFecha(), indicador.getMaestroIndicador().getId());
//        System.out.println("indicadorOld = " + indicadorOld);
//        System.out.println(indicador.getVersion());
//        logger.info("indicador.getAceptacion() = " + indicador.getAceptacion());
//        logger.info("indicador.getVariable1() = " + indicador.getVariable1());
//        logger.info("indicador.getVariable2() = " + indicador.getVariable2());
//        logger.info("indicador.getId() = " + indicador.getId());
        try {
            if(indicadorOld==null){
                //  NUEVO
                indicador.setIndicador(indicador.getVariable2()/indicador.getVariable1());
                logger.info("indicador.getIndicador() = " + indicador.getIndicador());
                getHibernateTemplate().save(indicador);
                return 1;
            } else {
                //  VIEJO
                indicadorOld.setAceptacion(indicador.getAceptacion());
                indicadorOld.setVariable1(indicador.getVariable1());
                indicadorOld.setVariable2(indicador.getVariable2());
                indicadorOld.setVersion("4");
                indicadorOld.setIndicador(indicador.getVariable2()/indicador.getVariable1());
                getHibernateTemplate().update(indicadorOld);
                return 1;
            }
        } catch (DataAccessException e) {
            e.printStackTrace();
            return 0;
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }

    public void setOracleDAO(OracleDao oracleDAO) {
        this.oracleDAO = oracleDAO;
    }

    public OracleDao getOracleDAO() {
        return oracleDAO;
    }


    public List<Indicador> getValoresIndicador1(){
        MaestroIndicadorEntity maestroIndicador = getMaestroIndicador(1);
        List<Object[]> valores = oracleDAO.getHibernateTemplate().find(
                "select i01n.n01Aaaamm, i01n.n01Valor, i01d.d01Valor " +
                        " from Ind01N AS i01n, Ind01D as i01d " +
                        " where i01n.n01Aaaamm = i01d.d01Aaaamm"
        );
        List<Indicador> indicadores = new ArrayList<Indicador>();
        Indicador indicador;
        for (Object[] objects: valores) {
            indicadores.add(poblateIndicadorFromObjetcs(objects, maestroIndicador));
        }
        return indicadores;
    }

    public List<Indicador> getValoresIndicador2(){
        MaestroIndicadorEntity maestroIndicador = getMaestroIndicador(2);
        List<Object[]> valores = oracleDAO.getHibernateTemplate().find(
                "select numerador.n02Aaaamm, numerador.n02Valor, denominador.d02Valor " +
                        " from Ind02N AS numerador, Ind02D as denominador " +
                        " where numerador.n02Aaaamm = denominador.d02Aaaamm"
        );
        List<Indicador> indicadores = new ArrayList<Indicador>();
        Indicador indicador;
        for (Object[] objects: valores) {
            indicadores.add(poblateIndicadorFromObjetcs(objects, maestroIndicador));
        }
        return indicadores;
    }

    public List<Indicador> getValoresIndicador6(){
        MaestroIndicadorEntity maestroIndicador = getMaestroIndicador(6);
        List<Object[]> valores = oracleDAO.getHibernateTemplate().find(
                "select numerador.n06Aaaamm, numerador.n06Valor, denominador.d06Valor " +
                        " from Ind06N AS numerador, Ind06D as denominador " +
                        " where numerador.n06Aaaamm = denominador.d06Aaaamm"
        );
        List<Indicador> indicadores = new ArrayList<Indicador>();
        for (Object[] objects: valores) {
            indicadores.add(poblateIndicadorFromObjetcs(objects, maestroIndicador));
        }
        return indicadores;
    }

    public List<Indicador> getValoresIndicador19(){
        MaestroIndicadorEntity maestroIndicador = getMaestroIndicador(19);
        List<Object[]> valores = oracleDAO.getHibernateTemplate().find(
                "select numerador.n19Aaaamm, numerador.n19Valor, denominador.d19Valor " +
                        " from Ind19N AS numerador, Ind19D as denominador " +
                        " where numerador.n19Aaaamm = denominador.d19Aaaamm"
        );
        List<Indicador> indicadores = new ArrayList<Indicador>();
        for (Object[] objects: valores) {
            indicadores.add(poblateIndicadorFromObjetcs(objects, maestroIndicador));
        }
        return indicadores;
    }

    public List<Indicador> getValoresIndicador8(){
        MaestroIndicadorEntity maestroIndicador = getMaestroIndicador(8);
        List<Object[]> valores = oracleDAO.getHibernateTemplate().find(
                "select numerador.n08Aaaamm, numerador.n08Valor, denominador.d08Valor " +
                        " from Ind08N AS numerador, Ind08D as denominador " +
                        " where numerador.n08Aaaamm = denominador.d08Aaaamm"
        );
        List<Indicador> indicadores = new ArrayList<Indicador>();
        for (Object[] objects: valores) {
            indicadores.add(poblateIndicadorFromObjetcs(objects, maestroIndicador));
        }
        return indicadores;
    }

    public Indicador poblateIndicadorFromObjetcs(Object[] objects,
                                                 MaestroIndicadorEntity maestroIndicador){
        Indicador indicador;
        indicador = new Indicador();
        indicador.setMaestroIndicador(maestroIndicador);
        indicador.setFecha((Integer) objects[0]);
        indicador.setVariable1((Integer) objects[1]);
        indicador.setVariable2((Integer) objects[2]);
        if (indicador.getVariable2()!=0) {
            indicador.setIndicador(indicador.getVariable1() / indicador.getVariable2());
        } else {
            indicador.setIndicador(0);
        }
        indicador.setAceptacion(maestroIndicador.getAceptacion());
        return indicador;
    }

}
