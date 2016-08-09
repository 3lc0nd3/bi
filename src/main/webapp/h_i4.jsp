<%@ page import="co.com.elramireza.bi.model.I4" %>
<%@ page import="java.text.DecimalFormat" %>
<jsp:useBean id="biManager" class="co.com.elramireza.bi.dao.BiDAO" scope="application"/>
<jsp:include page="c_header.jsp"/>
<%
    DecimalFormat df = new DecimalFormat("$###,###");
%>
<div class="row" >
    <div class="twelve columns">
        <h3>
            Report Capital
        </h3>
        <form >
            <div class="nine columns">
                <%--<label></label>--%>
                <table border="1" width="100%">
                    <tr>
                        <th>Capital Expenditure</th>
                        <th>2011</th>
                        <th>2012</th>
                        <th>2013</th>
                    </tr>
                    <%
                        for (I4 i4 : biManager.getI4Values()){
                    %>
                    <tr>
                        <td><%=i4.getCapitalExpenditure()%></td>
                        <td align="right"><%=df.format(i4.get_2011())%></td>
                        <td align="right"><%=df.format(i4.get_2012())%></td>
                        <td align="right"><%=df.format(i4.get_2013())%></td>
                        <%--<td><input checked type="checkbox" name="insti" value="<%=i%>"></td>--%>
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
                <a onclick="viewI4();" class="button">View</a>
            </div>
            <%--<div class="three columns"></div>--%>
        </form>
        <br>
        <br>
    </div>
</div>
<div class="row">

    <div id="chart1" style="height:700px; width:92%;"></div>
</div>

<script type="text/javascript">
    function viewI4(){

        var lista = [[[],[]],[[],[]],[[],[]]];
        biRemoto.getI4Values(function(data){
            if (data != null) {
                for (var i = 0; i < data.length; i++) {
                    var i4 = data[i];
                    lista[0][i] = [i4.capitalExpenditure.substring(0,20), i4._2011];
                    lista[1][i] = [i4.capitalExpenditure.substring(0,20), i4._2012];
                    lista[2][i] = [i4.capitalExpenditure.substring(0,20), i4._2013];
                }
                /*lista = [
                 [["a",1], ["b",2], ["c",3], ["d",4]],
                 [["a",5], ["b",6], ["c",7], ["d",8]]
                 ];*/
                //                    alert("lista = " + lista);
                jQuery('#chart1').empty();
                jQuery('#chart1').jqplot(lista, {
                    animate: true,
                    title:'Report Capital',
                    series:[
                        {
                            label: "2011"
                        },
                        {
                            label: "2012"
                        },
                        {
                            label: "2013"
                        }
                    ],
                    legend:{show:true, location:'se'},
                    seriesDefaults:{
//                        pointLabels: { show:true } ,
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
                            label: 'Capital Expenditure',
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
                            tickOptions:{
                                fontSize:'10pt',
                                fontFamily:'Tahoma',
                                angle:30
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
        });
    }

    viewI4();
</script>

<jsp:include page="c_footer.jsp"/>
