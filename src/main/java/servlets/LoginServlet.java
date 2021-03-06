package servlets;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

import util.User;
import util.LoginValidator;

@WebServlet()
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String email = request.getParameter("email");
        String pass = request.getParameter("pass");

        HttpSession session = request.getSession();
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
            out.println("Name oder Passwort falsch </br> </br>");

            out.print("<form method=\"post\" action=\"/login\">\n" +
                    "    Email ID:<input type=\"text\" name=\"email\" value=\"test\"/><br/>\n" +
                    "    Password:<input type=\"text\" name=\"pass\" value=\"pass\"/><br/>\n" +
                    "    <input type=\"submit\" value=\"Login\" />\n" +
                    "</form>");
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) {


    }


    @Override
    public void init() {
        System.out.println("Servlet " + this.getServletName() + " has started");
    }
    @Override
    public void destroy() {
        System.out.println("Servlet " + this.getServletName() + " has stopped");
    }
}
