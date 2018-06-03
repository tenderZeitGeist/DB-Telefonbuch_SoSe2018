<%@ page import="util.Entry" %>
<%@ page import="util.User" %>
<%@ page import="java.util.LinkedList" %>

<%--
  Created by IntelliJ IDEA.
  User: Manic
  Date: 03.06.2018
  Time: 19:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <%@ include file="common/header.jsp" %>
    <title>Overview</title>

    <%
        LinkedList<Entry> entries = new LinkedList<>();
        request.setAttribute("entries", entries);

        entries.add(new Entry("Max Mustermann", "0123 456789", "Musterstraße 1, 1234 Musterstadt"));
        entries.add(new Entry("Bettina Beispielfrau", "0987 654321", "Beispielboulevard 9, 5678 Beispielsburg"));
    %>

</head>
<body>

<%
    User user = (User) session.getAttribute("loggedInUser");

    if (user == null) {
        response.sendRedirect("/login");
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
    <c:forEach items="${entries}" var="entry">
    <tr>
        <td>${entry.name}</td>
        <td>${entry.phone}</td>
        <td>${entry.address}</td>
    </tr>
    </c:forEach>
</table>
<%}%>

<%@ include file="common/footer.jsp" %>
</body>
</html>
