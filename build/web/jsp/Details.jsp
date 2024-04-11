<%-- 
    Document   : Details
    Created on : Feb 21, 2022, 2:04:44 PM
    Author     : QUANG HUY
--%>

<%@page import="dao.RatingDAO"%>
<%@page import="models.Guitar"%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.Category"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>HuyShop | Detail</title>
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
        <style>

            @import url('https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@300&display=swap');

            .card {
                position: relative;
                display: flex;
                padding: 20px;
                flex-direction: column;
                min-width: 0;
                word-wrap: break-word;
                background-color: #fff;
                background-clip: border-box;
                border: 1px solid #d2d2dc;
                border-radius: 11px;
                -webkit-box-shadow: 0px 0px 5px 0px rgb(249, 249, 250);
                -moz-box-shadow: 0px 0px 5px 0px rgba(212, 182, 212, 1);
                box-shadow: 0px 0px 5px 0px rgb(161, 163, 164)
            }

            .media img {
                width: 60px;
                height: 60px
            }

            .reply a {
                text-decoration: none
            }
        </style>
        <%
            ArrayList<Category> cats = (ArrayList<Category>) request.getAttribute("cats");
            ArrayList<Guitar> guitar = (ArrayList<Guitar>) request.getAttribute("guitar");
            Guitar g = guitar.get(0);
            RatingDAO rateDao = (RatingDAO) request.getAttribute("rateDao");

        %>
    </head>
    <body>
        <div class="app">
            <%@include file="header.jsp" %>
            <!-- Breadcrumb Section Begin -->
            <section class="breadcrumb-section set-bg" data-setbg="https://wallpaperaccess.com/full/3022368.jpg">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12 text-center">
                            <div class="breadcrumb__text">
                                <h2 style="color: white; text-shadow: 2px 0 0 rgb(173, 55, 0), -2px 0 0 rgb(173, 55, 0), 0 2px 0 rgb(173, 55, 0), 0 -2px 0 rgb(173, 55, 0), 1px 1px rgb(173, 55, 0), -1px -1px 0 rgb(173, 55, 0), 1px -1px 0 rgb(173, 55, 0), -1px 1px 0 rgb(173, 55, 0);"><%=g.getGuitarName()%></h2>
                                <div class="breadcrumb__option">
                                    <a href="home">Home</a>
                                    <a href="home?cid=<%=g.getCategory().getCategoryID()%>"><%=g.getCategory().getCategoryName()%></a>
                                    <span><%=g.getGuitarName()%></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- Breadcrumb Section End -->

            <!-- Product Details Section Begin -->
            <section class="product-details spad">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-6 col-md-6">
                            <div class="product__details__pic">
                                <div class="product__details__pic__item">
                                    <img class="product__details__pic__item--large"
                                         src="<%=g.getGuitarImage()%>" alt="">
                                </div>
                                <div class="product__details__pic__slider owl-carousel">
                                    <img data-imgbigurl="img/product/details/product-details-2.jpg"
                                         src="img/product/details/thumb-1.jpg" alt="">
                                    <img data-imgbigurl="img/product/details/product-details-3.jpg"
                                         src="img/product/details/thumb-2.jpg" alt="">
                                    <img data-imgbigurl="img/product/details/product-details-5.jpg"
                                         src="img/product/details/thumb-3.jpg" alt="">
                                    <img data-imgbigurl="img/product/details/product-details-4.jpg"
                                         src="img/product/details/thumb-4.jpg" alt="">
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6">
                            <div class="product__details__text">
                                <h3><%=g.getGuitarName()%></h3>
                                <div class="product__details__rating">
                                    <%if (rateDao.getAverageStars(g.getGuitarID()) == 0) {%>
                                    <i class="fa-regular fa-star"></i>
                                    <i class="fa-regular fa-star"></i>
                                    <i class="fa-regular fa-star"></i>
                                    <i class="fa-regular fa-star"></i>
                                    <i class="fa-regular fa-star"></i>
                                    <%}%>
                                    <%if (rateDao.getAverageStars(g.getGuitarID()) == 1) {%>
                                    <i class="fa fa-star-half-o"></i>
                                    <i class="fa-regular fa-star"></i>
                                    <i class="fa-regular fa-star"></i>
                                    <i class="fa-regular fa-star"></i>
                                    <i class="fa-regular fa-star"></i>
                                    <%}%>
                                    <%if (rateDao.getAverageStars(g.getGuitarID()) == 2) {%>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa-regular fa-star"></i>
                                    <i class="fa-regular fa-star"></i>
                                    <i class="fa-regular fa-star"></i>
                                    <%}%>
                                    <%if (rateDao.getAverageStars(g.getGuitarID()) == 3) {%>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star-half-o"></i>
                                    <i class="fa-regular fa-star"></i>
                                    <i class="fa-regular fa-star"></i>
                                    <i class="fa-regular fa-star"></i>
                                    <%}%>
                                    <%if (rateDao.getAverageStars(g.getGuitarID()) == 4) {%>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa-regular fa-star"></i>
                                    <i class="fa-regular fa-star"></i>
                                    <i class="fa-regular fa-star"></i>
                                    <%}%>
                                    <%if (rateDao.getAverageStars(g.getGuitarID()) == 5) {%>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star-half-o"></i>
                                    <i class="fa-regular fa-star"></i>
                                    <i class="fa-regular fa-star"></i>
                                    <%}%>
                                    <%if (rateDao.getAverageStars(g.getGuitarID()) == 6) {%>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa-regular fa-star"></i>
                                    <i class="fa-regular fa-star"></i>
                                    <%}%>
                                    <%if (rateDao.getAverageStars(g.getGuitarID()) == 7) {%>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star-half-o"></i>
                                    <i class="fa-regular fa-star"></i>
                                    <%}%>
                                    <%if (rateDao.getAverageStars(g.getGuitarID()) == 8) {%>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa-regular fa-star"></i>
                                    <%}%>
                                    <%if (rateDao.getAverageStars(g.getGuitarID()) == 9) {%>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star-half-o"></i>
                                    <%}%>
                                    <%if (rateDao.getAverageStars(g.getGuitarID()) == 10) {%>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <%}%>
                                    <span>(<%=rateDao.getRatings(g.getGuitarID()).size()%> <%=(rateDao.getRatings(g.getGuitarID()).size() == 1) ? "rating" : "ratings"%>)</span>
                                </div>
                                <div class="product__details__price"><%=String.format("%.3f", g.getUnitPrice() / 1000)%>,000đ</div>
                                <p><%=g.getDescription()%></p>
                                <form action="addtocart?gid=<%=g.getGuitarID()%>&direct=detail" method="post">
                                    <div class="product__details__quantity">
                                        <div class="quantity">
                                            <div class="pro-qty">
                                                <input name="quan" type="text" value="1">
                                            </div>
                                        </div>
                                    </div>
                                    <%if (g.getUnitsInStock() > 0){%>
                                    <button style="border: none" type="submit" class="primary-btn">ADD TO CARD</button>
                                    <%} else {%>
                                    <div class="btn-outofstock">ADD TO CARD</div>
                                    <%}%>
                                    <c:if test="${sessionScope.user != null}">
                                        <a style="color: ${(isFavor!=0)?"#ff3333":""};" href="addrating?gid=<%=g.getGuitarID()%>&uid=${sessionScope.user.getUserID()}&type=heart&to=detail" class="heart-icon"><span class="icon_heart_alt"></span></a>
                                        </c:if>
                                        <c:if test="${sessionScope.user == null}">
                                        <a href="login" class="heart-icon"><span class="icon_heart_alt"></span></a>
                                        </c:if>
                                </form>
                                <ul>
                                    <li><b>Phân loại: </b> <span><%=g.getCategory().getCategoryName()%></span></li>
                                    <li><b>Thương hiệu: </b> <span><%=g.getBrand().getBrandName()%></span></li>
                                    <li><b>Trong kho: </b> <span>còn <%=g.getUnitsInStock()%> sản phẩm</span></li>

                                    <li><b>Share on</b>
                                        <div class="share">
                                            <a href="#"><i class="fa fa-facebook"></i></a>
                                            <a href="#"><i class="fa fa-twitter"></i></a>
                                            <a href="#"><i class="fa fa-instagram"></i></a>
                                            <a href="#"><i class="fa fa-pinterest"></i></a>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="product__details__tab">
                                <ul class="nav nav-tabs" role="tablist">
                                    <li class="nav-item">
                                        <a class="nav-link active" data-toggle="tab" href="#tabs-3" role="tab"
                                           aria-selected="false">Ratings</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link " data-toggle="tab" href="#tabs-1" role="tab"
                                           aria-selected="true">Comments</a>
                                    </li>
                                </ul>
                                <div class="tab-content">
                                    <div class="tab-pane" id="tabs-1" role="tabpanel" style="height: 100%;">
                                        <div class="container mb-5 mt-5" style="
                                             display: grid;
                                             place-items: center;
                                             font-family: 'Source Sans Pro', sans-serif;
                                             ">
                                            <div class="card">
                                                <div class="row">
                                                    <div class="col-md-12">

                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <c:forEach items="${cms}" var="cm">
                                                                    <div class="media" style="margin-bottom: 12px;"> <img class="mr-3 rounded-circle" alt="Bootstrap Media Preview" src="${cm.getUser().getAvatar()}" />
                                                                        <div class="media-body">
                                                                            <div class="row">
                                                                                <div class="col-8 d-flex">
                                                                                    <h5 style="min-width: fit-content; font-family: 'Source Sans Pro', sans-serif; font-weight: bold">${cm.getUser().getFullName()} </h5> <span style="font-size: 15px; min-width: fit-content"> &nbsp - ${cm.getDateCreate()}</span>
                                                                                </div>

                                                                            </div> <span style="font-size: 18px; margin-top: 20px">${cm.getComment()}</span> 

                                                                        </div>
                                                                    </div>
                                                                </c:forEach>
                                                                <c:if test="${sessionScope.user == null}">
                                                                <div class="" style="margin-top: 20px; display: flex; justify-content: center">
                                                                    <div class="bg-white p-2 add-comment">
                                                                        <a href="login" style="background-color: lightcoral" class="btn btn-outline-primary btn-sm ml-1 shadow-none">Login to comment</a>
                                                                    </div>
                                                                </div>
                                                            </c:if>
                                                            </div>
                                                            <c:if test="${sessionScope.user != null}">
                                                                <div class="col-md-12" style="margin-top: 20px">
                                                                    <form action="addcomment?gid=<%=g.getGuitarID()%>&uid=${sessionScope.user.getUserID()}" method="post" class="bg-white p-2 add-comment">
                                                                        <div>
                                                                            <span style="font-size: 20px;">Comment</span>
                                                                        </div>
                                                                        <div class="d-flex flex-row align-items-start">
                                                                            <textarea name="cmt" class="form-control ml-1 shadow-none textarea" style="font-size: 14px; color: black"></textarea></div>
                                                                        <div class="mt-2 text-right">
                                                                            <button type="submit" style=" margin-right: 8px; background-color: lightskyblue" class="post-comment btn btn-primary btn-sm shadow-none" type="button">Post comment</button>
                                                                            <a href="detail?gid=<%=g.getGuitarID()%>" style="background-color: lightskyblue" class="btn btn-outline-primary btn-sm ml-1 shadow-none" >Cancel</a></div>
                                                                    </form>
                                                                </div>
                                                            </c:if>
                                                            
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="tab-pane active" id="tabs-3" role="tabpanel">
                                        <div class="container mb-5 mt-5" style="
                                             display: grid;
                                             place-items: center;
                                             font-family: 'Source Sans Pro', sans-serif;
                                             ">
                                            <div class="card">
                                                <div class="row">
                                                    <div class="col-md-12">

                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <c:forEach items="${rs}" var="r">
                                                                    <div class="media" style=" margin-bottom: 12px; display: ${r.getIsFavor() == 0 && r.getRate() == 0 ? "none":""}"> <img class="mr-3 rounded-circle" alt="Bootstrap Media Preview" src="${r.getUser().getAvatar()}" />
                                                                        <div class="media-body">
                                                                            <div class="row">
                                                                                <div class="col-8 d-flex">
                                                                                    <h5 style="min-width: max-content; font-family: 'Source Sans Pro', sans-serif; font-weight: bold">${r.getUser().getFullName()} </h5> 
                                                                                    <span style="font-size: 15px; min-width: fit-content"> &nbsp <span class="home-product-item__like home-product-item__like--liked">
                                                                                            <c:if test="${r.getIsFavor() == 0}">
                                                                                                <i class="far fa-heart"></i>

                                                                                            </c:if>
                                                                                            <c:if test="${r.getIsFavor() == 1}">
                                                                                                <i class="home-product-item__like-icon-default far fa-heart"></i>
                                                                                                <i class="home-product-item__like-icon-fill fas fa-heart"></i>
                                                                                            </c:if>
                                                                                        </span></span>
                                                                                </div>

                                                                            </div> 
                                                                            <span style="font-size: 18px; margin-top: 20px">

                                                                                <span class="home-product-item__rating">
                                                                                    Voted: 
                                                                                    <c:if test="${r.getRate() == 0}">
                                                                                        <span style="color: red">not yet</span>
                                                                                    </c:if>
                                                                                    <c:if test="${r.getRate() == 1}">
                                                                                        <i class="home-product-item__rating-star-gold fas fa-star"></i>
                                                                                        <i class="home-product-item__rating-star fas fa-star"></i>
                                                                                        <i class="home-product-item__rating-star fas fa-star"></i>
                                                                                        <i class="home-product-item__rating-star fas fa-star"></i>
                                                                                        <i class="home-product-item__rating-star fas fa-star"></i>
                                                                                    </c:if>
                                                                                    <c:if test="${r.getRate() == 2}">
                                                                                        <i class="home-product-item__rating-star-gold fas fa-star"></i>
                                                                                        <i class="home-product-item__rating-star-gold fas fa-star"></i>
                                                                                        <i class="home-product-item__rating-star fas fa-star"></i>
                                                                                        <i class="home-product-item__rating-star fas fa-star"></i>
                                                                                        <i class="home-product-item__rating-star fas fa-star"></i>
                                                                                    </c:if>
                                                                                    <c:if test="${r.getRate() == 3}">
                                                                                        <i class="home-product-item__rating-star-gold fas fa-star"></i>
                                                                                        <i class="home-product-item__rating-star-gold fas fa-star"></i>
                                                                                        <i class="home-product-item__rating-star-gold fas fa-star"></i>
                                                                                        <i class="home-product-item__rating-star fas fa-star"></i>
                                                                                        <i class="home-product-item__rating-star fas fa-star"></i>
                                                                                    </c:if>
                                                                                    <c:if test="${r.getRate() == 4}">
                                                                                        <i class="home-product-item__rating-star-gold fas fa-star"></i>
                                                                                        <i class="home-product-item__rating-star-gold fas fa-star"></i>
                                                                                        <i class="home-product-item__rating-star-gold fas fa-star"></i>
                                                                                        <i class="home-product-item__rating-star-gold fas fa-star"></i>
                                                                                        <i class="home-product-item__rating-star fas fa-star"></i>
                                                                                    </c:if>
                                                                                    <c:if test="${r.getRate() == 5}">
                                                                                        <i class="home-product-item__rating-star-gold fas fa-star"></i>
                                                                                        <i class="home-product-item__rating-star-gold fas fa-star"></i>
                                                                                        <i class="home-product-item__rating-star-gold fas fa-star"></i>
                                                                                        <i class="home-product-item__rating-star-gold fas fa-star"></i>
                                                                                        <i class="home-product-item__rating-star-gold fas fa-star"></i>
                                                                                    </c:if>
                                                                                </span>
                                                                            </span>
                                                                        </div>
                                                                    </div>
                                                                </c:forEach>
                                                            </div>
                                                            
                                                            <style>
                                                                
                                                                /*reset css*/
                                                                label{margin:0;padding:0;}
                                                                
                                                                h1{font-size:15px;margin:10px;}
                                                                /****** Style Star Rating Widget *****/
                                                                #rating{border:none;float:left;}
                                                                #rating>input{display:none;}/*ẩn input radio - vì chúng ta đã có label là GUI*/
                                                                #rating>label:before{margin:5px;font-size:28px;font-family:FontAwesome;display:inline-block;content:"\f005";}/*1 ngôi sao*/
                                                                #rating>.half:before{content:"\f089";position:absolute;}/*0.5 ngôi sao*/
                                                                #rating>label{color:#ddd;float:right;}/*float:right để lật ngược các ngôi sao lại đúng theo thứ tự trong thực tế*/
                                                                /*thêm màu cho sao đã chọn và các ngôi sao phía trước*/
                                                                #rating>input:checked~label,
                                                                #rating:not(:checked)>label:hover, 
                                                                #rating:not(:checked)>label:hover~label{color:#FFD700;}
                                                                /* Hover vào các sao phía trước ngôi sao đã chọn*/
                                                                #rating>input:checked+label:hover,
                                                                #rating>input:checked~label:hover,
                                                                #rating>label:hover~input:checked~label,
                                                                #rating>input:checked~label:hover~label{color:#FFED85;}
                                                            </style>
                                                            <c:if test="${sessionScope.user != null}">
                                                                <div style="display: flex; justify-content: center" class="col-md-12">
                                                                    <span style="font-size: 24px">Your rate: &nbsp &nbsp</span>
                                                                </div>
                                                                <form action="addrating?gid=<%=g.getGuitarID()%>&uid=${sessionScope.user.getUserID()}&type=rate&to=detail" method="post" class="col-md-12" style="margin-top: 20px; display: flex; justify-content: center">
                                                                    
                                                                    <div id="rating">
                                                                        <input type="radio" id="star5" name="rate" value="5" />
                                                                        <label class = "full" for="star5" title="Awesome - 5 stars"></label>

                                                                        <input type="radio" id="star4" name="rate" value="4" />
                                                                        <label class = "full" for="star4" title="Pretty good - 4 stars"></label>

                                                                        <input type="radio" id="star3" name="rate" value="3" />
                                                                        <label class = "full" for="star3" title="Meh - 3 stars"></label>

                                                                        <input type="radio" id="star2" name="rate" value="2" />
                                                                        <label class = "full" for="star2" title="Kinda bad - 2 stars"></label>

                                                                        <input type="radio" id="star1" name="rate" value="1" />
                                                                        <label class = "full" for="star1" title="Sucks big time - 1 star"></label>
                                                                    </div>
                                                                    &nbsp &nbsp &nbsp
                                                                    <button style=" margin-right: 0px; align-self: center; background-color: lightskyblue" class="post-comment btn btn-primary btn-sm shadow-none" type="submit">Rate</button>
                                                                </form>
                                                            </c:if>
                                                            <c:if test="${sessionScope.user == null}">
                                                                <div class="col-md-12" style="margin-top: 20px; display: flex; justify-content: center">
                                                                    <div class="bg-white p-2 add-comment">
                                                                        <a href="login" style="background-color: lightcoral" class="btn btn-outline-primary btn-sm ml-1 shadow-none" type="button">Login to rate</a></div>
                                                                    </div>
                                                                </div>
                                                            </c:if>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- Product Details Section End -->
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
        <script>
            $(function () {
                var star = '.star',
                        selected = '.selected';

                $(star).on('click', function () {
                    $(selected).each(function () {
                        $(this).removeClass('selected');
                    });
                    $(this).addClass('selected');
                });

            });
        </script>
    </body>
</html>
