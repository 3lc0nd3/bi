package co.com.elramireza.bi.dao;

import co.com.elramireza.bi.modelOracle.Ind01N;
import co.com.elramireza.bi.modelOracle.Ind02N;
import co.com.elramireza.bi.modelOracle.Ind11D;
import co.com.elramireza.bi.modelOracle.Ind25D;
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
import org.hibernate.*;
import org.springframework.dao.DataAccessException;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.dao.support.DataAccessUtils;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.hibernate.criterion.Order;
import co.com.elramireza.bi.model.*;

import javax.servlet.ServletContext;
import java.io.*;
import java.sql.SQLException;
import java.sql.Timestamp;
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

    public Usuario getUsuarioFromLP(String email, String password){
        Object o[] = {
                email,
                password
        };

        List<Usuario> usuarios = getHibernateTemplate().find(
                "from Usuario where email = ? and " +
                        " password = ?",
                o
        );
        if(usuarios.size()>0){
            return usuarios.get(0);
        } else {
            return null;
        }
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

    public Indicador getIndicador(int mesdia,
                                  int idIndicador){
        Object o[] = {
                mesdia,
                idIndicador
        };

        List<Indicador> indicadors = getHibernateTemplate().find(
                "from Indicador where fechaDia = ? and maestroIndicador.id = ?",
                o
        );
        if(indicadors.size()>0){
            return indicadors.get(0);
        } else {
            return null;
        }
    }

    public int saveIndicador(Indicador indicador){
        Indicador indicadorOld = getIndicador(indicador.getFechaDia(), indicador.getMaestroIndicador().getId());
//        System.out.println("indicadorOld = " + indicadorOld);
//        System.out.println(indicador.getVersion());
//        logger.info("indicador.getAceptacion() = " + indicador.getAceptacion());
//        logger.info("indicador.getVariable1() = " + indicador.getVariable1());
//        logger.info("indicador.getVariable2() = " + indicador.getVariable2());
//        logger.info("indicador.getId() = " + indicador.getId());
        try {
            if(indicadorOld==null){
                //  NUEVO
                System.out.println("nuevo");
                indicador.setIndicador(indicador.getVariable2()/indicador.getVariable1());
                logger.info("indicador.getIndicador() = " + indicador.getIndicador());
                getHibernateTemplate().save(indicador);
                return 1;
            } else {
                //  VIEJO

                System.out.println("viejo");
                indicadorOld.setAceptacion(indicador.getAceptacion());
                indicadorOld.setVariable1(indicador.getVariable1());
                indicadorOld.setVariable2(indicador.getVariable2());
                indicadorOld.setVersion("1");
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
                        " where i01n.n01Aaaamm = i01d.d01Aaaamm " +
                        " order by i01n.n01Aaaamm "
        );
        List<Indicador> indicadores = new ArrayList<Indicador>();
        Indicador indicador;
        for (Object[] objects: valores) {
            indicadores.add(poblateIndicadorFromObjetcs(objects, maestroIndicador));
        }

        return indicadores;
    }


    public List<Indicador> getValoresIndicador2_oldYANO(){
        MaestroIndicadorEntity maestroIndicador = getMaestroIndicador(2);
        List<Object[]> valores = oracleDAO.getHibernateTemplate().find(
                "select numerador.n02Aaaamm, numerador.n02Valor, denominador.d02Valor " +
                        " from Ind02N AS numerador, Ind02D as denominador " +
                        " where numerador.n02Aaaamm = denominador.d02Aaaamm " +
                        " order by numerador.n02Aaaamm"
        );
        List<Indicador> indicadores = new ArrayList<Indicador>();
        Indicador indicador;
        for (Object[] objects: valores) {
            indicadores.add(poblateIndicadorFromObjetcs(objects, maestroIndicador));
        }
        return indicadores;
    }



    /*public List<Indicador> getValoresIndicador2_Mixto(){
        final MaestroIndicadorEntity maestroIndicador = getMaestroIndicador(2);

        borroIndicadorOracleTemporal(maestroIndicador.getId());

        List<Ind02N> numeradores = oracleDAO.getHibernateTemplate().find(
                "from Ind02N "
        );
        for (Ind02N ind02N : numeradores) {
            TempIndicador tempIndicador = new TempIndicador();

            tempIndicador.setIdIndicador(maestroIndicador.getId());
            tempIndicador.setFecha(ind02N.getN02Aaaamm());
            tempIndicador.setValor(ind02N.getN02Valor());

            getHibernateTemplate().save(tempIndicador);
        }

//        return getIndicadoresCombinados(maestroIndicador);
        Object o[] = {
                maestroIndicador.getId(),
                maestroIndicador.getId()
        };
        List<Object[]> valores = getHibernateTemplate().find(
                "select numerador.fecha, numerador.valor, denominador.d " +
                        " from IndicadorAgrupadoMes AS denominador, TempIndicador as numerador " +
                        " where " +
                        " numerador.idIndicador = ? and denominador.idIndicador = ? " +
                        " and numerador.fecha = denominador.fecha " +
                        " order by denominador.fecha ",
                o
        );
//        System.out.println("valores.size() = " + valores.size());
        List<Indicador> indicadores = new ArrayList<Indicador>();
        for (Object[] objects: valores) {
            indicadores.add(poblateIndicadorFromObjetcs(objects, maestroIndicador));
        }

        return indicadores;
    }*/

    public List<Indicador> getValoresIndicador3_oldYano(){
        /**
         *  denominador del 12 es numerador del 3
         * pero el denominador del 12 es el numerador del Numerador del 04 en MySQL
         *
         * el "denominador" del 3 es de MySQL
         */
        final MaestroIndicadorEntity maestroIndicador = getMaestroIndicador(3);

        borroIndicadorOracleTemporal(maestroIndicador.getId());

        List<IndicadorAgrupadoMes> numeradores = getHibernateTemplate().find(
                "from IndicadorAgrupadoMes where idIndicador = 4"
        );
        for (IndicadorAgrupadoMes agrupadoMes : numeradores) {
            TempIndicador tempIndicador = new TempIndicador();

            tempIndicador.setIdIndicador(maestroIndicador.getId());  //  pongo el 3
            tempIndicador.setFecha(agrupadoMes.getFecha());
            tempIndicador.setValor(agrupadoMes.getN());  //  NUMERADOR DEL 4

            getHibernateTemplate().save(tempIndicador);
        }

//        return getIndicadoresCombinados(maestroIndicador);
        Object o[] = {
                maestroIndicador.getId(),
                maestroIndicador.getId()
        };
        List<Object[]> valores = getHibernateTemplate().find(
                "select numerador.fecha, numerador.valor, denominador.d " +
                        " from IndicadorAgrupadoMes AS denominador, TempIndicador as numerador " +
                        " where " +
                        " numerador.idIndicador = ? and denominador.idIndicador = ? " +
                        " and numerador.fecha = denominador.fecha " +
                        " order by denominador.fecha ",
                o
        );
//        System.out.println("valores.size() = " + valores.size());
        List<Indicador> indicadores = new ArrayList<Indicador>();
        for (Object[] objects: valores) {
            indicadores.add(poblateIndicadorFromObjetcs(objects, maestroIndicador));
        }

        return indicadores;
    }

    public List<Indicador> getValoresIndicador4(){
        MaestroIndicadorEntity maestroIndicador = getMaestroIndicador(4);

        org.hibernate.Session hbSession = getSession();
        Transaction hbTs = hbSession.beginTransaction();

        String sql = "SELECT numerador.fecha,numerador.n as n, denominador.d as d \n" +
                "FROM `indicador_agrupado_mes` as numerador\n" +
                "INNER JOIN indicador_agrupado_mes as denominador on numerador.fecha = denominador.fecha\n" +
                "WHERE numerador.`id_indicador`=:idIndNumerador AND denominador.id_indicador=:idIndDenominador  \n" +
                "and numerador.version = '1' and denominador.version = '1'\n" +
                "ORDER BY `numerador`.`fecha` ASC ";
        SQLQuery query = hbSession.createSQLQuery(sql);

        query.setInteger("idIndNumerador", maestroIndicador.getId());
        query.setInteger("idIndDenominador", 3);

        List<Object[]> valores = query.list();

        hbTs.commit();
        hbSession.close();

        List<Indicador> indicadores = new ArrayList<Indicador>();
        for (Object[] objects: valores) {
            objects[1] = (Integer) ((Double) objects[1]).intValue();
            objects[2] = (Integer) ((Double) objects[2]).intValue();
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

    public List<Indicador> getValoresIndicador9(){
        final MaestroIndicadorEntity maestroIndicador = getMaestroIndicador(9);

        borroIndicadorOracleTemporal(maestroIndicador.getId());

        List<Ind01N> denominadores = oracleDAO.getHibernateTemplate().find(
                "from Ind01N "
        );
        for (Ind01N ind01N : denominadores) {
            TempIndicador tempIndicador = new TempIndicador();

            tempIndicador.setIdIndicador(maestroIndicador.getId());
            tempIndicador.setFecha(ind01N.getN01Aaaamm());
            tempIndicador.setValor(ind01N.getN01Valor());

            getHibernateTemplate().save(tempIndicador);
        }

        return getIndicadoresCombinados(maestroIndicador);
    }

    public List<Indicador> getValoresIndicador10(){
        final MaestroIndicadorEntity maestroIndicador = getMaestroIndicador(10);

        borroIndicadorOracleTemporal(maestroIndicador.getId());

        List<Ind02N> denominadores = oracleDAO.getHibernateTemplate().find(
                "from Ind02N "
        );
        for (Ind02N ind02N : denominadores) {
            TempIndicador tempIndicador = new TempIndicador();

            tempIndicador.setIdIndicador(maestroIndicador.getId());
            tempIndicador.setFecha(ind02N.getN02Aaaamm());
            tempIndicador.setValor(ind02N.getN02Valor());

            getHibernateTemplate().save(tempIndicador);
        }

        return getIndicadoresCombinados(maestroIndicador);
    }

    public List<Indicador> getValoresIndicador11(){
        final MaestroIndicadorEntity maestroIndicador = getMaestroIndicador(11);

        borroIndicadorOracleTemporal(maestroIndicador.getId());

        List<Ind11D> denominadores = oracleDAO.getHibernateTemplate().find(
                "from Ind11D "
        );
        for (Ind11D aux : denominadores) {
            TempIndicador tempIndicador = new TempIndicador();

            tempIndicador.setIdIndicador(maestroIndicador.getId());
            tempIndicador.setFecha(aux.getD11Aaaamm());
            tempIndicador.setValor(aux.getN11Valor()==null?0:aux.getN11Valor());

            getHibernateTemplate().save(tempIndicador);
        }

        return getIndicadoresCombinados(maestroIndicador);
    }

    public List<Indicador> getValoresIndicador12(){
        MaestroIndicadorEntity maestroIndicador = getMaestroIndicador(12);

        org.hibernate.Session hbSession = getSession();
        Transaction hbTs = hbSession.beginTransaction();

        String sql = "SELECT numerador.fecha,numerador.n as n, denominador.n as d \n" +
                "FROM `indicador_agrupado_mes` as numerador\n" +
                "INNER JOIN indicador_agrupado_mes as denominador on numerador.fecha = denominador.fecha\n" +
                "WHERE numerador.`id_indicador`=:idIndNumerador AND denominador.id_indicador=:idIndDenominador  \n" +
                "and numerador.version = '1' and denominador.version = '1'\n" +
                "ORDER BY `numerador`.`fecha` ASC ";
        SQLQuery query = hbSession.createSQLQuery(sql);

        query.setInteger("idIndNumerador", maestroIndicador.getId());
        query.setInteger("idIndDenominador", 4);

        List<Object[]> valores = query.list();

        System.out.println("valores 12 = " + valores.size());

        hbTs.commit();
        hbSession.close();

        List<Indicador> indicadores = new ArrayList<Indicador>();
        for (Object[] objects: valores) {
            objects[1] = (Integer) ((Double) objects[1]).intValue();
            objects[2] = (Integer) ((Double) objects[2]).intValue();
            indicadores.add(poblateIndicadorFromObjetcs(objects, maestroIndicador));
        }
        return indicadores;
    }

    public List<Indicador> getValoresIndicador14(){
        MaestroIndicadorEntity maestroIndicador = getMaestroIndicador(14);

        org.hibernate.Session hbSession = getSession();
        Transaction hbTs = hbSession.beginTransaction();

        String sql = "SELECT numerador.fecha,numerador.n as n, denominador.n as d \n" +
                "FROM `indicador_agrupado_mes` as numerador\n" +
                "INNER JOIN indicador_agrupado_mes as denominador on numerador.fecha = denominador.fecha\n" +
                "WHERE numerador.`id_indicador`=:idIndNumerador AND denominador.id_indicador=:idIndDenominador  \n" +
                "and numerador.version = '1' and denominador.version = '1'\n" +
                "ORDER BY `numerador`.`fecha` ASC ";
        SQLQuery query = hbSession.createSQLQuery(sql);

        query.setInteger("idIndNumerador", maestroIndicador.getId());
        query.setInteger("idIndDenominador", 9);

        List<Object[]> valores = query.list();

        hbTs.commit();
        hbSession.close();

        List<Indicador> indicadores = new ArrayList<Indicador>();
        for (Object[] objects: valores) {
            objects[1] = (Integer) ((Double) objects[1]).intValue();
            objects[2] = (Integer) ((Double) objects[2]).intValue();
            indicadores.add(poblateIndicadorFromObjetcs(objects, maestroIndicador));
        }
        return indicadores;
    }

    public List<Indicador> getValoresIndicador15(){
        MaestroIndicadorEntity maestroIndicador = getMaestroIndicador(15);

        org.hibernate.Session hbSession = getSession();
        Transaction hbTs = hbSession.beginTransaction();

        String sql = "SELECT numerador.fecha,numerador.n as n, denominador.n as d \n" +
                "FROM `indicador_agrupado_mes` as numerador\n" +
                "INNER JOIN indicador_agrupado_mes as denominador on numerador.fecha = denominador.fecha\n" +
                "WHERE numerador.`id_indicador`=:idIndNumerador AND denominador.id_indicador=:idIndDenominador  \n" +
                "and numerador.version = '1' and denominador.version = '1'\n" +
                "ORDER BY `numerador`.`fecha` ASC ";
        SQLQuery query = hbSession.createSQLQuery(sql);

        query.setInteger("idIndNumerador", maestroIndicador.getId());
        query.setInteger("idIndDenominador", 10);

        List<Object[]> valores = query.list();

        hbTs.commit();
        hbSession.close();

        List<Indicador> indicadores = new ArrayList<Indicador>();
        for (Object[] objects: valores) {
            objects[1] = (Integer) ((Double) objects[1]).intValue();
            objects[2] = (Integer) ((Double) objects[2]).intValue();
            indicadores.add(poblateIndicadorFromObjetcs(objects, maestroIndicador));
        }
        return indicadores;
    }

    public List<Indicador> getValoresIndicador16(){
        MaestroIndicadorEntity maestroIndicador = getMaestroIndicador(16);

        org.hibernate.Session hbSession = getSession();
        Transaction hbTs = hbSession.beginTransaction();

        String sql = "SELECT numerador.fecha,numerador.n as n, denominador.n as d \n" +
                "FROM `indicador_agrupado_mes` as numerador\n" +
                "INNER JOIN indicador_agrupado_mes as denominador on numerador.fecha = denominador.fecha\n" +
                "WHERE numerador.`id_indicador`=:idIndNumerador AND denominador.id_indicador=:idIndDenominador  \n" +
                "and numerador.version = '1' and denominador.version = '1'\n" +
                "ORDER BY `numerador`.`fecha` ASC ";
        SQLQuery query = hbSession.createSQLQuery(sql);

        query.setInteger("idIndNumerador", maestroIndicador.getId());
        query.setInteger("idIndDenominador", 11);

        List<Object[]> valores = query.list();

        hbTs.commit();
        hbSession.close();

        List<Indicador> indicadores = new ArrayList<Indicador>();
        for (Object[] objects: valores) {
            objects[1] = (Integer) ((Double) objects[1]).intValue();
            objects[2] = (Integer) ((Double) objects[2]).intValue();
            indicadores.add(poblateIndicadorFromObjetcs(objects, maestroIndicador));
        }
        return indicadores;
    }

    public List<Indicador> getValoresIndicador17(){
        MaestroIndicadorEntity maestroIndicador = getMaestroIndicador(17);

        org.hibernate.Session hbSession = getSession();
        Transaction hbTs = hbSession.beginTransaction();

        String sql = "SELECT numerador.fecha,numerador.n as n, denominador.n as d \n" +
                "FROM `indicador_agrupado_mes` as numerador\n" +
                "INNER JOIN indicador_agrupado_mes as denominador on numerador.fecha = denominador.fecha\n" +
                "WHERE numerador.`id_indicador`=:idIndNumerador AND denominador.id_indicador=:idIndDenominador  \n" +
                "and numerador.version = '1' and denominador.version = '1'\n" +
                "ORDER BY `numerador`.`fecha` ASC ";
        SQLQuery query = hbSession.createSQLQuery(sql);

        query.setInteger("idIndNumerador", maestroIndicador.getId());
        query.setInteger("idIndDenominador", 12);

        List<Object[]> valores = query.list();

        hbTs.commit();
        hbSession.close();

        List<Indicador> indicadores = new ArrayList<Indicador>();
        for (Object[] objects: valores) {
            objects[1] = (Integer) ((Double) objects[1]).intValue();
            objects[2] = (Integer) ((Double) objects[2]).intValue();
            indicadores.add(poblateIndicadorFromObjetcs(objects, maestroIndicador));
        }
        return indicadores;
    }

    public List<Indicador> getValoresIndicador18(){
        MaestroIndicadorEntity maestroIndicador = getMaestroIndicador(18);

        org.hibernate.Session hbSession = getSession();
        Transaction hbTs = hbSession.beginTransaction();

        String sql = "SELECT numerador.fecha,numerador.n as n, denominador.n as d \n" +
                "FROM `indicador_agrupado_mes` as numerador\n" +
                "INNER JOIN indicador_agrupado_mes as denominador on numerador.fecha = denominador.fecha\n" +
                "WHERE numerador.`id_indicador`=:idIndNumerador AND denominador.id_indicador=:idIndDenominador  \n" +
                "and numerador.version = '1' and denominador.version = '1'\n" +
                "ORDER BY `numerador`.`fecha` ASC ";
        SQLQuery query = hbSession.createSQLQuery(sql);

        query.setInteger("idIndNumerador", maestroIndicador.getId());
        query.setInteger("idIndDenominador", 13);

        List<Object[]> valores = query.list();

        hbTs.commit();
        hbSession.close();

        List<Indicador> indicadores = new ArrayList<Indicador>();
        for (Object[] objects: valores) {
            objects[1] = (Integer) ((Double) objects[1]).intValue();
            objects[2] = (Integer) ((Double) objects[2]).intValue();
            indicadores.add(poblateIndicadorFromObjetcs(objects, maestroIndicador));
        }
        return indicadores;
    }

    public List<Indicador> getValoresIndicador19(){
        MaestroIndicadorEntity maestroIndicador = getMaestroIndicador(19);
        List<Object[]> valores = oracleDAO.getHibernateTemplate().find(
                "select numerador.n19Aaaamm, numerador.n19Valor, denominador.d19Valor " +
                        " from Ind19N AS numerador, Ind19D as denominador " +
                        " where numerador.n19Aaaamm = denominador.d19Aaaamm " +
                        " order by numerador.n19Aaaamm "
        );
        List<Indicador> indicadores = new ArrayList<Indicador>();
        for (Object[] objects: valores) {
            indicadores.add(poblateIndicadorFromObjetcs(objects, maestroIndicador));
        }
        return indicadores;
    }

    public List<Indicador> getValoresIndicador20(){
        MaestroIndicadorEntity maestroIndicador = getMaestroIndicador(20);
        List<Object[]> valores = oracleDAO.getHibernateTemplate().find(
                "select numerador.n20Aaaamm, numerador.n20Valor, denominador.d20Valor " +
                        " from Ind20N AS numerador, Ind20D as denominador " +
                        " where numerador.n20Aaaamm = denominador.d20Aaaamm " +
                        " order by numerador.n20Aaaamm "
        );
        List<Indicador> indicadores = new ArrayList<Indicador>();
        for (Object[] objects: valores) {
            indicadores.add(poblateIndicadorFromObjetcs(objects, maestroIndicador));
        }

        return indicadores;
    }

    public List<Indicador> getValoresIndicador21(){
        MaestroIndicadorEntity maestroIndicador = getMaestroIndicador(21);
        List<Object[]> valores = oracleDAO.getHibernateTemplate().find(
                "select numerador.n21Aaaamm, numerador.n21Valor, denominador.d21Valor " +
                        " from Ind21N AS numerador, Ind21D as denominador " +
                        " where numerador.n21Aaaamm = denominador.d21Aaaamm " +
                        " order by numerador.n21Aaaamm "
        );
        List<Indicador> indicadores = new ArrayList<Indicador>();
        for (Object[] objects: valores) {
            indicadores.add(poblateIndicadorFromObjetcs(objects, maestroIndicador));
        }
        return indicadores;
    }

    public List<Indicador> getValoresIndicador22(){


        //  Borro todo el 19 de Mysql

        getHibernateTemplate().execute(new HibernateCallback() {
            @Override
            public Object doInHibernate(Session session) throws HibernateException, SQLException {
                Query query = session.createQuery(
                        "delete from Indicador where maestroIndicador.id = :Id19 "
                );
                query.setInteger("Id19", 19);
                query.executeUpdate();

                return null;
            }
        });

        //  Poblar
        List<Indicador> los19 = getValoresIndicador19();

        for (Indicador indicador19 : los19) {
            MaestroIndicadorEntity maestroIndicador19 = getMaestroIndicador(19);
            Indicador new19 = new Indicador();

            new19.setMaestroIndicador(maestroIndicador19);
            new19.setFecha(indicador19.getFecha());
            new19.setVersion("2");
            new19.setFechaDia(0);
            new19.setVariable1(indicador19.getVariable1());
            new19.setVariable2(indicador19.getVariable2());
            getHibernateTemplate().save(new19);

        }








        MaestroIndicadorEntity maestroIndicador = getMaestroIndicador(22);

        org.hibernate.Session hbSession = getSession();
        Transaction hbTs = hbSession.beginTransaction();

        String sql = "SELECT numerador.fecha,numerador.n as n, denominador.n as d \n" +
                "FROM `indicador_agrupado_mes` as numerador\n" +
                "INNER JOIN indicador_agrupado_mes as denominador on numerador.fecha = denominador.fecha\n" +
                "WHERE numerador.`id_indicador`=:idIndNumerador AND denominador.id_indicador=:idIndDenominador  \n" +
                "and numerador.version = '1' and denominador.version = '1'\n" +
                "ORDER BY `numerador`.`fecha` ASC ";
        SQLQuery query = hbSession.createSQLQuery(sql);

        query.setInteger("idIndNumerador", maestroIndicador.getId());
        query.setInteger("idIndDenominador", 19);

        List<Object[]> valores = query.list();

        hbTs.commit();
        hbSession.close();

        List<Indicador> indicadores = new ArrayList<Indicador>();
        for (Object[] objects: valores) {
            objects[1] = (Integer) ((Double) objects[1]).intValue();
            objects[2] = (Integer) ((Double) objects[2]).intValue();
            indicadores.add(poblateIndicadorFromObjetcs(objects, maestroIndicador));
        }
        return indicadores;
    }

    public List<Indicador> getValoresIndicador23New(){
        MaestroIndicadorEntity maestroIndicador = getMaestroIndicador(23);

        org.hibernate.Session hbSession = getSession();
        Transaction hbTs = hbSession.beginTransaction();

        String sql = "SELECT  fecha, n, d  FROM indicador_agrupado_mes WHERE id_indicador = :idIndNumerador ";
        SQLQuery query = hbSession.createSQLQuery(sql);

        query.setInteger("idIndNumerador", maestroIndicador.getId());

        List<Object[]> valores = query.list();

        hbTs.commit();
        hbSession.close();

        List<Indicador> indicadores = new ArrayList<Indicador>();
        for (Object[] objects: valores) {
            objects[1] = (Integer) ((Double) objects[1]).intValue();
            objects[2] = (Integer) ((Double) objects[2]).intValue();
            indicadores.add(poblateIndicadorFromObjetcs(objects, maestroIndicador));
        }
        return indicadores;
    }

    public List<Indicador> getValoresIndicador23(){

        //  Borro todo el 19 de Mysql

        getHibernateTemplate().execute(new HibernateCallback() {
            @Override
            public Object doInHibernate(Session session) throws HibernateException, SQLException {
                Query query = session.createQuery(
                        "delete from Indicador where maestroIndicador.id = :Id19 "
                );
                query.setInteger("Id19", 19);
                query.executeUpdate();

                return null;
            }
        });

        //  Poblar
        List<Indicador> los19 = getValoresIndicador19();

        for (Indicador indicador19 : los19) {
            MaestroIndicadorEntity maestroIndicador19 = getMaestroIndicador(19);
            Indicador new19 = new Indicador();

            new19.setMaestroIndicador(maestroIndicador19);
            new19.setFecha(indicador19.getFecha());
            new19.setVersion("2");
            new19.setFechaDia(0);
            new19.setVariable1(indicador19.getVariable1());
            new19.setVariable2(indicador19.getVariable2());
            getHibernateTemplate().save(new19);

        }


        MaestroIndicadorEntity maestroIndicador = getMaestroIndicador(23);

        org.hibernate.Session hbSession = getSession();
        Transaction hbTs = hbSession.beginTransaction();

        String sql = "SELECT numerador.fecha,numerador.n as n, denominador.n as d \n" +
                "FROM `indicador_agrupado_mes` as numerador\n" +
                "INNER JOIN indicador_agrupado_mes as denominador on numerador.fecha = denominador.fecha\n" +
                "WHERE numerador.`id_indicador`=:idIndNumerador AND denominador.id_indicador=:idIndDenominador  \n" +
                "and numerador.version = '1' and denominador.version = '1'\n" +
                "ORDER BY `numerador`.`fecha` ASC ";
        SQLQuery query = hbSession.createSQLQuery(sql);

        query.setInteger("idIndNumerador", maestroIndicador.getId());
        query.setInteger("idIndDenominador", 19);

        List<Object[]> valores = query.list();

        hbTs.commit();
        hbSession.close();

        List<Indicador> indicadores = new ArrayList<Indicador>();
        for (Object[] objects: valores) {
            objects[1] = (Integer) ((Double) objects[1]).intValue();
            objects[2] = (Integer) ((Double) objects[2]).intValue();
            indicadores.add(poblateIndicadorFromObjetcs(objects, maestroIndicador));
        }
        return indicadores;
    }

    public List<Indicador> getValoresIndicador24(){
        MaestroIndicadorEntity maestroIndicador = getMaestroIndicador(24);
        List<Object[]> valores = oracleDAO.getHibernateTemplate().find(
                "select numerador.n24Aaaamm, numerador.n24Valor, denominador.d24Valor " +
                        " from Ind24N AS numerador, Ind24D as denominador " +
                        " where numerador.n24Aaaamm = denominador.d24Aaaamm " +
                        " order by numerador.n24Aaaamm "
        );
        List<Indicador> indicadores = new ArrayList<Indicador>();
        for (Object[] objects: valores) {
            indicadores.add(poblateIndicadorFromObjetcs(objects, maestroIndicador));
        }
        return indicadores;
    }

    public List<Indicador> getValoresIndicador25_Old(){
        final MaestroIndicadorEntity maestroIndicador = getMaestroIndicador(25);

        borroIndicadorOracleTemporal(maestroIndicador.getId());

        List<Ind25D> denominadores = oracleDAO.getHibernateTemplate().find(
                "from Ind25D "
        );
        for (Ind25D aux : denominadores) {
            TempIndicador tempIndicador = new TempIndicador();

            tempIndicador.setIdIndicador(maestroIndicador.getId());
            tempIndicador.setFecha(aux.getD25Aaaamm());
            tempIndicador.setValor(aux.getD25Valor()==null?0:aux.getD25Valor());

            getHibernateTemplate().save(tempIndicador);
        }

        return getIndicadoresCombinados(maestroIndicador);
    }


    public List<Indicador> getValoresIndicador25(){
        MaestroIndicadorEntity maestroIndicador = getMaestroIndicador(19);
        List<Object[]> valores = oracleDAO.getHibernateTemplate().find(
                "select numerador.n25Aaaamm, numerador.n25Valor, denominador.d25Valor " +
                        " from Ind25N AS numerador, Ind25D as denominador " +
                        " where numerador.n25Aaaamm = denominador.d25Aaaamm " +
                        " order by numerador.n25Aaaamm "
        );
        List<Indicador> indicadores = new ArrayList<Indicador>();
        for (Object[] objects: valores) {
            indicadores.add(poblateIndicadorFromObjetcs(objects, maestroIndicador));
        }
        return indicadores;
    }

    /*public List<Indicador> getValoresIndicador25(){
        MaestroIndicadorEntity maestroIndicador = getMaestroIndicador(25);
        List<Object[]> valores = oracleDAO.getHibernateTemplate().find(
                "select numerador.n25Aaaamm, numerador.n25Valor, denominador.d25Valor " +
                        " from Ind25N AS numerador, Ind25D as denominador " +
                        " where numerador.n25Aaaamm = denominador.d25Aaaamm"
        );
        List<Indicador> indicadores = new ArrayList<Indicador>();
        for (Object[] objects: valores) {
            indicadores.add(poblateIndicadorFromObjetcs(objects, maestroIndicador));
        }
        return indicadores;
    }*/

    public List<Indicador> getIndicadorNDCompleto(int idMaestroIndicador){
        List<Indicador> indicadores = new ArrayList<Indicador>();
        MaestroIndicadorEntity maestroIndicador = getMaestroIndicador(idMaestroIndicador);

        List<IndicadorAgrupadoMes> agrupados = getHibernateTemplate().find(
                "from IndicadorAgrupadoMes where idIndicador = ? and version = '1' order by fecha asc ",
                idMaestroIndicador
        );

        for (int i = 0; i < agrupados.size(); i++) {
            IndicadorAgrupadoMes ia = agrupados.get(i);

            Indicador indicador = new Indicador();

            indicador.setMaestroIndicador(maestroIndicador);
            indicador.setVersion(ia.getVersion());
            indicador.setFecha(ia.getFecha());
            indicador.setVariable1(ia.getN());
            indicador.setVariable2(ia.getD());
//            System.out.println("idMaestroIndicador = " + idMaestroIndicador+"\tindicador.getFecha() = " + indicador.getFecha());
            if (ia.getD() != 0) {
//                System.out.println("si = ");
                indicador.setIndicador(indicador.getVariable1() / indicador.getVariable2());
//                System.out.println("ia.getN() = " + ia.getN());
//                System.out.println("ia.getD() = " + ia.getD());
//                System.out.println("ia.getN() / ia.getD() = " + ia.getN() / ia.getD());
//                System.out.println("indicador.getIndicador() = " + indicador.getIndicador());
            } else {

//                System.out.println("no = ");
                indicador.setIndicador(0);
            }
            indicador.setAceptacion(maestroIndicador.getAceptacion());

            indicadores.add(indicador);
        }

        return indicadores;
    }

    public List<Indicador> getUltimosIndicadores(List<Indicador> indicadores,
                                                 int cantidad){
//        System.out.println("indicadores.size() = " + indicadores.size());
        if(indicadores.size()>cantidad){
            int i1 = indicadores.size() - cantidad;
//            System.out.println("i1 = " + i1);
            for(int i = 0; i< i1; i++){
//                System.out.println("i = " + i);
//            for( int i=0; i<cantidad; i++){
                indicadores.remove(0);
            }
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

    public void borroIndicadorOracleTemporal(final int idMaestroIndicadorEntity){
        // borro en Temp los datos del Indicador

        getHibernateTemplate().execute(new HibernateCallback() {
            @Override
            public Object doInHibernate(Session session) throws HibernateException, SQLException {
                Query query = session.createQuery(
                        "delete from TempIndicador where idIndicador = ? "
                );
                query.setInteger(0, idMaestroIndicadorEntity);
                query.executeUpdate();
                return null;
            }
        });
    }

    public List<Indicador> getIndicadoresCombinados(MaestroIndicadorEntity maestroIndicador){
        Object o[] = {
                maestroIndicador.getId(),
                maestroIndicador.getId()
        };
        List<Object[]> valores = getHibernateTemplate().find(
                "select numerador.fecha, numerador.n, denominador.valor" +
                        " from IndicadorAgrupadoMes AS numerador, TempIndicador as denominador " +
                        " where " +
                        " numerador.idIndicador = ? and denominador.idIndicador = ? " +
                        " and numerador.fecha = denominador.fecha " +
                        " order by numerador.fecha ",
                o
        );
//        System.out.println("valores.size() = " + valores.size());
        List<Indicador> indicadores = new ArrayList<Indicador>();
        for (Object[] objects: valores) {
            indicadores.add(poblateIndicadorFromObjetcs(objects, maestroIndicador));
        }

        return indicadores;
    }

    /**
     * devuelve un indicador con valores de -1 si no encuentra valores
     * <br>
     *
     * @param maestro m
     * @param fechaMes fe
     * @param indicadores ind
     * @return el indicador de la
     */
    public Indicador getUnIndicadorSegunFechaMes(int maestro,
                                                 int fechaMes,
                                                 List<Indicador> indicadores){
        for (Indicador indicador : indicadores) {
            if (indicador.getFecha() == fechaMes) {
                return indicador;
            }
        }
        Indicador indicador = new Indicador();
        indicador.setMaestroIndicador(getMaestroIndicador(maestro));
        indicador.setIndicador(-1);
        indicador.setVariable1(0);
        indicador.setVariable2(0);
        indicador.setFecha(fechaMes);
        return indicador;
    }

    public Comentario getComentarioPeriodo(Comentario comentario){
        Object o[] = {
                comentario.getPeriodo(),
                comentario.getMaestroIndicador().getId()
        };
        List<Comentario> comentarios = getHibernateTemplate().find(
                "from Comentario where periodo = ? and " +
                        "maestroIndicador.id = ?",
                o
        );
        if(comentarios.size()>0){
            return comentarios.get(0);
        } else {
            comentario.setFechaRegistro(new Timestamp(System.currentTimeMillis()));
            comentario.setTexto("");
            getHibernateTemplate().save(comentario);
            return getComentarioPeriodo(comentario);
        }
    }

    public Comentario saveComentarioFromPeriodo(Comentario comentario){

        try {
            Comentario comentarioOld = getComentarioPeriodo(comentario);

            comentarioOld.setTexto(comentario.getTexto());
            comentarioOld.setFechaRegistro(new Timestamp(System.currentTimeMillis()));
            getHibernateTemplate().update(comentarioOld);

            return comentarioOld;
        } catch (DataAccessException e) {
            return null;
        }
    }

}
