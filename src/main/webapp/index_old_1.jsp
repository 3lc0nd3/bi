<jsp:include page="m_header.jsp" />
<%@ page import="java.util.List" %>
<%@ page import="co.com.elramireza.bi.model.Indicador" %>
<%@ page import="co.com.elramireza.bi.model.MaestroIndicadorEntity" %>
<jsp:useBean id="biManager" class="co.com.elramireza.bi.dao.BiDAO" scope="application"/>
<%

    List<Integer> meses = biManager.getHibernateTemplate().find(
            "select distinct fecha from Indicador order by fecha desc "
    );

    String mesS = request.getParameter("mes");
    int mes = 0;
    if (mesS!=null){
        mes = Integer.parseInt(mesS);
    } else {
        mes = meses.get(0);
    }

    List<Indicador> indicadores = biManager.getHibernateTemplate().find(
            "from Indicador where fecha = ?",
            mes
    );
%>
            <%--<div class="row m-b-20">
                <div class="col-xs-12 col-lg-6">
                    <h3></h3>
                    <p></p>
                </div>
            </div>--%>
            <div style="margin-bottom: 5px !important;" class="row m-b-40">
                <div class="col-md-6">
                    Selecciones el mes:
                    <select id="elMes" class="c-select">
                        <%
                            for (Integer elMes : meses) {
                        %>
                        <option value="<%=elMes%>"><%=elMes%></option>
                        <%
                            }  //  END FOR MESES
                        %>
                    </select>
                    <input onclick="irM();" type="button" value="ir" class="btn btn-primary">
                </div>
                <div class="col-md-6">

                </div>
            </div>
            <div class="row m-b-40">
                <div class="col-md-12">
                    <%
                        if (mes!=0){
                    %>
                    Mes elegido: <b><%=mes%></b>
                    <br>
                    <table align="center"  width="80%" border="1">
                        <tr>
                            <th>Id</th>
                            <th>Concepto de Medici&oacute;n </th>
                            <th>Valores </th>
                            <th>Indicador </th>
                            <th>Valor de Aceptaci&oacute;n </th>
                            <%--<th>Concepto de Aceptaci&oacute;n </th>--%>
                            <%--<th>Observaci&oacute;n </th>--%>
                        </tr>
                        <%
                            int i=0;
                            String color = "";
                            String esError = "";
                            for (Indicador indicador: indicadores){
                                i++;
                                if(i % 2 == 1){
                                    color = "filaGris";
                                } else {
                                    color = "filaBlanca";
                                }
                                if(indicador.getMaestroIndicador().getAceptacionArribaAbajo()==1){  // Esta por encima
                                    if(indicador.getIndicador() < indicador.getAceptacion()){
                                        esError = "filaError";
                                    } else {
                                        esError = "";
                                    }
                                } else {  //  esta por debajo
                                    if (indicador.getIndicador() > indicador.getAceptacion()) {
                                        esError = "filaError";
                                    } else {
                                        esError = "";
                                    }
                                }
                        %>
                        <tr class="<%=color%>">
                            <td rowspan="2" STYLE="text-align: center;">
                                <a style="text-decoration: underline !important; font-weight: bold;" href="h_charts.jsp?id=<%=indicador.getMaestroIndicador().getId()%>"><%=indicador.getMaestroIndicador().getId()%></a>
                            </td>
                            <td>
                                <%=indicador.getMaestroIndicador().getVar1()%>
                            </td>
                            <td style="text-align: right;">
                                <%=indicador.getVariable1()%>
                            </td>
                            <td style="text-align: right;" class="<%=esError%>" rowspan="2">
                                <%=(Math.floor(indicador.getIndicador()*10000))/100%>%
                            </td>
                            <td style="text-align: right;" class="<%=esError%>" rowspan="2">
                                <%=(Math.floor(indicador.getAceptacion()*10000))/100%>%
                            </td>
                            <%--<td rowspan="2">--%>
                                <%--????--%>
                            <%--</td>--%>
                            <%--<td rowspan="2">--%>
                                <%--????--%>
                            <%--</td>--%>
                        </tr>
                        <tr class="<%=color%>">
                            <td>
                                <%=indicador.getMaestroIndicador().getVar2()%>
                            </td>
                            <td style="text-align: right;">
                                <%=indicador.getVariable2()%>
                            </td>
                        </tr>
                        <%
                            }  //  END FOR INDICADORES
                        %>
                    </table>
                    <%
                        } else {  //  END IF HAY MES
                    %>
                    <%--<script>
                        irM();
                    </script>
                    --%><%
                        }
                    %>
                </div>
            </div>
        </div>
        <div class="footer">
            <div class="row">
                <div class="col-xs-12">
                    G.I. 2016
                </div>
            </div>
        </div>
    </div>
</div>
</div>
<script type="text/javascript">
</script>

</body>

</html>
