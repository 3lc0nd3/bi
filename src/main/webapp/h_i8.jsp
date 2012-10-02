<jsp:useBean id="biManager" class="co.com.elramireza.bi.dao.BiDAO" scope="application"/>
<jsp:include page="c_header.jsp"/>

<div class="row" >
    <div class="twelve columns">
        <h3>
            I8 KPI
        </h3>
    </div>
</div>
<form>
    <div class="row" >
        <div class="six columns">
            <label>KPI</label>
            <select id="kpi" onchange="searchi8();">
                <option value="BOperatingMargin">Operating Margin</option>
                <option value="ERevenueEarnedPerStaffDollar">Revenue Earned Per Staff Dollar</option>
                <option value="GInternationalRevenueOfAPercOfTotalRevenue">International Revenue Of A % Of Total Revenue</option>
                <option value="IPerOfMarketShareOfInternationalRevenue">% Of Market Share Of International Revenue</option>
                <option value="KLiquidityRation">Liquidity Ration</option>
            </select>
        </div>
        <div class="three columns">
            <label>Year</label>
            <select id="aYear" onchange="searchi8();">
                <option value="2009">2009</option>
                <option value="2010">2010</option>
            </select>
        </div>
        <div class="three columns">
            <a onclick="searchi8();" class="button">Search</a>
        </div>
    </div> <%--ROW--%>
    <div class="row" >
        <br>
        <div class="twelve columns">
            <label>Equation</label>
            <input style="text-align:center;" type="text" id="formula" readonly />
        </div>
    </div>
    <div class="row" >
        <div class="six columns">
            <%--<br>--%>
            <label id="l1"></label>
            <input style="text-align:right;" type="text" id="v1" readonly />
        </div>
        <div class="six columns">
            <%--<br>--%>
            <label id="l2"></label>
            <input style="text-align:right;" type="text" id="v2" readonly />
        </div>
    </div>
    <div class="row" >
        <div class="six columns">
            <%--<br>--%>
            <label id="valorLabel"></label>
            <input style="text-align:right;" type="text" id="valor" readonly />
        </div>
    </div>
</form>

<script type="text/javascript">
    function searchi8(){
//        dwr.util.setValue("newDialogDeskDiv"+idStartup, data, { escapeHtml:false });
        var year = dwr.util.getValue("aYear");
        var kpi =  dwr.util.getValue("kpi");
        biRemoto.getI8Calculado(year, function(data){
            dwr.util.setValue("valor", parseFloat(data[kpi]).toFixed(3), { escapeHtml:false });
            if(kpi == 'BOperatingMargin'){
                dwr.util.setValue("formula", "(Net Operating Result / Total Revenue) * 100");
                dwr.util.setValue("l1", "Net Operating Result");
                dwr.util.setValue("v1", data.CNetOperatingResult);
                dwr.util.setValue("l2", "Net Operating Result");
                dwr.util.setValue("v2", data.DTotalRevenue);
                dwr.util.setValue("valorLabel", "Operating Margin");
            } else
            if(kpi == 'ERevenueEarnedPerStaffDollar'){
                dwr.util.setValue("formula", "(Total Revenue / Total Staff Costs)");
                dwr.util.setValue("l1", "Total Revenue");
                dwr.util.setValue("v1", data.DTotalRevenue);
                dwr.util.setValue("l2", "Total Staff Costs");
                dwr.util.setValue("v2", data.FTotalStaffCosts);
                dwr.util.setValue("valorLabel", "Revenue Earned Per Staff Dollar");
            } else
            if(kpi == 'GInternationalRevenueOfAPercOfTotalRevenue'){
                dwr.util.setValue("formula", "(International Revenue / Total Revenue) * 100");
                dwr.util.setValue("l1", "International Revenue");
                dwr.util.setValue("v1", data.HInternationalRevenue);
                dwr.util.setValue("l2", "Total Revenue");
                dwr.util.setValue("v2", data.DTotalRevenue);
                dwr.util.setValue("valorLabel", "International Revenue of a % of Total Revenue");

            } else
            if(kpi == 'IPerOfMarketShareOfInternationalRevenue'){
                dwr.util.setValue("formula", "(International Revenue / Sector International Revenue) * 100");
                dwr.util.setValue("l1", "International Revenue");
                dwr.util.setValue("v1", data.HInternationalRevenue);
                dwr.util.setValue("l2", "Sector International Revenue");
                dwr.util.setValue("v2", data.JSectorInternationalEvenue);
                dwr.util.setValue("valorLabel", "% of Market Share of International Revenue");

            } else
            if(kpi == 'KLiquidityRation'){
                dwr.util.setValue("formula", "(Current Assets / Current Liabilities)");
                dwr.util.setValue("l1", "Current Assets");
                dwr.util.setValue("v1", data.LCurrentAssets);
                dwr.util.setValue("l2", "Current Liabilities");
                dwr.util.setValue("v2", data.MCurrentLiabilities);
                dwr.util.setValue("valorLabel", "Liquidity Ration");
            }
        });
    }
</script>



<jsp:include page="c_footer.jsp"/>