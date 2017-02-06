<%@ page import="java.util.List" %>
<%@ page import="co.com.elramireza.bi.modelOracle.Ind01D" %>
<%@ page import="co.com.elramireza.bi.model.Indicador" %>
<jsp:useBean id="biManager" class="co.com.elramireza.bi.dao.BiDAO" scope="application"/>
<jsp:useBean id="oraManager" class="co.com.elramireza.bi.dao.OracleDao" scope="application"/>

<%
    List<Ind01D> list = oraManager.getHibernateTemplate().find(
            "from Ind01D "
    );

    for (int i = 0; i < list.size(); i++) {
        Ind01D ind01D = list.get(i);
//        System.out.println("ind01D.getD01Aaaamm() = " + ind01D.getD01Aaaamm()+"\tind01D.getD01Valor() = " + ind01D.getD01Valor());

    }

    List<Indicador> inds = biManager.getValoresIndicador1();
    for (int i = 0; i < inds.size(); i++) {
        Indicador indicador = inds.get(i);

    }

%>