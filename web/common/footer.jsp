<%--
  Created by IntelliJ IDEA.
  User: Manic
  Date: 03.06.2018
  Time: 19:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>

<style>
    body{
        overflow: hidden;
        background-color: whitesmoke;
    }
    body a {
        float: left;
        display: block;
        color: black;
        text-align: center;
        padding: 14px 16px;
        text-decoration: none;
    }

    body a:hover {
        background-color: black;
        color: whitesmoke;
    }
</style>

<body>

<hr>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<a href="<c:url value="/telefonbuch/logout"/>">Logout</a>

<a href="<c:url value="/telefonbuch/overview"/>">Overview</a>

<a href="<c:url value="/hello"/>">Hello World!</a>

<a href="<c:url value="/newspage"/>">Newspage</a>

</body>


