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

        String responseContent;
        HtmlResponseWrapper capturingResponseWrapper = new HtmlResponseWrapper((HttpServletResponse) res);
        HtmlRequestWrapper capturingRequestWrapper =  new HtmlRequestWrapper((HttpServletRequest) req);

        // Filtering and chaining the request and response
        capturingRequestWrapper.replaceLetters();
        chain.doFilter(capturingRequestWrapper, capturingResponseWrapper);

        if (res.getContentType() != null ) {

            String content = capturingResponseWrapper.getCaptureAsString();

            // replace stuff here
            if (content.contains("k")) {

                responseContent = content.replaceAll(
                        "k",
                        "c");

            } else if (content.contains("K")) {

                responseContent = content.replaceAll(
                        "K",
                        "C");


            } else {

                return;

            }

            // System.out.println(responseContent);

            res.getWriter().write(responseContent);

        }
    }

    @Override
    public void destroy() {
    }


}
