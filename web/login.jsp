<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="util.User" %>
<%@ page import="javax.naming.Context" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="javax.naming.NamingException" %>
<%@ page import="java.sql.SQLException" %>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <%@ include file="common/header.jsp" %>
    <title>Login</title>

</head>

<%
    if(request.getMethod().equals("POST")){
        response.setContentType("text/html;charset=UTF-8");

        String userKey = "loggedInUser";
        User user = (User) session.getAttribute(userKey);

        if(user == null) {

            try {
                Context initContext = new InitialContext();
                Context envContext = (Context) initContext.lookup("java:comp/env");
                DataSource ds = (DataSource) envContext.lookup("jdbc/phonebookDB");
                Connection conn = ds.getConnection();

                Statement statement = conn.createStatement();
                String sql = "select username, password from users";
                ResultSet rs = statement.executeQuery(sql);

                String email = request.getParameter("email");
                String pass = request.getParameter("pass");

                while (rs.next()) {
                    if(email.equals(rs.getString("username"))){
                        if(pass.equals(rs.getString("password"))){
                            user = new User("", email, pass);
                        }
                    }
                }
            } catch (NamingException ex) {
                System.err.println(ex);
            } catch (SQLException ex) {
                System.err.println(ex);
            }

            session.setAttribute(userKey, user);

        }

        if(user != null) {

            response.sendRedirect("/login/overview");
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
