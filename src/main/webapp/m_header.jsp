<!doctype html>
<html lang="en">
<%@ page import="java.util.List" %>
<%@ page import="co.com.elramireza.bi.model.Indicador" %>
<%@ page import="co.com.elramireza.bi.model.MaestroIndicadorEntity" %>
<jsp:useBean id="biManager" class="co.com.elramireza.bi.dao.BiDAO" scope="application"/>
<%


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
    <style>
        th{
            text-align: center;
        }
        .sidebar-1 .section-title {
            /*text-transform: uppercase;*/
            font-weight: normal !important;
        }

        .filaGris {
            background-color: #d5d5d5;
            color: #1a1a1a;
        }

        .filaBlanca {
            background-color: white;
            color: black;
        }

        .filaError{
            background-color: red;
            color: black;
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
            <a class="nav-link dropdown-toggle no-after" data-toggle="dropdown">
                <img class="img-circle img-fluid profile-image" src="assets/faces/m1.png">
            </a>
            <div class="dropdown-menu dropdown-menu-scale from-right dropdown-menu-right">
                <%--<a class="dropdown-item animated fadeIn" href="email-inbox.html"> <i class="zmdi zmdi-email"></i> <span class="label label-pill label-danger label-xs pull-right">New</span> <span class="dropdown-text">Inbox</span> </a>--%>
                <%--<a class="dropdown-item animated fadeIn" href="pages-profile.html"> <i class="zmdi zmdi-settings-square"></i> <span class="dropdown-text">Profile</span> </a>--%>
                <%--<a class="dropdown-item animated fadeIn" href="pages-lock-screen.html"> <i class="zmdi zmdi-alarm"></i> <span class="dropdown-text">Lock screen</span> </a>--%>
                <a class="dropdown-item animated fadeIn" href="http://localhost:9002/pages-logout.html"> <i class="zmdi zmdi-power"></i> <span class="dropdown-text">Logout</span> </a>
            </div>
        </li>
    </ul>
    <!--<ul class="nav navbar-nav pull-right hidden-lg-down navbar-profile">
        <li class="nav-item"> <a class="nav-link direction" data-click="toggle-direction">RTL</a> </li>
    </ul>-->
</nav>
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
                        <%--<div class="social-media">
                            <button type="button" class="btn btn-facebook btn-circle m-r-5"><i class="fa fa-facebook color-white"></i> </button>
                            <button type="button" class="btn btn-twitter btn-circle m-r-5"><i class="fa fa-twitter color-white"></i> </button>
                            <button type="button" class="btn btn-google btn-circle m-r-5"><i class="fa fa-google color-white"></i> </button>
                        </div>
                        --%>
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
                                <%--<li>
                                    <a class="sideline"> <i class="zmdi zmdi-account-circle md-icon pull-left"></i> <span class="title">Profile</span> </a>
                                </li>
                                --%><li>
                                    <a class="sideline"> <i class="zmdi zmdi-settings md-icon pull-left"></i> <span class="title">Settings</span> </a>
                                </li>
                                <%--<li>
                                    <a class="sideline"> <i class="zmdi zmdi-favorite-outline md-icon pull-left"></i> <span class="title">Favorites</span> </a>
                                </li>
                                --%><li>
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