<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Indicadores</title>
    <meta name="description" content="Marino, Admin theme, Dashboard theme, AngularJS Theme">
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
    <link rel="stylesheet" href="styles/main.css"> </head>

<body data-layout="empty-layout" data-palette="palette-0" data-direction="none">
<div class="fullsize-background-image-1"> <img src="assets/backgrounds/bg845.png"> </div>
<div class="container-fluid">
    <div class="row">
        <div class="col-xs-12">
            <div class="login-page text-center animated fadeIn delay-2000">
                <h1> ingreso </h1>
                <h4> Por favor ingrese su email y su contrase&ntilde;a </h4>
                <div class="row">
                    <div class="col-xs-offset-2 col-xs-8 col-sm-offset-3 col-sm-6 col-md-offset-3 col-md-6 col-lg-offset-4 col-lg-4">
                        <form id="form1" name="form" novalidate class="form" action="index.jsp" method="post">
                            <div class="row">
                                <div class="col-xs-12">
                                    <div class="form-group floating-labels">
                                        <label for="email">Email</label>
                                        <input id="email" autocomplete="off" type="email" name="email">
                                        <p class="error-block"></p>
                                    </div>
                                </div>
                            </div>
                            <div class="row m-b-40">
                                <div class="col-xs-12">
                                    <div class="form-group floating-labels">
                                        <label for="password">Password</label>
                                        <input id="password" autocomplete="off" type="password" name="password">
                                        <p class="error-block"></p>
                                    </div>
                                </div>
                            </div>
                            <div class="row buttons">
                                <div class="col-xs-12 col-md-6">
                                    <input type="submit" class="btn-login btn btn-lg btn-info btn-block m-b-20" value="Login"> </div>
                                <%--<div class="col-xs-12 col-md-6"> <a href="pages-register.html" class="btn btn-lg btn-danger btn-block m-b-20">Register</a> </div>--%>
                            </div>
                        </form>
                    </div>
                </div>
                <p class="social-buttons">
                    <%--<button type="button" class="btn btn-solid btn-circle btn-facebook btn-lg"><i class="fa fa-facebook"></i> </button>--%>
                    <%--<button type="button" class="btn btn-solid btn-circle btn-twitter btn-lg"><i class="fa fa-twitter"></i> </button>--%>
                    <%--<button type="button" class="btn btn-solid btn-circle btn-google btn-lg"><i class="fa fa-google"></i> </button>--%>
                </p>
                <p class="copyright text-sm">&copy; Copyright</p>
            </div>
        </div>
    </div>
</div>
<!-- global scripts -->
<script src="bower_components/jquery/dist/jquery.js"></script>
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
<script src="scripts/components/floating-labels.js"></script>
<script src="scripts/pages-login.js"></script>
</body>

</html>
