package servlets;

import util.Entry;
import util.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedList;
import java.util.List;

@WebServlet(urlPatterns = {"/overview"})
public class OverviewServlet extends HttpServlet {
    private static final long serialVersionUID = 2L;

    LinkedList<Entry> entries = new LinkedList<Entry>();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) {

    }

     protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

         HttpSession session = request.getSession();
         User user = (User) session.getAttribute("loggedInUser");

         if (user == null) {
             response.sendRedirect("/");
         } else {
             response.setContentType("text/html;charset=UTF-8");
             PrintWriter out = response.getWriter();
             out.println("Welcome user: " + session.getId() + "</br> </br>");
             out.print("<table  border=\"1\">" +
                     "  <tr>" +
                     "    <th>Name</th>" +
                     "    <th>Phone</th>" +
                     "    <th>Address</th>" +
                     "  </tr>");

             for (Entry e: entries)
             {
                out.print("<tr>" +
                        "    <td>" + e.getName() + "</td>" +
                        "    <td>" + e.getPhone() + "</td>" +
                        "    <td>" + e.getAddress() + "</td>" +
                        "  </tr>");
             }

             out.print("</table>");
         }

    }

    @Override
    public void init() {
        System.out.println("Servlet " + this.getServletName() + " has started");

        entries.add(new Entry("Max Mustermann", "0123 456789", "Musterstraße 1, 1234 Musterstadt"));
        entries.add(new Entry("Bettina Beispielfrau", "0987 654321", "Beispielboulevard 9, 5678 Beispielsburg"));
    }

    @Override
    public void destroy() {
        System.out.println("Servlet " + this.getServletName() + " has stopped");
    }
}