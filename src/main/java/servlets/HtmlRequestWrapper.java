package servlets;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import java.util.Enumeration;

public class HtmlRequestWrapper extends HttpServletRequestWrapper {

    public HtmlRequestWrapper(HttpServletRequest request) {

        super((HttpServletRequest) request);

    }

    public void replaceLetters () {

        for (Enumeration en = super.getParameterNames(); en.hasMoreElements(); ) {

            String name = (String)en.nextElement();
            String values[] = super.getParameterValues(name);
            int n = values.length;

            for(int i=0; i < n; i++) {

                values[i] = values[i].replaceAll("c", "k").trim();

                setAttribute(name, values[i]);

                System.out.println(values[i]);
            }
        }
    }
}




