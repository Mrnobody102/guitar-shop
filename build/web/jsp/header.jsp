<%-- 
    Document   : header
    Created on : Feb 21, 2022, 2:09:55 PM
    Author     : QUANG HUY
--%>

<%@page import="models.Notis"%>
<%@page import="dao.NotiDAO"%>
<%@page import="models.Cart"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="models.Guitar"%>
<%@page import="models.OrderDetail"%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8"> <!-- Bộ ký tự sử dụng: UTF8 -->
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css" integrity="sha512-NhSC1YmyruXifcj/KFRWoC561YpHpc5Jtzgvbuzx5VozKpWvQ+4nXhPdFgmx8xqexRcpAglTj9sIBWINXa8x5w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="./css/main.css">
        <link rel="stylesheet" href="./css/base.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link rel="stylesheet" href="./assets/fonts/fontawesome-free-5.15.4-web/css/all.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500;700&display=swap" rel="stylesheet">

        <%
            User userSession = (User) session.getAttribute("user");
            ArrayList<Notis> ns;
        %>
    </head>

    <body>
        <header class="header">
            <div class="grid">      
                <%if (userSession != null) {%>
                <%if (userSession.getIsAdmin() == 1) {%>
                <!-- Admin -->
                <nav class="header__navbar">
                    <ul class="header__navbar-list">

                        <li class="header__navbar-item">
                            <a href="jsp" class="unlink-white">
                                Administrator's manager
                            </a>
                        </li>
                    </ul>
                    <ul>
                        <li class="header__navbar-item header__navbar-user header__navbar-user-appearance">
                            <div class="header__navbar-user-wrap">
                                <img src="<%=userSession.getAvatar()%>" alt="" class="header__navbar-user-img">
                                <span class="header__navbar-user-name"><%=userSession.getUserName()%></span>
                            </div>
                            <ul class="header__navbar-user-option-list header__bridge">
                                <li class="header__navbar-user-option-item"><a href="user?uid=<%=userSession.getUserID()%>" style="text-decoration: none; color: black">My account</a></li>
                                <li class="header__navbar-user-option-item"><a href="jsp" style="text-decoration: none; color: black">Manager</a></li>

                                <li class="header__navbar-user-option-item">
                                    <a href="logout" style="text-decoration: none; color: black">Log out</a>
                                </li>

                            </ul>   
                        </li>

                    </ul>
                </nav>

                <%} else if (userSession.getIsSeller() == 1) {%>

                <!-- Sellers -->
                <nav class="header__navbar">
                    <ul class="header__navbar-list">
                        <li class="header__navbar-item">
                            <a href="seller" class="unlink-white">
                                Seller's manager
                            </a>
                        </li>


                    </ul>

                    <ul class="header__navbar-list">
                        

                        <li class="header__navbar-item header__navbar-user header__navbar-user-appearance">
                            <div class="header__navbar-user-wrap">
                                <img src="<%=userSession.getAvatar()%>" alt="" class="header__navbar-user-img">
                                <span class="header__navbar-user-name"><%=userSession.getUserName()%></span>
                            </div>
                            <ul class="header__navbar-user-option-list header__bridge">
                                <li class="header__navbar-user-option-item"><a href="user?uid=<%=userSession.getUserID()%>" style="text-decoration: none; color: black">My account</a></li>
                                <li class="header__navbar-user-option-item"><a href="seller" style="text-decoration: none; color: black">Manager</a></li>
                                <li class="header__navbar-user-option-item">
                                    <a href="logout" style="text-decoration: none; color: black">Log out</a>
                                </li>

                            </ul>   
                        </li>
                    </ul>
                </nav>
                <%} else {%>
                <!-- Users -->
                <nav class="header__navbar">
                    <ul class="header__navbar-list">
                        <li class="header__navbar-item">
                            Follow us on
                            <a href="" class="header__navbar-icon-link">
                                <i class="header__navbar-icon fab fa-facebook"></i>
                            </a>
                            <a href="" class="header__navbar-icon-link">
                                <i class="header__navbar-icon fab fa-instagram"></i>
                            </a>
                        </li>
                        <li class="header__navbar-item">
                            <a href="chat" class="header__navbar-item-link">
                                <i class="header__navbar-icon far fa-question-circle"></i>
                                Help</a>
                        </li>
                    </ul>

                    <ul class="header__navbar-list">
                        <li class="header__navbar-item header__notify-appearance">
                            <a href="" class="header__navbar-item-link">
                                <i class="header__navbar-icon fas fa-bell"></i>
                                Nofications
                            </a>
                            <!--Notifications Header-->
                            <div class="header__notify header__bridge">
                                <header class="header__notify-header">
                                    <h3>Received Notifications</h3>
                                </header>
                                <ul class="header__notify-list">
                                    <%
                                        if (userSession != null) {
                                            NotiDAO nDao = new NotiDAO();
                                            ns = nDao.getNotisByUserID(userSession.getUserID());
                                            for (Notis n : ns) {%>
                                    <li class="header__notify-item header__notify-item--seen">
                                        <a href="" class="header__notify-link">
                                            <img src="http://www.drivingschoolexperts.com/wp-content/themes/reliqus-drivingschoolexpert/images/payment-successful.png" alt="" class="header__notify-img">
                                            <div class="header__notify-info">
                                                <span class="header__notify-name">Đơn hàng <%=n.getOrder().getOrder()%> của bạn đã đặt thành công, dự kiến sẽ được giao vào ngày <%=n.getOrder().getEstimatedDay()%>!</span>
                                                <span class="header__notify-describtion"><%=n.getNotiTime() + " " + n.getOnlyNotiDate()%></span>
                                            </div>
                                        </a>
                                    </li>
                                    <%}
                                        }%>
                                </ul>
                            </div>
                        </li>

                        <li class="header__navbar-item header__navbar-user header__navbar-user-appearance">
                            <div class="header__navbar-user-wrap">
                                <img src="<%=userSession.getAvatar()%>" alt="" class="header__navbar-user-img">
                                <span class="header__navbar-user-name"><%=userSession.getUserName()%></span>
                            </div>
                            <ul class="header__navbar-user-option-list header__bridge">
                                <li class="header__navbar-user-option-item"><a href="user?uid=<%=userSession.getUserID()%>" style="text-decoration: none; color: black">My account</a></li>
                                <li class="header__navbar-user-option-item"><a href="yourorder?uid=<%=userSession.getUserID()%>" style="text-decoration: none; color: black">My orders</a></li>
                                <li class="header__navbar-user-option-item">
                                    <a href="logout" style="text-decoration: none; color: black">Log out</a>
                                </li>

                            </ul>   
                        </li>
                    </ul>
                </nav>
                <%}%>
                <%} else {%>

                <!-- Guest -->
                <nav class="header__navbar">
                    <ul class="header__navbar-list">
                        <li class="header__navbar-item">
                            Follow us on
                            <a href="" class="header__navbar-icon-link">
                                <i class="header__navbar-icon fab fa-facebook"></i>
                            </a>
                            <a href="" class="header__navbar-icon-link">
                                <i class="header__navbar-icon fab fa-instagram"></i>
                            </a>
                        </li>
                        <li class="header__navbar-item">
                            <a href="chat" class="header__navbar-item-link">
                                <i class="header__navbar-icon far fa-question-circle"></i>
                                Help</a>
                        </li>
                    </ul>

                    <ul class="header__navbar-list">
                        <li class="header__navbar-item header__notify-appearance">

                            <!--Notifications Header-->
                            <div class="header__notify header__bridge">
                                <header class="header__notify-header">
                                    <h3>Received Notifications</h3>
                                </header>
                                <ul class="header__notify-list">
                                    <li class="header__notify-item header__notify-item--seen">
                                        <a href="" class="header__notify-link">
                                            <img src="https://cf.shopee.vn/file/7505b988fc719cf4d2f5766cffdd7c5a_tn" alt="" class="header__notify-img">
                                            <div class="header__notify-info">
                                                <span class="header__notify-name">FPT ra mắt sản phẩm son mới, có tác dụng đột phá, dự kiến vào ngày 10/5</span>
                                                <span class="header__notify-describtion">FPT sẽ ra mắt loại son HL15 vào mùa hè 2021, đặt hàng ngay!</span>
                                            </div>
                                        </a>
                                    </li>

                                </ul>
                            </div>
                        </li>
                        <li class="header__navbar-item header__navbar-item--strong header__navbar-item--separate">
                            <a href="login?action=home" class="header__navbar-item">Login</a>
                        </li>
                        <li class="header__navbar-item header__navbar-item--strong header__navbar-item--separate">
                            <a href="signup" class="header__navbar-item">Sign up</a></li> 
                    </ul>
                </nav>
                <%}%>


                <!-- Header with search  -->
                <div class="header-with-search">
                    <a href="home" class="header__logo-link">
                        <div class="header__logo">
                            <img src="https://www.seekpng.com/png/full/126-1262278_this-free-icons-png-design-of-white-electric.png" class="header__logo-img">
                        </div>
                    </a>

                    <!-- Header-search -->
                    <form action="search" method="get" class="header__search">
                        <!-- Input  -->
                        <div class="header__search-input-wrap">
                            <input type="text" name="search" value="${key}" class="header__search-input" placeholder="Nhập để tìm kiếm">

                            <!-- Header-search-history -->

                            <!--                                <div class="header__search-history">
                                                                <h3 class="header__search-history-heading">Lịch sử tìm kiếm</h3>
                                                                <ul class="header__search-history-list">
                                                                    <li class="header__search-history-item">
                                                                        <a href="">Điện thoại Bphone</a>
                                                                    </li>
                                                                    <li class="header__search-history-item">
                                                                        <a href="">Hến Quảng Nam</a>
                                                                    </li>
                                                                    <li class="header__search-history-item">
                                                                        <a href="">Tai nghe Sony</a>
                                                                    </li>
                                                                </ul>
                                                            </div>-->

                        </div>

                        <!-- Select-find-scope -->
                        <div class="header__search-select"  style="min-width: 130px">
                            <span class="header__search-select-label">Trong shop</span>
                            <i class="header__search-select-icon fas fa-angle-down"></i>
                            <ul class="header__search-option">
                                <li class="header__search-option-item header__search-option-item--active">
                                    <span class="">Trong shop</span>
                                    <i class="fas fa-check"></i>
                                </li>
                                <li class="header__search-option-item">
                                    <span class="">Ngoài shop</span>
                                    <i class="fas fa-check"></i>
                                </li>
                            </ul>
                        </div>
                        <button class="header__search-btn" type="submit">
                            <i class="header__search-btn-icon fas fa-search"></i>
                        </button>
                    </form>

                    <!-- Cart-layout -->
                    <div class="header__cart">
                        <div class="header__cart-icon-wrap">
                            <a href="viewcart">
                                <i class="header__cart-icon fas fa-shopping-cart"></i>
                            </a>
                            <span class="header__cart-notice" style="display: ${(sessionScope.cart.size()!=null && sessionScope.cart.size() > 0)?"block" : "none"}">${sessionScope.cart.size()}</span>
                            <!-- No cart: header__cart-list--no-cart -->
                            <div class="header__cart-list ">
                                <c:if test="${sessionScope.cart == null || sessionScope.cart.size() < 1}">
                                    <img style="width: 100%" src="https://www.vhv.rs/dpng/d/521-5212497_empty-cart-hd-png-download.png" alt="" class="header__cart-no-cart-img">
                                </c:if>
                                <c:if test="${sessionScope.cart != null && sessionScope.cart.size() >= 1}">
                                    <span class="header__cart-no-cart-msg">Chưa có sản phẩm</span>
                                    <!-- Cart items -->
                                    <h3 class="header__cart-heading">Sản phẩm đã thêm</h3>
                                    <ul class="header__cart-list-item">
                                        <c:forEach items="${sessionScope.cart}" var="c">
                                            <li class="header__cart-item" style="display: flex;">
                                                <img class="header__cart-item-img" src="${c.getGuitar().getGuitarImage()}" alt="">
                                                <div class="header__cart-item-info">
                                                    <div class="header__cart-item-head">
                                                        <h5 class="header__cart-item-name">${c.getGuitar().getGuitarName()}</h5>
                                                        <div class="header__cart-item-multi-price">
                                                            <span class="header__cart-item-price">${c.getGuitar().getUnitPriceString()}.000đ</span>
                                                            <span class="header__cart-item-multiply"> x </span>

                                                            <span class="header__cart-item-quantity">${c.getQuantity()}</span>
                                                        </div>                                            </div>
                                                    <div class="header__cart-item-body">
                                                        <span class="header__cart-item-description">Phân loại: ${c.getGuitar().getBrand().getBrandName()}</span>  
                                                        <a href="addtocart?gid=${c.getGuitar().getGuitarID()}&quan=-1" class="header__cart-item-remove" style="color: gray">
                                                            Xóa
                                                        </a>                                          
                                                    </div>
                                                </div>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                    <a href="viewcart" class="btn btn--primary header__cart-item-btn">Xem giỏ hàng</a>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>
    </body>
</html>
