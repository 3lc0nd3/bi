<%
    session.invalidate();
    response.sendRedirect("h_login.jsp");
    return;
%>