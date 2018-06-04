<%--
  Created by IntelliJ IDEA.
  User: Fabian
  Date: 04.06.2018
  Time: 12:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Logout</title>

    <%
        if(session != null)
            session.invalidate();
        response.sendRedirect("/login");
    %>
</head>
</html>
