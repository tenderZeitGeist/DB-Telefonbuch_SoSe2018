<%@ page import="util.User" %>

<%--
  Created by IntelliJ IDEA.
  User: Manic
  Date: 03.06.2018
  Time: 15:39
  To change this template use File | Settings | File Templates.
--%>


<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <%@ include file="common/header.jsp" %>
    <title>Index</title>
</head>
<body>

    <%
        /*HttpSession session = request.getSession();*/
        User user = (User) session.getAttribute("loggedInUser");

        if (user == null) {
            response.sendRedirect("/login");
        } else {
            response.sendRedirect( request.getContextPath() + "/overview");
        }
    %>

    <%@ include file="common/footer.jsp" %>
</body>
</html>
