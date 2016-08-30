<html>
<body>
<%@ page import="java.util.List" %>
<%@ page import="co.com.elramireza.bi.model.Indicador" %>
<jsp:useBean id="biManager" class="co.com.elramireza.bi.dao.BiDAO" scope="application"/>
<jsp:include page="c_header.jsp"/>
    <%
        String mesS = request.getParameter("mes");
        int mes = 0;
        if (mesS!=null){
            mes = Integer.parseInt(mesS);
        }

        List<Indicador> indicadores = biManager.getHibernateTemplate().find(
                "from Indicador where fecha = ?",
                mes
        );

        List<Integer> meses = biManager.getHibernateTemplate().find(
                "select distinct fecha from Indicador order by fecha"
        );
    %>
    <div class="row">
        <div class="six columns">
            <div class="container">
                Selecciones el mes:
                <select id="elMes">
                    <%
                        for (Integer elMes : meses) {
                    %>
                    <option value="<%=elMes%>"><%=elMes%></option>
                    <%
                        }  //  END FOR MESES
                    %>
                </select>
            </div>
        </div>
        <div class="six columns">
            <div class="container">
                <br>
                <input onclick="irM();" type="button" value="ir">
            </div>
        </div>
    </div>
    <div class="row">
        <div class="twelve columns">
            <div class="container">
                <%
                    if (mes!=0){
                %>
                <br>
                Mes elegido: <b><%=mes%></b>
                <br>
                <table border="1">
                    <tr>
                        <th>Identificador </th>
                        <th>Concepto de Medici&oacute;n </th>
                        <th>Valores </th>
                        <th>Indicador </th>
                        <th>Valor de Aceptaci&oacute;n </th>
                        <th>Concepto de Aceptaci&oacute;n </th>
                        <th>Observaci&oacute;n </th>
                    </tr>
                <%
                    for (Indicador indicador: indicadores){
                %>
                    <tr>
                        <td rowspan="2">
                            <%=indicador.getMaestroIndicador().getId()%>
                        </td>
                        <td>
                            <%=indicador.getMaestroIndicador().getVar1()%>
                        </td>
                        <td>
                            <%=indicador.getVariable1()%>
                        </td>
                        <td rowspan="2">
                            <%=(Math.floor(indicador.getIndicador()*10000))/100%>%
                        </td>
                        <td rowspan="2">
                            ????
                        </td>
                        <td rowspan="2">
                            <%=(Math.floor(indicador.getAceptacion()*10000))/100%>%
                        </td>
                        <td rowspan="2">
                            ????
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <%=indicador.getMaestroIndicador().getVar2()%>
                        </td>
                        <td>
                            <%=indicador.getVariable2()%>
                        </td>
                    </tr>
                <%
                    }  //  END FOR INDICADORES
                %>
                </table>
                <%
                    }  //  END IF HAY MES
                %>
            </div>
        </div>
    </div>
    <jsp:include page="c_footer.jsp"/>
</body>
</html>
<script>
    function irM() {
        var mes = dwr.util.getValue("elMes");
//        alrt(mes);
        window.location = "?mes="+mes;
    }
</script>