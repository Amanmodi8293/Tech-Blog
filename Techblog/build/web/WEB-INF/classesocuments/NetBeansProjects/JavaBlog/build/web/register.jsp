<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Register Page.</title>
        <!--Boostrap Css-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <!--My Css-->
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <!--Font Awesome Css-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .flex-background{
                clip-path: polygon(0 0, 49% 3%, 100% 0, 100% 94%, 42% 94%, 0 100%);
            }
        </style>
    </head>
    <body>

        <!--Navbar-->
        <%@include file="navbar.jsp" %>

        <main class="d-flex align-items-center primary-background flex-background" style="height: 90vh">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 offset-md-3">
                        <div class="card">
                            <div class="card-header primary-background text-white text-center">
                                <span class="fa fa-user-plus fa-3 fa-3x"></span>
                                <br>
                                <p>Register here</p>
                            </div>
                            <div class="card-body">
                                <form id="reg-form" action="RegisterServlet" method="POST">
                                    <div class="form-group">
                                        <label for="user_name">User name</label>
                                        <input name="user_name" type="text" class="form-control" id="user_name" aria-describedby="emailHelp" placeholder="Enter name">
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Email address</label>
                                        <input name="user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                        <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Password</label>
                                        <input name="user_password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                    </div>
                                    <div class="form-group">
                                        <label for="gender">Gender</label>
                                        <br>
                                        <input type="radio" id="gender" name="user_gender" value="Male"> Male
                                        <input type="radio" id="gender" name="user_gender" value="Female"> Female
                                    </div>
                                    <div class="form-check">
                                        <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
                                        <label class="form-check-label" for="exampleCheck1">Agree term and condition</label>
                                    </div>
                                    <br>
                                    <div class="container text-center" id="loader" style="display: none">
                                        <span class="fa fa-refresh fa-spin fa-4" ></span>
                                        <h4>Please wait..</h4>
                                    </div>
                                    <button id="submit-btn" type="submit" class="btn btn-primary primary-background">Singup</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </main>


        <!--Boostrap Js-->
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <!--jQuery Js-->
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        <!--My Js-->
        <script src="js/myscript.js" type="text/javascript"></script>
        <!--Sweet Alert Js-->
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <!--Ajax Js-->
        <script>
            $(document).ready(function () {
                console.log("Loaded.....");
                $('#reg-form').on('submit', function (event) {
                    event.preventDefault();

                    let form = new FormData(this);

                    $("#submit-btn").hide();
                    $("#loader").show();

//                    Send register servlet

                    $.ajax({
                        url: "RegisterServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            $("#submit-btn").show();
                            $("#loader").hide();

                            console.log(data);

                            if (data.trim() === 'Done') {

                                swal("Registered successfully...")
                                        .then((value) => {
                                            window.location = "Login.jsp";
                                        });
                            } else {
                                swal(data);
                            }

                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            $("#submit-btn").show();
                            $("#loader").hide();
                            swal("Something went wrong....");

                        },
                        processData: false,
                        contentType: false
                    });

                });
            });

        </script>

    </body>
</html>
