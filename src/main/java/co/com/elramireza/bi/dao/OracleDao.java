package co.com.elramireza.bi.dao;

import org.hibernate.*;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import java.sql.SQLException;

/**
 * Created by usuariox on 5/02/17.
 * elramireza@gmail.com
 */
@SuppressWarnings({
        "deprecation", "unchecked"
})
public class OracleDao extends HibernateDaoSupport {

    public void procedimiento24Horas(){
        logger.info("**************************************************************************");
        logger.info("**************************************************************************");
        logger.info("***     EJECUCION PROCEDIMIENTO 24    ************************************");
        logger.info("**************************************************************************");
        logger.info("**************************************************************************");

        procedimiento1();
    }

    public void procedimiento1(){
        logger.info("**************************************************************************");
        logger.info("**************************************************************************");
        logger.info("***     EJECUCION PROCEDIMIENTO 1     ************************************");
        logger.info("**************************************************************************");
        logger.info("**************************************************************************");

        org.hibernate.Session hbSession;
        Transaction hbTs;
        SQLQuery query;


//      1
        hbSession = getSession();
        hbTs = hbSession.beginTransaction();
        query = hbSession.createSQLQuery(
                "truncate table ind_06_n" );
//        query.setInteger(1, idCertamen);
        query.executeUpdate();
        hbTs.commit();
        hbSession.close();


//      2
        hbSession = getSession();
        hbTs = hbSession.beginTransaction();
        query = hbSession.createSQLQuery(
                "insert into ind_06_n (N06_AAAAMM, N06_VALOR) \n" +
                        "(select n06_aaaamm, acumula_06_n(n06_aaaamm) n06_valor \n" +
                        "from ind_06_t_n) " );
        query.executeUpdate();
        hbTs.commit();
        hbSession.close();


//      3
        hbSession = getSession();
        hbTs = hbSession.beginTransaction();
        query = hbSession.createSQLQuery(
                "truncate table ind_24_n" );
        query.executeUpdate();
        hbTs.commit();
        hbSession.close();


//      4
        hbSession = getSession();
        hbTs = hbSession.beginTransaction();
        query = hbSession.createSQLQuery(
                "insert into ind_24_n (N24_AAAAMM, N24_VALOR) \n" +
                        "(select n24_aaaamm, acumula_24_n(n24_aaaamm) n24_valor \n" +
                        "from IND_24_N_SINACU); " );
        query.executeUpdate();
        hbTs.commit();
        hbSession.close();
    }


}
