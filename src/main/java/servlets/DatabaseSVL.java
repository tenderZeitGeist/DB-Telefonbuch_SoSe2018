package servlets;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet()
public class DatabaseSVL extends HttpServlet {

    private static final long serialVersionUID = -4751096228274971485L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        String acceptHeader = request.getHeader("Accept");

        if(acceptHeader.equals("text/html")){

            response.setContentType("text/html");
            response.getWriter().print(
                    "<table>\n" +
                    "    <tr>\n" +
                    "        <td>\n" +
                    "            Testdaten1\n" +
                    "        </td>\n" +
                    "    </tr>\n" +
                    "    <tr>\n" +
                    "        <td>\n" +
                    "            Testdaten2\n" +
                    "        </td>\n" +
                    "    </tr>\n" +
                    "    <tr>\n" +
                    "        <td>\n" +
                    "            Testdaten3\n" +
                    "        </td>\n" +
                    "    </tr>\n" +
                    "</table>");

        } else if(acceptHeader.equals("text/plain")){

            response.setContentType("text/plain");
            response.getWriter().print("Testdaten1\n" +
                    "Testdaten2\n" +
                    "Testdaten3");
        }

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
