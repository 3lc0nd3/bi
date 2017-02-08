<jsp:include page="m_header.jsp" />
<%@ page import="java.util.List" %>
<%@ page import="co.com.elramireza.bi.model.Indicador" %>
<%@ page import="co.com.elramireza.bi.model.MaestroIndicadorEntity" %>
<%@ page import="java.util.ArrayList" %>
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

    List<Indicador> indicadores = new ArrayList<Indicador>();
    /*indicadores = biManager.getHibernateTemplate().find(
            "from Indicador where fecha = ?",
            mes
    );*/

    List<MaestroIndicadorEntity> maestros = biManager.getHibernateTemplate().find(
            "from MaestroIndicadorEntity "
    );

    for (int i = 0; i < maestros.size(); i++) {
        MaestroIndicadorEntity maestroIndicadorEntity = maestros.get(i);
        switch (maestroIndicadorEntity.getId()) {
            case 1 :
                System.out.println("Entro a 1");
                indicadores.add(biManager.getUnIndicadorSegunFechaMes(mes, biManager.getValoresIndicador1()));
//                System.out.println("indicadores.size() = " + indicadores.size());
                break;
            case 2:
                System.out.println("Entro a 2");
                indicadores.add(biManager.getUnIndicadorSegunFechaMes(mes, biManager.getValoresIndicador2()));
                break;
            case 3:
                System.out.println("Entro a 3");
                indicadores.add(biManager.getUnIndicadorSegunFechaMes(mes, biManager.getIndicadorNDCompleto(3)));
                break;
            case 4:
                System.out.println("Entro a 4");
                indicadores.add(biManager.getUnIndicadorSegunFechaMes(mes, biManager.getIndicadorNDCompleto(4)));
                break;
            case 6:
                System.out.println("Entro a 6");
                indicadores.add(biManager.getUnIndicadorSegunFechaMes(mes, biManager.getValoresIndicador6()));
                break;
            case 7:
                System.out.println("Entro a 7");
                indicadores.add(biManager.getUnIndicadorSegunFechaMes(mes, biManager.getIndicadorNDCompleto(7)));
                break;
            case 8:
                System.out.println("Entro a 8");
                indicadores.add(biManager.getUnIndicadorSegunFechaMes(mes, biManager.getValoresIndicador8()));
                break;
            case 9:
                System.out.println("Entro a 9");
                indicadores.add(biManager.getUnIndicadorSegunFechaMes(mes, biManager.getValoresIndicador9()));
                break;
            case 10:
                System.out.println("Entro a 10");
                indicadores.add(biManager.getUnIndicadorSegunFechaMes(mes, biManager.getValoresIndicador10()));
                break;
            case 11:
                System.out.println("Entro a 11");
                indicadores.add(biManager.getUnIndicadorSegunFechaMes(mes, biManager.getValoresIndicador11()));
                break;
            case 13:
                System.out.println("Entro a 13");
                indicadores.add(biManager.getUnIndicadorSegunFechaMes(mes, biManager.getIndicadorNDCompleto(13)));
                break;
            case 14:
                System.out.println("Entro a 14");
                indicadores.add(biManager.getUnIndicadorSegunFechaMes(mes, biManager.getValoresIndicador14()));
                break;
            case 15:
                System.out.println("Entro a 15");
                indicadores.add(biManager.getUnIndicadorSegunFechaMes(mes, biManager.getValoresIndicador15()));
                break;
            case 16:
                System.out.println("Entro a 16");
                indicadores.add(biManager.getUnIndicadorSegunFechaMes(mes, biManager.getValoresIndicador16()));
                break;
            case 17:
                System.out.println("Entro a 17");
                indicadores.add(biManager.getUnIndicadorSegunFechaMes(mes, biManager.getValoresIndicador17()));
                break;
            case 18:
                System.out.println("Entro a 18");
                indicadores.add(biManager.getUnIndicadorSegunFechaMes(mes, biManager.getValoresIndicador18()));
                break;
            case 19:
                System.out.println("Entro a 19");
                indicadores.add(biManager.getUnIndicadorSegunFechaMes(mes, biManager.getValoresIndicador19()));
                break;
            case 20:
                System.out.println("Entro a 20");
                indicadores.add(biManager.getUnIndicadorSegunFechaMes(mes, biManager.getValoresIndicador20()));
                break;
            case 21:
                System.out.println("Entro a 21");
                indicadores.add(biManager.getUnIndicadorSegunFechaMes(mes, biManager.getValoresIndicador21()));
                break;
            case 22:
                System.out.println("Entro a 22");
                indicadores.add(biManager.getUnIndicadorSegunFechaMes(mes, biManager.getValoresIndicador22()));
                break;
            case 23:
                System.out.println("Entro a 23");
                indicadores.add(biManager.getUnIndicadorSegunFechaMes(mes, biManager.getValoresIndicador23()));
                break;
            case 24:
                System.out.println("Entro a 24");
                indicadores.add(biManager.getUnIndicadorSegunFechaMes(mes, biManager.getValoresIndicador24()));
                break;
            case 25:
                System.out.println("Entro a 25");
                indicadores.add(biManager.getUnIndicadorSegunFechaMes(mes, biManager.getValoresIndicador25()));
                break;
        }  //  END SWITCH

    }  //  END FOR MAESTROS

    System.out.println("indicadores.size() = " + indicadores.size());
    for (int i = 0; i < indicadores.size(); i++) {
        Indicador indicador = indicadores.get(i);

//        System.out.println("indicador.getMaestroIndicador().getId() = " + indicador);
    }


%>
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
                                if(indicador != null){

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
