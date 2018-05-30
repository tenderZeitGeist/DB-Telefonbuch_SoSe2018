package java.main;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.main.User;

@WebServlet(name = "WelcomeServlet")
public class WelcomeServlet extends HttpServlet {
    private static final long serialVersionUID = 2L;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

     protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

         HttpSession session = request.getSession();
         User user = (User) session.getAttribute("loggedInUser");

         if (user == null) {
             RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/login");
             dispatcher.forward(request, response);
         } else {
             response.setContentType("text/html;charset=UTF-8");
             PrintWriter out = response.getWriter();
             out.println("Welcome user");
             out.println(session.getId());
         }

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