

<%@page import="models.Guitar"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <title>Product Manager</title>
        <link
            rel="stylesheet"
            href="https://fonts.googleapis.com/css?family=Roboto:400,700"
            />
        <!-- https://fonts.google.com/specimen/Roboto -->
        <link rel="stylesheet" href="css/fontawesome.min.css" />
        <!-- https://fontawesome.com/ -->
        <link rel="stylesheet" href="css/bootstrap.min.css" />
        <!-- https://getbootstrap.com/ -->
        <link rel="stylesheet" href="css/templatemo-style.css">
        <!--
            Product Admin CSS Template
            https://templatemo.com/tm-524-product-admin
        -->

        <%
            ArrayList<Guitar> guitars = (ArrayList<Guitar>) request.getAttribute("guitars");
        %>
    </head>

    <body id="reportsPage">
        <nav class="navbar navbar-expand-xl">
            <div class="container h-100">
                <a class="navbar-brand" href="home">
                    <h1 class="tm-site-title mb-0">BACK TO STORE</h1>
                </a>
                <button
                    class="navbar-toggler ml-auto mr-0"
                    type="button"
                    data-toggle="collapse"
                    data-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent"
                    aria-expanded="false"
                    aria-label="Toggle navigation"
                    >
                    <i class="fas fa-bars tm-nav-icon"></i>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mx-auto h-100">
                        <li class="nav-item">
                            <a class="nav-link" href="seller">
                                <i class="fas fa-tachometer-alt"></i> Dashboard
                                <span class="sr-only">(current)</span>
                            </a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link active" href="seller?manage=products">
                                <i class="fas fa-shopping-cart"></i> Products
                            </a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="seller?manage=chat">
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
                                Seller, <b>Logout</b>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="container mt-5">
            <div class="row tm-content-row">
                <div class="col-12 tm-block-col">
                    <div class="tm-bg-primary-dark tm-block tm-block-products">
                        <div class="tm-product-table-container">
                            <table class="table table-hover tm-table-small tm-product-table">
                                <thead>
                                    <tr>
                                        <th scope="col">&nbsp;</th>
                                        <th scope="col">PRODUCT NAME</th>
                                        <th scope="col">CATEGORY</th>
                                        <th scope="col">BRAND</th>
                                        <th scope="col">UNIT PRICE</th>
                                        <th scope="col">IN STOCK</th>

                                        <th scope="col">&nbsp;</th>
                                        <th scope="col">&nbsp;</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% for (Guitar g : guitars) {%>
                                    <tr>
                                        <th scope="row"><input type="checkbox" /></th>
                                        <td><%= g.getGuitarName()%></td>
                                        <td><%= g.getCategory().getCategoryName()%></td>
                                        <td><%= g.getBrand().getBrandName()%></td>
                                        <td><%=String.format("%.3f", g.getUnitPrice() / 1000)%>,000</td>
                                        <td><%= g.getUnitsInStock()%></td>

                                        <td>
                                            <a href="manage?type=deleteproduct&gid=<%=g.getGuitarID()%>" class="tm-product-delete-link">
                                                <i class="far fa-trash-alt tm-product-delete-icon"></i>
                                            </a>
                                        </td>
                                        <td>
                                            <a href="manage?type=editproduct&gid=<%=g.getGuitarID()%>" class="tm-product-delete-link">
                                                <i class="far fa-edit tm-product-delete-icon"></i>
                                            </a>
                                        </td>
                                    </tr>
                                    <%}%>
                                </tbody>
                            </table>
                        </div>
                        <!-- table container -->
                        <a
                            href="manage?type=addproducts"
                            class="btn btn-primary btn-block text-uppercase mb-3">Add new product</a>
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

        <script src="js/jquery-3.3.1.min.js"></script>
        <!-- https://jquery.com/download/ -->
        <script src="js/bootstrap.min.js"></script>
        <!-- https://getbootstrap.com/ -->
        <script>
            $(function () {
                $(".tm-product-name").on("click", function () {
                    window.location.href = "edit-product.html";
                });
            });
        </script>
    </body>
</html>
