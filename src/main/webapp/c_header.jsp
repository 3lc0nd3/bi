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

    <script src="javascripts/jquery.js"></script>
    <script src="javascripts/foundation.min.js"></script>

    <script src="javascripts/jquery/jquery.formatCurrency-1.4.0.min.js"></script>

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
    <script src="javascripts/jqPlot/jqplot.highlighter.js"></script>
    
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
    <jsp:include page="c_banner.jsp"/>
    <jsp:include page="c_menu.jsp"/>
