<%--
  Created by IntelliJ IDEA.
  User: ZeitGeist
  Date: 13.06.2018
  Time: 19:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@ include file="common/header.jsp" %>

    <title>Foreign-Policy</title>

    <style>

        .trump {
            max-width: 40em;
            height: auto;
            margin: 0 auto;
            display: flex;
            justify-content: center;
        }

        .newsarticle {
            margin: 0 auto;
            width: 40em;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        p {
            font-family: 'DejaVu Sans', Arial, Helvetica, sans-serif;
            font-size: large;
            text-align-all: justify;
        }

    </style>

</head>
<body>

<div id="picture" class="picture">
    <img src="../resources/gettyimages-971754092.jpg" class="trump">
</div>

<div id="newsarticle" class="newsarticle">
    <p>
        Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.
    </p>
</div>
<%@ include file="common/footer.jsp" %>
</body>
</html>
