<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Admin's manager</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,700">
        <!-- https://fonts.google.com/specimen/Roboto -->
        <link rel="stylesheet" href="css/fontawesome.min.css">
        <!-- https://fontawesome.com/ -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <!-- https://getbootstrap.com/ -->
        <link rel="stylesheet" href="css/templatemo-style.css">
        <!--
            Product Admin CSS Template
            https://templatemo.com/tm-524-product-admin
        -->
    <div style="display: none">
        <c:forEach items="${cs}" var="c">
        <div id="ckey${c.getCategoryID()}">${c.getCategoryName()}</div>
    </c:forEach>
    <% ArrayList<Integer> cis = (ArrayList<Integer>) request.getAttribute("cis");
            if (cis.size() < 3) {%>
    <div id="cvalue2">0</div>
    <%}
                for (int i = 0; i < cis.size(); i++) {%>
    <div id="cvalue<%=i%>"><%=cis.get(i)%></div>
    <%}%>
    <c:forEach items="${bs}" var="b">
        <div id="bkey${b.getBrandID()}">${b.getBrandName()}</div>
    </c:forEach>
    <% ArrayList<Integer> bis = (ArrayList<Integer>) request.getAttribute("bis");
            for (int i = 0; i < bis.size(); i++) {%>
    <div id="bvalue<%=i%>"><%=bis.get(i)%></div>
    <%}%>
    </div>
</head>

<body id="reportsPage">
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
                            <a class="nav-link active" href="jsp">
                                <i class="fas fa-tachometer-alt"></i>
                                Dashboard
                                <span class="sr-only">(current)</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="jsp?manage=products">
                                <i class="fas fa-shopping-cart"></i>
                                Products
                            </a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="jsp?manage=users">
                                <i class="far fa-user"></i>
                                Accounts
                            </a>
                        </li>
                         <li class="nav-item">
                                <a class="nav-link" href="jsp?manage=chat">
                                    <i class="fas fa-comment"></i>
                                    <span>
                                        Messages
                                    </span>
                                </a>
                                
                            </li>
                    </ul>
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link d-block" href="logout">
                                Admin, <b>Logout</b>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>

        </nav>
        <div class="container">
            <div class="row">
                <div class="col">
                    <p class="text-white mt-5 mb-5">Welcome back, <b>Admin</b></p>
                </div>
            </div>
            <!-- row -->
            <div class="row tm-content-row">
                
                <div class="col-sm-12 col-md-12 col-lg-6 col-xl-6 tm-block-col">
                    <div class="tm-bg-primary-dark tm-block">
                        <h2 class="tm-block-title">Brands</h2>
                        <canvas id="barChart"></canvas>
                    </div>
                </div>
                <div class="col-sm-12 col-md-12 col-lg-6 col-xl-6 tm-block-col">
                    <div class="tm-bg-primary-dark tm-block tm-block-taller">
                        <h2 class="tm-block-title">Categories</h2>
                        <div id="pieChartContainer">
                            <canvas id="pieChart" class="chartjs-render-monitor" width="200" height="200"></canvas>
                        </div>                        
                    </div>
                </div>
                
                <div class="col-12 tm-block-col">
                    <div class="tm-bg-primary-dark tm-block tm-block-taller tm-block-scroll">
                        <h2 class="tm-block-title">Orders List</h2>
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">ORDER NO</th>
                                    <th scope="col">ORDER DATE</th>
                                    <th scope="col">USER NAME</th>
                                    <th scope="col">USER ADDRESS</th>
                                    <th scope="col">USER PHONE</th>
                                    <th scope="col">TOTAL PRICE</th>
                                    <th scope="col">SHIP COMPANY</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${os}" var="o">
                                <tr>
                                    <th scope="row"><b>${o.getOrder()}</b></th>
                                    
                                    <td><b>${o.getOnlyOrderDate()}</b></td>
                                    <td><b><div class="tm-status-circle ${sessionScope.user.getUserID() == o.getUser().getUserID()? "moving" : "cancelled"}">
                                        </div>${o.getUser().getUserName()}</b></td>
                                    <td><b>${o.getUser().getAddress()}</b></td>
                                    <td><b>${o.getUser().getUserPhone()}</b></td>
                                    <td>${o.getTotalPriceString()}.000</td>
                                    <td>${o.getShipVia().getCompanyName()}</td>
                                </tr>
                                </c:forEach>
                            </tbody>
                        </table>
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
        const width_threshold = 480;

        function drawLineChart() {
            if ($("#lineChart").length) {
                ctxLine = document.getElementById("lineChart").getContext("2d");
                optionsLine = {
                    scales: {
                        yAxes: [
                            {
                                scaleLabel: {
                                    display: true,
                                    labelString: "Hits"
                                }
                            }
                        ]
                    }
                };

                // Set aspect ratio based on window width
                optionsLine.maintainAspectRatio =
                        $(window).width() < width_threshold ? false : true;

                configLine = {
                    type: "line",
                    data: {
                        labels: [
                            "January",
                            "February",
                            "March",
                            "April",
                            "May",
                            "June",
                            "July"
                        ],
                        datasets: [
                            {
                                label: "Latest Hits",
                                data: [88, 68, 79, 57, 50, 55, 70],
                                fill: false,
                                borderColor: "rgb(75, 192, 192)",
                                cubicInterpolationMode: "monotone",
                                pointRadius: 0
                            },
                            {
                                label: "Popular Hits",
                                data: [33, 45, 37, 21, 55, 74, 69],
                                fill: false,
                                borderColor: "rgba(255,99,132,1)",
                                cubicInterpolationMode: "monotone",
                                pointRadius: 0
                            },
                            {
                                label: "Featured",
                                data: [44, 19, 38, 46, 85, 66, 79],
                                fill: false,
                                borderColor: "rgba(153, 102, 255, 1)",
                                cubicInterpolationMode: "monotone",
                                pointRadius: 0
                            }
                        ]
                    },
                    options: optionsLine
                };

                lineChart = new Chart(ctxLine, configLine);
            }
        }

        function drawBarChart() {
            if ($("#barChart").length) {
                ctxBar = document.getElementById("barChart").getContext("2d");

                optionsBar = {
                    responsive: true,
                    scales: {
                        yAxes: [
                            {
                                barPercentage: 0.2,
                                ticks: {
                                    beginAtZero: true
                                },
                                scaleLabel: {
                                    display: true,
                                    labelString: "Units in stock"
                                }
                            }
                        ]
                    }
                };

                optionsBar.maintainAspectRatio =
                        $(window).width() < width_threshold ? false : true;

                /**
                 * COLOR CODES
                 * Red: #F7604D
                 * Aqua: #4ED6B8
                 * Green: #A8D582
                 * Yellow: #D7D768
                 * Purple: #9D66CC
                 * Orange: #DB9C3F
                 * Blue: #3889FC
                 */

                
                configBar = {
                    type: "horizontalBar",
                    data: {
                        labels: [
                            document.getElementById('bkey1').innerHTML,
                            document.getElementById('bkey2').innerHTML,
                            document.getElementById('bkey3').innerHTML,
                            document.getElementById('bkey4').innerHTML,
                            document.getElementById('bkey5').innerHTML,
                            document.getElementById('bkey6').innerHTML,
                            document.getElementById('bkey7').innerHTML
                        ],
                        datasets: [
                            {
                                label: "# units in stock",
                                data: [
                             document.getElementById('bvalue0').innerHTML,    
                             document.getElementById('bvalue1').innerHTML,    
                             document.getElementById('bvalue2').innerHTML,    
                             document.getElementById('bvalue3').innerHTML,    
                             document.getElementById('bvalue4').innerHTML,    
                             document.getElementById('bvalue5').innerHTML,    
                             document.getElementById('bvalue6').innerHTML    
                             
                            ],
                                backgroundColor: [
                                    "#F7604D",
                                    "#4ED6B8",
                                    "#A8D582",
                                    "#D7D768",
                                    "#9D66CC",
                                    "#DB9C3F",
                                    "#3889FC",
                                ],
                                borderWidth: 0
                            }
                        ]
                    },
                    options: optionsBar
                };

                barChart = new Chart(ctxBar, configBar);
            }
        }

        function drawPieChart() {
            if ($("#pieChart").length) {
                var chartHeight = 300;
                $("#pieChartContainer").css("height", chartHeight + "px");

                ctxPie = document.getElementById("pieChart").getContext("2d");

                optionsPie = {
                    responsive: true,
                    maintainAspectRatio: false,
                    layout: {
                        padding: {
                            left: 10,
                            right: 10,
                            top: 10,
                            bottom: 10
                        }
                    },
                    legend: {
                        position: "top"
                    }
                };

                configPie = {
                    type: "pie",
                    data: {
                        datasets: [
                            {
                                data: [
                                    document.getElementById('cvalue0').innerHTML,
                                    document.getElementById('cvalue1').innerHTML,
                                    document.getElementById('cvalue2').innerHTML
                                ],
                                backgroundColor: ["#F7604D", "#4ED6B8", "#A8D582"],
                                label: "Storage"
                            }
                        ],
                        labels: [
                            document.getElementById('ckey1').innerHTML,
                            document.getElementById('ckey2').innerHTML,
                            document.getElementById('ckey3').innerHTML
                        ]
                    },
                    options: optionsPie
                };

                pieChart = new Chart(ctxPie, configPie);
            }
        }

        function updateLineChart() {
            if (lineChart) {
                lineChart.options = optionsLine;
                lineChart.update();
            }
        }

        function updateBarChart() {
            if (barChart) {
                barChart.options = optionsBar;
                barChart.update();
            }
        }

        Chart.defaults.global.defaultFontColor = 'white';
        let ctxLine,
                ctxBar,
                ctxPie,
                optionsLine,
                optionsBar,
                optionsPie,
                configLine,
                configBar,
                configPie,
                lineChart;
        barChart, pieChart;
        // DOM is ready
        $(function () {
            drawLineChart(); // Line Chart
            drawBarChart(); // Bar Chart
            drawPieChart(); // Pie Chart

            $(window).resize(function () {
                updateLineChart();
                updateBarChart();
            });
        })
    </script>
</body>

</html>