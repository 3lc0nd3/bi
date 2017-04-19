<!doctype html>
<html lang="en">
<body>

<%@ page import="java.util.List" %>
<%@ page import="co.com.elramireza.bi.model.Indicador" %>
<%@ page import="co.com.elramireza.bi.model.MaestroIndicadorEntity" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="co.com.elramireza.bi.model.Comentario" %>
<jsp:useBean id="biManager" class="co.com.elramireza.bi.dao.BiDAO" scope="application"/>
<style>
    th {
        text-transform: uppercase !important;
    }
</style>
<%



    String noAplica = "  ";

    List<Integer> meses = biManager.getHibernateTemplate().find(
            "select distinct fecha from Indicador order by fecha desc "
    );

    int mes = (Integer) session.getAttribute("mes");

    List<Indicador> indicadores = (List<Indicador>) session.getAttribute("indicadores");
    if(indicadores == null){
        indicadores = new ArrayList<Indicador>();
    }


%>
            <div class="row m-b-40">
                <div class="col-md-12">
                    <%
                        if (mes!=0){
                    %>
                    Mes elegido: <b><%=mes%></b>
                    <br>
                    <table align="center"  width="85%" border="1">
                        <tr>
                            <th>Id</th>
                            <th>Concepto de Medici&oacute;n </th>
                            <th>Valores </th>
                            <th>Ind. </th>
                            <th>% Acept. </th>
                            <th>Criterio</th>
                            <th>Comentario</th>
                            <%--<th>Concepto de Aceptaci&oacute;n </th>--%>
                            <%--<th>Observaci&oacute;n </th>--%>
                        </tr>
                        <%
                            int i=0;
                            String color = "";
                            String esError = "";

                            Indicador ultimoIndicador = null;

                            for (Indicador indicador: indicadores){
                                if(indicador != null){

                                    i++;
                                    //  COLORES
                                    if(i % 2 == 1){
                                        color = "filaGris";
                                    } else {
                                        color = "filaBlanca";
                                    }

                                    //  ACEPTACION
                                    if(indicador.getMaestroIndicador().getAceptacionArribaAbajo()==1){  // Esta por encima
                                        if(indicador.getIndicador() < indicador.getMaestroIndicador().getAceptacion()){
                                            esError = "filaError";
                                        } else {
                                            esError = "";
                                        }
                                    } else {  //  esta por debajo
                                        if (indicador.getIndicador() > indicador.getMaestroIndicador().getAceptacion()) {
                                            esError = "filaError";
                                        } else {
                                            esError = "";
                                        }
                                    }
                        %>
                        <tr class="<%=color%>">
                            <td rowspan="2" STYLE="text-align: center;">
                                <a style="text-decoration: underline !important; font-weight: bold;" href="h_charts.jsp?id=<%=indicador.getMaestroIndicador().getId()%>">
                                    <%--<%=indicador.getMaestroIndicador().getId()%>--%>
                                    <%=indicador.getMaestroIndicador().getNombre()%>
                                </a>
                            </td>
                            <td>
                                <%=indicador.getMaestroIndicador().getVar1()%>
                            </td>
                            <td style="text-align: right;">
                                <%
                                    if(indicador.getIndicador()>=0){
                                %>
                                <%=(int)indicador.getVariable1()%>
                                <%
                                } else {
                                %>
                                <%=noAplica%>
                                <%
                                    }
                                %>
                            </td>
                            <td style="text-align: right;" class="<%=esError%>" rowspan="2">
                                <%
                                    if(indicador.getIndicador()>=0){
                                %>
                                <%=(Math.floor(indicador.getIndicador()*10000))/100%>%
                                <%
                                } else {
                                %>
                                <%=noAplica%>
                                <%
                                    }
                                %>
                            </td>
                            <td style="text-align: right;" class="<%=esError%>" rowspan="2">
                                <%=((Math.round(indicador.getMaestroIndicador().getAceptacion()*10000))/100)%>%
                            </td>
                            <td  rowspan="2">
                                <%=indicador.getMaestroIndicador().getCriterio()%>
                            </td>
                            <td rowspan="2">
                                <%
                                    Comentario comentario = new Comentario();
                                    comentario.setPeriodo(mes);
                                    comentario.setMaestroIndicador(indicador.getMaestroIndicador());
                                    comentario = biManager.getComentarioPeriodo(comentario);
                                    if(comentario!= null){
                                %>
                                <%=comentario.getTexto()%>
                                <%
                                    }
                                %>
                            </td>
                            <%--<td rowspan="2">--%>
                                <%--????--%>
                            <%--</td>--%>
                        </tr>
                        <tr class="<%=color%>">
                            <td>
                                <%=indicador.getMaestroIndicador().getVar2()%>
                            </td>
                            <td style="text-align: right;">
                                <%
                                    if(indicador.getIndicador()>=0){
                                %>
                                <%=(int)indicador.getVariable2()%>
                                <%
                                } else {
                                %>
                                <%=noAplica%>
                                <%
                                    }
                                %>
                            </td>
                        </tr>
                        <%
                                    ultimoIndicador = indicador;
                                }  //  END IF IND ES NULL
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
