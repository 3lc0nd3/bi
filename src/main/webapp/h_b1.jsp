<%@ page import="co.com.elramireza.bi.model.I1" %>
<jsp:useBean id="biManager" class="co.com.elramireza.bi.dao.BiDAO" scope="application"/>
<jsp:include page="c_header.jsp"/>

<div class="row" >
    <div class="twelve columns">
        <div class="container">
            <h3>
                I1-Profit Loss
            </h3>


            <table width="97%" border="1" cellpadding="0" cellspacing="0">
                <thead>
                <tr>
                    <td class=""> </td>
                    <th class="thI1"> Id</th>
                    <th class="thI1"> 2008</th>
                    <th class="thI1"> 2009</th>
                    <th class="thI1"> 2010</th>
                    <th class="thI1"> 2011</th>
                    <th class="thI1"> 2012</th>
                    <th class="thI1"> 2013</th>
                    <th class="thI1"> 2014</th>
                    <th class="thI1"> 2015</th>
                    <th class="thI1"> 2016</th>
                </tr>
                </thead>
                <tbody>
<%
    for(I1 i1: biManager.getI1List()){
%>
                <tr>
                    <td style="; text-align:right;"><%=i1.getId()%></td>
                    <td style="<%=i1.getStyle()%>"><%=i1.getItem().equals("")?"&nbsp;":i1.getItem()%></td>
                    <td style="; text-align:right;"><%=i1.get_2008().equals("")?"&nbsp;":i1.get_2008()%></td>
                    <td style="; text-align:right;"><%=i1.get_2009().equals("")?"&nbsp;":i1.get_2009()%></td>
                    <td style="; text-align:right;"><%=i1.get_2010().equals("")?"&nbsp;":i1.get_2010()%></td>
                    <td style="; text-align:right;"><%=i1.get_2011().equals("")?"&nbsp;":i1.get_2011()%></td>
                    <td style="; text-align:right;"><%=i1.get_2012().equals("")?"&nbsp;":i1.get_2012()%></td>
                    <td style="; text-align:right;"><%=i1.get_2013().equals("")?"&nbsp;":i1.get_2013()%></td>
                    <td style="; text-align:right;"><%=i1.get_2014().equals("")?"&nbsp;":i1.get_2014()%></td>
                    <td style="; text-align:right;"><%=i1.get_2015().equals("")?"&nbsp;":i1.get_2015()%></td>
                    <td style="; text-align:right;"><%=i1.get_2016().equals("")?"&nbsp;":i1.get_2016()%></td>
                </tr>
<%
    }
%>
                </tbody>
            </table>

            <table>
                <tr>

                </tr>
            </table>
        </div>
    </div>
</div>

<jsp:include page="c_footer.jsp"/>
