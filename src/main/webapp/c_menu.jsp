<%@ page import="java.util.List" %>
<%@ page import="co.com.elramireza.bi.model.Indicador" %>
<%@ page import="co.com.elramireza.bi.model.MaestroIndicadorEntity" %>
<jsp:useBean id="biManager" class="co.com.elramireza.bi.dao.BiDAO" scope="application"/>
<%
    List<MaestroIndicadorEntity> maestros = biManager.getHibernateTemplate().find(
            "from MaestroIndicadorEntity order by id"
    );
%>
<br>

<div class="row" >
    <div class="six columns">
        <div class="container">
            <ul class="nav-bar vertical">
                <li class=""><a href="/">Inicio</a></li>
                <%
                    for (MaestroIndicadorEntity maestro: maestros){
                %>
                <li class=""><a href="h_indicador.jsp?id=<%=maestro.getId()%>"><%=maestro.getNombre()%></a></li>
                <%
                    }  //  END FOR MAESTROS
                %>
                <%--<li class=""><a href="h_i2.jsp">I2 Student Revenue</a></li>--%>
                <%--<li class=""><a href="h_i3.jsp">I3 Dash Growth Rev</a></li>--%>
                <%--<li class=""><a href="h_i4.jsp">I4 Report Capital</a></li>--%>
            </ul>
        </div>
    </div>
    <div class="six columns">
        <div class="container">
            <ul class="nav-bar vertical">
                <%--<li class=""><a href="h_o4.jsp">O4 Bench Operating Marging</a></li>--%>
                <%--<li class=""><a href="h_i6.jsp">I6 Bench Revenue Vs Staff Costs</a></li>--%>
                <%--<li class=""><a href="h_indicador_1.jsp">I7 Bench Revenue Vs Academic Staff Costs</a></li>--%>
                <%--<li class=""><a href="h_i8.jsp">I8 KPI</a></li> --%>
            </ul>
        </div>
    </div>
</div>