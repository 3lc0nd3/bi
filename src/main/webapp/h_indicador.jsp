<%@ page import="java.util.List" %>
<%@ page import="co.com.elramireza.bi.model.Indicador" %>
<%@ page import="co.com.elramireza.bi.model.MaestroIndicadorEntity" %>
<jsp:useBean id="biManager" class="co.com.elramireza.bi.dao.BiDAO" scope="application"/>
<jsp:include page="c_header.jsp"/>

<%
    String idIndicadorS = request.getParameter("id");
    int idIndicador = 0;
    if(idIndicadorS!=null){
        idIndicador = Integer.parseInt(idIndicadorS);
    }

    MaestroIndicadorEntity maestroIndicadorEntity = biManager.getMaestroIndicador(idIndicador);

    List<Indicador> indicadores1 = biManager.getHibernateTemplate().find(
            "from Indicador where maestroIndicador.id = ? and version = '1'",
            idIndicador
    );

%>

<div class="row">
    <div class="six columns">
        <div class="container">
            <div id="chart1" style="height:500px; width:100%;"></div>
        </div>
    </div>
    <div class="six columns">
        <div class="container">
            <div id="chart2" style="height:500px; width:100%;"></div>
        </div>
    </div>
</div>


    <br>
    <%--<table width="80%">
        <thead>
            <th>Institution</th>
            <th>Total Revenue</th>
            <th>Total Academic Staff Cost</th>
        </thead>
        <tbody id="i7tBody"></tbody>
    </table>--%>
</div>

<script type="text/javascript">
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
                                rendererOptions: { /*forceTickAt0: true, */forceTickAt: 100},
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
                        }
                    });
                }
        }

    }

    viewI7();
</script>

<jsp:include page="c_footer.jsp"/>
