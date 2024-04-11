<%@page import="models.Guitar"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <title>Edit Product</title>
        <link
            rel="stylesheet"
            href="https://fonts.googleapis.com/css?family=Roboto:400,700"
            />
        <link rel="stylesheet" href="css/fontawesome.min.css" />
        <link rel="stylesheet" href="jquery-ui-datepicker/jquery-ui.min.css" type="text/css" />
        <link rel="stylesheet" href="css/bootstrap.min.css" />
        <link rel="stylesheet" href="css/templatemo-style.css">
        <%
            ArrayList<Guitar> guitar = (ArrayList<Guitar>) request.getAttribute("guitar");
            Guitar g = guitar.get(0);
        %>
    </head>

    <body>

        <div class="container tm-mt-big tm-mb-big">
            <div class="row">
                <div class="col-xl-9 col-lg-10 col-md-12 col-sm-12 mx-auto">
                    <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
                        <div class="row">
                            <div class="col-12">
                                <h2 class="tm-block-title d-inline-block">Edit Product</h2>
                            </div>
                        </div>
                        <div class="row tm-edit-product-row">
                            <div class="col-xl-6 col-lg-6 col-md-12">
                                <form action="updateproduct?gid=<%=g.getGuitarID()%>&update=edit" method="post" class="tm-edit-product-form">
                                    <div class="form-group mb-3">
                                        <label
                                            for="name"
                                            >Product Name
                                        </label>
                                        <input
                                            id="name"
                                            name="name"
                                            type="text"
                                            value="<%=g.getGuitarName()%>"
                                            class="form-control validate"
                                            />
                                    </div>
                                    <div class="form-group mb-3">
                                        <label
                                            for="desc"
                                            >Description</label
                                        >
                                        <textarea                    
                                            class="form-control validate tm-small"
                                            rows="5"
                                            name="desc"
                                            required
                                            ><%=g.getDescription()%></textarea>
                                    </div>
                                    <div class="form-group mb-3">
                                        <label
                                            for="category"
                                            >Category</label
                                        >
                                        <select
                                            class="custom-select tm-select-accounts"
                                            id="category"
                                            name="category"
                                            >
                                            <option value="1" selected>Classic</option>
                                            <option value="2">Acoustic</option>
                                            <option value="3">Others</option>
                                        </select>
                                    </div>
                                    <div class="row">
                                        <div class="form-group mb-3 col-xs-12 col-sm-6">
                                            <label
                                                for="uPrice"
                                                >Unit Price
                                            </label>
                                            <input
                                                name="uPrice"
                                                type="text"
                                                value="<%=g.getUnitPrice()%>"
                                                class="form-control validate"
                                                data-large-mode="true"
                                                />
                                        </div>
                                        <div class="form-group mb-3 col-xs-12 col-sm-6">
                                            <label
                                                for="uiStock"
                                                >Units In Stock
                                            </label>
                                            <input
                                                id="stock"
                                                name="uiStock"
                                                type="text"
                                                value="<%=g.getUnitsInStock()%>"
                                                class="form-control validate"
                                                />
                                        </div>
                                    </div>

                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-12 mx-auto mb-4">
                                <div class="tm-product-img-edit mx-auto">
                                    <img src="<%=g.getGuitarImage()%>" alt="Product image" class="img-fluid d-block mx-auto">
                                    <i
                                        class="fas fa-cloud-upload-alt tm-upload-icon"

                                        ></i>
                                </div>
                                <br>
                                <div class="form-group">
                                    <label
                                        for="img"
                                        >URL Image
                                    </label>
                                    <input
                                        type="text"
                                        name="img"
                                        class="form-control validate"
                                        value="<%=g.getGuitarImage()%>"
                                        />
                                </div>
                                <div class="form-group">
                                    <label
                                        for="brand"
                                        >Brand ID
                                    </label>
                                    <input
                                        type="text"
                                        name="brand"
                                        class="form-control validate"
                                        value="<%=g.getBrand().getBrandID()%>"
                                        />
                                </div>
                            </div>
                            <div class="col-12">
                                <button type="submit" class="btn btn-primary btn-block text-uppercase">Update Now</button>
                            </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <footer class="tm-footer row tm-mt-small">
            <div class="col-12 font-weight-light">
                <p class="text-center text-white mb-0 px-4 small">
                    Copyright &copy; <b>2018</b> All rights reserved. 

                    Design: <a rel="nofollow noopener" href="https://templatemo.com" class="tm-footer-link">Huy Pham</a>
                </p>
            </div>
        </footer> 

        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="jquery-ui-datepicker/jquery-ui.min.js"></script>
        <script src="js/bootstrap.min.js"></script>

    </body>
</html>
