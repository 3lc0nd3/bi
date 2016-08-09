<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8" >

    <%
        response.setHeader("Cache-Control","no-cache");
        response.setHeader("Pragma","no-cache");
        response.setDateHeader ("Expires", 0);
    %>


    <%--<script src="javascripts/jquery.js"></script>

    <link rel="stylesheet" href="stylesheets/foundation.css">
    <link rel="stylesheet" href="stylesheets/app.css">

    <script src="javascripts/jqPlot/jquery.jqplot.min.js"></script>
    <script src="javascripts/jqPlot/jqplot.barRenderer.min.js"></script>
    <script src="javascripts/jqPlot/jqplot.categoryAxisRenderer.min.js"></script>
    <script src="javascripts/jqPlot/jqplot.pointLabels.min.js"></script>
    <script src="javascripts/jqPlot/jqplot.canvasTextRenderer.min.js"></script>
    <script src="javascripts/jqPlot/jqplot.cursor.min.js"></script>
    <script src="javascripts/jqPlot/jqplot.logAxisRenderer.min.js"></script>
    <script src="javascripts/jqPlot/jqplot.canvasAxisLabelRenderer.min.js"></script>
    <script src="javascripts/jqPlot/jqplot.canvasAxisTickRenderer.min.js"></script>
    <script src="javascripts/jqPlot/jqplot.highlighter.min.js"></script>
    --%><%--<script src="javascripts/jqPlot/jquery-ui-1.8.21.custom.min.js"></script>--%><%--
    --%><%--<script src="javascripts/jqPlot/excanvas.min.js"></script>--%><%--
    <link rel="stylesheet" href="javascripts/jqPlot/jquery.jqplot.min.css">--%>


    <script src="javascripts/jquery.js"></script>

    <link rel="stylesheet" href="stylesheets/foundation.css">
    <link rel="stylesheet" href="stylesheets/app.css">

    <script src="javascripts/jqPlot/jquery.jqplot.min.js"></script>
    <script src="javascripts/jqPlot/excanvas.min.js"></script>
    <script src="javascripts/jqPlot/jqplot.barRenderer.min.js"></script>
    <script src="javascripts/jqPlot/jqplot.categoryAxisRenderer.min.js"></script>
    <script src="javascripts/jqPlot/jqplot.pointLabels.min.js"></script>
    <script src="javascripts/jqPlot/jqplot.canvasTextRenderer.min.js"></script>
    <script src="javascripts/jqPlot/jqplot.cursor.min.js"></script>
    <script src="javascripts/jqPlot/jqplot.logAxisRenderer.min.js"></script>
    <script src="javascripts/jqPlot/jqplot.canvasAxisLabelRenderer.min.js"></script>
    <script src="javascripts/jqPlot/jqplot.canvasAxisTickRenderer.min.js"></script>
    <script src="javascripts/jqPlot/jqplot.highlighter.min.js"></script>
    <%--<script src="javascripts/jqPlot/jqplot."></script>--%>
    <%--<script src="javascripts/jqPlot/jqplot."></script>--%>
    <link rel="stylesheet" href="javascripts/jqPlot/jquery.jqplot.min.css">

    <script src="javascripts/modernizr.foundation.js"></script>
    <script src="javascripts/jquery.foundation.tabs.js"></script>

    <script type='text/javascript' src='dwr/engine.js'></script>
    <script type='text/javascript' src='dwr/util.js'></script>

    <script type='text/javascript' src='dwr/interface/biRemoto.js'></script>
    <%--<script src="javascripts/jquery.js"></script>--%>
    <script type="text/javascript">
//        jQuery = jQuery.noConflict();
    </script>
</head>

<body>
<div id="chart1" class="example-chart" style="height:600px;width:700px"></div>
<div id="chart2" class="example-chart" style="height:600px;width:500px"></div>
<div id="chartdiv" style="height:400px;width:600px; "></div>
<script type="text/javascript">
    var line1 = [['Nissan', 4],['Porche', 6],['Acura', 2],['Aston Martin', 5],['Rolls Royce', 6]];
        line1 = [
            [[2009,1], [2010,2], [2011,3], [2012,4]],
            [[2009,5], [2010,6], [2011,17], [2012,8]]
        ];
/*
        alert("line1[0][3] = " + line1[0][3]);
        alert("line1[1][2] = " + line1[1][2]);
        alert("line1 = " + line1);*/
        jQuery('#chart1').jqplot(line1, {
            animate: true,
            animateReplot: true,
            title:'Line Style Options',
            series:[
                {
                    label: "Total Revenue"
                },
                {
                    label: "Total Academic Staff Cost"
                }
            ],
            legend:{show:true, location:'ne'},
            seriesDefaults: {
                pointLabels: { show:true } ,
                rendererOptions: {
                    smooth: true
                }
            },
            axes:{
                xaxis: {
                    renderer: jQuery.jqplot.CategoryAxisRenderer,
                    rendererOptions: { forceTickAt0: true, forceTickAt100: true },
                    label: 'Institution',
                    labelRenderer: jQuery.jqplot.CanvasAxisLabelRenderer,
                    tickRenderer: jQuery.jqplot.CanvasAxisTickRenderer,
                    tickOptions: {
                        angle: -30
//                        fontFamily: 'Courier New',
//                        fontSize: '9pt'
                    }

                }
            }
        });


        line1 = [
            [["a",1], ["b",2], ["c",3], ["d",4]],
            [["a",5], ["b",6], ["c",7], ["d",8]]
        ];


        jQuery('#chart2').jqplot(line1, {
            animate: true,
            animateReplot: true,
            title:'Default Bar Chart',
            seriesDefaults:{
                renderer:jQuery.jqplot.BarRenderer
            },
            axes:{
                xaxis: {
                    renderer: jQuery.jqplot.CategoryAxisRenderer,
                    label: 'Institution',
                    labelRenderer: jQuery.jqplot.CanvasAxisLabelRenderer,
                    tickRenderer: jQuery.jqplot.CanvasAxisTickRenderer,
                    tickOptions: {
                        angle: -30
//                        fontFamily: 'Courier New',
//                        fontSize: '9pt'
                    }

                },
                yaxis:{
                    rendererOptions:{
                        tickRenderer:jQuery.jqplot.CanvasAxisTickRenderer},
                    label: '%',
                    tickOptions:{
                        fontSize:'10pt',
                        fontFamily:'Tahoma',
                        angle:30
                    }
                }
            }
        });

    jQuery.jqplot('chartdiv',  [[[1, 2],[3,5.12],[5,13.1],[7,33.6],[9,85.9],[11,219.9]]]);
</script>
       <script src="javascripts/jqPlot/example.js"></script>
</body>
</html>