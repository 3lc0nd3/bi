<%@ page import="java.util.List" %>
<%@ page import="co.com.elramireza.bi.model.I3Calculado" %>
<%@ page import="co.com.elramireza.bi.dao.BiDAO" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="co.com.elramireza.bi.model.ValorExcel" %>
<jsp:useBean id="biManager" class="co.com.elramireza.bi.dao.BiDAO" scope="application"/>
<jsp:include page="c_header.jsp"/>

<%
    List<I3Calculado> i3Calculados = biManager.getI3Calculados();
    DecimalFormat df = new DecimalFormat("$###,###");

    List<List<ValorExcel>> filas = (List<List<ValorExcel>>) request.getAttribute("filasExcel");
%>

<div class="row" >
    <div class="twelve columns">
        <h3>
            I3 Dash Growth Rev
        </h3>
        <form >
            <div class="six columns">
                <table border="1">
                    <th>Year</th>
                    <th>Total Revenue</th>
                    <th>Total Expenses</th>
                    <th>Net Operating Result</th>
                    <%
                        for (I3Calculado i3 : i3Calculados){
                    %>
                    <tr>
                        <td><%=i3.getYear()%></td>
                        <td align="right"><%=df.format(i3.getTotalRevenue())%></td>
                        <td align="right"><%=df.format(i3.getTotalExpenses())%></td>
                        <td style="color:<%=i3.getNetOperatingResult()<0?"red":"black"%>;" align="right"><%=df.format(i3.getNetOperatingResult())%></td>
                    </tr>
                    <%
                        }
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
                alert("val = " + val);
                return Math.round(val * 10000)/100 + '%';
            };
        })(jQuery);
    });

    function graficaExcel() {

    }

    function viewI3(){
        {
            var lista2 = [[[],[]],[[],[]]];
            biRemoto.getI3Calculados(function(data) {
                if (data != null) {
//                    alert("data.length = " + data.length);
                    /*for (var i = 0; i < data.length; i++) {
                        var i3 = data[i];
                        lista[0][i] = [i3.year, i3.totalRevenue];
                        lista[1][i] = [i3.year, i3.totalExpenses];
                    }*/

                    lista2 = [[[],[]],[[],[]],[[],[]]];

                    lista2[0][0] = [1999, 7];
                    lista2[1][0] = [1999, 6];
                    lista2[2][0] = [1999, 5];

                    lista2[0][1] = [2001, 3];
                    lista2[1][1] = [2001, 4];
                    lista2[2][1] = [2001, 4];

                    lista2[0][2] = [2002, 5];
                    lista2[1][2] = [2002, 6];
                    lista2[2][2] = [2002, 3];

                    lista2[0][3] = [2003, 8];
                    lista2[1][3] = [2003, 9];
                    lista2[2][3] = [2003, 2];

                    lista2[0][4] = [2004, 2];
                    lista2[1][4] = [2004, 3];
                    lista2[2][4] = [2004, 1];

//                    alert("lista = " + lista);
                    jQuery('#chart1').empty();
                    jQuery('#chart1').jqplot(lista2, {
                        animate: true,
                        animateReplot: true,
                        title:'Line Style Options',
                        /*series:[
                            {
                                label: "Total Revenue",
                                // Change our line width and use a diamond shaped marker.
                                markerOptions: { style:'dimaond' }
                            },
                            {
                                label: "Total Expenses",
                                markerOptions: { size: 7, style:"circle" }
                            },
                            {
                                label: "Total another",
                                markerOptions: { size: 7, style:"plus" }
                            }
                        ],*/
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
                                label: 'Year',
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
            });
        }
    }

    viewI3();

    function subeArchivo() {
//    alrt("Hola 2");
//        botonEnProceso("bgFoto");
        var o = jQuery("#fileFoto").val();
        if (o == '') {
            alrtError("Por favor seleccione un archivo <%--<%=tipoPremio.getId()%>--%>");
            botonOperativo();
        } else
            biRemoto.subeArchivoExcel(dwr.util.getValue('fileFoto'),function(data){
                if(data!=null){
                    var lista = [[[],[]],[[],[]]];
                    /*for (var i = 0; i < data.length; i++) {
                        var i3 = data[i];
                        lista[0][i] = [i3.year, i3.totalRevenue];
                        lista[1][i] = [i3.year, i3.totalExpenses];
                    }*/

                    for (var i = 0; i < data.length; i++) {
//                        alrt("i: " + i + " -> " + data[i]);
                        var filaList = data[i];
                        for (var j = 0; j < filaList.length; j++) {
                            var celda = filaList[j];
                            alrtError("cell: " + j + " -> " + celda.vDouble);
                            lista[j][i] = []
                        }
                    }

                    alrt("Bien");
                    botonOperativo();
                } else {
                    botonOperativo();
                    alrtError("Problemas");
                }
            });
    }

</script>

<jsp:include page="c_footer.jsp"/>
