<jsp:include page="m_header.jsp" />
<%@ page import="java.util.List" %>
<%@ page import="co.com.elramireza.bi.model.Indicador" %>
<%@ page import="co.com.elramireza.bi.model.MaestroIndicadorEntity" %>
<%@ page import="java.util.ArrayList" %>
<jsp:useBean id="biManager" class="co.com.elramireza.bi.dao.BiDAO" scope="application"/>
<%
    int cuantosUltimos = 12;

    String idIndicadorS = request.getParameter("id");
    int idIndicador = 0;
    if(idIndicadorS!=null){
        idIndicador = Integer.parseInt(idIndicadorS);
    }

    MaestroIndicadorEntity maestroIndicadorEntity = biManager.getMaestroIndicador(idIndicador);


    List<Indicador> indicadores;

    switch (idIndicador) {
        case 1 :
            System.out.println("Entro a 1");
            indicadores = biManager.getUltimosIndicadores(biManager.getValoresIndicador1(),cuantosUltimos);
            break;
        case 2:
            System.out.println("Entro a 2");
            indicadores = biManager.getUltimosIndicadores(biManager.getIndicadorNDCompleto(2),cuantosUltimos);
            break;
        case 3:
            System.out.println("Entro a 3");
            indicadores = biManager.getUltimosIndicadores(biManager.getIndicadorNDCompleto(3),cuantosUltimos);
            break;
        case 4:
            System.out.println("Entro a 4");
            indicadores = biManager.getUltimosIndicadores(biManager.getValoresIndicador4(),cuantosUltimos);
            break;
        case 6:
            System.out.println("Entro a 6");
            indicadores = biManager.getUltimosIndicadores(biManager.getValoresIndicador6(),cuantosUltimos);
            break;
        case 7:
            System.out.println("Entro a 7");
            indicadores = biManager.getUltimosIndicadores(biManager.getIndicadorNDCompleto(7),cuantosUltimos);
            break;
        case 8:
            System.out.println("Entro a 8");
            indicadores = biManager.getUltimosIndicadores(biManager.getValoresIndicador8(),cuantosUltimos);
            break;
        case 9:
            System.out.println("Entro a 9");
            indicadores = biManager.getUltimosIndicadores(biManager.getValoresIndicador9(),cuantosUltimos);
            break;
        case 10:
            System.out.println("Entro a 10");
            indicadores = biManager.getUltimosIndicadores(biManager.getValoresIndicador10(),cuantosUltimos);
            break;
        case 11:
            System.out.println("Entro a 11");
            indicadores = biManager.getUltimosIndicadores(biManager.getValoresIndicador11(),cuantosUltimos);
            break;
        case 12:
            System.out.println("Entro a 12");
            indicadores = biManager.getUltimosIndicadores(biManager.getValoresIndicador12(),cuantosUltimos);
            break;
        case 13:
            System.out.println("Entro a 13");
            indicadores = biManager.getUltimosIndicadores(biManager.getIndicadorNDCompleto(13),cuantosUltimos);
            break;
        case 14:
            System.out.println("Entro a 14");
            indicadores = biManager.getUltimosIndicadores(biManager.getValoresIndicador14(),cuantosUltimos);
            break;
        case 15:
            System.out.println("Entro a 15");
            indicadores = biManager.getUltimosIndicadores(biManager.getValoresIndicador15(),cuantosUltimos);
            break;
        case 16:
            System.out.println("Entro a 16");
            indicadores = biManager.getUltimosIndicadores(biManager.getValoresIndicador16(),cuantosUltimos);
            break;
        case 17:
            System.out.println("Entro a 17");
            indicadores = biManager.getUltimosIndicadores(biManager.getValoresIndicador17(),cuantosUltimos);
            break;
        case 18:
            System.out.println("Entro a 18");
            indicadores = biManager.getUltimosIndicadores(biManager.getValoresIndicador18(),cuantosUltimos);
            break;
        case 19:
            System.out.println("Entro a 19");
            indicadores = biManager.getUltimosIndicadores(biManager.getValoresIndicador19(),cuantosUltimos);
            break;
        case 20:
            System.out.println("Entro a 20");
            indicadores = biManager.getUltimosIndicadores(biManager.getValoresIndicador20(),cuantosUltimos);
            break;
        case 21:
            System.out.println("Entro a 21");
            indicadores = biManager.getUltimosIndicadores(biManager.getValoresIndicador21(),cuantosUltimos);
            break;
        case 22:
            System.out.println("Entro a 22");
            indicadores = biManager.getUltimosIndicadores(biManager.getValoresIndicador22(),cuantosUltimos);
            break;
        case 23:
            System.out.println("Entro a 23");
            indicadores = biManager.getUltimosIndicadores(biManager.getValoresIndicador23(),cuantosUltimos);
            break;
        case 24:
            System.out.println("Entro a 24");
            indicadores = biManager.getUltimosIndicadores(biManager.getValoresIndicador24(),cuantosUltimos);
            break;
        case 25:
            System.out.println("Entro a 25");
            indicadores = biManager.getUltimosIndicadores(biManager.getValoresIndicador25(),cuantosUltimos);
            break;
        case 26:
            System.out.println("Entro a 26");
            indicadores = biManager.getUltimosIndicadores(biManager.getIndicadorNDCompleto(26),cuantosUltimos);
            break;
        case 27:
            System.out.println("Entro a 27");
            indicadores = biManager.getUltimosIndicadores(biManager.getIndicadorNDCompleto(27),cuantosUltimos);
            break;
        case 28:
            System.out.println("Entro a 28");
            indicadores = biManager.getUltimosIndicadores(biManager.getIndicadorNDCompleto(28),cuantosUltimos);
            break;
        case 29:
            System.out.println("Entro a 29");
            indicadores = biManager.getUltimosIndicadores(biManager.getIndicadorNDCompleto(29),cuantosUltimos);
            break;
        case 30:
            System.out.println("Entro a 30");
            indicadores = biManager.getUltimosIndicadores(biManager.getIndicadorNDCompleto(30),cuantosUltimos);
            break;
        case 31:
            System.out.println("Entro a 31");
            indicadores = biManager.getUltimosIndicadores(biManager.getIndicadorNDCompleto(31),cuantosUltimos);
            break;
        case 32:
            System.out.println("Entro a 32");
            indicadores = biManager.getUltimosIndicadores(biManager.getIndicadorNDCompleto(32),cuantosUltimos);
            break;
        case 33:
            System.out.println("Entro a 33");
            indicadores = biManager.getUltimosIndicadores(biManager.getIndicadorNDCompleto(33),cuantosUltimos);
            break;
        case 34:
            System.out.println("Entro a 34");
            indicadores = biManager.getUltimosIndicadores(biManager.getIndicadorNDCompleto(34),cuantosUltimos);
            break;
        default:
            indicadores = new ArrayList<Indicador>();
            break;
    }

//    System.out.println("indicadores1.size() = " + indicadores1.size());

    /*indicadores1 = biManager.getHibernateTemplate().find(
            "from Indicador where maestroIndicador.id = ? and version = '1'",
            idIndicador
    );*/

%>
<script>
    var colors;
    (function() {
        'use strict';
        $(function() {
            // $('body').attr('data-palette', config.theme);
            var config = $.localStorage.get('config');
            $('body').attr('data-layout', config.layout);
            $('body').attr('data-direction', config.direction);
            colors = config.colors;


            function tooltipContentEditor(str, seriesIndex, pointIndex, plot) {
                // display series_label with x and y values value
                return plot.legend.labels[seriesIndex] + ", " + str;
            }

            function viewI7(){
                dwr.util.removeAllRows("i7tBody");
                var year = dwr.util.getValue("year");
                if(true){
                    var s1 = [];
                    var tk = [];
                    var lista = [[[],[]],[[],[]]];
                    var lista2 = [[[],[]],[[],[]]];
                    if (true) {
                        <%
                            for(int i = 0; i<indicadores.size();i++){
                                Indicador ind = indicadores.get(i);
                        %>
                        lista[0][<%=i%>] = [<%=ind.getFecha()%>, <%=ind.getVariable1()%>];
                        lista[1][<%=i%>] = [<%=ind.getFecha()%>, <%=ind.getVariable2()%>];

                        lista2[0][<%=i%>] = [<%=ind.getFecha()%>, 100*<%=ind.getIndicador()%>];
                        lista2[1][<%=i%>] = [<%=ind.getFecha()%>, 100*<%=ind.getAceptacion()%>];
                        <%
                            }
                        %>
                        jQuery('#chart1').empty();
                        jQuery('#chart2').empty();
                        jQuery('#chart1').jqplot(lista, {
                            animate: true,
                            title:'<%=maestroIndicadorEntity.getNombre()%>',
                            series:[
                                {
                                    label: "<%=maestroIndicadorEntity.getVar1()%>"
                                },
                                {
                                    label: "<%=maestroIndicadorEntity.getVar2()%>"
                                }
                            ],
                            legend:{show:true, location:'ne'},
                            seriesDefaults:{
                                pointLabels: { show:true } ,
                                renderer:jQuery.jqplot.BarRenderer,
                                rendererOptions:{
//                                    varyBarColor: true,
                                    animation: {
                                        speed: 1700
                                    }
                                }
                            },
                            axes:{
                                xaxis: {
                                    renderer: jQuery.jqplot.CategoryAxisRenderer,
                                    label: 'Meses',
                                    labelRenderer: jQuery.jqplot.CanvasAxisLabelRenderer,
                                    tickRenderer: jQuery.jqplot.CanvasAxisTickRenderer,
                                    tickOptions: {
                                        angle: -45
//                        fontFamily: 'Courier New',
//                        fontSize: '9pt'
                                    }

                                },
                                yaxis:{
                                    rendererOptions:{
                                        tickRenderer:jQuery.jqplot.CanvasAxisTickRenderer},
                                    tickOptions:{
                                        fontSize:'10pt',
                                        fontFamily:'Tahoma',
                                        angle:45
                                    }
                                }
                            },
                            highlighter: {
                                show: true,
                                sizeAdjust: 10,
                                tooltipFormatString: ' %.2f',
                                useAxesFormatters: false
                                ,tooltipAxes: 'y'
                            }
                        });

                        jQuery('#chart2').jqplot(lista2, {
                            animate: true,
                            animateReplot: true,
                            title:'<%=maestroIndicadorEntity.getNombre()%> (%)',
                            series:[
                                {
                                    label: "Indicador %<%--<%=maestroIndicadorEntity.getVar1()%>--%>",
                                    // Change our line width and use a diamond shaped marker.
                                    markerOptions: { style:'dimaond' }
                                },
                                {
                                    label: "Criterio %<%--<%=maestroIndicadorEntity.getVar2()%>--%>",
                                    markerOptions: { size: 7, style:"circle" }
                                }
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
                                    rendererOptions: { forceTickAt0: true, forceTickAt: 100},
                                    label: 'Meses',
                                    labelRenderer: jQuery.jqplot.CanvasAxisLabelRenderer,
                                    tickRenderer: jQuery.jqplot.CanvasAxisTickRenderer,
                                    tickOptions: {
                                        formatString:'%y',
                                        angle: -45
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
//                                    ,tooltipContentEditor:tooltipContentEditor
                                ,tooltipAxes: 'y'
                            }
                        });
                    }
                }

            }
            viewI7();
        });

    })();
</script>

<div class="row m-b-20">
                    <div class="col-xs-12 col-lg-6">
                        <h3>
                            <%=maestroIndicadorEntity.getId()%> -
                            <%=maestroIndicadorEntity.getNombre()%>
                        </h3>
                        <p></p>
                    </div>
                </div>
                <div class="row m-b-40">
                    <div class="col-md-6">
                        <h4> Comparativo </h4>
                        <div id="chart1" style="height:500px; width:100%;"></div>
                        <%--<div id="chart1">--%>
                        <%--<div id="morris-bar-example">--%>
                        <%--</div>--%>
                    </div>
                    <div class="col-md-6">
                        <h4> Aceptaci&oacute;n</h4>
                        <div id="chart2" style="height:500px; width:100%;"></div>
                        <%--<div id="morris-line-example">--%>
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
