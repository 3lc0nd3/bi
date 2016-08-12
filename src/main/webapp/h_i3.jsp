<%@ page import="java.util.List" %>
<%@ page import="co.com.elramireza.bi.model.I3Calculado" %>
<%@ page import="co.com.elramireza.bi.dao.BiDAO" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="co.com.elramireza.bi.model.ValorExcel" %>
<%@ page import="java.util.ArrayList" %>
<jsp:useBean id="biManager" class="co.com.elramireza.bi.dao.BiDAO" scope="application"/>
<jsp:include page="c_header.jsp"/>

<%
    List<I3Calculado> i3Calculados = biManager.getI3Calculados();
    DecimalFormat df = new DecimalFormat("$###,###");

    List<List<ValorExcel>> filas = (List<List<ValorExcel>>) session.getAttribute("filasExcel");
    if (filas == null){
        filas =  new ArrayList<List<ValorExcel>>();
    }

    List<String> series = new ArrayList<String>();

    List<ValorExcel> cellList = new ArrayList<ValorExcel>();
    if (filas.size() > 0){
        cellList = filas.get(0);
        for (ValorExcel v : cellList) {
            series.add(v.getvString());
        }
    }
%>

<div class="row" >
    <div class="twelve columns">
        <h3>
            I3 Dash Growth Rev
        </h3>
        <form >
            <div class="six columns">
                <table border="1">
                    <tr>
                        <%
                            for (String s: series){
                        %>
                        <th style="color: white; background-color: black;"><%=s%></th>
                        <%
                            }
                        %>
                    </tr>
                    <%
                        //  EMPIEZA EN 1 PUES EN 0 ESTAN LAS SERIES
                        for (int i = 1; i < filas.size(); i++) {
                            cellList = filas.get(i);
                    %>
                    <tr>
                        <%
                            for (ValorExcel v : cellList) {
                        %>
                        <td  align="right"cp ><%=v.getvDouble()%></td>
                        <%
                            }
                        %>
                    </tr>
                    <%--<td style="color:<%=i3.getNetOperatingResult()<0?"red":"black"%>;" align="right"><%=df.format(i3.getNetOperatingResult())%></td>--%>
                    <%
                        }  //  END FOR FILAS
                    %>
                </table>
                <br>
                <br>
            </div>
            <div class="six columns">
                <input type="file" class="button required"  name="fileFoto" id="fileFoto">
                <br>
                <input type="button" class="button" id="bgFoto" onclick="subeArchivo();" value="Subir archivo">
                <br>
                <br>
                <br><br><br><br><br><br><br><br><br>
                <a onclick="viewI3();" class="button">View</a>
            </div>
        </form>
        <br>
        <br>
    </div>

</div>
<div class="row">

        <div id="chart1" style="height:500px; width:85%;"></div>
</div>

<script type="text/javascript">

    jQuery(document).ready(function(){
        (function(jQuery) {
            jQuery.jqplot.YearFormatter = function(format, val){
//                alert("val = " + val);
                return Math.round(val * 10000)/100 + '%';
            };
        })(jQuery);
    });

    function viewI3(){
        {
            var lista = [
                <%
                    for (int i = 1; i < cellList.size(); i++) {
                    %>
                    <%="[[],[]],"%><%
                    }
                    %>
            ];
            <%
                //  EMPIEZA EN 1 PUES EN 0 ESTAN LAS SERIES
                for (int i = 1; i < filas.size(); i++) {
                    cellList = filas.get(i);
            %>
            <%
                    for(int j = 1; j<cellList.size();j++){
                        ValorExcel v = cellList.get(j);
                        //  -1 por el renglon de las series
            %>
                    lista[<%=j-1%>][<%=i-1%>] = [<%=cellList.get(0).getvDouble()%>, <%=v.getvDouble()%>];

            <%
                    }
            %>
            <%
                }  //  END FOR FILAS
            %>
              /*
                    lista[0][0] = [1999, 7];
                    lista[1][0] = [1999, 6];
                    lista[2][0] = [1999, 5];
                    lista[3][0] = [1999, 15];

                    lista[0][1] = [2001, 3];
                    lista[1][1] = [2001, 4];
                    lista[2][1] = [2001, 4];

                    lista[0][2] = [2002, 5];
                    lista[1][2] = [2002, 6];
                    lista[2][2] = [2002, 3];

                    lista[0][3] = [2003, 8];
                    lista[1][3] = [2003, 9];
                    lista[2][3] = [2003, 2];

                    lista[0][4] = [2004, 2];
                    lista[1][4] = [2004, 3];
                    lista[2][4] = [2004, 1];*/

//                    alert("lista = " + lista);
                    jQuery('#chart1').empty();
                    jQuery('#chart1').jqplot(lista, {
                        animate: true,
                        animateReplot: true,
                        title:'Series',
                        series:[
                            <%
                                for (int i = 1; i < series.size(); i++) {
                                  String s =  series.get(i);
                            %>
                            {
                                label: "<%=s%>",
                                markerOptions: { size: 7, style:"circle" }
                            },
                            <%
                                }  //  END FOR SERIES -1
                            %>
                        ],
                        legend:{show:true, location:'no'},
                        seriesDefaults: {
//                            pointLabels: { show:true } ,
                            rendererOptions: {
                                smooth: true
                            }
                        },
                        axes:{
                            xaxis: {
                                renderer: jQuery.jqplot.CategoryAxisRenderer,
                                rendererOptions: { /*forceTickAt0: true, */forceTickAt: 100},
                                label: '<%=series.get(0)%>',
                                labelRenderer: jQuery.jqplot.CanvasAxisLabelRenderer,
                                tickRenderer: jQuery.jqplot.CanvasAxisTickRenderer,
                                tickOptions: {
                                    formatString:'%y'
//                                    angle: -30
                                    //                        fontFamily: 'Courier New',
                                    //                        fontSize: '9pt'
                                }

                            }
                        },
                        highlighter: {
                            show: true,
                            sizeAdjust: 10,
                            tooltipFormatString: ' %.2f',
                            useAxesFormatters: false
                        }
                    });
        }
    }

    viewI3();

    function subeArchivo() {
        alrt("entro");
//    alrt("Hola 2");
//        botonEnProceso("bgFoto");
        var o = jQuery("#fileFoto").val();
        if (o == '') {
            alrtError("Por favor seleccione un archivo <%--<%=tipoPremio.getId()%>--%>");
            botonOperativo();
        } else
            biRemoto.subeArchivoExcel(dwr.util.getValue('fileFoto'),function(data){
                if(data!=null){
                    alrt("Bien");
                    location.reload();
                } else {
//                    botonOperativo();
                    alrtError("Problemas");
                }
            });
    }

</script>

<jsp:include page="c_footer.jsp"/>
