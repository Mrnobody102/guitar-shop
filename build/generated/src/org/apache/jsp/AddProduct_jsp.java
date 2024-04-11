package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import models.Guitar;
import java.util.ArrayList;

public final class AddProduct_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("    <head>\n");
      out.write("        <meta charset=\"UTF-8\" />\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />\n");
      out.write("        <meta http-equiv=\"X-UA-Compatible\" content=\"ie=edge\" />\n");
      out.write("        <title>Add Product</title>\n");
      out.write("        <link\n");
      out.write("            rel=\"stylesheet\"\n");
      out.write("            href=\"https://fonts.googleapis.com/css?family=Roboto:400,700\"\n");
      out.write("            />\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/fontawesome.min.css\" />\n");
      out.write("        <link rel=\"stylesheet\" href=\"jquery-ui-datepicker/jquery-ui.min.css\" type=\"text/css\" />\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/bootstrap.min.css\" />\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/templatemo-style.css\">\n");
      out.write("    </head>\n");
      out.write("\n");
      out.write("    <body>\n");
      out.write("        \n");
      out.write("        <div class=\"container tm-mt-big tm-mb-big\">\n");
      out.write("            <div class=\"row\">\n");
      out.write("                <div class=\"col-xl-9 col-lg-10 col-md-12 col-sm-12 mx-auto\">\n");
      out.write("                    <div class=\"tm-bg-primary-dark tm-block tm-block-h-auto\">\n");
      out.write("                        <div class=\"row\">\n");
      out.write("                            <div class=\"col-12\">\n");
      out.write("                                <h2 class=\"tm-block-title d-inline-block\">Add Product</h2>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"row tm-edit-product-row\">\n");
      out.write("                            <div class=\"col-xl-6 col-lg-6 col-md-12\">\n");
      out.write("                                <form action=\"updateproduct?update=add\" method=\"post\" class=\"tm-edit-product-form\">\n");
      out.write("                                    <div class=\"form-group mb-3\">\n");
      out.write("                                        <label\n");
      out.write("                                            for=\"name\"\n");
      out.write("                                            >Product Name\n");
      out.write("                                        </label>\n");
      out.write("                                        <input\n");
      out.write("                                            id=\"name\"\n");
      out.write("                                            name=\"name\"\n");
      out.write("                                            type=\"text\"\n");
      out.write("                                            value=\"\"\n");
      out.write("                                            class=\"form-control validate\"\n");
      out.write("                                            />\n");
      out.write("                                    </div>\n");
      out.write("                                    <div class=\"form-group mb-3\">\n");
      out.write("                                        <label\n");
      out.write("                                            for=\"desc\"\n");
      out.write("                                            >Description</label\n");
      out.write("                                        >\n");
      out.write("                                        <textarea                    \n");
      out.write("                                            class=\"form-control validate tm-small\"\n");
      out.write("                                            rows=\"5\"\n");
      out.write("                                            name=\"desc\"\n");
      out.write("                                            required\n");
      out.write("                                            ></textarea>\n");
      out.write("                                    </div>\n");
      out.write("                                    <div class=\"form-group mb-3\">\n");
      out.write("                                        <label\n");
      out.write("                                            for=\"category\"\n");
      out.write("                                            >Category</label\n");
      out.write("                                        >\n");
      out.write("                                        <select\n");
      out.write("                                            class=\"custom-select tm-select-accounts\"\n");
      out.write("                                            id=\"category\"\n");
      out.write("                                            name=\"category\"\n");
      out.write("                                            >\n");
      out.write("                                            <option>Select category</option>\n");
      out.write("                                            <option value=\"1\" selected>Classic</option>\n");
      out.write("                                            <option value=\"2\">Acoustic</option>\n");
      out.write("                                            <option value=\"3\">Others</option>\n");
      out.write("                                        </select>\n");
      out.write("                                    </div>\n");
      out.write("                            <div class=\"col-xl-6 col-lg-6 col-md-12 mx-auto mb-4\">\n");
      out.write("                                <div class=\"row\">\n");
      out.write("                                        <div class=\"form-group mb-3 col-xs-12 col-sm-6\">\n");
      out.write("                                            <label\n");
      out.write("                                                for=\"uPrice\"\n");
      out.write("                                                >Unit Price\n");
      out.write("                                            </label>\n");
      out.write("                                            <input\n");
      out.write("                                                name=\"uPrice\"\n");
      out.write("                                                type=\"text\"\n");
      out.write("                                                value=\"\"\n");
      out.write("                                                class=\"form-control validate\"\n");
      out.write("                                                data-large-mode=\"true\"\n");
      out.write("                                                />\n");
      out.write("                                        </div>\n");
      out.write("                                        <div class=\"form-group mb-3 col-xs-12 col-sm-6\">\n");
      out.write("                                            <label\n");
      out.write("                                                for=\"uiStock\"\n");
      out.write("                                                >Units In Stock\n");
      out.write("                                            </label>\n");
      out.write("                                            <input\n");
      out.write("                                                id=\"stock\"\n");
      out.write("                                                name=\"uiStock\"\n");
      out.write("                                                type=\"text\"\n");
      out.write("                                                value=\"\"\n");
      out.write("                                                class=\"form-control validate\"\n");
      out.write("                                                />\n");
      out.write("                                        </div>\n");
      out.write("                                    </div>\n");
      out.write("                                <div class=\"form-group\">\n");
      out.write("                                    <label\n");
      out.write("                                        for=\"img\"\n");
      out.write("                                        >URL Image\n");
      out.write("                                    </label>\n");
      out.write("                                    <input\n");
      out.write("                                        type=\"text\"\n");
      out.write("                                        name=\"img\"\n");
      out.write("                                        class=\"form-control validate\"\n");
      out.write("                                        value=\"\"\n");
      out.write("                                        />\n");
      out.write("                                </div>\n");
      out.write("                                    <div class=\"form-group\">\n");
      out.write("                                    <label\n");
      out.write("                                        for=\"brand\"\n");
      out.write("                                        >Brand ID\n");
      out.write("                                    </label>\n");
      out.write("                                    <input\n");
      out.write("                                        type=\"text\"\n");
      out.write("                                        name=\"brand\"\n");
      out.write("                                        class=\"form-control validate\"\n");
      out.write("                                        value=\"\"\n");
      out.write("                                        />\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"col-12\">\n");
      out.write("                                <button type=\"submit\" class=\"btn btn-primary btn-block text-uppercase\">Add now</button>\n");
      out.write("                            </div>\n");
      out.write("                            \n");
      out.write("                        </form>\n");
      out.write("                        \n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        <footer class=\"tm-footer row tm-mt-small\">\n");
      out.write("            <div class=\"col-12 font-weight-light\">\n");
      out.write("                <p class=\"text-center text-white mb-0 px-4 small\">\n");
      out.write("                    Copyright &copy; <b>2018</b> All rights reserved. \n");
      out.write("\n");
      out.write("                    Design: <a rel=\"nofollow noopener\" href=\"https://templatemo.com\" class=\"tm-footer-link\">Huy Pham</a>\n");
      out.write("                </p>\n");
      out.write("            </div>\n");
      out.write("        </footer> \n");
      out.write("\n");
      out.write("        <script src=\"js/jquery-3.3.1.min.js\"></script>\n");
      out.write("        <script src=\"jquery-ui-datepicker/jquery-ui.min.js\"></script>\n");
      out.write("        <script src=\"js/bootstrap.min.js\"></script>\n");
      out.write("        \n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
