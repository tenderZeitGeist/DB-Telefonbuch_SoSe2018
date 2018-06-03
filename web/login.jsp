<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="util.LoginValidator" %>
<%@ page import="util.User" %><%--
  Created by IntelliJ IDEA.
  User: Manic
  Date: 03.06.2018
  Time: 18:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <%@ include file="common/header.jsp" %>
    <title>Login</title>
</head>

<%
    if(request.getMethod().equals("POST")){
        response.setContentType("text/html;charset=UTF-8");

        String email = request.getParameter("email");
        String pass = request.getParameter("pass");

        String userKey = "loggedInUser";
        User user = (User) session.getAttribute(userKey);

        if(user == null) {

            user = LoginValidator.checkUser(email, pass);
            session.setAttribute(userKey, user);

        }

        if(user != null) {

            response.sendRedirect("/overview");
            request.changeSessionId();

        } else {
%>

<p>Name oder Passwort falsch!</p>

<%
        }
    }
%>

<body>
    <form method="post" action="<c:url value="/login"/>">
        <label>
            Email ID:
            <input type="text" name="email" value="test"/>
        </label><br/>
        <label>
            Password:
            <input type="text" name="pass" value="pass"/>
        </label><br/>
        <input type="submit" value="Login" />
    </form>

    <%@ include file="common/footer.jsp" %>
</body>
</html>
