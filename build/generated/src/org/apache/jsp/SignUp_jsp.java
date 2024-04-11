package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class SignUp_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html;charset=UTF-8");
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
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>ShopHuy | Sign up</title>\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css\" integrity=\"sha512-NhSC1YmyruXifcj/KFRWoC561YpHpc5Jtzgvbuzx5VozKpWvQ+4nXhPdFgmx8xqexRcpAglTj9sIBWINXa8x5w==\" crossorigin=\"anonymous\" referrerpolicy=\"no-referrer\" />\n");
      out.write("        <link rel=\"stylesheet\" href=\"./css/main.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"./css/base.css\">\n");
      out.write("        <link rel=\"preconnect\" href=\"https://fonts.googleapis.com\">\n");
      out.write("        <link rel=\"preconnect\" href=\"https://fonts.gstatic.com\" crossorigin>\n");
      out.write("        <script src=\"https://kit.fontawesome.com/ede3035339.js\" crossorigin=\"anonymous\"></script>\n");
      out.write("        <link href=\"https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500;700&display=swap\" rel=\"stylesheet\">\n");
      out.write("\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div class=\"modal\">\n");
      out.write("            <div class=\"modal__overlay\">\n");
      out.write("\n");
      out.write("            </div>\n");
      out.write("            <div class=\"modal__body\">\n");
      out.write("                <div class=\"auth-form\">\n");
      out.write("                    <div class=\"auth-form__container\">\n");
      out.write("                        <div class=\"auth-form__header\">\n");
      out.write("                            <h3 class=\"auth-form__heading\">\n");
      out.write("                                Sign Up\n");
      out.write("                            </h3>\n");
      out.write("                            <a href=\"login\" style=\"text-decoration: none\">\n");
      out.write("                            <span class=\"auth-form__switch-btn\">Login</span></a>\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                        <form action=\"updateuser\" method=\"post\" class=\"auth-form__form\">\n");
      out.write("                            <div class=\"auth-form__group\">\n");
      out.write("                                <input required name=\"username\" class=\"auth-form__input\" placeholder=\"Your Username\">\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"auth-form__group\">\n");
      out.write("                                <input required type=\"password\" name=\"password\" class=\"auth-form__input\" placeholder=\"Enter Password\">\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"auth-form__group\">\n");
      out.write("                                <input required type=\"password\" name=\"rewritePassword\" class=\"auth-form__input\" placeholder=\"Re-enter Password\">\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"auth-form__aside\">\n");
      out.write("                                <p class=\"auth-form__policy-service\">\n");
      out.write("                                    By signing up, you agree to ShopHuy's \n");
      out.write("                                    <a href=\"\" class=\"auth-form__sp-link\">Terms of Service</a>\n");
      out.write("                                    &\n");
      out.write("                                    <a href=\"\" class=\"auth-form__sp-link\">Private Policy</a>\n");
      out.write("                                </p>  \n");
      out.write("                            </div>\n");
      out.write("\n");
      out.write("                            <div class=\"auth-form__controls\">\n");
      out.write("                                <a href=\"home\" class=\"btn btn--hover auth-form__controls-back\">BACK</a>\n");
      out.write("                                <button type=\"submit\" class=\"btn btn--primary\">SIGN UP</button>\n");
      out.write("                            </div>\n");
      out.write("                        </form>\n");
      out.write("                    </div>\n");
      out.write("                    <br>\n");
      out.write("                    <div style=\"display: flex; justify-content: center\">\n");
      out.write("                        <p style=\"color: red; font-size: 13px;\">");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${signupMessage}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("</p>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"auth-form__socials\">\n");
      out.write("                        <a href=\"\" class=\"btn btn--size-s btn--with-icon auth-form__socials--facebook\">\n");
      out.write("                            <i class=\"auth-form__socials-facebook-icon fab fa-facebook-square\"></i>\n");
      out.write("                            <span class=\"auth-form__socials-title\">\n");
      out.write("                                Connect with Facebook\n");
      out.write("                            </span>\n");
      out.write("                        </a>\n");
      out.write("                        <a href=\"\" class=\"btn btn--size-s btn--with-icon auth-form__socials--google\">\n");
      out.write("                            <i class=\"auth-form__socials-google-icon fab fa-google\"></i>\n");
      out.write("                            <span class=\"auth-form__socials-title\">\n");
      out.write("                                Connect with Google \n");
      out.write("                            </span>\n");
      out.write("                        </a>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
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
