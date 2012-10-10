<jsp:useBean id="biManager" class="co.com.elramireza.bi.dao.BiDAO" scope="application"/>
<jsp:include page="c_header.jsp"/>

<div class="row" >
    <div class="twelve columns">
        <h3>
            O4 Bench Operating Marging
        </h3>
        <form >
            <div class="six columns">
                <label>Institution</label>
                <table border="1">

                <%--<select id="institution">--%>
                    <%
                        for (Object ins : biManager.getInstitutesO4()){
                            String i = (String) ins;
                    %>
                    <tr>
                        <td>
                            <%=i%>
                        </td>
                        <td>
                            <input checked type="checkbox" name="insti" value="<%=i%>">
                        </td>
                    </tr>
                    <%--<option <%=i.contains("Trobe")?"selected=\"selected\"":""%> value="<%=i%>"><%=i%></option>--%>
                    <%
                        }
                    %>
                <%--</select>--%>
                </table>
                <br>
                <br>
            </div>
            <div class="three columns">
                <label>Year</label>
                <select id="year">
                    <%
                        for(Object y: biManager.getYearsO4()){
                    %>
                    <option value="<%=y%>"><%=y%></option>
                    <%
                        }
                    %>
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

        <div id="chart1" style="height:500px; width:85%;"></div>
</div>

<script type="text/javascript">

    jQuery(document).ready(function(){
        (function(jQuery) {
            jQuery.jqplot.PercentFormatter = function(format, val){
                return Math.round(val * 10000)/100 + '%';
            };
        })(jQuery);
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
                        title:'Bench Operating Marging ' + year,
                        seriesDefaults:{
                            pointLabels: {
                                show:true,
                                formatString: '%s',
                                formatter: $.jqplot.PercentFormatter
                            } ,
                            renderer:jQuery.jqplot.BarRenderer,
                                rendererOptions:{
                                    varyBarColor: true,
                                    animation: {
                                        speed: 1700
                                    }
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
                }
            });
        }

    }

    viewO4();
</script>

<jsp:include page="c_footer.jsp"/>
