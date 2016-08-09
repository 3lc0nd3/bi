
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8" >




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


    <link rel="stylesheet" href="javascripts/jqPlot/jquery.jqplot.min.css">

    <script src="javascripts/modernizr.foundation.js"></script>
    <script src="javascripts/jquery.foundation.tabs.js"></script>

    <script type='text/javascript' src='dwr/engine.js'></script>
    <script type='text/javascript' src='dwr/util.js'></script>

    <script type='text/javascript' src='dwr/interface/biRemoto.js'></script>

    <script type="text/javascript">

    </script>
</head>

<body>


    <br>




<div class="row" >
    <div class="twelve columns">
        <h3>
            O4 Bench Operating Marging
        </h3>
        <form >
            <div class="six columns">
                <label>Institution</label>
                <table border="1">



                    <tr>
                        <td>
                            Charles Darwin University
                        </td>
                        <td>
                            <input checked type="checkbox" name="insti" value="Charles Darwin University">
                        </td>
                    </tr>


                    <tr>
                        <td>
                            The University of Newcastle
                        </td>
                        <td>
                            <input checked type="checkbox" name="insti" value="The University of Newcastle">
                        </td>
                    </tr>


                    <tr>
                        <td>
                            Griffith University
                        </td>
                        <td>
                            <input checked type="checkbox" name="insti" value="Griffith University">
                        </td>
                    </tr>


                    <tr>
                        <td>
                            James Cook University
                        </td>
                        <td>
                            <input checked type="checkbox" name="insti" value="James Cook University">
                        </td>
                    </tr>


                    <tr>
                        <td>
                            Murdoch University
                        </td>
                        <td>
                            <input checked type="checkbox" name="insti" value="Murdoch University">
                        </td>
                    </tr>


                    <tr>
                        <td>
                            The Flinders University of South Australia
                        </td>
                        <td>
                            <input checked type="checkbox" name="insti" value="The Flinders University of South Australia">
                        </td>
                    </tr>


                    <tr>
                        <td>
                            La Trobe University
                        </td>
                        <td>
                            <input checked type="checkbox" name="insti" value="La Trobe University">
                        </td>
                    </tr>



                </table>
                <br>
                <br>
            </div>
            <div class="three columns">
                <label>Year</label>
                <select id="year">

                    <option value="2009">2009</option>

                    <option value="2010">2010</option>

                    <option value="2011">2011</option>

                </select>
            </div>
            <div class="three columns">
                <a onclick="viewO4();" class="button">View</a>
            </div>
        </form>
        <br>
        <br>
    </div>
</div>
<div class="row">

        <div id="chart1" style="height:400px; width:800px;"></div>
</div>

    <script type="text/javascript">
        jQuery(document).ready(function(){

        });
        function viewO4(){
            var year = dwr.util.getValue("year");
            var insti = dwr.util.getValue("insti");
            if(insti != ''){
                var s1 = [];
                var tk = [];
                var lista = [[]];
                biRemoto.getO4CalculadoValues(insti, year, function(data){
                    if (data != null) {
                        for (var i = 0; i < data.length; i++) {
                            var o4 = data[i];
                            lista[i] = [o4.institution, o4.operatingMarging];
                        }
                        jQuery('#chart1').empty();
                        jQuery('#chart1').jqplot([lista], {
                            animate: true,
                            title:'Bench Operating Marging',
                            seriesDefaults:{
                                renderer:jQuery.jqplot.BarRenderer,
                                rendererOptions:{
                                    varyBarColor: true
                                }
                            },
                            axes:{
                                xaxis: {
                                    renderer: jQuery.jqplot.CategoryAxisRenderer,
                                    label: 'Institution',
                                    labelRenderer: jQuery.jqplot.CanvasAxisLabelRenderer,
                                    tickRenderer: jQuery.jqplot.CanvasAxisTickRenderer,
                                    tickOptions: {
                                        angle: -40
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
                        /*jQuery(document).ready(function(){
                        // A Bar chart from a single series will have all the bar colors the same.
                        var line1 = [['Nissan', 4],['Porche', 6],['Acura', 2],['Aston Martin', 5],['Rolls Royce', 6]];

                        jQuery('#chart1').jqplot([line1], {
                            title:'Default Bar Chart',
                            seriesDefaults:{
                                renderer:jQuery.jqplot.BarRenderer,
                            },
                            axes:{
                                xaxis:{
                                    renderer: jQuery.jqplot.CategoryAxisRenderer
                                }
                            }
                        });
                    });*/
                    }
                });
            }

        }

    </script>
    <br>
    <br>
    <div class="row" style="background-color:gray; color:aliceblue;">
        <div class="twelve columns">
            <div class="container">
                <br>
                <br>
                &copy; 2012
                <br>
                <br>
                <br>
            </div>
        </div>
    </div>

    <!-- Included JS Files (Compressed) -->
  <%--<script src="javascripts/jquery.js"></script>--%>
  <%--<script src="javascripts/foundation.min.js"></script>--%>

  <!-- Initialize JS Plugins -->
  <script src="javascripts/app.js"></script>

       </body>
</html>
