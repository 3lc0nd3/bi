<jsp:useBean id="biManager" class="co.com.elramireza.bi.dao.BiDAO" scope="application"/>
<jsp:include page="c_header.jsp"/>

<div class="row" >
    <div class="twelve columns">
        <h3>
            I2-Student Revenue
        </h3>
    </div>
</div>
<div class="row" >
    <div class="six columns">
        <form>
            <label>Year</label>
            <select class="medium" id="year">
                <%
                    for (Object year: biManager.getYearsI2()){
                %>
                <option value="<%=year%>"><%=year%></option>
                <%
                    }
                %>
            </select>
            <br>
            <label>Type Students</label>
            <select class="medium" id="type">
                <%
                    for (Object type: biManager.getTypeEstudentI2()){
                %>
                <option value="<%=type%>"><%=type%></option>
                <%
                    }
                %>
            </select>
            <br>
            <label>Faculty</label>
            <select class="medium" id="faculty">
                <%
                    for (Object faculty: biManager.getFacultyI2()){
                %>
                <option value="<%=faculty%>"><%=faculty%></option>
                <%
                    }
                %>
            </select>
            <br>
            <label>%What If</label>
            <input type="text" value="10" id="wif" placeholder="%" />
            <br>
            <a onclick="searchi2();" class="button">Search</a>
        </form>
    </div>
    <div class="six columns">
        <label>Projection</label>
        <input style="text-align:right;" type="text" id="projection" readonly />
        <label>New Projection</label>
        <input style="text-align:right;" type="text" id="newProjection" readonly />
        <label>Variance</label>
        <input style="text-align:right;" type="text" id="variance" readonly />
    </div>

</div>

<script type="text/javascript">
    function searchi2(){
        var wif = dwr.util.getValue('wif');
        wif = 1 * wif;
        if (dwr.util.getValue('wif')== '') {
            alert("What If ?");
        } else {
            biRemoto.getI2(
                    dwr.util.getValue('year'),
                    dwr.util.getValue('type'),
                    dwr.util.getValue('faculty'),
                    function(data) {
                        var newProjection = data.projection*(1+wif)/10;
                        var variance = newProjection - data.target;
                        dwr.util.setValue("projection", data.projection);
                        dwr.util.setValue("newProjection", newProjection);
                        dwr.util.setValue("variance", variance);
                        jQuery("#projection").formatCurrency();
                        jQuery("#newProjection").formatCurrency();
                        jQuery("#variance").formatCurrency();
                    });
        }
    }
</script>

<jsp:include page="c_footer.jsp"/>
