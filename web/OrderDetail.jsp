<%-- 
    Document   : cart
    Created on : Feb 21, 2022, 9:10:51 PM
    Author     : QUANG HUY
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="models.Guitar"%>
<%@page import="models.Category"%>
<%@page import="models.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ShopHuy | Order Detail</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css" integrity="sha512-NhSC1YmyruXifcj/KFRWoC561YpHpc5Jtzgvbuzx5VozKpWvQ+4nXhPdFgmx8xqexRcpAglTj9sIBWINXa8x5w==" crossorigin="anonymous" referrerpolicy="no-referrer" />

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <script src="https://kit.fontawesome.com/ede3035339.js" crossorigin="anonymous"></script>
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500;700&display=swap" rel="stylesheet">

        <!-- Css Styles -->
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
        <link rel="stylesheet" href="css/nice-select.css" type="text/css">
        <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
        <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
        <link rel="stylesheet" href="css/style.css" type="text/css">

    </head>
    <body>
        <div class="app">
            <%@include file="header.jsp" %>
            <section class="breadcrumb-section set-bg" data-setbg="https://wallpaperaccess.com/full/2254672.jpg">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12 text-center">
                            <div class="breadcrumb__text">
                                <h2 style="color: white; text-shadow: 2px 0 0 rgb(173, 55, 0), -2px 0 0 rgb(173, 55, 0), 0 2px 0 rgb(173, 55, 0), 0 -2px 0 rgb(173, 55, 0), 1px 1px rgb(173, 55, 0), -1px -1px 0 rgb(173, 55, 0), 1px -1px 0 rgb(173, 55, 0), -1px 1px 0 rgb(173, 55, 0);">Order Detail</h2>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- Shoping Cart Section Begin -->
            <section class="shoping-cart spad">
                <div class="container">
                    <form action="changecart">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="shoping__cart__table">
                                    <table>
                                        <thead>
                                            <tr>
                                                <th>Name</th>
                                                <th>Category</th>
                                                <th>Brand</th>
                                                <th>Price</th>
                                                
                                                <th>Quantity</th>
                                                <th>Total</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${ods}" var="ods">
                                                <tr>
                                                    <td style="width: 25%"><h5>${ods.getCart().getGuitar().getGuitarName()}</h5></td>
                                                    <td style="width: 15%"><h5>${ods.getCart().getGuitar().getCategory().getCategoryName()}</h5></td>
                                                    <td style="width: 15%"><h5>${ods.getCart().getGuitar().getBrand().getBrandName()}</h5></td>
                                                    <td class="shoping__cart__price" style="width: 20%">
                                                        ${ods.getCart().getGuitar().getUnitPriceString()}.000đ
                                                    </td>
                                                    <td class="shoping__cart__total" style="width: 10%">
                                                        ${ods.getCart().getQuantity()}

                                                    </td>
                                                    <td class="shoping__cart__total" style="width: 20%">
                                                        ${ods.getCart().getSumPriceString()}
                                                    </td>

                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="shoping__cart__btns">
                                    <a href="home" class="btn primary-btn cart-btn">CONTINUE SHOPPING</a>
                                    <a href="yourorder?uid=${sessionScope.user.getUserID()}" class="btn primary-btn cart-btn cart-btn-right">
                                        BACK</a>
                                </div>
                            </div>
                            
                        </div>
                    </form>
                </div>
            </section>
        
        <%@include file="footer.jsp" %>
    </div>
    <!-- Js Plugins -->
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.nice-select.min.js"></script>
    <script src="js/jquery-ui.min.js"></script>
    <script src="js/jquery.slicknav.js"></script>
    <script src="js/mixitup.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/main.js"></script>
</body>
</html>
