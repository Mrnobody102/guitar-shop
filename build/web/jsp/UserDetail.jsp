<%-- 
    Document   : cart
    Created on : Feb 21, 2022, 9:10:51 PM
    Author     : QUANG HUY
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="models.Guitar"%>
<%@page import="models.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ShopHuy | User detail</title>

        <link
            rel="stylesheet"
            href="https://fonts.googleapis.com/css?family=Roboto:400,700"
            />
        <!-- https://fonts.google.com/specimen/Roboto -->
        <link rel="stylesheet" href="css/fontawesome.min.css" />
        <!-- https://fontawesome.com/ -->
        <link rel="stylesheet" href="css/bootstrap.min.css" />
        <!-- https://getbootstrap.com/ -->
        <link rel="stylesheet" href="css/templatemo-style.css">

    </head>
    <body>
        <div class="app" style="background-color: white; font-size: 14px">
            <%@include file="header.jsp" %>
            <!-- Breadcrumb Section Begin -->

            <div class="container mt-5" style="background-color: white">

                <!-- row -->
                <form action="editmyprofile?uid=${user.getUserID()}" method="post" class="row tm-content-row">
                    <div class="tm-block-col tm-col-avatar">
                        <div class="tm-block tm-block-avatar" style="background-color: rgb(173, 55, 0);">
                            <h2 class="tm-block-title" style="font-size: 16px">Change Avatar</h2>
                            <div class="tm-avatar-container">
                                <img
                                    src="${user.getAvatar()}"
                                    alt="Avatar"
                                    class="tm-avatar img-fluid mb-4"
                                    />
                                <a href="#" class="tm-avatar-delete-link">
                                    <i class="far fa-trash-alt tm-product-delete-icon"></i>
                                </a>
                            </div>
                            <button class="btn btn-primary btn-block text-uppercase">
                                Upload New Photo
                            </button>
                        </div>
                    </div>
                    <div class="tm-block-col tm-col-account-settings">
                        <div class="tm-block tm-block-settings" style="background-color: rgb(173, 55, 0);">
                            <h2 class="tm-block-title" style="font-size: 16px">Account Settings</h2>
                            <div class="tm-signup-form row">
                                <div class="form-group col-lg-6">
                                    <label for="name">Account Name</label>
                                    <input style="background-color: wheat; color: black; font-size: 14px"
                                        id="name"
                                        name="name"
                                        type="text"
                                        class="form-control validate"
                                        value="${user.getUserName()}"
                                        />
                                </div>
                                <div class="form-group col-lg-6">
                                    <label for="fname">Full Name</label>
                                    <input style="background-color: wheat; color: black; font-size: 14px"
                                        id="email"
                                        name="fname"
                                        type="text"
                                        class="form-control validate"
                                        value="${user.getFullName()}"
                                        />
                                </div>
                                <div class="form-group col-lg-12">
                                    <label for="address">Address</label>
                                    <input style="background-color: wheat; color: black; font-size: 14px"
                                        id="password"
                                        name="address"
                                        type="text"
                                        class="form-control validate"
                                        value="${user.getAddress()}"
                                        />
                                </div>
                                
                                <div class="form-group col-lg-6">
                                    <label for="phone">Phone</label>
                                    <input style="background-color: wheat; color: black; font-size: 14px"
                                        id="phone"
                                        name="phone"
                                        type="tel"
                                        class="form-control validate"
                                        value="${user.getUserPhone()}"
                                        />
                                </div>
                                <div class="form-group col-12">
                                    <label class="tm-hide-sm">&nbsp;</label>
                                    <button
                                        type="submit"
                                        class="btn btn-primary btn-block text-uppercase"
                                        >
                                        Update Your Profile
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <!-- Js Plugins -->
        <script src="js/jquery-3.3.1.min.js"></script>
        <!-- https://jquery.com/download/ -->
        <script src="js/bootstrap.min.js"></script>
            <%@include file="footer.jsp" %>
        </div>
        
    </body>
</html>
