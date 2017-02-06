<jsp:include page="m_header.jsp" />
<%@ page import="java.util.List" %>
<%@ page import="co.com.elramireza.bi.model.Indicador" %>
<%@ page import="co.com.elramireza.bi.model.MaestroIndicadorEntity" %>
<jsp:useBean id="biManager" class="co.com.elramireza.bi.dao.BiDAO" scope="application"/>
<%
    String idIndicadorS = request.getParameter("id");
    int idIndicador = 0;
    if(idIndicadorS!=null){
        idIndicador = Integer.parseInt(idIndicadorS);
    }

    MaestroIndicadorEntity maestroIndicadorEntity = biManager.getMaestroIndicador(idIndicador);


    List<Indicador> indicadores1;

    switch (idIndicador) {
        case 1 :
            System.out.println("Entro a 1");
            indicadores1 = biManager.getValoresIndicador1();
            break;
        default:
            indicadores1 = biManager.getValoresIndicador1();
            break;
    }

    System.out.println("indicadores1.size() = " + indicadores1.size());

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
                            for(int i = 0; i<indicadores1.size();i++){
                                Indicador ind = indicadores1.get(i);
                        %>
                        lista[0][<%=i%>] = [<%=ind.getFecha()%>, <%=ind.getVariable1()%>];
                        lista[1][<%=i%>] = [<%=ind.getFecha()%>, <%=ind.getVariable2()%>];

                        lista2[0][<%=i%>] = [<%=ind.getFecha()%>, <%=ind.getIndicador()%>];
                        lista2[1][<%=i%>] = [<%=ind.getFecha()%>, <%=ind.getAceptacion()%>];
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
                                    label: "<%=maestroIndicadorEntity.getVar1()%>",
                                    // Change our line width and use a diamond shaped marker.
                                    markerOptions: { style:'dimaond' }
                                },
                                {
                                    label: "<%=maestroIndicadorEntity.getVar2()%>",
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
                        <h3><%=maestroIndicadorEntity.getNombre()%></h3>
                        <p></p>
                    </div>
                </div>
                <div class="row m-b-40">
                    <div class="col-md-6">
                        <h4> Bar chart </h4>
                        <div id="chart1" style="height:500px; width:100%;"></div>
                        <%--<div id="chart1">--%>
                        <%--<div id="morris-bar-example">--%>
                        <%--</div>--%>
                    </div>
                    <div class="col-md-6">
                        <h4> Line chart </h4>
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
