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
        <title>HuyShop | Shopping cart</title>
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
            <!-- Breadcrumb Section Begin -->
            <c:if test="${sessionScope.cart != null && sessionScope.cart.size() >= 1}">
                <section class="breadcrumb-section set-bg" data-setbg="http://guitarfc.com/wp-content/uploads/2015/07/guitarfc.com_Guitar-Bg-4.jpg">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12 text-center">
                                <div class="breadcrumb__text">
                                    <h2 style="color: white; text-shadow: 2px 0 0 rgb(173, 55, 0), -2px 0 0 rgb(173, 55, 0), 0 2px 0 rgb(173, 55, 0), 0 -2px 0 rgb(173, 55, 0), 1px 1px rgb(173, 55, 0), -1px -1px 0 rgb(173, 55, 0), 1px -1px 0 rgb(173, 55, 0), -1px 1px 0 rgb(173, 55, 0);">Shopping cart</h2>
                                    <div class="breadcrumb__option">
                                        <a href="home">Home</a>
                                        <span>Shopping cart</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- Breadcrumb Section End -->

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
                                                    <th>Image</th>
                                                    <th>Name</th>
                                                    <th>Price</th>
                                                    <th>Quantity</th>
                                                    <th>Total</th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${sessionScope.cart}" var="c">
                                                    <tr>
                                                        <td class="shoping__cart__item" style="text-align: center">
                                                            <img src="${c.getGuitar().getGuitarImage()}" alt="">
                                                        </td>
                                                        <td><h5>${c.getGuitar().getGuitarName()}</h5></td>
                                                        <td class="shoping__cart__price">
                                                            ${c.getGuitar().getUnitPriceString()}.000đ
                                                        </td>
                                                        <td class="shoping__cart__quantity">
                                                            <div class="quantity">
                                                                <div class="pro-qty">
                                                                    <input readonly name="${c.getGuitar().getGuitarID()}" type="text" value="${c.getQuantity()}">
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td class="shoping__cart__total">
                                                            ${c.getSumPriceString()}
                                                        </td>
                                                        <td class="shoping__cart__item__close">
                                                            <a href="deletetempcart?gid=${c.getGuitar().getGuitarID()}"><span class="icon_close"></span></a>
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
                                        <a href="deleteallcart" class="btn primary-btn cart-btn">DELETE ALL</a>
                                        <button type="submit" class="btn primary-btn cart-btn cart-btn-right"><span class="icon_loading"></span>
                                            Upadate Cart</button>
                                    </div>
                                </div>
                                <div class="col-3"></div>
                                <div class="col-6">
                                    <div class="shoping__checkout">
                                        <h5>Cart Total</h5>
                                        <ul>
                                            <%
                                                ArrayList<Cart> carts = (ArrayList<Cart>) session.getAttribute("cart");
                                                String total = "";
                                                float totalF = 0;
                                                for (Cart c : carts) {
                                                    totalF += c.getGuitar().getUnitPrice() * c.getQuantity();
                                                }
                                                String totalS = totalF + "";
                                                total = totalS.substring(0, totalS.length() - 5) + "." + totalS.substring(totalS.length() - 5, totalS.length() - 2);
                                            %>
                                            <li>Total <span><%=total%>.000đ</span></li>
                                        </ul>
                                        <c:if test="${sessionScope.user == null}">
                                            <div style="display: block; text-align: center">
                                                <p style="color: red">You have not been logged!</p>
                                                <a href="login?action=order" class="primary-btn">LOGIN</a>
                                            </div>
                                        </c:if>
                                        <c:if test="${sessionScope.user != null}">
                                            <%
                                                for (Cart c : carts) {
                                                    if (c.getGuitar().getUnitsInStock() < c.getQuantity() || c.getQuantity() <= 0){
                                                        session.setAttribute("isValidQuantity", false);
                                                        break;
                                                    } else {
                                                        session.setAttribute("isValidQuantity", true);
                                                    }
                                                }
                                            %>
                                            <c:if test="${sessionScope.isValidQuantity == false}">
                                                <div style="display: block; text-align: center">
                                                <p style="color: red">Quantity is out of stock or invalid!</p>
                                                </div>
                                            </c:if>
                                            <c:if test="${sessionScope.isValidQuantity != false}">
                                                <a href="order" class="primary-btn">PROCEED TO CHECKOUT</a>
                                            </c:if>
                                        </c:if>
                                    </div>
                                </div>
                                <div class="col-3"></div>
                            </div>
                        </form>
                    </div>
                </section>
            </c:if>
            <c:if test="${sessionScope.cart == null || sessionScope.cart.size() < 1}">
                <div style="display: flex; justify-content: center; padding-top: 30px">
                    <img style="width: 36%" src="https://jersix.com/wp-content/uploads/2020/10/Empty-pana-uai-2000x1500.png">

                </div>
                <div style="display: flex; justify-content: center; padding: 30px">
                    <a href="home" class="btn primary-btn cart-btn">SHOPPING</a>
                </div>
            </c:if>
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
