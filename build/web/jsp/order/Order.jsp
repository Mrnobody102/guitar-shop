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
        <title>ShopHuy | Order</title>
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

        <%
            ArrayList<Cart> carts = (ArrayList<Cart>) session.getAttribute("cart");
            float totalF = 0;
            for (Cart c : carts) {
                totalF += c.getGuitar().getUnitPrice() * c.getQuantity();
            }
            String totalS = totalF + "";
            String total = totalS.substring(0, totalS.length() - 5) + "." + totalS.substring(totalS.length() - 5, totalS.length() - 2);
        %>
    </head>
    <body>
        <div class="app">
            <%@include file="header.jsp" %>

            <section class="breadcrumb-section set-bg" data-setbg="https://hdwallpaperim.com/wp-content/uploads/2017/08/22/98804-Vocaloid-music-Megurine_Luka-anime_girls-guitar.jpg">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12 text-center">
                            <div class="breadcrumb__text">
                                <h2 style="color: white; text-shadow: 2px 0 0 rgb(173, 55, 0), -2px 0 0 rgb(173, 55, 0), 0 2px 0 rgb(173, 55, 0), 0 -2px 0 rgb(173, 55, 0), 1px 1px rgb(173, 55, 0), -1px -1px 0 rgb(173, 55, 0), 1px -1px 0 rgb(173, 55, 0), -1px 1px 0 rgb(173, 55, 0);">Order</h2>
                                <div class="breadcrumb__option">
                                    <a href="home">Home</a>
                                    <span>Order</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <section class="checkout spad">
                <div class="container">
                    <div class="checkout__form">
                        <h4>Billing Details</h4>
                        <form action="addorder?uid=${sessionScope.user.getUserID()}" method="post">
                            <div class="row">
                                <div class="col-lg-8 col-md-6">
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <div class="checkout__input">
                                                <p>Full Name<span>*</span></p>
                                                <input required type="text" name="name" value="${sessionScope.user.getFullName()}">
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <div class="checkout__input">
                                                <p>Phone<span>*</span></p>
                                                <input required type="text" name="phone" value="${sessionScope.user.getUserPhone()}">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="checkout__input col-lg-6">
                                            <p>Shipp Address<span>*</span></p>
                                            <input required type="text" name="address" value="${sessionScope.user.getAddress()}">
                                        </div>
                                        <div class="form-group col-lg-6">
                                            <div class="checkout__input">
                                                <p>Require Date<span>*</span></p>
                                                <input id="requiredate" onchange="TDate()" required type="date" name="rdate">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-8 col-md-6">
                                            <div class="checkout__input">
                                                <p>Shipper<span>*</span></p>
                                                <select name="shipper" >

                                                    <option value="1">Express</option>
                                                    <option value="2">FPT Deliver</option>
                                                    <option value="3" selected>Giao hàng nhanh</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6">
                                    <div class="checkout__order">
                                        <h4>Your Order</h4>
                                        <div class="checkout__order__products">Products <span>Total</span></div>
                                        <ul>
                                            <c:forEach items="${sessionScope.cart}" var="c">
                                                <li>${c.getGuitar().getGuitarName()} <span> ${c.getSumPriceString()}</span></li>
                                                </c:forEach>
                                        </ul>

                                        <div class="checkout__order__total">Total <span><%=total%>.000đ</span></div>
                                        <button type="submit" class="site-btn">PLACE ORDER</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </section>
            <!-- Checkout Section End -->

            <%@include file="footer.jsp" %>
        </div>
        <!-- Js Plugins -->
        <script>

            function TDate() {
                var RDate = document.getElementById("requiredate").value;
                var ToDate = new Date();
                if (new Date(RDate).getTime() <= ToDate.getTime()) {
                    alert("The Require date must be BIGGER or EQUAL to now");
                    document.getElementById("requiredate").value = null;
                    return false;
                }
                return true;
            }
        </script>
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
