<!doctype html>
<html lang="en">
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

    List<Indicador> indicadores1 = biManager.getHibernateTemplate().find(
            "from Indicador where maestroIndicador.id = ? and version = '1'",
            idIndicador
    );

%>
<head>
    <meta charset="utf-8">
    <title>Indicadores</title>
    <meta name="description" content="Indicadores">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link rel="shortcut icon" href="favicon.ico">
    <!--[if IE]>
<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
    <!-- global stylesheets -->
    <link rel="stylesheet" href="styles/components/bootstrap.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.1/animate.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.2.0/css/material-design-iconic-font.min.css">
    <link href="https://fonts.googleapis.com/css?family=Roboto:400,300,300italic,400italic,500,500italic,700,700italic,900,900italic" rel="stylesheet" type="text/css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/1.0.0/css/flag-icon.min.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="styles/main.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.css" rel="stylesheet" type="text/css">

    <!-- global scripts -->
    <%--<script src="bower_components/jquery/dist/jquery.js"></script>--%>
    <script src="javascripts/jqPlot/jquery.js"></script>

    <script src="bower_components/tether/dist/js/tether.js"></script>
    <script src="bower_components/bootstrap/dist/js/bootstrap.js"></script>
    <script src="bower_components/PACE/pace.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.0.0/lodash.min.js"></script>
    <script src="scripts/components/jquery-fullscreen/jquery.fullscreen-min.js"></script>
    <script src="bower_components/jquery-storage-api/jquery.storageapi.min.js"></script>
    <script src="bower_components/wow/dist/wow.min.js"></script>
    <script src="scripts/functions.js"></script>
    <script src="scripts/colors.js"></script>
    <script src="scripts/left-sidebar.js"></script>
    <script src="scripts/navbar.js"></script>
    <script src="scripts/horizontal-navigation-1.js"></script>
    <script src="scripts/horizontal-navigation-2.js"></script>
    <script src="scripts/horizontal-navigation-3.js"></script>
    <script src="scripts/main.js"></script>


    <link rel="stylesheet" href="javascripts/jqPlot/jquery.jqplot.min.css">
    <script src="javascripts/jqPlot/jquery.jqplot.min.js"></script>
    <script language="javascript" type="text/javascript" src="javascripts/jqPlot/jqplot.categoryAxisRenderer.js"></script>
    <script language="javascript" type="text/javascript" src="javascripts/jqPlot/jqplot.barRenderer.js"></script>
    <script language="javascript" type="text/javascript" src="javascripts/jqPlot/jqplot.dateAxisRenderer.js"></script>
    <script language="javascript" type="text/javascript" src="javascripts/jqPlot/jqplot.logAxisRenderer.js"></script>
    <script language="javascript" type="text/javascript" src="javascripts/jqPlot/jqplot.canvasTextRenderer.js"></script>
    <script language="javascript" type="text/javascript" src="javascripts/jqPlot/jqplot.canvasAxisTickRenderer.js"></script>
    <script language="javascript" type="text/javascript" src="javascripts/jqPlot/jqplot.highlighter.js"></script>
    <link rel="stylesheet" type="text/css" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.0/themes/smoothness/jquery-ui.css" />

    <script type='text/javascript' src='dwr/engine.js'></script>
    <script type='text/javascript' src='dwr/util.js'></script>
    <script type='text/javascript' src='dwr/interface/biRemoto.js'></script>

    <link href="javascripts/jquery-notice/jquery.notice.css" rel="stylesheet">
    <script src="javascripts/jquery-notice/jquery.notice.js"></script>

    <script type="text/javascript">
        function alrt(msg){
            jQuery.noticeAdd({
                text: msg,
                stay: false,
                type: 'notice-success'
            });
        }
        function alrtError(msg){
            jQuery.noticeAdd({
                text: msg,
                stay: true,
                type: 'notice-error'
            });
        }

        /**
         * hace que el boton se ponga en modo espera
         * @param idBoton
         */
        function botonEnProceso(idBoton){
            var bTmp = dwr.util.byId(idBoton);
            window["botonEnProcesoId"] = idBoton;
            window["botonEnProcesoValueOld"] = bTmp.value;
            bTmp.value = "Procesando";
            bTmp.disabled = true;
        }
        /**
         * retorna a la normalidad
         */
        function botonOperativo(){
            var bTmp = dwr.util.byId(window["botonEnProcesoId"]);
//    alrt("bTmp = " + bTmp);
            if (bTmp != null) {
                bTmp.value = window["botonEnProcesoValueOld"];
                bTmp.disabled = false;
            }
        }

    </script>
    <%--<script src="scripts/charts-morris-js.js"></script>--%>

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

                /*Morris.Bar({
                    element: 'morris-bar-example',
                    data: [{
                        y: '2006',
                        a: 100,
                        b: 90
                    }, {
                        y: '2007',
                        a: 75,
                        b: 65
                    }, {
                        y: '2008',
                        a: 50,
                        b: 40
                    }, {
                        y: '2009',
                        a: 75,
                        b: 65
                    }, {
                        y: '2010',
                        a: 50,
                        b: 40
                    }, {
                        y: '2011',
                        a: 75,
                        b: 65
                    }, {
                        y: '2012',
                        a: 100,
                        b: 90
                    }],
                    xkey: 'y',
                    ykeys: ['a', 'b'],
                    labels: ['Series A', 'Series B'],
                    barColors: [colors.danger, colors.warning],
                });*/
            });

        })();
    </script>

    <style>
        .sidebar-1 .section-title {
            /*text-transform: uppercase;*/
            font-weight: normal !important;
        }
    </style>
</head>
<body data-layout="empty-layout" data-palette="palette-4" data-direction="none">
    <nav class="navbar navbar-fixed-top navbar-1"><a class="navbar-brand" href="index.jsp">Indicadores</a>
        <ul class="nav navbar-nav pull-left toggle-layout">
            <li class="nav-item">
                <a class="nav-link" data-click="toggle-layout"> <i class="zmdi zmdi-menu"></i> </a>
            </li>
        </ul>
        <ul class="nav navbar-nav pull-right hidden-lg-down navbar-profile">
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle no-after" data-toggle="dropdown"> <img class="img-circle img-fluid profile-image" src="assets/faces/m1.png"> </a>
                <div class="dropdown-menu dropdown-menu-scale from-right dropdown-menu-right">
                    <a class="dropdown-item animated fadeIn" href="email-inbox.html"> <i class="zmdi zmdi-email"></i> <span class="label label-pill label-danger label-xs pull-right">New</span> <span class="dropdown-text">Inbox</span> </a>
                    <a class="dropdown-item animated fadeIn" href="pages-profile.html"> <i class="zmdi zmdi-settings-square"></i> <span class="dropdown-text">Profile</span> </a>
                    <a class="dropdown-item animated fadeIn" href="pages-lock-screen.html"> <i class="zmdi zmdi-alarm"></i> <span class="dropdown-text">Lock screen</span> </a>
                    <a class="dropdown-item animated fadeIn" href="http://localhost:9002/pages-logout.html"> <i class="zmdi zmdi-power"></i> <span class="dropdown-text">Logout</span> </a>
                </div>
            </li>
        </ul>
        <!--<ul class="nav navbar-nav pull-right hidden-lg-down navbar-profile">
            <li class="nav-item"> <a class="nav-link direction" data-click="toggle-direction">RTL</a> </li>
        </ul>-->
    </nav>
    <div class="theme-selector">
        <p>Select theme</p>

    </div>
    <div class="horizontal-navigation horizontal-navigation-1">
        <div class="container-fluid">
            <div class="row">
                <div class="col-xs-12">
                    <div class="p-t-20 p-b-20">
                        <ol class="breadcrumb icon-angle-right animation-delay">
                            <li class="wow fadeIn"> Home </li>
                            <li class="wow fadeIn"> Charts </li>
                            <li class="wow fadeIn active"> Morris js </li>
                        </ol>
                        <div class="description">
                            <h3 class="wow fadeIn delay-1000">Charts</h3>
                            <p class="wow fadeIn delay-1200"> Morris js </p>
                        </div>
                        <ul class="list-unstyled navigation animation-delay">
                            <li class="horizontal-navigation-dropdown wow fadeIn"> <a class="btn btn-primary"> Dashboards </a>
                                <div class="horizontal-dropdown-menu" ng-class="{'horizontal-dropdown-menu-lg': item.items.length &gt; 10}"> <a class="btn btn-primary sideline" href="dashboards-analytics.html"> Analytics </a> <a class="btn btn-primary sideline" href="dashboards-e-commerce.html"> e-Commerce </a> <a class="btn btn-primary sideline" href="dashboards-finance.html"> Finance </a> <a class="btn btn-primary sideline" href="dashboards-saas.html"> SAAS </a> </div>
                            </li>
                            <li class="horizontal-navigation-dropdown wow fadeIn"> <a class="btn btn-primary"> Layouts </a>
                                <div class="horizontal-dropdown-menu" ng-class="{'horizontal-dropdown-menu-lg': item.items.length &gt; 10}"> <a class="btn btn-primary sideline" data-click="set-layout" data-id="default-sidebar"> Default sidebar </a> <a class="btn btn-primary sideline" data-click="set-layout" data-id="collapsed-sidebar"> Collapsed sidebar </a> <a class="btn btn-primary sideline" data-click="set-layout" data-id="off-canvas"> Off canvas </a> <a class="btn btn-primary sideline" data-click="set-layout" data-id="left-sidebar-over"> Left sidebar over </a> <a class="btn btn-primary sideline" data-click="set-layout" data-id="left-sidebar-under"> Left sidebar under </a> <a class="btn btn-primary sideline" data-click="set-layout" data-id="horizontal-navigation-1"> Horizontal navigation 1 </a> <a class="btn btn-primary sideline" data-click="set-layout" data-id="horizontal-navigation-2"> Horizontal navigation 2 </a> <a class="btn btn-primary sideline" data-click="set-layout" data-id="horizontal-navigation-3"> Horizontal navigation 3 </a> <a class="btn btn-primary sideline" data-click="set-layout" data-id="mega-menu"> Mega menu </a> </div>
                            </li>
                            <li class="horizontal-navigation-dropdown wow fadeIn"> <a class="btn btn-primary"> Widgets </a>
                                <div class="horizontal-dropdown-menu" ng-class="{'horizontal-dropdown-menu-lg': item.items.length &gt; 10}"> <a class="btn btn-primary sideline" href="widgets-activity-widgets.html"> Activity widgets </a> <a class="btn btn-primary sideline" href="widgets-chart-widgets.html"> Chart widgets </a> <a class="btn btn-primary sideline" href="widgets-social-media-widgets.html"> Social Media widgets </a> <a class="btn btn-primary sideline" href="widgets-text-widgets.html"> Text widgets </a> <a class="btn btn-primary sideline" href="widgets-user-widgets.html"> User widgets </a> </div>
                            </li>
                            <li class="horizontal-navigation-dropdown wow fadeIn"> <a class="btn btn-primary"> UI </a>
                                <div class="horizontal-dropdown-menu horizontal-dropdown-menu-lg" ng-class="{'horizontal-dropdown-menu-lg': item.items.length &gt; 10}"> <a class="btn btn-primary sideline" href="ui-elements-timers-and-counters.html"> Timers and counters </a> <a class="btn btn-primary sideline" href="ui-elements-images.html"> Images </a> <a class="btn btn-primary sideline" href="ui-elements-overlays.html"> Overlays </a> <a class="btn btn-primary sideline" href="ui-elements-lists.html"> Lists </a> <a class="btn btn-primary sideline" href="ui-elements-typography.html"> Typography </a> <a class="btn btn-primary sideline" href="ui-elements-buttons.html"> Buttons </a> <a class="btn btn-primary sideline" href="ui-elements-labels.html"> Labels </a> <a class="btn btn-primary sideline" href="ui-elements-progress-bars.html"> Progress Bars </a> <a class="btn btn-primary sideline" href="ui-elements-carousel.html"> Carousel </a> <a class="btn btn-primary sideline" href="ui-elements-tabs.html"> Tabs </a> <a class="btn btn-primary sideline" href="ui-elements-grid.html"> Grid </a> <a class="btn btn-primary sideline" href="ui-elements-alerts-and-notifications.html"> Alerts &amp; notifications </a> <a class="btn btn-primary sideline" href="ui-elements-animations.html"> Animations </a> <a class="btn btn-primary sideline" href="ui-elements-breadcrumbs.html"> Breadcrumbs </a> <a class="btn btn-primary sideline" href="ui-elements-google-maps.html"> Google Maps </a> <a class="btn btn-primary sideline" href="ui-elements-vector-maps.html"> Vector Maps </a> <a class="btn btn-primary sideline" href="ui-elements-cards.html"> Cards </a> <a class="btn btn-primary sideline" href="ui-elements-dropdowns.html"> Dropdowns </a> <a class="btn btn-primary sideline" href="ui-elements-drag-and-drop.html"> Drag and drop </a> <a class="btn btn-primary sideline" href="ui-elements-modals.html"> Modals </a> <a class="btn btn-primary sideline" href="ui-elements-other-elements.html"> Other elements </a> </div>
                            </li>
                            <li class="horizontal-navigation-dropdown wow fadeIn"> <a class="btn btn-primary"> Utilities </a>
                                <div class="horizontal-dropdown-menu" ng-class="{'horizontal-dropdown-menu-lg': item.items.length &gt; 10}"> <a class="btn btn-primary sideline" href="utilities-color-utilities.html"> Color utilities </a> <a class="btn btn-primary sideline" href="utilities-border-utilities.html"> Border utilities </a> <a class="btn btn-primary sideline" href="utilities-height-utilities.html"> Height utilities </a> <a class="btn btn-primary sideline" href="utilities-margin-utilities.html"> Margin Utilities </a> <a class="btn btn-primary sideline" href="utilities-other-utilities.html"> Other utilities </a> <a class="btn btn-primary sideline" href="utilities-padding-utilities.html"> Padding utilities </a> <a class="btn btn-primary sideline" href="utilities-position-utilities.html"> Position utilities </a> <a class="btn btn-primary sideline" href="utilities-text-utilities.html"> Text utilities </a> <a class="btn btn-primary sideline" href="utilities-width-utilities.html"> Width utilities </a> </div>
                            </li>
                            <li class="horizontal-navigation-dropdown wow fadeIn"> <a class="btn btn-primary"> Icons </a>
                                <div class="horizontal-dropdown-menu" ng-class="{'horizontal-dropdown-menu-lg': item.items.length &gt; 10}"> <a class="btn btn-primary sideline" href="icons-font-awesome.html"> Font Awesome </a> <a class="btn btn-primary sideline" href="icons-ionicons.html"> Ionicons </a> <a class="btn btn-primary sideline" href="icons-emoji.html"> Emoji </a> <a class="btn btn-primary sideline" href="icons-flags.html"> Flags </a> <a class="btn btn-primary sideline" href="icons-material-design-icons.html"> Material Design Icons </a> <a class="btn btn-primary sideline" href="icons-weather-icons.html"> Weather Icons </a> </div>
                            </li>
                            <li class="horizontal-navigation-dropdown wow fadeIn"> <a class="btn btn-primary"> Forms </a>
                                <div class="horizontal-dropdown-menu" ng-class="{'horizontal-dropdown-menu-lg': item.items.length &gt; 10}"> <a class="btn btn-primary sideline" href="forms-basic.html"> Basic forms </a> <a class="btn btn-primary sideline" href="forms-sample.html"> Sample forms </a> <a class="btn btn-primary sideline" href="forms-validation.html"> Form Validation </a> <a class="btn btn-primary sideline" href="forms-file-uploads.html"> File Uploads </a> <a class="btn btn-primary sideline" href="forms-jquery-file-upload.html"> jQuery File Upload </a> <a class="btn btn-primary sideline" href="forms-text-editor.html"> Text editor </a> <a class="btn btn-primary sideline" href="forms-pickers.html"> Pickers </a> <a class="btn btn-primary sideline" href="forms-nouislider.html"> NoUiSlider </a> <a class="btn btn-primary sideline" href="forms-typeahead.html"> Typeahead </a> </div>
                            </li>
                            <li class="horizontal-navigation-dropdown wow fadeIn"> <a class="btn btn-primary"> Tables </a>
                                <div class="horizontal-dropdown-menu" ng-class="{'horizontal-dropdown-menu-lg': item.items.length &gt; 10}"> <a class="btn btn-primary sideline" href="tables-static.html"> Static Tables </a> <a class="btn btn-primary sideline" href="tables-datatable.html"> Datatable </a> <a class="btn btn-primary sideline" href="tables-sortable.html"> Sortable </a> <a class="btn btn-primary sideline" href="tables-table-export.html"> Table export </a> <a class="btn btn-primary sideline" href="tables-jquery-treegrid.html"> jQuery Treegrid </a> </div>
                            </li>
                            <li class="horizontal-navigation-dropdown wow fadeIn"> <a class="btn btn-primary"> e-Commerce </a>
                                <div class="horizontal-dropdown-menu" ng-class="{'horizontal-dropdown-menu-lg': item.items.length &gt; 10}"> <a class="btn btn-primary sideline" href="e-commerce-dashboard.html"> Dashboard </a> <a class="btn btn-primary sideline" href="e-commerce-orders.html"> Orders </a> <a class="btn btn-primary sideline" href="e-commerce-order.html"> Order </a> <a class="btn btn-primary sideline" href="e-commerce-products.html"> Products </a> <a class="btn btn-primary sideline" href="e-commerce-product.html"> Product </a> <a class="btn btn-primary sideline" href="e-commerce-customers.html"> Customers </a> </div>
                            </li>
                            <li class="horizontal-navigation-dropdown wow fadeIn"> <a class="btn btn-primary"> Email </a>
                                <div class="horizontal-dropdown-menu" ng-class="{'horizontal-dropdown-menu-lg': item.items.length &gt; 10}"> <a class="btn btn-primary sideline" href="email-inbox.html"> Inbox </a> <a class="btn btn-primary sideline" href="email-view.html"> View email </a> <a class="btn btn-primary sideline" href="email-compose.html"> Compose email </a> </div>
                            </li>
                            <li class="horizontal-navigation-dropdown wow fadeIn"> <a class="btn btn-primary"> Charts </a>
                                <div class="horizontal-dropdown-menu" ng-class="{'horizontal-dropdown-menu-lg': item.items.length &gt; 10}"> <a class="btn btn-primary sideline" href="charts-nvd3.html"> NVD3 </a> <a class="btn btn-primary sideline" href="charts-chartist.html"> Chartist </a> <a class="btn btn-primary sideline" href="charts-chart-js.html"> Chart.js </a> <a class="btn btn-primary sideline" href="charts-easy-pie-chart.html"> Easy Pie Chart </a> <a class="btn btn-primary sideline" href="charts-jquery-knob.html"> jQuery Knob </a> <a class="btn btn-primary sideline" href="charts-gauge.html"> Gauges </a> <a class="btn btn-primary sideline" href="charts-morris-js.html"> Morris.js </a> </div>
                            </li>
                            <li class="horizontal-navigation-dropdown wow fadeIn"> <a class="btn btn-primary"> Pages </a>
                                <div class="horizontal-dropdown-menu" ng-class="{'horizontal-dropdown-menu-lg': item.items.length &gt; 10}"> <a class="btn btn-primary sideline" href="pages-error-page.html"> Error page </a> <a class="btn btn-primary sideline" href="pages-empty-page.html"> Empty Page </a> <a class="btn btn-primary sideline" href="pages-login.html"> Login </a> <a class="btn btn-primary sideline" href="pages-register.html"> Register </a> <a class="btn btn-primary sideline" href="pages-forgot-password.html"> Forgot Password </a> <a class="btn btn-primary sideline" href="pages-lock-screen.html"> Lock Screen </a> <a class="btn btn-primary sideline" href="pages-profile.html"> User profile </a> <a class="btn btn-primary sideline" href="pages-coming-soon.html"> Coming soon </a> <a class="btn btn-primary sideline" href="pages-under-maintenance.html"> Under maintenance </a> </div>
                            </li>
                            <li class="horizontal-navigation-dropdown wow fadeIn"> <a class="btn btn-primary"> Extras </a>
                                <div class="horizontal-dropdown-menu" ng-class="{'horizontal-dropdown-menu-lg': item.items.length &gt; 10}"> <a class="btn btn-primary sideline" href="extras-invoice.html"> Invoice </a> <a class="btn btn-primary sideline" href="extras-zoom.html"> Zoom </a> <a class="btn btn-primary sideline" href="extras-search-results.html"> Search Results </a> <a class="btn btn-primary sideline" href="extras-pricing-tables.html"> Pricing tables </a> <a class="btn btn-primary sideline" href="extras-wow.html"> Wow </a> <a class="btn btn-primary sideline" href="extras-syntax-highlighting.html"> Syntax highlighting </a> <a class="btn btn-primary sideline" href="extras-calendar.html"> Calendar </a> <a class="btn btn-primary sideline" href="extras-crop.html"> Image cropping </a> <a class="btn btn-primary sideline" href="extras-mousetrap.html"> Mousetrap </a> <a class="btn btn-primary sideline" href="extras-typed.html"> Typed.js </a> </div>
                            </li>
                            <li class="horizontal-navigation-dropdown wow fadeIn"> <a class="btn btn-primary" href="documentation.html"> Docs </a> </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="horizontal-navigation horizontal-navigation-2">
        <div class="container-fluid">
            <div class="row">
                <div class="col-xs-12">
                    <div class="p-t-20 p-b-20">
                        <ol class="breadcrumb icon-angle-right animation-delay">
                            <li class="wow fadeIn"> Home </li>
                            <li class="wow fadeIn"> Charts </li>
                            <li class="wow fadeIn active"> Morris js </li>
                        </ol>
                        <div class="description">
                            <h3 class="wow fadeIn delay-1000">Charts</h3>
                            <p class="wow fadeIn delay-1200"> Morris js </p>
                        </div>
                        <ul class="list-unstyled navigation animation-delay">
                            <li class="horizontal-navigation-dropdown wow fadeIn"> <a class="btn btn-primary"> Dashboards </a>
                                <div class="horizontal-dropdown-menu" ng-class="{'horizontal-dropdown-menu-lg': item.items.length &gt; 10}"> <a class="btn btn-primary sideline" href="dashboards-analytics.html"> Analytics </a> <a class="btn btn-primary sideline" href="dashboards-e-commerce.html"> e-Commerce </a> <a class="btn btn-primary sideline" href="dashboards-finance.html"> Finance </a> <a class="btn btn-primary sideline" href="dashboards-saas.html"> SAAS </a> </div>
                            </li>
                            <li class="horizontal-navigation-dropdown wow fadeIn"> <a class="btn btn-primary"> Layouts </a>
                                <div class="horizontal-dropdown-menu" ng-class="{'horizontal-dropdown-menu-lg': item.items.length &gt; 10}"> <a class="btn btn-primary sideline" data-click="set-layout" data-id="default-sidebar"> Default sidebar </a> <a class="btn btn-primary sideline" data-click="set-layout" data-id="collapsed-sidebar"> Collapsed sidebar </a> <a class="btn btn-primary sideline" data-click="set-layout" data-id="off-canvas"> Off canvas </a> <a class="btn btn-primary sideline" data-click="set-layout" data-id="left-sidebar-over"> Left sidebar over </a> <a class="btn btn-primary sideline" data-click="set-layout" data-id="left-sidebar-under"> Left sidebar under </a> <a class="btn btn-primary sideline" data-click="set-layout" data-id="horizontal-navigation-1"> Horizontal navigation 1 </a> <a class="btn btn-primary sideline" data-click="set-layout" data-id="horizontal-navigation-2"> Horizontal navigation 2 </a> <a class="btn btn-primary sideline" data-click="set-layout" data-id="horizontal-navigation-3"> Horizontal navigation 3 </a> <a class="btn btn-primary sideline" data-click="set-layout" data-id="mega-menu"> Mega menu </a> </div>
                            </li>
                            <li class="horizontal-navigation-dropdown wow fadeIn"> <a class="btn btn-primary"> Widgets </a>
                                <div class="horizontal-dropdown-menu" ng-class="{'horizontal-dropdown-menu-lg': item.items.length &gt; 10}"> <a class="btn btn-primary sideline" href="widgets-activity-widgets.html"> Activity widgets </a> <a class="btn btn-primary sideline" href="widgets-chart-widgets.html"> Chart widgets </a> <a class="btn btn-primary sideline" href="widgets-social-media-widgets.html"> Social Media widgets </a> <a class="btn btn-primary sideline" href="widgets-text-widgets.html"> Text widgets </a> <a class="btn btn-primary sideline" href="widgets-user-widgets.html"> User widgets </a> </div>
                            </li>
                            <li class="horizontal-navigation-dropdown wow fadeIn"> <a class="btn btn-primary"> UI </a>
                                <div class="horizontal-dropdown-menu horizontal-dropdown-menu-lg" ng-class="{'horizontal-dropdown-menu-lg': item.items.length &gt; 10}"> <a class="btn btn-primary sideline" href="ui-elements-timers-and-counters.html"> Timers and counters </a> <a class="btn btn-primary sideline" href="ui-elements-images.html"> Images </a> <a class="btn btn-primary sideline" href="ui-elements-overlays.html"> Overlays </a> <a class="btn btn-primary sideline" href="ui-elements-lists.html"> Lists </a> <a class="btn btn-primary sideline" href="ui-elements-typography.html"> Typography </a> <a class="btn btn-primary sideline" href="ui-elements-buttons.html"> Buttons </a> <a class="btn btn-primary sideline" href="ui-elements-labels.html"> Labels </a> <a class="btn btn-primary sideline" href="ui-elements-progress-bars.html"> Progress Bars </a> <a class="btn btn-primary sideline" href="ui-elements-carousel.html"> Carousel </a> <a class="btn btn-primary sideline" href="ui-elements-tabs.html"> Tabs </a> <a class="btn btn-primary sideline" href="ui-elements-grid.html"> Grid </a> <a class="btn btn-primary sideline" href="ui-elements-alerts-and-notifications.html"> Alerts &amp; notifications </a> <a class="btn btn-primary sideline" href="ui-elements-animations.html"> Animations </a> <a class="btn btn-primary sideline" href="ui-elements-breadcrumbs.html"> Breadcrumbs </a> <a class="btn btn-primary sideline" href="ui-elements-google-maps.html"> Google Maps </a> <a class="btn btn-primary sideline" href="ui-elements-vector-maps.html"> Vector Maps </a> <a class="btn btn-primary sideline" href="ui-elements-cards.html"> Cards </a> <a class="btn btn-primary sideline" href="ui-elements-dropdowns.html"> Dropdowns </a> <a class="btn btn-primary sideline" href="ui-elements-drag-and-drop.html"> Drag and drop </a> <a class="btn btn-primary sideline" href="ui-elements-modals.html"> Modals </a> <a class="btn btn-primary sideline" href="ui-elements-other-elements.html"> Other elements </a> </div>
                            </li>
                            <li class="horizontal-navigation-dropdown wow fadeIn"> <a class="btn btn-primary"> Utilities </a>
                                <div class="horizontal-dropdown-menu" ng-class="{'horizontal-dropdown-menu-lg': item.items.length &gt; 10}"> <a class="btn btn-primary sideline" href="utilities-color-utilities.html"> Color utilities </a> <a class="btn btn-primary sideline" href="utilities-border-utilities.html"> Border utilities </a> <a class="btn btn-primary sideline" href="utilities-height-utilities.html"> Height utilities </a> <a class="btn btn-primary sideline" href="utilities-margin-utilities.html"> Margin Utilities </a> <a class="btn btn-primary sideline" href="utilities-other-utilities.html"> Other utilities </a> <a class="btn btn-primary sideline" href="utilities-padding-utilities.html"> Padding utilities </a> <a class="btn btn-primary sideline" href="utilities-position-utilities.html"> Position utilities </a> <a class="btn btn-primary sideline" href="utilities-text-utilities.html"> Text utilities </a> <a class="btn btn-primary sideline" href="utilities-width-utilities.html"> Width utilities </a> </div>
                            </li>
                            <li class="horizontal-navigation-dropdown wow fadeIn"> <a class="btn btn-primary"> Icons </a>
                                <div class="horizontal-dropdown-menu" ng-class="{'horizontal-dropdown-menu-lg': item.items.length &gt; 10}"> <a class="btn btn-primary sideline" href="icons-font-awesome.html"> Font Awesome </a> <a class="btn btn-primary sideline" href="icons-ionicons.html"> Ionicons </a> <a class="btn btn-primary sideline" href="icons-emoji.html"> Emoji </a> <a class="btn btn-primary sideline" href="icons-flags.html"> Flags </a> <a class="btn btn-primary sideline" href="icons-material-design-icons.html"> Material Design Icons </a> <a class="btn btn-primary sideline" href="icons-weather-icons.html"> Weather Icons </a> </div>
                            </li>
                            <li class="horizontal-navigation-dropdown wow fadeIn"> <a class="btn btn-primary"> Forms </a>
                                <div class="horizontal-dropdown-menu" ng-class="{'horizontal-dropdown-menu-lg': item.items.length &gt; 10}"> <a class="btn btn-primary sideline" href="forms-basic.html"> Basic forms </a> <a class="btn btn-primary sideline" href="forms-sample.html"> Sample forms </a> <a class="btn btn-primary sideline" href="forms-validation.html"> Form Validation </a> <a class="btn btn-primary sideline" href="forms-file-uploads.html"> File Uploads </a> <a class="btn btn-primary sideline" href="forms-jquery-file-upload.html"> jQuery File Upload </a> <a class="btn btn-primary sideline" href="forms-text-editor.html"> Text editor </a> <a class="btn btn-primary sideline" href="forms-pickers.html"> Pickers </a> <a class="btn btn-primary sideline" href="forms-nouislider.html"> NoUiSlider </a> <a class="btn btn-primary sideline" href="forms-typeahead.html"> Typeahead </a> </div>
                            </li>
                            <li class="horizontal-navigation-dropdown wow fadeIn"> <a class="btn btn-primary"> Tables </a>
                                <div class="horizontal-dropdown-menu" ng-class="{'horizontal-dropdown-menu-lg': item.items.length &gt; 10}"> <a class="btn btn-primary sideline" href="tables-static.html"> Static Tables </a> <a class="btn btn-primary sideline" href="tables-datatable.html"> Datatable </a> <a class="btn btn-primary sideline" href="tables-sortable.html"> Sortable </a> <a class="btn btn-primary sideline" href="tables-table-export.html"> Table export </a> <a class="btn btn-primary sideline" href="tables-jquery-treegrid.html"> jQuery Treegrid </a> </div>
                            </li>
                            <li class="horizontal-navigation-dropdown wow fadeIn"> <a class="btn btn-primary"> e-Commerce </a>
                                <div class="horizontal-dropdown-menu" ng-class="{'horizontal-dropdown-menu-lg': item.items.length &gt; 10}"> <a class="btn btn-primary sideline" href="e-commerce-dashboard.html"> Dashboard </a> <a class="btn btn-primary sideline" href="e-commerce-orders.html"> Orders </a> <a class="btn btn-primary sideline" href="e-commerce-order.html"> Order </a> <a class="btn btn-primary sideline" href="e-commerce-products.html"> Products </a> <a class="btn btn-primary sideline" href="e-commerce-product.html"> Product </a> <a class="btn btn-primary sideline" href="e-commerce-customers.html"> Customers </a> </div>
                            </li>
                            <li class="horizontal-navigation-dropdown wow fadeIn"> <a class="btn btn-primary"> Email </a>
                                <div class="horizontal-dropdown-menu" ng-class="{'horizontal-dropdown-menu-lg': item.items.length &gt; 10}"> <a class="btn btn-primary sideline" href="email-inbox.html"> Inbox </a> <a class="btn btn-primary sideline" href="email-view.html"> View email </a> <a class="btn btn-primary sideline" href="email-compose.html"> Compose email </a> </div>
                            </li>
                            <li class="horizontal-navigation-dropdown wow fadeIn"> <a class="btn btn-primary"> Charts </a>
                                <div class="horizontal-dropdown-menu" ng-class="{'horizontal-dropdown-menu-lg': item.items.length &gt; 10}"> <a class="btn btn-primary sideline" href="charts-nvd3.html"> NVD3 </a> <a class="btn btn-primary sideline" href="charts-chartist.html"> Chartist </a> <a class="btn btn-primary sideline" href="charts-chart-js.html"> Chart.js </a> <a class="btn btn-primary sideline" href="charts-easy-pie-chart.html"> Easy Pie Chart </a> <a class="btn btn-primary sideline" href="charts-jquery-knob.html"> jQuery Knob </a> <a class="btn btn-primary sideline" href="charts-gauge.html"> Gauges </a> <a class="btn btn-primary sideline" href="charts-morris-js.html"> Morris.js </a> </div>
                            </li>
                            <li class="horizontal-navigation-dropdown wow fadeIn"> <a class="btn btn-primary"> Pages </a>
                                <div class="horizontal-dropdown-menu" ng-class="{'horizontal-dropdown-menu-lg': item.items.length &gt; 10}"> <a class="btn btn-primary sideline" href="pages-error-page.html"> Error page </a> <a class="btn btn-primary sideline" href="pages-empty-page.html"> Empty Page </a> <a class="btn btn-primary sideline" href="pages-login.html"> Login </a> <a class="btn btn-primary sideline" href="pages-register.html"> Register </a> <a class="btn btn-primary sideline" href="pages-forgot-password.html"> Forgot Password </a> <a class="btn btn-primary sideline" href="pages-lock-screen.html"> Lock Screen </a> <a class="btn btn-primary sideline" href="pages-profile.html"> User profile </a> <a class="btn btn-primary sideline" href="pages-coming-soon.html"> Coming soon </a> <a class="btn btn-primary sideline" href="pages-under-maintenance.html"> Under maintenance </a> </div>
                            </li>
                            <li class="horizontal-navigation-dropdown wow fadeIn"> <a class="btn btn-primary"> Extras </a>
                                <div class="horizontal-dropdown-menu" ng-class="{'horizontal-dropdown-menu-lg': item.items.length &gt; 10}"> <a class="btn btn-primary sideline" href="extras-invoice.html"> Invoice </a> <a class="btn btn-primary sideline" href="extras-zoom.html"> Zoom </a> <a class="btn btn-primary sideline" href="extras-search-results.html"> Search Results </a> <a class="btn btn-primary sideline" href="extras-pricing-tables.html"> Pricing tables </a> <a class="btn btn-primary sideline" href="extras-wow.html"> Wow </a> <a class="btn btn-primary sideline" href="extras-syntax-highlighting.html"> Syntax highlighting </a> <a class="btn btn-primary sideline" href="extras-calendar.html"> Calendar </a> <a class="btn btn-primary sideline" href="extras-crop.html"> Image cropping </a> <a class="btn btn-primary sideline" href="extras-mousetrap.html"> Mousetrap </a> <a class="btn btn-primary sideline" href="extras-typed.html"> Typed.js </a> </div>
                            </li>
                            <li class="horizontal-navigation-dropdown wow fadeIn"> <a class="btn btn-primary" href="documentation.html"> Docs </a> </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="horizontal-navigation horizontal-navigation-3">
        <div class="container-fluid">
            <div class="row">
                <div class="col-xs-12">
                    <ul class="list-unstyled navigation animation-delay">
                        <li class="horizontal-navigation-dropdown wow fadeIn"> <a class="btn btn-primary"> Dashboards </a>
                            <div class="horizontal-dropdown-menu" ng-class="{'horizontal-dropdown-menu-lg': item.items.length &gt; 10}"> <a class="btn btn-primary sideline" href="dashboards-analytics.html"> Analytics </a> <a class="btn btn-primary sideline" href="dashboards-e-commerce.html"> e-Commerce </a> <a class="btn btn-primary sideline" href="dashboards-finance.html"> Finance </a> <a class="btn btn-primary sideline" href="dashboards-saas.html"> SAAS </a> </div>
                        </li>
                        <li class="horizontal-navigation-dropdown wow fadeIn"> <a class="btn btn-primary"> Layouts </a>
                            <div class="horizontal-dropdown-menu" ng-class="{'horizontal-dropdown-menu-lg': item.items.length &gt; 10}"> <a class="btn btn-primary sideline" data-click="set-layout" data-id="default-sidebar"> Default sidebar </a> <a class="btn btn-primary sideline" data-click="set-layout" data-id="collapsed-sidebar"> Collapsed sidebar </a> <a class="btn btn-primary sideline" data-click="set-layout" data-id="off-canvas"> Off canvas </a> <a class="btn btn-primary sideline" data-click="set-layout" data-id="left-sidebar-over"> Left sidebar over </a> <a class="btn btn-primary sideline" data-click="set-layout" data-id="left-sidebar-under"> Left sidebar under </a> <a class="btn btn-primary sideline" data-click="set-layout" data-id="horizontal-navigation-1"> Horizontal navigation 1 </a> <a class="btn btn-primary sideline" data-click="set-layout" data-id="horizontal-navigation-2"> Horizontal navigation 2 </a> <a class="btn btn-primary sideline" data-click="set-layout" data-id="horizontal-navigation-3"> Horizontal navigation 3 </a> <a class="btn btn-primary sideline" data-click="set-layout" data-id="mega-menu"> Mega menu </a> </div>
                        </li>
                        <li class="horizontal-navigation-dropdown wow fadeIn"> <a class="btn btn-primary"> Widgets </a>
                            <div class="horizontal-dropdown-menu" ng-class="{'horizontal-dropdown-menu-lg': item.items.length &gt; 10}"> <a class="btn btn-primary sideline" href="widgets-activity-widgets.html"> Activity widgets </a> <a class="btn btn-primary sideline" href="widgets-chart-widgets.html"> Chart widgets </a> <a class="btn btn-primary sideline" href="widgets-social-media-widgets.html"> Social Media widgets </a> <a class="btn btn-primary sideline" href="widgets-text-widgets.html"> Text widgets </a> <a class="btn btn-primary sideline" href="widgets-user-widgets.html"> User widgets </a> </div>
                        </li>
                        <li class="horizontal-navigation-dropdown wow fadeIn"> <a class="btn btn-primary"> UI </a>
                            <div class="horizontal-dropdown-menu horizontal-dropdown-menu-lg" ng-class="{'horizontal-dropdown-menu-lg': item.items.length &gt; 10}"> <a class="btn btn-primary sideline" href="ui-elements-timers-and-counters.html"> Timers and counters </a> <a class="btn btn-primary sideline" href="ui-elements-images.html"> Images </a> <a class="btn btn-primary sideline" href="ui-elements-overlays.html"> Overlays </a> <a class="btn btn-primary sideline" href="ui-elements-lists.html"> Lists </a> <a class="btn btn-primary sideline" href="ui-elements-typography.html"> Typography </a> <a class="btn btn-primary sideline" href="ui-elements-buttons.html"> Buttons </a> <a class="btn btn-primary sideline" href="ui-elements-labels.html"> Labels </a> <a class="btn btn-primary sideline" href="ui-elements-progress-bars.html"> Progress Bars </a> <a class="btn btn-primary sideline" href="ui-elements-carousel.html"> Carousel </a> <a class="btn btn-primary sideline" href="ui-elements-tabs.html"> Tabs </a> <a class="btn btn-primary sideline" href="ui-elements-grid.html"> Grid </a> <a class="btn btn-primary sideline" href="ui-elements-alerts-and-notifications.html"> Alerts &amp; notifications </a> <a class="btn btn-primary sideline" href="ui-elements-animations.html"> Animations </a> <a class="btn btn-primary sideline" href="ui-elements-breadcrumbs.html"> Breadcrumbs </a> <a class="btn btn-primary sideline" href="ui-elements-google-maps.html"> Google Maps </a> <a class="btn btn-primary sideline" href="ui-elements-vector-maps.html"> Vector Maps </a> <a class="btn btn-primary sideline" href="ui-elements-cards.html"> Cards </a> <a class="btn btn-primary sideline" href="ui-elements-dropdowns.html"> Dropdowns </a> <a class="btn btn-primary sideline" href="ui-elements-drag-and-drop.html"> Drag and drop </a> <a class="btn btn-primary sideline" href="ui-elements-modals.html"> Modals </a> <a class="btn btn-primary sideline" href="ui-elements-other-elements.html"> Other elements </a> </div>
                        </li>
                        <li class="horizontal-navigation-dropdown wow fadeIn"> <a class="btn btn-primary"> Utilities </a>
                            <div class="horizontal-dropdown-menu" ng-class="{'horizontal-dropdown-menu-lg': item.items.length &gt; 10}"> <a class="btn btn-primary sideline" href="utilities-color-utilities.html"> Color utilities </a> <a class="btn btn-primary sideline" href="utilities-border-utilities.html"> Border utilities </a> <a class="btn btn-primary sideline" href="utilities-height-utilities.html"> Height utilities </a> <a class="btn btn-primary sideline" href="utilities-margin-utilities.html"> Margin Utilities </a> <a class="btn btn-primary sideline" href="utilities-other-utilities.html"> Other utilities </a> <a class="btn btn-primary sideline" href="utilities-padding-utilities.html"> Padding utilities </a> <a class="btn btn-primary sideline" href="utilities-position-utilities.html"> Position utilities </a> <a class="btn btn-primary sideline" href="utilities-text-utilities.html"> Text utilities </a> <a class="btn btn-primary sideline" href="utilities-width-utilities.html"> Width utilities </a> </div>
                        </li>
                        <li class="horizontal-navigation-dropdown wow fadeIn"> <a class="btn btn-primary"> Icons </a>
                            <div class="horizontal-dropdown-menu" ng-class="{'horizontal-dropdown-menu-lg': item.items.length &gt; 10}"> <a class="btn btn-primary sideline" href="icons-font-awesome.html"> Font Awesome </a> <a class="btn btn-primary sideline" href="icons-ionicons.html"> Ionicons </a> <a class="btn btn-primary sideline" href="icons-emoji.html"> Emoji </a> <a class="btn btn-primary sideline" href="icons-flags.html"> Flags </a> <a class="btn btn-primary sideline" href="icons-material-design-icons.html"> Material Design Icons </a> <a class="btn btn-primary sideline" href="icons-weather-icons.html"> Weather Icons </a> </div>
                        </li>
                        <li class="horizontal-navigation-dropdown wow fadeIn"> <a class="btn btn-primary"> Forms </a>
                            <div class="horizontal-dropdown-menu" ng-class="{'horizontal-dropdown-menu-lg': item.items.length &gt; 10}"> <a class="btn btn-primary sideline" href="forms-basic.html"> Basic forms </a> <a class="btn btn-primary sideline" href="forms-sample.html"> Sample forms </a> <a class="btn btn-primary sideline" href="forms-validation.html"> Form Validation </a> <a class="btn btn-primary sideline" href="forms-file-uploads.html"> File Uploads </a> <a class="btn btn-primary sideline" href="forms-jquery-file-upload.html"> jQuery File Upload </a> <a class="btn btn-primary sideline" href="forms-text-editor.html"> Text editor </a> <a class="btn btn-primary sideline" href="forms-pickers.html"> Pickers </a> <a class="btn btn-primary sideline" href="forms-nouislider.html"> NoUiSlider </a> <a class="btn btn-primary sideline" href="forms-typeahead.html"> Typeahead </a> </div>
                        </li>
                        <li class="horizontal-navigation-dropdown wow fadeIn"> <a class="btn btn-primary"> Tables </a>
                            <div class="horizontal-dropdown-menu" ng-class="{'horizontal-dropdown-menu-lg': item.items.length &gt; 10}"> <a class="btn btn-primary sideline" href="tables-static.html"> Static Tables </a> <a class="btn btn-primary sideline" href="tables-datatable.html"> Datatable </a> <a class="btn btn-primary sideline" href="tables-sortable.html"> Sortable </a> <a class="btn btn-primary sideline" href="tables-table-export.html"> Table export </a> <a class="btn btn-primary sideline" href="tables-jquery-treegrid.html"> jQuery Treegrid </a> </div>
                        </li>
                        <li class="horizontal-navigation-dropdown wow fadeIn"> <a class="btn btn-primary"> e-Commerce </a>
                            <div class="horizontal-dropdown-menu" ng-class="{'horizontal-dropdown-menu-lg': item.items.length &gt; 10}"> <a class="btn btn-primary sideline" href="e-commerce-dashboard.html"> Dashboard </a> <a class="btn btn-primary sideline" href="e-commerce-orders.html"> Orders </a> <a class="btn btn-primary sideline" href="e-commerce-order.html"> Order </a> <a class="btn btn-primary sideline" href="e-commerce-products.html"> Products </a> <a class="btn btn-primary sideline" href="e-commerce-product.html"> Product </a> <a class="btn btn-primary sideline" href="e-commerce-customers.html"> Customers </a> </div>
                        </li>
                        <li class="horizontal-navigation-dropdown wow fadeIn"> <a class="btn btn-primary"> Email </a>
                            <div class="horizontal-dropdown-menu" ng-class="{'horizontal-dropdown-menu-lg': item.items.length &gt; 10}"> <a class="btn btn-primary sideline" href="email-inbox.html"> Inbox </a> <a class="btn btn-primary sideline" href="email-view.html"> View email </a> <a class="btn btn-primary sideline" href="email-compose.html"> Compose email </a> </div>
                        </li>
                        <li class="horizontal-navigation-dropdown wow fadeIn"> <a class="btn btn-primary"> Charts </a>
                            <div class="horizontal-dropdown-menu" ng-class="{'horizontal-dropdown-menu-lg': item.items.length &gt; 10}"> <a class="btn btn-primary sideline" href="charts-nvd3.html"> NVD3 </a> <a class="btn btn-primary sideline" href="charts-chartist.html"> Chartist </a> <a class="btn btn-primary sideline" href="charts-chart-js.html"> Chart.js </a> <a class="btn btn-primary sideline" href="charts-easy-pie-chart.html"> Easy Pie Chart </a> <a class="btn btn-primary sideline" href="charts-jquery-knob.html"> jQuery Knob </a> <a class="btn btn-primary sideline" href="charts-gauge.html"> Gauges </a> <a class="btn btn-primary sideline" href="charts-morris-js.html"> Morris.js </a> </div>
                        </li>
                        <li class="horizontal-navigation-dropdown wow fadeIn"> <a class="btn btn-primary"> Pages </a>
                            <div class="horizontal-dropdown-menu" ng-class="{'horizontal-dropdown-menu-lg': item.items.length &gt; 10}"> <a class="btn btn-primary sideline" href="pages-error-page.html"> Error page </a> <a class="btn btn-primary sideline" href="pages-empty-page.html"> Empty Page </a> <a class="btn btn-primary sideline" href="pages-login.html"> Login </a> <a class="btn btn-primary sideline" href="pages-register.html"> Register </a> <a class="btn btn-primary sideline" href="pages-forgot-password.html"> Forgot Password </a> <a class="btn btn-primary sideline" href="pages-lock-screen.html"> Lock Screen </a> <a class="btn btn-primary sideline" href="pages-profile.html"> User profile </a> <a class="btn btn-primary sideline" href="pages-coming-soon.html"> Coming soon </a> <a class="btn btn-primary sideline" href="pages-under-maintenance.html"> Under maintenance </a> </div>
                        </li>
                        <li class="horizontal-navigation-dropdown wow fadeIn"> <a class="btn btn-primary"> Extras </a>
                            <div class="horizontal-dropdown-menu" ng-class="{'horizontal-dropdown-menu-lg': item.items.length &gt; 10}"> <a class="btn btn-primary sideline" href="extras-invoice.html"> Invoice </a> <a class="btn btn-primary sideline" href="extras-zoom.html"> Zoom </a> <a class="btn btn-primary sideline" href="extras-search-results.html"> Search Results </a> <a class="btn btn-primary sideline" href="extras-pricing-tables.html"> Pricing tables </a> <a class="btn btn-primary sideline" href="extras-wow.html"> Wow </a> <a class="btn btn-primary sideline" href="extras-syntax-highlighting.html"> Syntax highlighting </a> <a class="btn btn-primary sideline" href="extras-calendar.html"> Calendar </a> <a class="btn btn-primary sideline" href="extras-crop.html"> Image cropping </a> <a class="btn btn-primary sideline" href="extras-mousetrap.html"> Mousetrap </a> <a class="btn btn-primary sideline" href="extras-typed.html"> Typed.js </a> </div>
                        </li>
                        <li class="horizontal-navigation-dropdown wow fadeIn"> <a class="btn btn-primary" href="documentation.html"> Docs </a> </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="container-fluid">
        <div class="row">
            <div class="sidebar-placeholder"> </div>
            <div class="sidebar-outer-wrapper">
                <div class="sidebar-inner-wrapper">
                    <div class="sidebar-1" >
                        <div class="profile"  style="height: auto !important;">
                            <button data-click="toggle-sidebar" type="button" class="btn btn-white btn-outline no-border close-sidebar"> <i class="fa fa-close"></i> </button>
                            <div class="profile-image">
                                <img class="img-circle img-fluid" src="assets/faces/m1.png">
                            </div>
                            <div class="social-media">
                                <button type="button" class="btn btn-facebook btn-circle m-r-5"><i class="fa fa-facebook color-white"></i> </button>
                                <button type="button" class="btn btn-twitter btn-circle m-r-5"><i class="fa fa-twitter color-white"></i> </button>
                                <button type="button" class="btn btn-google btn-circle m-r-5"><i class="fa fa-google color-white"></i> </button>
                            </div>
                            <div class="profile-toggle">
                                <button data-click="toggle-profile" type="button" class="btn btn-white btn-outline no-border"> <i class="pull-right fa fa-caret-down icon-toggle-profile"></i> </button>
                            </div>
                            <div class="profile-title">Lucas smith</div>
                            <div class="profile-subtitle">lucas.smith@gmail.com</div>
                        </div>
                        <div class="sidebar-nav">
                            <div class="sidebar-section account-links">
                                <div class="section-title">Account</div>
                                <ul class="list-unstyled section-content">
                                    <li>
                                        <a class="sideline"> <i class="zmdi zmdi-account-circle md-icon pull-left"></i> <span class="title">Profile</span> </a>
                                    </li>
                                    <li>
                                        <a class="sideline"> <i class="zmdi zmdi-settings md-icon pull-left"></i> <span class="title">Settings</span> </a>
                                    </li>
                                    <li>
                                        <a class="sideline"> <i class="zmdi zmdi-favorite-outline md-icon pull-left"></i> <span class="title">Favorites</span> </a>
                                    </li>
                                    <li>
                                        <a class="sideline"> <i class="zmdi zmdi-sign-in md-icon pull-left"></i> <span class="title">Logout</span> </a>
                                    </li>
                                </ul>
                            </div>
                            <div class="sidebar-labels section-title">
                                <h5>Indicadores</h5>
                                <ul class="list-unstyled">
                                    <%
                                        List<MaestroIndicadorEntity> maestros = biManager.getHibernateTemplate().find(
                                                "from MaestroIndicadorEntity order by id"
                                        );
                                    %>
                                    <%
                                        for (MaestroIndicadorEntity maestro: maestros){
                                    %>
                                    <li class=""></li>
                                    <li>
                                        <i class="fa fa-dot-circle-o color-success"></i>
                                        <span class="m-l-10">
                                            <a href="h_charts.jsp?id=<%=maestro.getId()%>"><%=maestro.getNombre()%></a>
                                        </span> </li>
                                    <%
                                        }  //  END FOR MAESTROS
                                    %>
                                </ul>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
            <%--<div class="right-sidebar-outer">

            </div>--%>
            <div class="col-xs-12 main" id="main">
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
