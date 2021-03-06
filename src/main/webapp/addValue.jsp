<%@ page import="java.util.List" %>
<%@ page import="co.com.elramireza.bi.model.Indicador" %>
<%@ page import="co.com.elramireza.bi.model.MaestroIndicadorEntity" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="co.com.elramireza.bi.model.Usuario" %>
<jsp:useBean id="biManager" class="co.com.elramireza.bi.dao.BiDAO" scope="application"/>
<%
    Usuario usuario = (Usuario) session.getAttribute("usuario");
    if(usuario!=null && usuario.getTipo() == 2){
%>
<jsp:include page="m_header.jsp" />

<%
    int yearIni = 2015;
    int yearFin = Calendar.getInstance().get(Calendar.YEAR);
//    System.out.println("yearFin = " + yearFin);

    List<MaestroIndicadorEntity> maestros = biManager.getHibernateTemplate().find(
            "From MaestroIndicadorEntity order by id"
    );

    List<Integer> meses = new ArrayList<Integer>();

    for (int year = yearFin; year >= yearIni; year--) {
        for (int m=12; m>=1; m--) {
            meses.add(Integer.parseInt(""+year+(m<10?"0"+m:m)));
        }

    }

%>
            <%--<div class="row m-b-20">
                <div class="col-xs-12 col-lg-6">
                    <h3></h3>
                    <p></p>
                </div>
            </div>--%>
            <div style="margin-bottom: 5px !important;" class="row m-b-40">
                <div class="col-md-12">
                    <h1>Valores de indicador por periodo</h1>
                    <br>

                    Seleccione el indicador
                    <select id="idMaestro" class="c-select" onchange="cambiaMaestro()">
                        <option value="0">Seleccione...</option>
                        <%
                            for (MaestroIndicadorEntity maestro : maestros){
                        %>
                        <option value="<%=maestro.getId()%>"><%=maestro.getId()%> <%=maestro.getNombre()%> </option>
                        <%
                            }  //  END FOR MAESTROS
                        %>
                    </select>
                    Selecciones el mes:
                    <select id="elMes" class="c-select" onchange="cambiaMaestro()">
                        <%
                            for (Integer elMes : meses) {
                        %>
                        <option value="<%=elMes%>"><%=elMes%></option>
                        <%
                            }  //  END FOR MESES
                        %>
                    </select>
                    D&iacute;a:
                    <select id="elDia" class="c-select" onchange="cambiaMaestro()">
                        <%
                            String diaS;
                            for (int i=1; i<32; i++) {
                                if(i<10){
                                    diaS="0"+i;
                                } else {
                                    diaS = String.valueOf(i);
                                }
                        %>
                        <option value="<%=diaS%>"><%=diaS%></option>
                        <%
                            }  //  END FOR MESES
                        %>
                    </select>
                    <%--<br>--%>
                    <br>
                    <span id="var1span"></span>
                    <input id="variable1">
                    <br>
                    <span id="var2span"></span>
                    <input id="variable2">
                    <br>
                    <%--<span id="">Aceptaci&oacute;n % (0-100)</span>
                    <input id="aceptacion">
                    <br>--%>

                    <input id="bGuardar" onclick="guardar();" type="button" value="Guardar" class="btn btn-primary">
                </div>
                <%--<div class="col-md-6">--%>
<%----%>
                <%--</div>--%>
            </div>
            <div class="row m-b-40">
                <div class="col-md-12">

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

    function guardar() {

        var maestroIndicadorM = {
            id : dwr.util.getValue("idMaestro")
        };

        var indicador = {
            id : 0,
            maestroIndicador : maestroIndicadorM,
            version : 1,
            fecha : dwr.util.getValue("elMes"),
            fechaDia : dwr.util.getValue("elMes")+dwr.util.getValue("elDia"),
            variable1 : dwr.util.getValue("variable1"),
            variable2 : dwr.util.getValue("variable2")
        };

        biRemoto.saveIndicador(indicador, function (data) {
            if (data==1) {
                alrt("Guardado");
            } else {
                alrtError("Problemas");
            }
        });

    }

    function cambiaMaestro() {
        var mes = dwr.util.getValue("elMes")+dwr.util.getValue("elDia");
//        alrt(mes);
        var idIndicador = dwr.util.getValue('idMaestro');
        if (mes>0 && idIndicador!=0) {
            biRemoto.getMaestroIndicador(
                    idIndicador,
                    function (data) {
                        dwr.util.setValue("var1span",data.var1 /*+ data.editaN*/);
                        dwr.util.setValue("var2span",data.var2 /*+ data.editaD*/);

                        if(data.editaN){
                            $('#variable1').prop('disabled', false);
                        } else {
                            $('#variable1').prop('disabled', true);
                        }
                        if(data.editaD){
                            $('#variable2').prop('disabled', false);
                        } else {
                            $('#variable2').prop('disabled', true);
                        }

                        if(data.editaN || data.editaD){
                            $('#bGuardar').prop('disabled', false);
                        } else {
                            $('#bGuardar').prop('disabled', true);
                        }


                        biRemoto.getIndicador(mes, idIndicador,
                                function (data) {
                                    if (data!=null) {
                                        alrt("Ya existe");
                                        dwr.util.setValue("variable1",data.variable1);
                                        dwr.util.setValue("variable2",data.variable2);
//                                        dwr.util.setValue("aceptacion",data.aceptacion*100);
                                    } else {
                                        alrt("nuevo");
                                        dwr.util.setValue("variable1","");
                                        dwr.util.setValue("variable2","");
//                                        dwr.util.setValue("aceptacion","");
                                    }
                                }

                        );

                    }
            );
        } else {
        }

    }
</script>

<%
    }  //  END IF ES TIPO == 2
    else if(usuario!= null){
%>
<jsp:include page="m_header.jsp" />

<h1>No tienes permisos para usar este servicio.</h1>
<%
    } else  {
        session.invalidate();
        response.sendRedirect("h_login.jsp");
        return;
    }
%>
</body>

</html>
