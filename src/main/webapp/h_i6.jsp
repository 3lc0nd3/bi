<jsp:useBean id="biManager" class="co.com.elramireza.bi.dao.BiDAO" scope="application"/>
<jsp:include page="c_header.jsp"/>

<div class="row" >
    <div class="twelve columns">
        <h3>
            Bench Revenue Vs Staff Costs
        </h3>
        <form >
            <div class="six columns">
                <label>Institution</label>
                <table border="1">

                <%--<select id="institution">--%>
                    <%
                        for (Object ins : biManager.getInstitutesI6()){
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
                        for(Object y: biManager.getYearsI6()){
                    %>
                    <option value="<%=y%>"><%=y%></option>
                    <%
                        }
                    %>
                </select>
            </div>
            <div class="three columns">
                <a onclick="viewI6();" class="button">View</a>
            </div>
        </form>
        <br>
        <br>
    </div>
</div>
<div class="row">

    <div id="chart1" style="height:500px; width:85%;"></div>
    <br>
    <table width="80%">
        <thead>
            <th>Institution</th>
            <th>Total Revenue</th>
            <th>Total Staff Cost</th>
        </thead>
        <tbody id="i6tBody"></tbody>
    </table>
</div>

<script type="text/javascript">

    var cellFuncs = [
            function(data) { return data.institution;   },
            function(data) { return data.totalRevenue; },
            function(data) { return Math.round(data.totalStaffCost *100)/100; }
    ];

    function viewI6(){
        dwr.util.removeAllRows("i6tBody");
        var year = dwr.util.getValue("year");
        var insti = dwr.util.getValue("insti");
        if(insti != ''){
            var s1 = [];
            var tk = [];
            var lista = [[[],[]],[[],[]]];
            biRemoto.getI6Values(insti, year, function(data){
                dwr.util.addRows("i6tBody", data, cellFuncs);
                if (data != null) {
                    for (var i = 0; i < data.length; i++) {
                        var i6 = data[i];
                        lista[0][i] = [i6.institution, i6.totalRevenue];
                        lista[1][i] = [i6.institution, i6.totalStaffCost];
                    }
                    /*lista = [
                        [["a",1], ["b",2], ["c",3], ["d",4]],
                        [["a",5], ["b",6], ["c",7], ["d",8]]
                    ];*/
//                    alert("lista = " + lista);
                    jQuery('#chart1').empty();
                    jQuery('#chart1').jqplot(lista, {
                        animate: true,
                        title:' Bench Revenue Vs Staff '+ year,
                        series:[
                            {
                                label: "Total Revenue"
                            },
                            {
                                label: "Total Staff Cost"
                            }
                        ],
                        legend:{show:true, location:'se'},
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

    viewI6();
</script>

<jsp:include page="c_footer.jsp"/>
