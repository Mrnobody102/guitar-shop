<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!------ Include the above in your HEAD tag ---------->

<!DOCTYPE html>
<html>
    <head>
        <title>Chat</title> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./css/main.css">
        <link rel="stylesheet" href="./css/base.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.css">
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.js"></script>
        <style>
            body,html{
                height: 100%;
                margin: 0;
                background: #7F7FD5;
                background: -webkit-linear-gradient(to right, #91EAE4, #86A8E7, #7F7FD5);
                background: linear-gradient(to right, #91EAE4, #86A8E7, #7F7FD5);
            }

            .chat{
                margin-top: 48px;
                margin-bottom: 48px;
            }
            .card{
                height: 480px;
                border-radius: 15px !important;
                background-color: rgba(0,0,0,0.4) !important;
            }
            .contacts_body{
                padding:  0.75rem 0 !important;
                overflow-y: auto;
                white-space: nowrap;
            }
            .msg_card_body{
                overflow: auto;
                
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
    <!--Coded With Love By Mutiullah Samim-->
    <body>
        <%@include file="header.jsp" %>
        <div class="container-fluid">
            <div class="row justify-content-center">
                <div class="col-10 chat">
                    <div class="card">
                        <div class="card-header msg_head">
                            <div class="d-flex bd-highlight">
                                <div class="img_cont">
                                    <img src="./img/seller-woman-farm-products-market-facade-vector-26569500.jpg" class="rounded-circle user_img">
                                    <span class="online_icon"></span>
                                </div>
                                <div class="user_info">
                                    <span>Chat with Seller</span>
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
                                <c:if test="${m.getFromID() != sessionScope.user.getUserID()}">
                                    <div class="d-flex justify-content-start mb-4">
                                        <div class="img_cont_msg">
                                            <img src="./img/seller-woman-farm-products-market-facade-vector-26569500.jpg" class="rounded-circle user_img_msg">
                                        </div>
                                        <div class="msg_cotainer">
                                            ${m.content}
                                            <span class="msg_time">${m.getMesDateCreate()}</span>
                                        </div>
                                    </div>
                                </c:if>
                                <c:if test="${m.getFromID() == sessionScope.user.getUserID()}">
                                    <div class="d-flex justify-content-end mb-4">
                                        <div class="msg_cotainer_send">
                                            ${m.content}
                                            <span class="msg_time_send">${m.getMesDateCreate()}</span>
                                        </div>
                                        <div class="img_cont_msg">
                                            <img src="${sessionScope.user.getAvatar()}" class="rounded-circle user_img_msg">
                                        </div>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </div>
                        <form action="chat" method="post" class="card-footer" >
                            <div class="input-group">
                                <div class="input-group-append">
                                    <span class="input-group-text attach_btn" style="font-size: 15px"><i class="fas fa-paperclip"></i></span>
                                </div>
                                <input style="font-size: 15px" required type="text" name="mes" class="form-control type_msg" placeholder="Type your message...">
                                <div type="submit" class="input-group-append">
                                    <span class="input-group-text send_btn" style="font-size: 15px"><i class="fas fa-location-arrow"></i></span>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <footer class="footer" style="background: linear-gradient(#f7f2cd, white);">
            <div class="grid">
                <div class="grid__row" style="padding-top: 24px">
                    <div class="grid__column-2-4">
                        <h3 class="footer__heading">Store Branches</h3>
                        <ul class="footer__list">
                            <li class="footer__list-item">
                                <a href="" class="footer-item__link">Hải Dương</a>
                            </li>
                            <li class="footer__list-item">
                                <a href="" class="footer-item__link">Hà Nội</a>
                            </li>
                            <li class="footer__list-item">
                                <a href="" class="footer-item__link">TP. Hồ Chí Minh</a>
                            </li>
                        </ul>
                    </div>
                    <div class="grid__column-2-4 footer-item__wrap">
                        <h3 class="footer__heading">Customer Service</h3>
                        <ul class="footer__list">
                            <li class="footer__list-item">
                                <a href="" class="footer-item__link">Support Center</a>
                            </li>
                            <li class="footer__list-item">
                                <a href="" class="footer-item__link">ShopHuy Mall</a>
                            </li>
                            <li class="footer__list-item">
                                <a href="" class="footer-item__link">Shopping Guide</a>
                            </li>
                        </ul>
                    </div>
                    <div class="grid__column-2-4 footer-item__wrap">
                        <h3 class="footer__heading">About Us</h3>
                        <ul class="footer__list">
                            <li class="footer__list-item">
                                <a href="" class="footer-item__link">History of ShopHuy</a>
                            </li>
                            <li class="footer__list-item">
                                <a href="" class="footer-item__link">Terms</a>
                            </li>
                            <li class="footer__list-item">
                                <a href="" class="footer-item__link">Recruitment</a>
                            </li>
                        </ul>
                    </div>

                    <div class="grid__column-2-4 footer-item__wrap">
                        <h3 class="footer__heading">Follow Us On</h3>
                        <ul class="footer__list">
                            <li class="footer__list-item">
                                <i class="footer__list-item-icon fab fa-facebook"></i>
                                <a href="" class="footer-item__link">Facebook</a>
                            </li>
                            <li class="footer__list-item">
                                <i class="footer__list-item-icon fab fa-instagram"></i>
                                <a href="" class="footer-item__link">Instagram</a>
                            </li>
                            <li class="footer__list-item">
                                <i class="footer__list-item-icon fab fa-linkedin"></i>
                                <a href="" class="footer-item__link">LinkedIn</a>
                            </li>
                        </ul>
                    </div>
                    <div class="grid__column-2-4 footer-item__wrap footer-item__wrap-app">
                        <h3 class="footer__heading">Go Shop On Application</h3>
                        <div class="footer__app" style="min-width: 300px">
                            <img src="./img/QR_code_for_mobile_English_Wikipedia.svg" alt="Download QR" class="footer__app-qr">
                            <div class="footer__app-link">
                                <img src="./img/google-play-11-722703.png" alt="CH Play" class="footer__app-img">
                                <img src="./img/app-store-for-apple-watch-128x128_2x.png" alt="App Store" class="footer__app-img">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="grid__row footer__copy-right">
                    <p class="footer__copy-right-text"> © 2021 - Pham Quang Huy Inc</p>
                </div>
            </div>
        </footer>
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





