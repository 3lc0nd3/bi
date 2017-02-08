<%@ page import="java.util.List" %>
<%@ page import="co.com.elramireza.bi.model.Indicador" %>
<%@ page import="co.com.elramireza.bi.modelOracle.*" %>
<%@ page import="co.com.elramireza.bi.model.IndicadorAgrupadoMes" %>
<jsp:useBean id="biManager" class="co.com.elramireza.bi.dao.BiDAO" scope="application"/>
<jsp:useBean id="oraManager" class="co.com.elramireza.bi.dao.OracleDao" scope="application"/>

<%
    /*List<Ind01N> list = oraManager.getHibernateTemplate().find(
            "from Ind01N "
    );

    for (Ind01N cosa : list) {
        System.out.println("fec = " + cosa.getN01Aaaamm() + "\tvalor = " + cosa.getN01Valor());
    }

    List<IndicadorAgrupadoMes> numeradores = biManager.getHibernateTemplate().find(
            "from IndicadorAgrupadoMes where idIndicador = ? and version = '1' order by fecha asc ",
            9
    );

    for (int i = 0; i < numeradores.size(); i++) {
        IndicadorAgrupadoMes indicadorAgrupadoMes = numeradores.get(i);
        System.out.println("Fec = " + indicadorAgrupadoMes.getFecha()+"\t valor = " + indicadorAgrupadoMes.getN());
    }*/

    /*List<Indicador> inds = biManager.getValoresIndicador8();
    for (int i = 0; i < inds.size(); i++) {
        Indicador indicador = inds.get(i);
        System.out.println("indicador.getIndicador() = " + indicador.getIndicador());
    }*/

    List<Indicador> inds;
    /*inds = biManager.getHibernateTemplate().find(
            "from IndicadorAgrupadoMes where idIndicador = 3 order by fecha desc "
    );*/

    /*inds = biManager.getIndicadorNDCompleto(3);

    for (Indicador indicadorAgrupadoMes : inds) {
        System.out.println("" + indicadorAgrupadoMes.getMaestroIndicador().getId()+
                "\t" + indicadorAgrupadoMes.getFecha() +
                "\t" + indicadorAgrupadoMes.getVariable1() +
                "\t" + indicadorAgrupadoMes.getVariable2());
    }*/

    inds = biManager.getIndicadorNDCompleto(4);

    Indicador indFecha = biManager.getUnIndicadorSegunFechaMes(201512, inds);

    System.out.println("indFecha = " + indFecha);
    if(indFecha!=null){
        System.out.println("F = " + indFecha.getFecha()+
                "\tn = " + indFecha.getVariable1()+
                "\td = " + indFecha.getVariable2()+
                "\tInd = " + indFecha.getIndicador());
    }
%>