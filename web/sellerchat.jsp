<%-- 
    Document   : sellerchat
    Created on : Mar 18, 2022, 7:40:23 AM
    Author     : QUANG HUY
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Seller's messages</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,700">
        <!-- https://fonts.google.com/specimen/Roboto -->
        <link rel="stylesheet" href="css/fontawesome.min.css">
        <!-- https://fontawesome.com/ -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <!-- https://getbootstrap.com/ -->
        <link rel="stylesheet" href="css/templatemo-style.css">
        <style>
            body,html{
                background-color: #567086;
            }

            .chat{
                margin-top: auto;
                margin-bottom: auto;
            }
            .card{
                height: 500px;
                border-radius: 15px !important;
                background-color: rgba(0,0,0,0.4) !important;
            }
            .contacts_body{
                padding:  0.75rem 0 !important;
                overflow-y: auto;
                white-space: nowrap;
            }
            .msg_card_body{
                overflow-y: auto;
            }
            .card-header{
                border-radius: 15px 15px 0 0 !important;
                border-bottom: 0 !important;
            }
            .card-footer{
                border-radius: 0 0 15px 15px !important;
                border-top: 0 !important;
            }
            .container{
                align-content: center;
            }
            .search{
                border-radius: 15px 0 0 15px !important;
                background-color: rgba(0,0,0,0.3) !important;
                border:0 !important;
                color:white !important;
            }
            .search:focus{
                box-shadow:none !important;
                outline:0px !important;
            }
            .type_msg{
                background-color: rgba(0,0,0,0.3) !important;
                border:0 !important;
                color:white !important;
                height: 60px !important;
                overflow-y: auto;
            }
            .type_msg:focus{
                box-shadow:none !important;
                outline:0px !important;
            }
            .attach_btn{
                border-radius: 15px 0 0 15px !important;
                background-color: rgba(0,0,0,0.3) !important;
                border:0 !important;
                color: white !important;
                cursor: pointer;
            }
            .send_btn{
                border-radius: 0 15px 15px 0 !important;
                background-color: rgba(0,0,0,0.3) !important;
                border:0 !important;
                color: white !important;
                cursor: pointer;
            }
            .search_btn{
                border-radius: 0 15px 15px 0 !important;
                background-color: rgba(0,0,0,0.3) !important;
                border:0 !important;
                color: white !important;
                cursor: pointer;
            }
            .contacts{
                list-style: none;
                padding: 0;
            }
            .contacts li{
                width: 100% !important;
                padding: 5px 10px;
                margin-bottom: 15px !important;
            }
            .active{
                background-color: rgba(0,0,0,0.3);
            }
            .user_img{
                height: 70px;
                width: 70px;
                border:1.5px solid #f5f6fa;

            }
            .user_img_msg{
                height: 40px;
                width: 40px;
                border:1.5px solid #f5f6fa;

            }
            .img_cont{
                position: relative;
                height: 70px;
                width: 70px;
            }
            .img_cont_msg{
                height: 40px;
                width: 40px;
            }
            .online_icon{
                position: absolute;
                height: 15px;
                width:15px;
                background-color: #4cd137;
                border-radius: 50%;
                bottom: 0.2em;
                right: 0.4em;
                border:1.5px solid white;
            }
            .offline_icon{
                position: absolute;
                height: 15px;
                width:15px;
                background-color: red;
                border-radius: 50%;
                bottom: 0.2em;
                right: 0.4em;
                border:1.5px solid white;
            }
            .offline{
                background-color: #c23616 !important;
            }
            .user_info{
                margin-top: auto;
                margin-bottom: auto;
                margin-left: 15px;
            }
            .user_info span{
                font-size: 20px;
                color: white;
            }
            .user_info p{
                font-size: 10px;
                color: rgba(255,255,255,0.6);
            }
            .video_cam{
                margin-left: 50px;
                margin-top: 5px;
            }
            .video_cam span{
                color: white;
                font-size: 20px;
                cursor: pointer;
                margin-right: 20px;
            }
            .msg_cotainer{
                margin-top: auto;
                margin-bottom: auto;
                margin-left: 10px;
                border-radius: 25px;
                background-color: #82ccdd;
                padding: 10px 16px;
                position: relative;
                font-size: 14px;
            }
            .msg_cotainer_send{

                font-size: 14px;
                margin-top: auto;
                margin-bottom: auto;
                margin-right: 10px;
                border-radius: 25px;
                background-color: #78e08f;
                padding: 10px 24px;
                position: relative;
            }
            .msg_time{
                position: absolute;
                left: 4px;
                bottom: -15px;
                color: rgba(255,255,255,0.5);
                font-size: 10px;
            }
            .msg_time_send{
                position: absolute;
                right: 4px;
                bottom: -15px;
                color: rgba(255,255,255,0.5);
                font-size: 10px;
            }
            .msg_head{
                position: relative;
            }
            #action_menu_btn{
                position: absolute;
                right: 10px;
                top: 10px;
                color: white;
                cursor: pointer;
                font-size: 20px;
            }
            .action_menu{
                z-index: 1;
                position: absolute;
                padding: 15px 0;
                background-color: rgba(0,0,0,0.5);
                color: white;
                border-radius: 15px;
                top: 30px;
                right: 15px;
                display: none;
            }
            .action_menu ul{
                list-style: none;
                padding: 0;
                margin: 0;
            }
            .action_menu ul li{
                width: 100%;
                padding: 10px 15px;
                margin-bottom: 5px;
            }
            .action_menu ul li i{
                padding-right: 10px;

            }
            .action_menu ul li:hover{
                cursor: pointer;
                background-color: rgba(0,0,0,0.2);
            }
            @media(max-width: 576px){
                .contacts_card{
                    margin-bottom: 15px !important;
                }
            }
        </style>
    </head>
    <body>

        <div class="" id="home">
            <nav class="navbar navbar-expand-xl">
                <div class="container h-100">
                    <a class="navbar-brand" href="home">
                        <h1 class="tm-site-title mb-0">BACK TO STORE</h1>
                    </a>
                    <button class="navbar-toggler ml-auto mr-0" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <i class="fas fa-bars tm-nav-icon"></i>
                    </button>

                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav mx-auto h-100">
                            <li class="nav-item">
                                <a class="nav-link " href="seller">
                                    <i class="fas fa-tachometer-alt"></i>
                                    Dashboard
                                    <span class="sr-only">(current)</span>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="seller?manage=products">
                                    <i class="fas fa-shopping-cart"></i>
                                    Products
                                </a>
                            </li>
                            <c:if test="${sessionScope.user.isAdmin == 1}">
                                <li class="nav-item">
                                    <a class="nav-link" href="admin?manage=users">
                                        <i class="far fa-user"></i>
                                        Accounts
                                    </a>
                                </li>
                            </c:if>
                            <li class="nav-item">
                                <a class="nav-link active" href="admin?manage=chat" id="navbarDropdown" role="button" data-toggle="dropdown"
                                   aria-haspopup="true" aria-expanded="false">
                                    <i class="fas fa-comment"></i>
                                    <span>
                                        Messages
                                    </span>
                                </a>

                            </li>
                        </ul>
                        <c:if test="${sessionScope.user.isAdmin == 1}">
                            <ul class="navbar-nav">
                                <li class="nav-item">
                                    <a class="nav-link d-block" href="logout">
                                        Admin, <b>Logout</b>
                                    </a>
                                </li>
                            </ul>
                        </c:if>
                        <c:if test="${sessionScope.user.isAdmin != 1}">
                            <ul class="navbar-nav">
                                <li class="nav-item">
                                    <a class="nav-link d-block" href="logout">
                                        Seller, <b>Logout</b>
                                    </a>
                                </li>
                            </ul>
                        </c:if>
                    </div>
                </div>

            </nav>

            <div class="container-fluid h-100" style="padding: 30px 0;">
                <div class="row justify-content-center h-100">
                    <div class="col-md-4 col-xl-3 chat"><div class="card mb-sm-3 mb-md-0 contacts_card">
                            <div class="card-header">
                                <div class="input-group">
                                    <input type="text" placeholder="Search..." name="" class="form-control search">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text search_btn"><i class="fas fa-search"></i></span>
                                    </div>
                                </div>
                            </div>
                            <div class="card-body contacts_body">
                                <ui class="contacts">
                                    <c:forEach items="${umess}" var="um">
                                    <li class="${isActive == um.getUserID()?"active":""}">
                                        <a href="seller?manage=chat&uid=${um.getUserID()}" class="d-flex bd-highlight">
                                            <div class="img_cont">
                                                <img src="${um.getAvatar()}" class="rounded-circle user_img">
                                                <span class="offline_icon"></span>
                                            </div>
                                            <div class="user_info">
                                                <span>${um.getFullName()}</span>
                                                <p>${um.getUserName()} is offline</p>
                                            </div>
                                        </a>
                                    </li>
                                    </c:forEach>
                                </ui>
                            </div>
                            <div class="card-footer"></div>
                        </div></div>
                    <div class="col-md-8 col-xl-6 chat">
                        <div class="card">
                            <div class="card-header msg_head">
                                <div class="d-flex bd-highlight">
                                    <c:if test="${umess.size() != 0}">
                                    <div class="img_cont">
                                        <img src="${uChat.getAvatar()}" class="rounded-circle user_img">
                                        <span class="offline_icon"></span>
                                    </div>
                                    </c:if>
                                    <div class="user_info">
                                        <span>${uChat.getFullName()}</span>
                                        <p>Messages</p>
                                    </div>
                                </div>
                                <span id="action_menu_btn"><i class="fas fa-ellipsis-v"></i></span>
                                <div class="action_menu" id="menuchat">
                                    <ul>
                                        <li><i class="fas fa-user-circle"></i> View profile</li>
                                        <li><i class="fas fa-users"></i> Add to close friends</li>
                                        <li><i class="fas fa-plus"></i> Add to group</li>
                                        <li><i class="fas fa-ban"></i> Block</li>
                                    </ul>
                                </div>
                            </div>
                            <div class="card-body msg_card_body" id="cart-body-id">
                                <c:forEach items="${ms}" var="m">
                                    <c:if test="${uDao.getUsersByID(m.getFromID()).isAdmin == 0 && uDao.getUsersByID(m.getFromID()).isSeller == 0}">
                                        <div class="d-flex justify-content-start mb-4">
                                            <div class="img_cont_msg">
                                                <img src="${uChat.getAvatar()}" class="rounded-circle user_img_msg">
                                            </div>
                                            <div class="msg_cotainer">
                                                ${m.content}
                                                <span class="msg_time">${m.getMesDateCreate()}</span>
                                            </div>
                                        </div>
                                    </c:if>
                                    <c:if test="${uDao.getUsersByID(m.getFromID()).isAdmin == 1 || uDao.getUsersByID(m.getFromID()).isSeller == 1}">
                                        <div class="d-flex justify-content-end mb-4">
                                            <div class="msg_cotainer_send">
                                                ${m.content}
                                                <span class="msg_time_send">${m.getMesDateCreate()}</span>
                                            </div>
                                            <div class="img_cont_msg">
                                                <img src="./img/seller-woman-farm-products-market-facade-vector-26569500.jpg" class="rounded-circle user_img_msg">
                                            </div>
                                        </div>
                                    </c:if>
                                </c:forEach>
                            </div>
                            <form action="chatwithcus?uid=${isActive}" method="post" class="card-footer" >
                                <div class="input-group">
                                    <div class="input-group-append">
                                        <span class="input-group-text attach_btn"><i class="fas fa-paperclip"></i></span>
                                    </div>
                                    <input required type="text" name="mes" class="form-control type_msg" placeholder="Type your message...">
                                    <div type="submit" class="input-group-append">
                                        <span class="input-group-text send_btn"><i class="fas fa-location-arrow"></i></span>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <footer class="tm-footer row tm-mt-small">
                <div class="col-12 font-weight-light">
                    <p class="text-center text-white mb-0 px-4 small">
                        Copyright &copy; <b>2022</b> Pham Quang Huy Inc. 

                        Design: <a rel="nofollow noopener" href="https://templatemo.com" class="tm-footer-link">Huy Pham</a>
                    </p>
                </div>
            </footer>
        </div>
        <script src="js/jquery-3.3.1.min.js"></script>
        <!-- https://jquery.com/download/ -->
        <script src="js/moment.min.js"></script>
        <!-- https://momentjs.com/ -->
        <script src="js/Chart.min.js"></script>
        <!-- http://www.chartjs.org/docs/latest/ -->
        <script src="js/bootstrap.min.js"></script>
        <script>
            $(document).ready(function () {
                $('#action_menu_btn').click(function () {
                    $('.action_menu').toggle();
                });
            });
            var messageBody =  document.getElementById("cart-body-id");
            messageBody.scrollTop = messageBody.scrollHeight;
        </script>
    </body>
</html>
