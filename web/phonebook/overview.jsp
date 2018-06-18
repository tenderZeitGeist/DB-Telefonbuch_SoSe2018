<%@ page import="util.User" %>

<%@ page contentType="text/html;charset=UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jstl/sql" %>

<html>
<head>
    <%@ include file="../common/header.jsp" %>
    <title>Overview</title>

    <sql:query var="entries" dataSource="jdbc/phonebookDB">
        select name, phone, address from entries;
    </sql:query>

</head>
<body>

<%
    User user = (User) session.getAttribute("loggedInUser");

    if (user == null) {
        response.sendRedirect("/telefonbuch/login");
    } else {
        request.changeSessionId();

%>
<p>Welcome user: <%=session.getId()%></p>
<table border="1">
    <tr>
        <th>Name</th>
        <th>Phone</th>
        <th>Address</th>
    </tr>
    <c:forEach items="${entries.rows}" var="entry">
    <tr>
        <td><c:out value="${fn:substringAfter(entry.name, \" \")}, ${fn:substringBefore(entry.name, \" \")}"/></td>
        <td><c:out value="(${fn:substring(entry.phone, 0, 4)}) ${fn:substring(entry.phone, 4, fn:length(entry.phone))}"/></td>
        <td>${entry.address}</td>
    </tr>
    </c:forEach>
</table>
<%}%>

<%@ include file="../common/footer.jsp" %>
</body>
</html>
