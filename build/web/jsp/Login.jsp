<%-- 
    Document   : Login
    Created on : Feb 21, 2022, 12:04:40 PM
    Author     : QUANG HUY
--%>

<%@page import="models.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ShopHuy | Login</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css" integrity="sha512-NhSC1YmyruXifcj/KFRWoC561YpHpc5Jtzgvbuzx5VozKpWvQ+4nXhPdFgmx8xqexRcpAglTj9sIBWINXa8x5w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="./css/main.css">
        <link rel="stylesheet" href="./css/base.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <script src="https://kit.fontawesome.com/ede3035339.js" crossorigin="anonymous"></script>
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500;700&display=swap" rel="stylesheet">
        <%
//            String mess = request.getParameter("mess");
        %>
    </head>
    <body>
        <div class="modal">
            <div class="modal__overlay">

            </div>
            <div class="modal__body">
                <form action="logging?action=${action}" method="post" class="auth-form">
                    <div class="auth-form__container">
                        <div class="auth-form__header">
                            <h3 class="auth-form__heading">
                                Login
                            </h3>
                        </div>

                        <div class="auth-form__form">
                            <div class="auth-form__group">
                                <input required type="text" name="username" class="auth-form__input" placeholder="Your Username" value="">
                            </div>
                            <div >
                                <input required type="password" name="password" class="auth-form__input" placeholder="Enter Password" value="">
                            </div>

                            <div class="auth-form__aside">
                                <div class="auth-form__help">
                                    <a href="" class="auth-form__help-link auth-form__help-forgot-password">Forgot Password</a>
                                    <span class="auth-form__help-separate-line">|</span>
                                    <a href="" class="auth-form__help-link auth-form__help-need-help">Need Help?</a>
                                </div>
                            </div>

                            <div class="auth-form__controls">
                                <a href="home" class="btn btn--hover auth-form__controls-back">BACK</a>

                                <button type="submit" class="btn btn--primary">LOGIN</button>>
                            </div>
                        </div>
                    </div>
                    <br>
                    <div style="display: flex; justify-content: center">
                        <p style="color: red; font-size: 13px;">${loginMessage}</p>
                    </div>
                    
                    <div class="auth-form__socials">
                        <a href="" class="btn btn--size-s btn--with-icon auth-form__socials--facebook">
                            <i class="auth-form__socials-facebook-icon fab fa-facebook-square"></i>
                            <span class="auth-form__socials-title">
                                Login with Facebook
                            </span>
                        </a>
                        <a href="" class="btn btn--size-s btn--with-icon auth-form__socials--google">
                            <i class="auth-form__socials-google-icon fab fa-google"></i>
                            <span class="auth-form__socials-title">
                                Login with Google
                            </span>
                        </a>
                    </div>
                </form>
            </div>
        </div>
                    
    </body>
</html>
