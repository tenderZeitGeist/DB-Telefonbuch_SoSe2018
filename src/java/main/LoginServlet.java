package java.main;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.main.LoginValidator;
import java.main.User;

@WebServlet(name = "LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

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
            redirectAfterLogin(user, response, request);
            request.changeSessionId();
        } else {
            out.println("Name oder Passwort falsch");
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }

    private void redirectAfterLogin(User user, HttpServletResponse response, HttpServletRequest request)
            throws IOException, ServletException {

        RequestDispatcher rs = request.getRequestDispatcher("/welcome");
        rs.forward(request, response);
    }

    @Override
    public void init() throws ServletException {
        System.out.println("Servlet " + this.getServletName() + " has started");
    }
    @Override
    public void destroy() {
        System.out.println("Servlet " + this.getServletName() + " has stopped");
    }
}
