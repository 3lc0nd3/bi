<!doctype html>
<html lang="en">
<%@ page import="java.util.List" %>
<%@ page import="co.com.elramireza.bi.model.Indicador" %>
<%@ page import="co.com.elramireza.bi.model.MaestroIndicadorEntity" %>
<jsp:useBean id="biManager" class="co.com.elramireza.bi.dao.BiDAO" scope="application"/>
<%
    String mesS = request.getParameter("mes");
    int mes = 0;
    if (mesS!=null){
        mes = Integer.parseInt(mesS);
    }

    List<Indicador> indicadores = biManager.getHibernateTemplate().find(
            "from Indicador where fecha = ?",
            mes
    );

    List<Integer> meses = biManager.getHibernateTemplate().find(
            "select distinct fecha from Indicador order by fecha desc "
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
            if (bTmp != null) {
                bTmp.value = window["botonEnProcesoValueOld"];
                bTmp.disabled = false;
            }
        }


        function irM() {
            var mes = dwr.util.getValue("elMes");
//        alrt(mes);
            window.location = "?mes="+mes;
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



            });

        })();
    </script>
</head>
<body data-layout="empty-layout" data-palette="palette-4" data-direction="none">
<nav class="navbar navbar-fixed-top navbar-1"><a class="navbar-brand" href="index.jsp">Indicadores</a>
    <ul class="nav navbar-nav pull-left toggle-layout">
        <li class="nav-item">
            <a class="nav-link" data-click="toggle-layout"> <i class="zmdi zmdi-menu"></i> </a>
        </li>
    </ul>
    <ul class="nav navbar-nav pull-right hidden-lg-down navbar-notifications">
        <li class="nav-item">
            <a class="nav-link" data-click="toggle-right-sidebar"> <i class="zmdi zmdi-notifications-active"></i> <span class="label label-rounded label-danger label-xs">3</span> </a>
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
                <div class="sidebar-1">
                    <div class="profile">
                        <button data-click="toggle-sidebar" type="button" class="btn btn-white btn-outline no-border close-sidebar"> <i class="fa fa-close"></i> </button>
                        <div class="profile-image"> <img class="img-circle img-fluid" src="assets/faces/m1.png"> </div>
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
        <div class="right-sidebar-outer">
            <div class="right-sidebar-inner">
                <div class="right-sidebar">
                    <div class="bs-nav-tabs nav-tabs-warning justified">
                        <ul class="nav nav-tabs nav-animated-border-from-center">
                            <li class="nav-item"> <a class="nav-link active" data-toggle="tab" data-target="#rtab-left">Activities</a> </li>
                            <li class="nav-item"> <a class="nav-link" data-toggle="tab" data-target="#rtab-center">Users</a> </li>
                            <li class="nav-item"> <a class="nav-link" data-toggle="tab" data-target="#rtab-right">Stats</a> </li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane fade in active" id="rtab-left">
                                <h5>Today</h5>
                                <div class="timeline-widget-4">
                                    <div class="row bg-odd-color">
                                        <div class="col-xs-12 timeline timeline-info">
                                            <div class="p-10">
                                                <p>Someone commented on your post</p>
                                                <p class="text-sm text-muted">10 minutes ago</p>
                                                <p class="text-sm m-t-10"> <span>Reply</span> <i class="m-l-5 m-r-5 fa fa-mail-reply"></i> </p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row bg-even-color">
                                        <div class="col-xs-12 timeline timeline-danger">
                                            <div class="p-10">
                                                <p>A friend posted something on instagram</p>
                                                <p class="text-sm text-muted">30 minutes ago</p>
                                                <p class="text-sm m-t-10"> <span>Like</span> <i class="m-l-5 m-r-5 fa fa-thumbs-o-up"></i> <span>Comment</span> <i class="m-l-5 m-r-5 fa fa-comment"></i> </p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row bg-odd-color">
                                        <div class="col-xs-12 timeline timeline-success">
                                            <div class="p-10">
                                                <p>Finished important task</p>
                                                <p class="text-sm text-muted">3 hours ago</p>
                                                <p class="text-sm m-t-10"> <span>10</span> <i class="m-l-5 m-r-5 fa fa-star-o"></i> <span>23</span> <i class="m-l-5 m-r-5 fa fa-heart-o"></i> </p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row bg-even-color">
                                        <div class="col-xs-12 timeline timeline-success">
                                            <div class="p-10">
                                                <p>Went to mars</p>
                                                <p class="text-sm text-muted">Last month</p>
                                                <p class="text-sm m-t-10"> <span>10</span> <i class="m-l-5 m-r-5 fa fa-check"></i> </p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row bg-odd-color">
                                        <div class="col-xs-12 timeline timeline-warning">
                                            <div class="p-10">
                                                <p>Bought a Tesla</p>
                                                <p class="text-sm text-muted">3 months ago</p>
                                                <p class="text-sm m-t-10"> <span>10</span> <i class="m-l-5 m-r-5 fa fa-twitter"></i> <span>23</span> <i class="m-l-5 m-r-5 fa fa-heart"></i> </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <h5>Stream</h5>
                                <div class="row">
                                    <div class="col-xs-12">
                                        <ul class="list-group activities">
                                            <li class="list-group-item"> <span class="text-xs pull-right">4 minutes ago</span> <span class="label label-success">charge</span>
                                                <div class="clearfix"></div> <span class="capitalize">Michael Smith</span> <span class="text-bold">upgraded to</span> the $50 plan</li>
                                            <li class="list-group-item"> <span class="text-xs pull-right">34 minutes ago</span> <span class="label label-primary">charge</span>
                                                <div class="clearfix"></div> <span class="capitalize">Jane Perez</span> <span class="text-bold">canceled</span> the $25 plan</li>
                                            <li class="list-group-item"> <span class="text-xs pull-right">an hour ago</span> <span class="label label-primary">upgrade</span>
                                                <div class="clearfix"></div> <span class="capitalize">George Clinton from Facebook</span> <span class="text-bold">upgraded to</span> the $25 plan</li>
                                            <li class="list-group-item"> <span class="text-xs pull-right">2 hours ago</span> <span class="label label-warning">cancelled</span>
                                                <div class="clearfix"></div> <span class="capitalize">Someone from Google</span> <span class="text-bold">canceled</span> the $25 plan</li>
                                            <li class="list-group-item"> <span class="text-xs pull-right">2 hours ago</span> <span class="label label-success">upgrade</span>
                                                <div class="clearfix"></div> <span class="capitalize">Lucas Smith</span> <span class="text-bold">upgraded to</span> the $25 plan</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="rtab-center">
                                <h5>Online</h5>
                                <div class="user-widget-8">
                                    <div class="row">
                                        <div class="col-xs-12 bs-media">
                                            <div class="media">
                                                <a class="media-left"> <i class="fa fa-circle icon color-success"></i> <img class="media-object img-circle h-40 w-40" alt="/assets/faces/m1.png" src="assets/faces/m1.png"> </a>
                                                <div class="media-body">
                                                    <h5 class="media-heading"> Lucas smith </h5>
                                                    <p>Vital Database Dude</p>
                                                </div>
                                            </div>
                                            <div class="media">
                                                <a class="media-left"> <i class="fa fa-circle icon color-info"></i> <img class="media-object img-circle h-40 w-40" alt="/assets/faces/w1.png" src="assets/faces/w1.png"> </a>
                                                <div class="media-body">
                                                    <h5 class="media-heading"> Janet Abshire </h5>
                                                    <p>Lead Innovation Officer</p>
                                                </div>
                                            </div>
                                            <div class="media">
                                                <a class="media-left"> <i class="fa fa-circle icon color-success"></i> <img class="media-object img-circle h-40 w-40" alt="/assets/faces/m2.png" src="assets/faces/m2.png"> </a>
                                                <div class="media-body">
                                                    <h5 class="media-heading"> Lucas Koch </h5>
                                                    <p>Incomparable UX Editor</p>
                                                </div>
                                            </div>
                                            <div class="media">
                                                <a class="media-left"> <i class="fa fa-circle icon color-warning"></i> <img class="media-object img-circle h-40 w-40" alt="/assets/faces/w2.png" src="assets/faces/w2.png"> </a>
                                                <div class="media-body">
                                                    <h5 class="media-heading"> Gladys Schuster </h5>
                                                    <p>Primary Product Pioneer</p>
                                                </div>
                                            </div>
                                            <div class="media">
                                                <a class="media-left"> <i class="fa fa-circle icon color-success"></i> <img class="media-object img-circle h-40 w-40" alt="/assets/faces/m3.png" src="assets/faces/m3.png"> </a>
                                                <div class="media-body">
                                                    <h5 class="media-heading"> George Clinton </h5>
                                                    <p>World Class API Genius</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <h5>Offline</h5>
                                <div class="user-widget-8">
                                    <div class="row">
                                        <div class="col-xs-12 bs-media">
                                            <div class="media">
                                                <a class="media-left"> <i class="fa fa-circle icon color-danger"></i> <img class="media-object img-circle h-40 w-40" alt="/assets/faces/w10.png" src="assets/faces/w10.png"> </a>
                                                <div class="media-body">
                                                    <h5 class="media-heading"> Kirsten Perez </h5>
                                                    <p>Project Management Researcher</p>
                                                </div>
                                            </div>
                                            <div class="media">
                                                <a class="media-left"> <i class="fa fa-circle icon color-danger"></i> <img class="media-object img-circle h-40 w-40" alt="/assets/faces/m10.png" src="assets/faces/m10.png"> </a>
                                                <div class="media-body">
                                                    <h5 class="media-heading"> Jerome Lynch </h5>
                                                    <p>Android Engineer</p>
                                                </div>
                                            </div>
                                            <div class="media">
                                                <a class="media-left"> <i class="fa fa-circle icon color-success"></i> <img class="media-object img-circle h-40 w-40" alt="/assets/faces/w9.png" src="assets/faces/w9.png"> </a>
                                                <div class="media-body">
                                                    <h5 class="media-heading"> Hannah Cook </h5>
                                                    <p>Wise Email Captain</p>
                                                </div>
                                            </div>
                                            <div class="media">
                                                <a class="media-left"> <i class="fa fa-circle icon color-warning"></i> <img class="media-object img-circle h-40 w-40" alt="/assets/faces/m9.png" src="assets/faces/m9.png"> </a>
                                                <div class="media-body">
                                                    <h5 class="media-heading"> Melvin Hicks </h5>
                                                    <p>Primary PHP Monkey</p>
                                                </div>
                                            </div>
                                            <div class="media">
                                                <a class="media-left"> <i class="fa fa-circle icon color-danger"></i> <img class="media-object img-circle h-40 w-40" alt="/assets/faces/w8.png" src="assets/faces/w8.png"> </a>
                                                <div class="media-body">
                                                    <h5 class="media-heading"> Jackie Perkins </h5>
                                                    <p>Executive PR Evangelist</p>
                                                </div>
                                            </div>
                                            <div class="media">
                                                <a class="media-left"> <i class="fa fa-circle icon color-info"></i> <img class="media-object img-circle h-40 w-40" alt="/assets/faces/m8.png" src="assets/faces/m8.png"> </a>
                                                <div class="media-body">
                                                    <h5 class="media-heading"> Michael Jenkins </h5>
                                                    <p>Ruby On Rails Developer</p>
                                                </div>
                                            </div>
                                            <div class="media">
                                                <a class="media-left"> <i class="fa fa-circle icon color-success"></i> <img class="media-object img-circle h-40 w-40" alt="/assets/faces/w7.png" src="assets/faces/w7.png"> </a>
                                                <div class="media-body">
                                                    <h5 class="media-heading"> Monica White </h5>
                                                    <p>iOS Strategist</p>
                                                </div>
                                            </div>
                                            <div class="media">
                                                <a class="media-left"> <i class="fa fa-circle icon color-danger"></i> <img class="media-object img-circle h-40 w-40" alt="/assets/faces/m7.png" src="assets/faces/m7.png"> </a>
                                                <div class="media-body">
                                                    <h5 class="media-heading"> Eric Simpson </h5>
                                                    <p>Innovation Pioneer</p>
                                                </div>
                                            </div>
                                            <div class="media">
                                                <a class="media-left"> <i class="fa fa-circle icon color-warning"></i> <img class="media-object img-circle h-40 w-40" alt="/assets/faces/w6.png" src="assets/faces/w6.png"> </a>
                                                <div class="media-body">
                                                    <h5 class="media-heading"> Clorinda Murphy </h5>
                                                    <p>Social Media Writer</p>
                                                </div>
                                            </div>
                                            <div class="media">
                                                <a class="media-left"> <i class="fa fa-circle icon color-primary"></i> <img class="media-object img-circle h-40 w-40" alt="/assets/faces/m6.png" src="assets/faces/m6.png"> </a>
                                                <div class="media-body">
                                                    <h5 class="media-heading"> James Smith </h5>
                                                    <p>Project Management Champ</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="rtab-right">
                                <h5>Sales</h5>
                                <div class="m-b-10">
                                    <div class="text-widget-1">
                                        <div class="row">
                                            <div class="col-xs-4"> <span class="fa-stack fa-stack-2x pull-left"> <i class="fa fa-circle fa-stack-2x color-warning"></i> <i class="fa fa fa-usd fa-stack-1x color-white"></i> </span> </div>
                                            <div class="col-xs-8 text-left">
                                                <div class="row">
                                                    <div class="col-xs-12">
                                                        <div class="title">Today</div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-xs-12">
                                                        <div class="numbers">
                                                            <div> <span class="amount" count-to-currency="1123.99" value="0" duration="2">$1,123</span> </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="m-b-10">
                                    <div class="text-widget-1">
                                        <div class="row">
                                            <div class="col-xs-4"> <span class="fa-stack fa-stack-2x pull-left"> <i class="fa fa-circle fa-stack-2x color-success"></i> <i class="fa fa fa-eur fa-stack-1x color-white"></i> </span> </div>
                                            <div class="col-xs-8 text-left">
                                                <div class="row">
                                                    <div class="col-xs-12">
                                                        <div class="title">Yesterday</div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-xs-12">
                                                        <div class="numbers">
                                                            <div> <span class="amount" count-to-currency="1844" value="0" duration="2">$1,844</span> </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="m-b-10">
                                    <div class="text-widget-1">
                                        <div class="row">
                                            <div class="col-xs-4"> <span class="fa-stack fa-stack-2x pull-left"> <i class="fa fa-circle fa-stack-2x color-danger"></i> <i class="fa fa fa-btc fa-stack-1x color-white"></i> </span> </div>
                                            <div class="col-xs-8 text-left">
                                                <div class="row">
                                                    <div class="col-xs-12">
                                                        <div class="title">This week</div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-xs-12">
                                                        <div class="numbers">
                                                            <div> <span class="amount" count-to-currency="7485" value="0" duration="2">$7,485</span> </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <h5>Twitter</h5>
                                <div class="m-b-10">
                                    <div class="icon-widget-3 bg-twitter">
                                        <div class="row icon">
                                            <div class="col-xs-12 text-center"> <i class="color-white"></i> </div>
                                        </div>
                                        <div class="row icons">
                                            <div class="col-xs-12 col-md-4 col-lg-4 text-center">
                                                <div class="amount"> <i class="fa fa-twitter color-white"></i> <span class="color-white">90</span> </div>
                                            </div>
                                            <div class="col-xs-12 col-md-4 col-lg-4 text-center">
                                                <div class="amount"> <i class="fa fa-comment-o color-white"></i> <span class="color-white">22</span> </div>
                                            </div>
                                            <div class="col-xs-12 col-md-4 col-lg-4 text-center">
                                                <div class="amount"> <i class="fa fa-star-o color-white"></i> <span class="color-white">33</span> </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <h5>Facebook</h5>
                                <div class="m-b-10">
                                    <div class="icon-widget-3 bg-facebook">
                                        <div class="row icon">
                                            <div class="col-xs-12 text-center"> <i class="color-white"></i> </div>
                                        </div>
                                        <div class="row icons">
                                            <div class="col-xs-12 col-md-4 col-lg-4 text-center">
                                                <div class="amount"> <i class="fa fa-thumbs-o-up color-white"></i> <span class="color-white">45</span> </div>
                                            </div>
                                            <div class="col-xs-12 col-md-4 col-lg-4 text-center">
                                                <div class="amount"> <i class="fa fa-comment-o color-white"></i> <span class="color-white">51</span> </div>
                                            </div>
                                            <div class="col-xs-12 col-md-4 col-lg-4 text-center">
                                                <div class="amount"> <i class="fa fa-star-o color-white"></i> <span class="color-white">13</span> </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <h5>Google</h5>
                                <div class="m-b-10">
                                    <div class="icon-widget-3 bg-google">
                                        <div class="row icon">
                                            <div class="col-xs-12 text-center"> <i class="color-white"></i> </div>
                                        </div>
                                        <div class="row icons">
                                            <div class="col-xs-12 col-md-4 col-lg-4 text-center">
                                                <div class="amount"> <i class="fa fa-heart-o color-white"></i> <span class="color-white">8</span> </div>
                                            </div>
                                            <div class="col-xs-12 col-md-4 col-lg-4 text-center">
                                                <div class="amount"> <i class="fa fa-comment-o color-white"></i> <span class="color-white">13</span> </div>
                                            </div>
                                            <div class="col-xs-12 col-md-4 col-lg-4 text-center">
                                                <div class="amount"> <i class="fa fa-star-o color-white"></i> <span class="color-white">44</span> </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <h5>Poll results</h5>
                                <div class="m-b-10 p-20">
                                    <div class="row">
                                        <div class="col-xs-12">
                                            <p> <span class="pull-right">24%</span> <span>Spain</span> </p>
                                            <progress class="progress-sm progress progress-warning" value="24" max="100">24%</progress>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-xs-12">
                                            <p> <span class="pull-right">52%</span> <span>USA</span> </p>
                                            <progress class="progress-sm progress progress-danger" value="52" max="100">52%</progress>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-xs-12">
                                            <p> <span class="pull-right">68%</span> <span>Australia</span> </p>
                                            <progress class="progress-sm progress progress-info" value="68" max="100">68%</progress>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-xs-12">
                                            <p> <span class="pull-right">45%</span> <span>Sweden</span> </p>
                                            <progress class="progress-sm progress progress-success" value="45" max="100">45%</progress>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xs-12 main" id="main">
            <%--<div class="row m-b-20">
                <div class="col-xs-12 col-lg-6">
                    <h3></h3>
                    <p></p>
                </div>
            </div>--%>
            <div class="row m-b-40">
                <div class="col-md-6">
                    Selecciones el mes:
                    <select id="elMes" class="c-select">
                        <%
                            for (Integer elMes : meses) {
                        %>
                        <option value="<%=elMes%>"><%=elMes%></option>
                        <%
                            }  //  END FOR MESES
                        %>
                    </select>
                    <input onclick="irM();" type="button" value="ir" class="btn btn-primary">
                </div>
                <div class="col-md-6">

                </div>
            </div>


            <div class="row m-b-40">
                <div class="col-md-12">
                    <%
                        if (mes!=0){
                    %>
                    Mes elegido: <b><%=mes%></b>
                    <br>
                    <table border="1">
                        <tr>
                            <th>Identificador </th>
                            <th>Concepto de Medici&oacute;n </th>
                            <th>Valores </th>
                            <th>Indicador </th>
                            <th>Valor de Aceptaci&oacute;n </th>
                            <th>Concepto de Aceptaci&oacute;n </th>
                            <th>Observaci&oacute;n </th>
                        </tr>
                        <%
                            for (Indicador indicador: indicadores){
                        %>
                        <tr>
                            <td rowspan="2">
                                <%=indicador.getMaestroIndicador().getId()%>
                            </td>
                            <td>
                                <%=indicador.getMaestroIndicador().getVar1()%>
                            </td>
                            <td>
                                <%=indicador.getVariable1()%>
                            </td>
                            <td rowspan="2">
                                <%=(Math.floor(indicador.getIndicador()*10000))/100%>%
                            </td>
                            <td rowspan="2">
                                ????
                            </td>
                            <td rowspan="2">
                                <%=(Math.floor(indicador.getAceptacion()*10000))/100%>%
                            </td>
                            <td rowspan="2">
                                ????
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <%=indicador.getMaestroIndicador().getVar2()%>
                            </td>
                            <td>
                                <%=indicador.getVariable2()%>
                            </td>
                        </tr>
                        <%
                            }  //  END FOR INDICADORES
                        %>
                    </table>
                    <%
                        } else {  //  END IF HAY MES
                    %>
                    <script>
                        irM();
                    </script>
                    <%
                        }
                    %>
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
