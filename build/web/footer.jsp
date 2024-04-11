<%-- 
    Document   : footer
    Created on : Feb 21, 2022, 2:09:32 PM
    Author     : QUANG HUY
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html> 
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./css/main.css">
        <link rel="stylesheet" href="./css/base.css">
        <title>JSP Page</title>
        <style>
            .chat {
                box-sizing: border-box;
                font-family: sans-serif;
            }
            /* Nút Để Mở Chatbox */
            .nut-mo-chatbox {
                background-color: #005cbf;
                color: white;
                padding: 16px 20px;
                border: none;
                cursor: pointer;
                opacity: 0.8;
                position: fixed;
                bottom: 23px;
                right: 28px;
                width: 180px;
                border-radius: 4px;
                font-size: 15px;
            }
            /* Ẩn chatbox mặc định */
            .Chatbox {

                display: none;
                position: fixed;
                bottom: 0;
                right: 15px;
                z-index: 9;
            }
            /* Thêm style cho form */
            .form-container {
                max-width: 300px;
                padding: 10px;
                background: linear-gradient(-45deg, #183850 0, #183850 25%, #192C46 50%, #22254C 75%, #22254C 100%);
            }
            /* thiết lập style textarea */
            .form-container textarea {
                width: 100%;
                padding: 15px;
                margin: 5px 0 22px 0;
                border: none;
                background: #f1f1f1;
                resize: none;
                min-height: 200px;
            }
            /*thiết lập style cho textarea khi được focus */
            .form-container textarea:focus {
                background-color: #ddd;
                outline: none;
            }
            /* Thiết lập style cho nút trong form*/
            .form-container .btn {
                background-color: #4CAF50;
                color: white;
                padding: 16px 20px;
                border: none;
                cursor: pointer;
                width: 100%;
                margin-bottom:10px;
                opacity: 0.8;
            }/* Thiết lập màu nền cho nút đóng chatbox */
            .form-container .nut-dong-chatbox {
                background-color: red;
            }
            /* Thêm hiệu ứng hover cho nút*/
            .form-container .btn:hover, .nut-mo-chatbox:hover {
                opacity: 1;
            }


            #bodybox {
                margin: auto;
                max-width: 550px;
                font: 15px arial, sans-serif;
                padding-top: 20px;
                padding-bottom: 25px;
                padding-right: 25px;
                padding-left: 25px;
            }

            #chatborder {
                box-shadow: 5px 5px 5px grey;
                background-color: rgba(255,232,211, 0.8);
                margin-top: 20px;
                margin-bottom: 20px;
                margin-left: 20px;
                margin-right: 20px;
                padding-top: 10px;
                padding-bottom: 15px;
                padding-right: 20px;
                padding-left: 15px;
                border-radius: 15px;
            }

            .chatlog {
                color: #8000ba;
                font: 15px arial, sans-serif;
            }

            #chatbox {
                font: 17px arial, sans-serif;
                height: 22px;
                width: 100%;
            }
        </style>
    </head>
    <body>
        <c:if test="${sessionScope.user != null && sessionScope.user.isAdmin == 0 && sessionScope.user.isSeller == 0}">
            <div class="chat">
                <button id="chatselect" class="nut-mo-chatbox" onclick="moForm()">Need help?</button>
                <div class="Chatbox" id="myForm">

                    <div id='bodybox'>
                        <div id='chatborder'>
                            <p style="text-align: center; font-weight: bold; color: #4CAF50; font-family: monospace">Chat with chatbot</p>
                            <p id="chatlog7" class="chatlog">&nbsp;</p>
                            <p id="chatlog6" class="chatlog">&nbsp;</p>
                            <p id="chatlog5" class="chatlog">&nbsp;</p>
                            <p id="chatlog4" class="chatlog">&nbsp;</p>
                            <p id="chatlog3" class="chatlog">&nbsp;</p>
                            <p id="chatlog2" class="chatlog">&nbsp;</p>
                            <p id="chatlog1" class="chatlog">&nbsp;</p>
                            <input type="text" name="chat" id="chatbox" placeholder="Hi there! Type here to talk to me." onfocus="placeHolder()">
                        </div>
                        <div style="display: flex; justify-content: space-around;">
                            <a href="chat" style="cursor: pointer; padding: 4px 12px; border: 1px solid black; background-color: white; color: black; ">
                                <span>Chat with seller</span>
                            </a>
                            <div style="cursor: pointer; padding: 4px 12px; border: 1px solid black; background-color: white" onclick="dongForm()">
                                <span>Close</span>
                            </div>
                        </div>
                    </div>
                </div>
            </c:if>
            <c:if test="${sessionScope.user == null}">
                <div class="chat">
                    <button id="chatselect" class="nut-mo-chatbox" onclick="moForm()">Need help?</button>
                    <div class="Chatbox" id="myForm">

                        <div id='bodybox'>
                            <div id='chatborder'>
                                <p style="text-align: center; font-weight: bold; color: #4CAF50; font-family: monospace">Chat with chatbot</p>
                                <p id="chatlog7" class="chatlog">&nbsp;</p>
                                <p id="chatlog6" class="chatlog">&nbsp;</p>
                                <p id="chatlog5" class="chatlog">&nbsp;</p>
                                <p id="chatlog4" class="chatlog">&nbsp;</p>
                                <p id="chatlog3" class="chatlog">&nbsp;</p>
                                <p id="chatlog2" class="chatlog">&nbsp;</p>
                                <p id="chatlog1" class="chatlog">&nbsp;</p>
                                <input type="text" name="chat" id="chatbox" placeholder="Hi there! Type here to talk to me." onfocus="placeHolder()">
                            </div>
                            <div style="display: flex; justify-content: space-around;">
                                <a href="login" style="cursor: pointer; padding: 4px 12px; border: 1px solid black; background-color: white; color: black; ">
                                    <span>Chat with seller</span>
                                </a>
                                <div style="cursor: pointer; padding: 4px 12px; border: 1px solid black; background-color: white" onclick="dongForm()">
                                    <span>Close</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:if>
                <footer class="footer">
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
                    /*Hàm Mở Form*/
                    function moForm() {
                        document.getElementById("myForm").style.display = "block";
                        document.getElementById("chatselect").style.display = "none";
                    }
                    /*Hàm Đóng Form*/
                    function dongForm() {
                        document.getElementById("chatselect").style.display = "block";
                        document.getElementById("myForm").style.display = "none";
                    }
                    //links
                    //http://eloquentjavascript.net/09_regexp.html
                    //https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Regular_Expressions


                    var messages = [], //array that hold the record of each string in chat
                            lastUserMessage = "", //keeps track of the most recent input string from the user
                            chatMessage = "", //var keeps track of what the chatbot is going to say
                            chatName = 'Chatbot', //name of the chatbot
                            talking = true; //when false the speach function doesn't work
                    //
                    //
                    //****************************************************************
                    //****************************************************************
                    //****************************************************************
                    //****************************************************************
                    //****************************************************************
                    //****************************************************************
                    //****************************************************************
                    //edit this function to change what the chatbot says
                    function chatbotResponse() {
                        talking = true;
                        const rep = ['You are so handsome!',
//                            'I am confused!', "Welcome to my guitar store!",
                            'Be the master!', 'Danh ngu vai', 'Danh vo dit', 'Ngu nhu cho', 'I am faker'
                        ];
                        chatMessage = rep[Math.floor(Math.random() * (rep.length))];


                        if (lastUserMessage === 'hi' || lastUserMessage == 'hello') {
                            const hi = ['hello', 'Have a nice day!']
                            chatMessage = hi[Math.floor(Math.random() * (hi.length))];
                            ;
                        }

                        if (lastUserMessage === 'name') {
                            chatMessage = 'My name is ' + chatName;
                        }

                        if (lastUserMessage === 'guitar') {
                            chatMessage = 'What your favorite guitar?';
                        }

                        if (lastUserMessage === 'help') {
                            chatMessage = 'You can chat with seller!';
                        }
                    }
                    //****************************************************************
                    //****************************************************************
                    //****************************************************************
                    //****************************************************************
                    //****************************************************************
                    //****************************************************************
                    //****************************************************************
                    //
                    //
                    //
                    //this runs each time enter is pressed.
                    //It controls the overall input and output
                    function newEntry() {
                        //if the message from the user isn't empty then run 
                        if (document.getElementById("chatbox").value !== "") {
                            //pulls the value from the chatbox ands sets it to lastUserMessage
                            lastUserMessage = document.getElementById("chatbox").value;
                            //sets the chat box to be clear
                            document.getElementById("chatbox").value = "";
                            //adds the value of the chatbox to the array messages
                            messages.push(lastUserMessage);
                            //Speech(lastUserMessage);  //says what the user typed outloud
                            //sets the variable chatMessage in response to lastUserMessage
                            chatbotResponse();
                            //add the chatbot's name and message to the array messages
                            messages.push("<b>" + chatName + ":</b> " + chatMessage);
                            // says the message using the text to speech function written below
                            Speech(chatMessage);
                            //outputs the last few array elements of messages to html
                            for (var i = 1; i < 8; i++) {
                                if (messages[messages.length - i])
                                    document.getElementById("chatlog" + i).innerHTML = messages[messages.length - i];
                            }
                        }
                    }

                    //text to Speech
                    //https://developers.google.com/web/updates/2014/01/Web-apps-that-talk-Introduction-to-the-Speech-Synthesis-API
                    function Speech(say) {
                        if ('speechSynthesis' in window && talking) {
                            var utterance = new SpeechSynthesisUtterance(say);
                            //msg.voice = voices[10]; // Note: some voices don't support altering params
                            //msg.voiceURI = 'native';
                            //utterance.volume = 1; // 0 to 1
                            //utterance.rate = 0.1; // 0.1 to 10
                            //utterance.pitch = 1; //0 to 2
                            //utterance.text = 'Hello World';
                            //utterance.lang = 'en-US';
                            speechSynthesis.speak(utterance);
                        }
                    }

                    //runs the keypress() function when a key is pressed
                    document.onkeypress = keyPress;
                    //if the key pressed is 'enter' runs the function newEntry()
                    function keyPress(e) {
                        var x = e || window.event;
                        var key = (x.keyCode || x.which);
                        if (key == 13 || key == 3) {
                            //runs this function when enter is pressed
                            newEntry();
                        }
                        if (key == 38) {
                            console.log('hi')
                            //document.getElementById("chatbox").value = lastUserMessage;
                        }
                    }

                    //clears the placeholder text ion the chatbox
                    //this function is set to run when the users brings focus to the chatbox, by clicking on it
                    function placeHolder() {
                        document.getElementById("chatbox").placeholder = "";
                    }
                </script>
                </body>
                </html>
