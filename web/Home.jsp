<%-- 
    Document   : Home
    Created on : Feb 20, 2022, 8:30:46 AM
    Author     : QUANG HUY
--%>

<%@page import="dao.RatingDAO"%>
<%@page import="models.Rating"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="models.Guitar"%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.Category"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Huyquanhoa | Home</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css" integrity="sha512-NhSC1YmyruXifcj/KFRWoC561YpHpc5Jtzgvbuzx5VozKpWvQ+4nXhPdFgmx8xqexRcpAglTj9sIBWINXa8x5w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="./css/main.css">
        <link rel="stylesheet" href="./css/base.css">
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
            ArrayList<Category> cats = (ArrayList<Category>) request.getAttribute("cats");
            ArrayList<Guitar> guitars = (ArrayList<Guitar>) request.getAttribute("guitars");
            int isActive;
            if(request.getAttribute("isActive") != null){
            isActive = Integer.parseInt(request.getAttribute("isActive").toString());
            } else {
                isActive = 0;
            }

            RatingDAO rDao = new RatingDAO();
//            ArrayList<Rating> ratings = (ArrayList<Rating>) request.getAttribute("ratings");
            int pageIndex = Integer.parseInt(request.getAttribute("pageIndex").toString());
            int endPage = Integer.parseInt(request.getAttribute("endPage").toString());

            User userSes = (User) session.getAttribute("user");
        %>
    </head>
    <body>
        <div class="app" style="">
            <%@include file="header.jsp" %>

            <section class="breadcrumb-section set-bg" data-setbg="./img/wp5786736.webp">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12 text-center">
                            <div class="breadcrumb__text">
                                <%if (userSession != null) {%>
                                <h2 style="font-family: monospace; color: rgb(173, 55, 0); text-shadow: 2px 0 0 #fff, -2px 0 0 #fff, 0 2px 0 #fff, 0 -2px 0 #fff, 1px 1px #fff, -1px -1px 0 #fff, 1px -1px 0 #fff, -1px 1px 0 #fff;">
                                    Hello, <%=userSession.getFullName()%>!</h2>
                                    <%} else {%>
                                <h2 style="font-family: monospace; color: rgb(173, 55, 0); text-shadow: 2px 0 0 #fff, -2px 0 0 #fff, 0 2px 0 #fff, 0 -2px 0 #fff, 1px 1px #fff, -1px -1px 0 #fff, 1px -1px 0 #fff, -1px 1px 0 #fff;">
                                    Welcome to my guitar store! </h2>
                                    <%}%>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- Product Section Begin -->
            <section class="product" style="background: linear-gradient(#f7f2cd, white);">

            </section>
            <section class="product spad">
                <div class="container">
                    <div class="row">

                        <div class="col-lg-3 col-md-5">
                            <div class="sidebar">
                                <div class="sidebar__item">
                                    <h4>
                                        Danh mục</h4>
                                    <ul class="category__list">
                                        <li class="category-item">
                                            <a href ="home" class="category-item__link">All</a>
                                        </li>
                                        <%for (Category c : cats) {%>
                                        <li class="category-item">
                                            <a style="<%=(isActive == c.getCategoryID())?"color: darkorange;":""%>" href ="home?cid=<%=c.getCategoryID()%>" class="category-item__link"><%=c.getCategoryName()%></a>
                                        </li>
                                        <%}%>
                                    </ul>
                                </div>

                                <div class="sidebar__item">
                                    <h4>Giá</h4>
                                    <form action="pricefilter" method="post" class="price-range-wrap" style="width: 80%">
                                        <div class="price-range ui-slider ui-corner-all ui-slider-horizontal ui-widget ui-widget-content"
                                             data-min="0" data-max="35">
                                            <div class="ui-slider-range ui-corner-all ui-widget-header"></div>
                                            <span tabindex="0" class="ui-slider-handle ui-corner-all ui-state-default"></span>
                                            <span tabindex="0" class="ui-slider-handle ui-corner-all ui-state-default"></span>
                                        </div>
                                        <div class="range-slider">
                                            <div class="price-input">
                                                <input type="text" name="minprice" value="${minp}" id="minamount">
                                                <input type="text" name="maxprice" value="${maxp}" id="maxamount">
                                            </div>
                                        </div>
                                        <div class="mt-2" style="padding: 10px 20% 36px 20%;">
                                            <button type="submit" style="background-color: #ff6666;" class="post-comment btn btn-primary btn-sm shadow-none" type="button">Lọc giá</button>
                                        </div>
                                    </form>

                                    <div class="sidebar__item sidebar__item__color--option">
                                        <h4>Thương hiệu</h4>
                                        <div class="sidebar__item__color sidebar__item__color--white">
                                            <label for="taylor">
                                                Taylor
                                                <input type="radio" id="white">
                                            </label>
                                        </div>
                                        <div class="sidebar__item__color sidebar__item__color--gray">
                                            <label for="fender">
                                                Fender
                                                <input type="radio" id="gray">
                                            </label>
                                        </div>
                                        <div class="sidebar__item__color sidebar__item__color--red">
                                            <label for="suzuki">
                                                Suzuki
                                                <input type="radio" id="red">
                                            </label>
                                        </div>
                                        <div class="sidebar__item__color sidebar__item__color--black">
                                            <label for="takamine">
                                                Takamine
                                                <input type="radio" id="black">
                                            </label>
                                        </div>
                                        <div class="sidebar__item__color sidebar__item__color--blue">
                                            <label for="lazer">
                                                Lazer
                                                <input type="radio" id="blue">
                                            </label>
                                        </div>
                                        <div class="sidebar__item__color sidebar__item__color--green">
                                            <label for="kapok">
                                                Kapok
                                                <input type="radio" id="green">
                                            </label>
                                        </div>
                                    </div>
                                    <div class="sidebar__item">
                                        <h4>Tìm kiếm theo</h4>
                                        <a href="search?search=classic" class="sidebar__item__size">
                                            <label for="classic">
                                                classic
                                                <input type="radio" id="large" name="classic">
                                            </label>
                                        </a>
                                        <a href="search?search=cổ+điển"  class="sidebar__item__size">
                                            <label for="taylor">
                                                cổ điển
                                                <input type="radio" id="medium" name="taylor">
                                            </label>
                                        </a>
                                        <a href="search?search=hiện+đại"  class="sidebar__item__size">
                                            <label for="acoustic">
                                                hiện đại
                                                <input type="radio" id="small" name="acoustic">
                                            </label>
                                        </a>
                                        <a href="search?search=âm+thanh+tốt" class="sidebar__item__size">
                                            <label for="fender">
                                                âm thanh tốt
                                                <input type="radio" id="tiny" name="fender">
                                            </label>
                                        </a>
                                    </div>
                                    <div class="sidebar__item">
                                        <div class="latest-product__text">
                                            <h4>Latest Products</h4>
                                            <div class="latest-product__slider owl-carousel">
                                                <c:forEach items="${lastguitars}" var="lg">
                                                    <div class="latest-prdouct__slider__item">
                                                        <a href="detail?gid=${lg.getGuitarID()}" class="latest-product__item">
                                                            <div class="latest-product__item__pic">
                                                                <img src="${lg.getGuitarImage()}" alt="">
                                                            </div>
                                                            <div class="latest-product__item__text">
                                                                <h6>${lg.getGuitarName()}</h6>
                                                                <span>${lg.getBrand().getBrandName()}</span>
                                                            </div>
                                                        </a>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--                                    <div class="col-lg-1">
                                                                
                                                            </div>-->
                        <div class="col-lg-9 col-md-7">

                            <div class="filter__item">
                                <div class="row">
                                    <div class="col-lg-4 col-md-5">
                                        <form action="sort" method="post" class="filter__sort">
                                            <span>Sắp xếp </span>
                                            <select name="sort" onchange="this.form.submit()">
                                                <option value="default" selected>Mặc định</option>
                                                <option value="up" ${(price.equals("up")) ? "selected":""}>Giá tăng dần</option>
                                                <option value="down" ${(price.equals("down"))? "selected":""}>Giá giảm dần</option>
                                            </select>
                                        </form>
                                    </div>
                                    <div class="col-lg-6 col-md-4">

                                    </div>
                                    <div class="col-lg-2 col-md-3">
                                        <div class="filter__option">
                                            <span class="icon_grid-2x2"></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <%for (Guitar g : guitars) {%>
                                <div class="col-lg-4 col-md-6 col-sm-6">
                                    <div class="product__item" style="background-color: #f8fbf9; border-radius: 5px">
                                        <div class="product__item__pic set-bg" style="border-top-left-radius: 5px; border-top-right-radius: 5px" data-setbg="<%=g.getGuitarImage()%>">
                                            <ul class="product__item__pic__hover">
                                                <%if (userSes != null) {%>
                                                <li><a href="addrating?gid=<%=g.getGuitarID()%>&uid=<%=userSes.getUserID()%>&type=heart&to=home"><i class="fa fa-heart"></i></a></li>
                                                <%} else {%>
                                                <li><a href="login"><i class="fa fa-heart"></i></a></li>
                                                
                                                <%}%>
                                                <li><a href="detail?gid=<%=g.getGuitarID()%>"><i class="fa fa-arrow-up"></i></a></li>
                                                <li style="display: <%=g.getUnitsInStock() > 0 ? "" : "none"%>"><a href="addtocart?gid=<%=g.getGuitarID()%>&quan=1"><i class="fa fa-shopping-cart"></i></a></li>
                                            </ul>
                                        </div>
                                        <div class="product__item__text">
                                            <a href="detail?gid=<%=g.getGuitarID()%>">
                                                <h6 style="font-weight: bold"><%=g.getGuitarName()%></h6>
                                                <h4 class="home-product-item__name" style="padding: 0 8px; color: black"><%=g.getDescription()%></h4>
                                                <h5 style="padding: 12px; color: rgb(173, 55, 0); padding: 12px; font-size: 16px; font-weight: 600"><%=String.format("%.3f", g.getUnitPrice() / 1000)%>,000đ</h5>
                                            </a>


                                            <div class="home-product-item__react" style="padding: 0 12px; font-size: 12px">
                                                <span class="home-product-item__like home-product-item__like--liked">
                                                    <%if (userSes == null) {%>
                                                        <i class="far fa-heart"></i>
                                                    <%}else{%>
                                                        
                                                    <i class="<%=rDao.getIsFavor(g.getGuitarID(), userSes.getUserID())==1?"home-product-item__like-icon-fill fas fa-heart":"far fa-heart"%>"></i>
                                                        
                                                    <%}%>
                                                </span>
                                                <div class="home-product-item__rating">
                                                    <%if (rDao.getAverageStars(g.getGuitarID()) == 0) {%>
                                                    <i class="fa-regular fa-star"></i>
                                                    <i class="fa-regular fa-star"></i>
                                                    <i class="fa-regular fa-star"></i>
                                                    <i class="fa-regular fa-star"></i>
                                                    <i class="fa-regular fa-star"></i>
                                                    <%}%>
                                                    <%if (rDao.getAverageStars(g.getGuitarID()) == 1) {%>
                                                    <i class="home-product-item__rating-star-gold fa fa-star-half-o"></i>
                                                    <i class="fa-regular fa-star"></i>
                                                    <i class="fa-regular fa-star"></i>
                                                    <i class="fa-regular fa-star"></i>
                                                    <i class="fa-regular fa-star"></i>
                                                    <%}%>
                                                    <%if (rDao.getAverageStars(g.getGuitarID()) == 2) {%>
                                                    <i class="home-product-item__rating-star-gold fa fa-star"></i>
                                                    <i class="home-product-item__rating-star-gold fa fa-star"></i>
                                                    <i class="fa-regular fa-star"></i>
                                                    <i class="fa-regular fa-star"></i>
                                                    <i class="fa-regular fa-star"></i>
                                                    <%}%>
                                                    <%if (rDao.getAverageStars(g.getGuitarID()) == 3) {%>
                                                    <i class="home-product-item__rating-star-gold fa fa-star"></i>
                                                    <i class="home-product-item__rating-star-gold fa fa-star-half-o"></i>
                                                    <i class="fa-regular fa-star"></i>
                                                    <i class="fa-regular fa-star"></i>
                                                    <i class="fa-regular fa-star"></i>
                                                    <%}%>
                                                    <%if (rDao.getAverageStars(g.getGuitarID()) == 4) {%>
                                                    <i class="home-product-item__rating-star-gold fa fa-star"></i>
                                                    <i class="home-product-item__rating-star-gold fa fa-star"></i>
                                                    <i class="fa-regular fa-star"></i>
                                                    <i class="fa-regular fa-star"></i>
                                                    <i class="fa-regular fa-star"></i>
                                                    <%}%>
                                                    <%if (rDao.getAverageStars(g.getGuitarID()) == 5) {%>
                                                    <i class="home-product-item__rating-star-gold fa fa-star"></i>
                                                    <i class="home-product-item__rating-star-gold fa fa-star"></i>
                                                    <i class="home-product-item__rating-star-gold fa fa-star-half-o"></i>
                                                    <i class="fa-regular fa-star"></i>
                                                    <i class="fa-regular fa-star"></i>
                                                    <%}%>
                                                    <%if (rDao.getAverageStars(g.getGuitarID()) == 6) {%>
                                                    <i class="home-product-item__rating-star-gold fa fa-star"></i>
                                                    <i class="home-product-item__rating-star-gold fa fa-star"></i>
                                                    <i class="home-product-item__rating-star-gold fa fa-star"></i>
                                                    <i class="fa-regular fa-star"></i>
                                                    <i class="fa-regular fa-star"></i>
                                                    <%}%>
                                                    <%if (rDao.getAverageStars(g.getGuitarID()) == 7) {%>
                                                    <i class="home-product-item__rating-star-gold fa fa-star"></i>
                                                    <i class="home-product-item__rating-star-gold fa fa-star"></i>
                                                    <i class="home-product-item__rating-star-gold fa fa-star"></i>
                                                    <i class="home-product-item__rating-star-gold fa fa-star-half-o"></i>
                                                    <i class="fa-regular fa-star"></i>
                                                    <%}%>
                                                    <%if (rDao.getAverageStars(g.getGuitarID()) == 8) {%>
                                                    <i class="home-product-item__rating-star-gold fa fa-star"></i>
                                                    <i class="home-product-item__rating-star-gold fa fa-star"></i>
                                                    <i class="home-product-item__rating-star-gold fa fa-star"></i>
                                                    <i class="home-product-item__rating-star-gold fa fa-star"></i>
                                                    <i class="fa-regular fa-star"></i>
                                                    <%}%>
                                                    <%if (rDao.getAverageStars(g.getGuitarID()) == 9) {%>
                                                    <i class="home-product-item__rating-star-gold fa fa-star"></i>
                                                    <i class="home-product-item__rating-star-gold fa fa-star"></i>
                                                    <i class="home-product-item__rating-star-gold fa fa-star"></i>
                                                    <i class="home-product-item__rating-star-gold fa fa-star"></i>
                                                    <i class="home-product-item__rating-star-gold fa fa-star-half-o"></i>
                                                    <%}%>
                                                    <%if (rDao.getAverageStars(g.getGuitarID()) == 10) {%>
                                                    <i class="home-product-item__rating-star-gold fa fa-star"></i>
                                                    <i class="home-product-item__rating-star-gold fa fa-star"></i>
                                                    <i class="home-product-item__rating-star-gold fa fa-star"></i>
                                                    <i class="home-product-item__rating-star-gold fa fa-star"></i>
                                                    <i class="home-product-item__rating-star-gold fa fa-star"></i>
                                                    <%}%>
                                                </div>

                                            </div>
                                            <div class="home-product-item__origin" style="padding: 10px 12px; font-size: 12px">
                                                <div class="home-product-item__brand"><%=g.getCategory().getCategoryName()%></div>
                                                <div class="home-product-item__original-country"><%=(g.getUnitsInStock()>1)?"Còn " + g.getUnitsInStock():"Hết hàng"%></div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                                <%}%>
                            </div>
                            <div class="grid" style="display: ${isHidden}">
                                <!-- Pagination -->
                                <div class="product__pagination pagination">
                                        <%for (int i = 1; i <= endPage; i++) {%>
                                    <a href="home?page=<%=i%>" <%=(pageIndex == i) ? "class=\"product__pagination-active\"" : ""%>"><%=i%></a>
                                    <%}%>

                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </section>
            <!-- Product Section End -->


            <%@include file="footer.jsp" %>
        </div>
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
