<%@ page import="java.util.List" %>
<%@ page import="co.com.elramireza.bi.model.Indicador" %>
<jsp:useBean id="biManager" class="co.com.elramireza.bi.dao.BiDAO" scope="application"/>
<jsp:include page="c_header.jsp"/>

<%
    List<Indicador> indicadores1 = biManager.getHibernateTemplate().find(
            "from Indicador where idIndicador = 1 and version = '1'"
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

    var cellFuncs = [
            function(data) { return data.institution;   },
            function(data) { return data.totalRevenue; },
            function(data) { return Math.round(data.totalAcademicStaffCosts *100)/100; }
    ];

    function viewI7(){
        dwr.util.removeAllRows("i7tBody");
        var year = dwr.util.getValue("year");
        if(true){
            var s1 = [];
            var tk = [];
            var lista = [[[],[]],[[],[]]];
            var lista2 = [[[],[]],[[],[]]];
//            lista2 = [[[],[]],[[],[]],[[],[]]];
//            biRemoto.getI7Values(insti, year, function(data){
//                dwr.util.addRows("i7tBody", data, cellFuncs);
                if (true) {
//                    for (var i = 0; i < data.length; i++) {
//                        var i7 = data[i];
//                        lista[0][i] = [i7.institution, i7.totalRevenue];
//                        lista[1][i] = [i7.institution, i7.totalAcademicStaffCosts];
//                    }
                    <%
                        for(int i = 0; i<indicadores1.size();i++){
                            Indicador ind = indicadores1.get(i);
                    %>
                        lista[0][<%=i%>] = [<%=ind.getFecha()%>, <%=ind.getVariable1()%>];
                        lista[1][<%=i%>] = [<%=ind.getFecha()%>, <%=ind.getVariable2()%>];

                        lista2[0][<%=i%>] = [<%=ind.getFecha()%>, <%=ind.getIndicador()%>];
                        lista2[1][<%=i%>] = [<%=ind.getFecha()%>, <%=ind.getAceptacion()%>];
//                        lista2[2][0] = [1999, 5];
                    <%
                        }
                    %>
                    /*lista = [
                        [["a",1], ["b",2], ["c",3], ["d",4]],
                        [["a",5], ["b",6], ["c",7], ["d",8]]
                    ];*/
//                    alert("lista = " + lista);
                    jQuery('#chart1').empty();
                    jQuery('#chart2').empty();
                    jQuery('#chart1').jqplot(lista, {
                        animate: true,
                        title:' Indicador ' +1,
                        series:[
                            {
                                label: "RNA Producidos"
                            },
                            {
                                label: "RNA Solicitados"
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
                        title:'Indicador 1',
                        series:[
                         {
                         label: "Indicador 1",
                         // Change our line width and use a diamond shaped marker.
                         markerOptions: { style:'dimaond' }
                         },
                         {
                         label: "Aceptaci&oacute;n",
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
//            });
        }

    }

    viewI7();
</script>

<jsp:include page="c_footer.jsp"/>
