<%--
  Created by IntelliJ IDEA.
  User: ZeitGeist
  Date: 13.06.2018
  Time: 19:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@ include file="/common/header.jsp" %>
    <title>Newspage</title>

    <style>

        body {
            font-family: 'DejaVu Sans', Arial, Helvetica, sans-serif;
            font-size: large;
            text-align-all: justify;

        }

        h2, p {
            display: flex;
            align-items: center;
            justify-content: center;
        }

        p {
            margin: 0 auto;
            width: 40em;
        }

        div {
            margin: 0 auto;
        }

    </style>

</head>
<body>

<h2>
    BREAKING NEWS!
</h2>

<div>
    <p>
        <a href="/newspage/foreign-policy">Trump is meeting up with Kim Jong-un!</a>
    </p>
</div>

<div>
    <p>
        <a href="/newspage/article">Technimatic released their first album!</a
    </p>
</div>


</p>

<%@ include file="/common/footer.jsp" %>
</body>
</html>
