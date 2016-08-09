<jsp:useBean id="biManager" class="co.com.elramireza.bi.dao.BiDAO" scope="application"/>
<jsp:include page="c_header.jsp"/>

<div class="row" >
    <div class="twelve columns">
        <h3>
            Bench Revenue Vs Academic Staff Costs
        </h3>
        <form >
            <div class="six columns">
                <label>Institution</label>
                <table border="1">
                    <%
                        for (Object ins : biManager.getInstitutesI7()){
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
                    <%
                        }
                    %>
                </table>
                <br>
                <br>
            </div>
            <div class="three columns">
                <label>Year</label>
                <select id="year">
                    <%                        
                        for(Object y: biManager.getYearsI7()){
                    %>
                    <option value="<%=y%>"><%=y%></option>
                    <%
                        }
                    %>
                </select>
            </div>
            <div class="three columns">
                <a onclick="viewI7();" class="button">View</a>
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
            <th>Total Academic Staff Cost</th>
        </thead>
        <tbody id="i7tBody"></tbody>
    </table>
</div>

<script type="text/javascript">

    var cellFuncs = [
            function(data) { return data.institution;   },
            function(data) { return data.totalRevenue; },
            function(data) { return Math.round(data.totalAcademicStaffCosts *100)/100; }
    ];

    function viewI7(){
        dwr.util.removeAllRows("i7tBody");
        var year = dwr.util.getValue("year");
        var insti = dwr.util.getValue("insti");
        if(insti != ''){
            var s1 = [];
            var tk = [];
            var lista = [[[],[]],[[],[]]];
            biRemoto.getI7Values(insti, year, function(data){
                dwr.util.addRows("i7tBody", data, cellFuncs);
                if (data != null) {
                    for (var i = 0; i < data.length; i++) {
                        var i7 = data[i];
                        lista[0][i] = [i7.institution, i7.totalRevenue];
                        lista[1][i] = [i7.institution, i7.totalAcademicStaffCosts];
                    }
                    /*lista = [
                        [["a",1], ["b",2], ["c",3], ["d",4]],
                        [["a",5], ["b",6], ["c",7], ["d",8]]
                    ];*/
//                    alert("lista = " + lista);
                    jQuery('#chart1').empty();
                    jQuery('#chart1').jqplot(lista, {
                        animate: true,
                        title:' Bench Revenue Vs Academic Staff Cost ' +year,
                        series:[
                            {
                                label: "Total Revenue"
                            },
                            {
                                label: "Total Academic Staff Cost"
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

    viewI7();
</script>

<jsp:include page="c_footer.jsp"/>
