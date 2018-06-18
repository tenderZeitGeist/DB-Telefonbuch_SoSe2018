package servlets;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class FilterServlet implements Filter {

    @Override
    public void init(FilterConfig config) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws ServletException, IOException {

        String replacedContent;
        HtmlResponseWrapper capturingResponseWrapper = new HtmlResponseWrapper((HttpServletResponse) res);

        chain.doFilter(req, capturingResponseWrapper);

        if (res.getContentType() != null) {

            String content = capturingResponseWrapper.getCaptureAsString();

            // replace stuff here
            if (content.contains("k")) {

                replacedContent = content.replaceAll(
                        "k",
                        "c");

            } else if (content.contains("K")) {

                replacedContent = content.replaceAll(
                        "K",
                        "C");

            } else {

                return;

            }

            chain.doFilter();

            System.out.println(replacedContent);

            res.getWriter().write(replacedContent);


        }
    }

    @Override
    public void destroy() {
    }


}
