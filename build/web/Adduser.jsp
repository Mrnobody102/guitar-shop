<%@page import="models.Guitar"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <title>Add Product</title>
        <link
            rel="stylesheet"
            href="https://fonts.googleapis.com/css?family=Roboto:400,700"
            />
        <link rel="stylesheet" href="css/fontawesome.min.css" />
        <link rel="stylesheet" href="jquery-ui-datepicker/jquery-ui.min.css" type="text/css" />
        <link rel="stylesheet" href="css/bootstrap.min.css" />
        <link rel="stylesheet" href="css/templatemo-style.css">
    </head>

    <body>

        <div class="container tm-mt-big tm-mb-big">
            <div class="row">
                <div class="col-xl-9 col-lg-10 col-md-12 col-sm-12 mx-auto">
                    <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
                        <div class="row">
                            <div class="col-12">
                                <h2 class="tm-block-title d-inline-block">Add User</h2>
                            </div>
                        </div>
                        <div class="row tm-edit-product-row">

                            <div class="col-xl-6 col-lg-6 col-md-12">
                                <form action="adduser" method="post" class="tm-edit-product-form">
                                    <div class="form-group mb-3">
                                        <div class="row">
                                            <div class="form-group mb-3 col-xs-12 col-sm-6">
                                                <label
                                                    for="uname"
                                                    >User name
                                                </label>
                                                <input
                                                    name="uname"
                                                    type="text"
                                                    value=""
                                                    class="form-control validate"
                                                    data-large-mode="true"
                                                    />
                                            </div>
                                            <div class="form-group mb-3 col-xs-12 col-sm-6">
                                                <label
                                                    for="role"
                                                    >User's Role</label
                                                >
                                                <select
                                                    class="custom-select tm-select-accounts"
                                                    id="category"
                                                    name="role"
                                                    >
                                                    <option value="1" selected>Customer</option>
                                                    <option value="2">Seller</option>
                                                    <option value="3">Admin</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                        <div class="form-group mb-3">
                                            <label
                                                for="fname"
                                                >Full name
                                            </label>
                                            <input
                                                id="stock"
                                                name="fname"
                                                type="text"
                                                value=""
                                                class="form-control validate"
                                                />

                                        </div>


                                    </div>
                                    <div class="col-xl-6 col-lg-6 col-md-12 mx-auto mb-4">
                                        <div class="row">
                                            <div class="form-group mb-3 col-xs-12 col-sm-6">
                                                <label
                                                    for="pass"
                                                    >Password
                                                </label>
                                                <input
                                                    name="pass"
                                                    type="text"
                                                    value=""
                                                    class="form-control validate"
                                                    data-large-mode="true"
                                                    />
                                            </div>
                                            <div class="form-group mb-3 col-xs-12 col-sm-6">
                                                <label
                                                    for="phone"
                                                    >Phone
                                                </label>
                                                <input
                                                    id="stock"
                                                    name="phone"
                                                    type="text"
                                                    value=""
                                                    class="form-control validate"
                                                    />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label
                                                for="img"
                                                >Avatar URL Image
                                            </label>
                                            <input
                                                type="text"
                                                name="img"
                                                class="form-control validate"
                                                value=""
                                                />
                                        </div>
                                        <div class="form-group">
                                            <label
                                                for="address"
                                                >Address
                                            </label>
                                            <input
                                                type="text"
                                                name="address"
                                                class="form-control validate"
                                                value=""
                                                />
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <button type="submit" class="btn btn-primary btn-block text-uppercase">Add now</button>
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
