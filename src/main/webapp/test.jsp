<%@ page import="java.util.List" %>
<%@ page import="co.com.elramireza.bi.model.Indicador" %>
<%@ page import="co.com.elramireza.bi.modelOracle.*" %>
<jsp:useBean id="biManager" class="co.com.elramireza.bi.dao.BiDAO" scope="application"/>
<jsp:useBean id="oraManager" class="co.com.elramireza.bi.dao.OracleDao" scope="application"/>

<%
    List<Ind08D> list = oraManager.getHibernateTemplate().find(
            "from Ind08D "
    );

    for (Ind08D cosa : list) {
        System.out.println("fec = " + cosa.getD08Aaaamm() + "\tvalor = " + cosa.getD08Valor());
    }

    List<Indicador> inds = biManager.getValoresIndicador8();
    for (int i = 0; i < inds.size(); i++) {
        Indicador indicador = inds.get(i);
        System.out.println("indicador.getIndicador() = " + indicador.getIndicador());
    }

%>