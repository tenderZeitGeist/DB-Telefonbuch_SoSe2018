<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Fabian
  Date: 18.06.2018
  Time: 14:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form method="GET" accept="text/html" action="<c:url value="/database"/>">
    <input type="submit" value="TEXT/HTML" />
</form>
<form method="GET" accept="text/plain" action="<c:url value="/database"/>">
    <input type="submit" value="TEXT/PLAIN" />
</form>


</body>
</html>
