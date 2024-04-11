<%-- 
    Document   : SignUp
    Created on : Feb 22, 2022, 9:35:41 AM
    Author     : QUANG HUY
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ShopHuy | Sign up</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css" integrity="sha512-NhSC1YmyruXifcj/KFRWoC561YpHpc5Jtzgvbuzx5VozKpWvQ+4nXhPdFgmx8xqexRcpAglTj9sIBWINXa8x5w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="./css/main.css">
        <link rel="stylesheet" href="./css/base.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <script src="https://kit.fontawesome.com/ede3035339.js" crossorigin="anonymous"></script>
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500;700&display=swap" rel="stylesheet">

    </head>
    <body>
        <div class="modal">
            <div class="modal__overlay">

            </div>
            <div class="modal__body">
                <div class="auth-form">
                    <div class="auth-form__container">
                        <div class="auth-form__header">
                            <h3 class="auth-form__heading">
                                Sign Up
                            </h3>
                            <a href="login" style="text-decoration: none">
                            <span class="auth-form__switch-btn">Login</span></a>
                        </div>

                        <form action="updateuser" method="post" class="auth-form__form">
                            <div class="auth-form__group">
                                <input required name="username" class="auth-form__input" placeholder="Your Username">
                            </div>
                            <div class="auth-form__group">
                                <input required type="password" name="password" class="auth-form__input" placeholder="Enter Password">
                            </div>
                            <div class="auth-form__group">
                                <input required type="password" name="rewritePassword" class="auth-form__input" placeholder="Re-enter Password">
                            </div>
                            <div class="auth-form__aside">
                                <p class="auth-form__policy-service">
                                    By signing up, you agree to ShopHuy's 
                                    <a href="" class="auth-form__sp-link">Terms of Service</a>
                                    &
                                    <a href="" class="auth-form__sp-link">Private Policy</a>
                                </p>  
                            </div>

                            <div class="auth-form__controls">
                                <a href="home" class="btn btn--hover auth-form__controls-back">BACK</a>
                                <button type="submit" class="btn btn--primary">SIGN UP</button>
                            </div>
                        </form>
                    </div>
                    <br>
                    <div style="display: flex; justify-content: center">
                        <p style="color: red; font-size: 13px;">${signupMessage}</p>
                    </div>
                    <div class="auth-form__socials">
                        <a href="" class="btn btn--size-s btn--with-icon auth-form__socials--facebook">
                            <i class="auth-form__socials-facebook-icon fab fa-facebook-square"></i>
                            <span class="auth-form__socials-title">
                                Connect with Facebook
                            </span>
                        </a>
                        <a href="" class="btn btn--size-s btn--with-icon auth-form__socials--google">
                            <i class="auth-form__socials-google-icon fab fa-google"></i>
                            <span class="auth-form__socials-title">
                                Connect with Google 
                            </span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
