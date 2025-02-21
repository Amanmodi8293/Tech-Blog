<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.tech.blog.dao.UserDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page errorPage="error_page.jsp" %>
<%
    User user = (User) session.getAttribute("currentUser");

    if (user == null) {
        response.sendRedirect("Login.jsp");
    }


%>
<%    int postId = Integer.parseInt(request.getParameter("post_id"));
    PostDao p = new PostDao(ConnectionProvider.getConnection());
    Post post = p.getPostByPostId(postId);
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title><%= post.getpTitle()%></title>
        <!--Boostrap Css-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <!--My Css-->
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <!--Font Awesome Css-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .background-flex{
                clip-path: polygon(0 0, 49% 3%, 100% 0, 100% 94%, 42% 94%, 0 100%);
            }

            .post-title{
                font-weight: 100px;
                font-size: 30px;
            }

            .post-content{
                font-weight: 100px;
                font-size: 20px;
            }

            .post-code{

            }

            .post-user-name{
                font-size: 20px;
            }

            .post-date{
                font-style: italic;
                font-weight: bold;
            }

            .row-user-info{
                border: 2px solid #e2e2e2;
                padding-top: 15px;
            }

            body{
                background: url(img/bg1.jpg);
                background-size: cover;
                background-attachment: fixed;
            }

        </style>
    </head>

    <!--Start of navbar-->
    <nav class="navbar navbar-expand-lg navbar-dark primary-background">
        <a class="navbar-brand" href="#"><span class="fa fa-asterisk"></span> Tech Blog</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="profile.jsp"><span class="fa fa-home"></span> Home <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <span class="fa fa-bars"></span> Categories
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="#">Programming Language</a>
                        <a class="dropdown-item" href="#">Project Implementation</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="#">Data Structure</a>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#"><span class="fa fa-address-card-o"></span> Contact</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#" data-toggle="modal" data-target="#add-post-modal"><span class="fa fa-address-card-o"></span> Post</a>
                </li>
            </ul>
            <ul class="navbar-nav mr-right">
                <li class="nav-item active">
                    <a class="nav-link" href="#" data-toggle="modal" data-target="#profile-modal" ><span class="fa fa-user-circle"></span> <%= user.getName()%> <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="LogoutServlet"><span class="fa fa-user-plus"></span> Logout <span class="sr-only">(current)</span></a>
                </li>
            </ul>
        </div>
    </nav>
    <!--Ending of navbar-->

    <!--Main content of body-->

    <div class="container">

        <div class="row my-4">

            <div class="col-md-8 offset-md-2">

                <div class="card">

                    <div class="card-header  primary-background text white">
                        <h4 class="post-title"><%= post.getpTitle()%></h4>
                    </div>
                    <div class="card-body">

                        <img class="card-img-top my-2" src="blog_pics/<%= post.getpPic()%>" alt="Card image cap">

                        <div class="row my-3 row-user-info">
                            <div class="col-md-8">

                                <%
                                    UserDao u = new UserDao(ConnectionProvider.getConnection());
                                %>

                                <p class="post-user-name"><a href="#"><%= u.getUserByUserId(post.getUserId()).getName()%></a> has posted : </p>
                            </div>
                            <div class="col-md-4">
                                <p class="post-date"><%= DateFormat.getDateTimeInstance().format(post.getpDate())%></p>
                            </div>
                        </div>

                        <p class="post-content"><%= post.getpContent()%></p>

                        <br>
                        <br>
                        <div class="post-code">
                            <pre><%= post.getpCode()%></pre>
                        </div>
                    </div>

                    <%
                        LikeDao l = new LikeDao(ConnectionProvider.getConnection());
                    %>
                    <div class="card-footer primary-background">
                        <a href="#" onclick="doLike(<%= post.getpId()%>,<%= user.getId()%>)" class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"><span class="like-counter"><%= l.countLikeOnPost(post.getpId())%></span></i></a>
                    </div>

                </div>


            </div>

        </div>

    </div>

    <!--End of main content of body-->


    <!--Profile modal-->

    <div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header primary-background text-white text-center">
                    <h5 class="modal-title" id="exampleModalLabel"> Techblog</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="container text-center">
                        <img src="pics/<%= user.getProfile()%>" style="border-radius: 50%; width: 100px; height: 100px">
                        <h5 class="modal-title mt-3" id="exampleModalLabel"> <%= user.getName()%></h5>
                    </div>
                </div>
                <!--Profile details-->
                <div id="profile-details">
                    <table class="table">
                        <tbody>
                            <tr>
                                <th scope="row"> Id : </th>
                                <td><%= user.getId()%></td>

                            </tr>
                            <tr>
                                <th scope="row"> Email : </th>
                                <td><%= user.getEmail()%></td>
                            </tr>
                            <tr>
                                <th scope="row"> Gender : </th>
                                <td><%= user.getGender()%></td>
                            </tr>
                            <tr>
                                <th scope="row"> Registered on : </th>
                                <td><%= user.getRegister_date()%></td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <!--Profile edit-->
                <div  id="profile-edit" style="display: none;">
                    <h3 class="mb-3 text-center">Please Edit Carefully</h3>
                    <form action="EditProfileServlet" method="post" enctype="multipart/form-data">
                        <table class="table">
                            <tr>
                                <td> Id : </td>
                                <td class="text-center"><%= user.getId()%></td>

                            </tr>
                            <tr>
                                <td> Name : </td>
                                <td><input type="text" name="user_name" class="form-control" value="<%= user.getName()%>"> </td>
                            </tr>
                            <tr>
                                <td> Email : </td>
                                <td><input type="email" name="user_email" class="form-control" value="<%= user.getEmail()%>"> </td>
                            </tr>
                            <tr>
                                <td> Password : </td>
                                <td><input type="password" name="user_password" class="form-control" value="<%= user.getPassword()%>"> </td>
                            </tr>
                            <tr>
                                <td> Gender : </td>
                                <td><input type="text" name="user_gender" class="form-control" value="<%= user.getGender()%>"> </td>
                            </tr>
                            <tr>
                                <td> New Profile Pic : </td>
                                <td><input type="file" name="user_profile" class="form-control"> </td>
                            </tr>
                        </table>
                        <div class="container">
                            <button type="submit" class="btn btn-outline-light primary-background">Save</button>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button id="edit-profile-button" type="button" class="btn btn-primary">Edit</button>
                </div>

            </div>
        </div>
    </div>



    <!--End of profile modal-->

    <!--Post modal-->

    <div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Provide the post details..</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="add-post-form" action="AddPostServlet" method="post" enctype="multipart/form-data">
                        <div class="form-group">
                            <select class="form-control" name="cid">
                                <option selected disabled="" >---Select categories---</option>
                                <%
                                    PostDao postd = new PostDao(ConnectionProvider.getConnection());
                                    ArrayList<Category> list = postd.getCategory();
                                    for (Category c : list) {
                                %>
                                <option value="<%= c.getCid()%>" ><%= c.getName()%></option>
                                <%
                                    }
                                %>
                            </select>
                        </div>
                        <div class="form-group">
                            <input name="pTitle" type="text" placeholder="Enter post title" class="form-control"/>
                        </div>
                        <div class="form-group">
                            <textarea name="pContent" class="form-control" placeholder="Enter your content"></textarea>
                        </div>
                        <div class="form-group">
                            <textarea name="pCode" class="form-control" placeholder="Enter your program (if any)."></textarea>
                        </div>
                        <div class="form-group">
                            <label><h6>Select your pic..</h5></label>
                            <br>
                            <input type="file" name="pic"/>
                        </div>
                        <div class="form-group text-center">
                            <button type="submit" class="btn btn-outline-primary text-white primary-background">Post</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!--End of post modal-->




    <!--jQuery Js-->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <!--Ajax Js-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
    <!--Boostrap Js-->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
    <!--Sweet Alert Js-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <!--My Js-->
    <script>
                            function doLike(pid, uid) {
                                console.log(pid + "," + uid);

                                const d = {
                                    uid: uid,
                                    pid: pid,
                                    operation: 'like'
                                };

                                $.ajax({
                                    url: "LikeServlet",
                                    data: d,
                                    success: function (data, textStatus, jqXHR) {
                                        console.log(data);
                                        if (data.trim() == "true") {
                                            let c = $(".like-counter").html();
                                            c++;
                                            $(".like-counter").html(c);

                                        }
                                    },
                                    error: function (jqXHR, textStatus, errorThrown) {
                                        console.log(jqXHR);
                                    }
                                });
                            }





    </script>
    <!--Profile Js-->
    <script>


        $(document).ready(function () {

            let editStatus = false;

            $("#edit-profile-button").click(function () {

                if (editStatus == false) {
                    $("#profile-details").hide();
                    $("#profile-edit").show();
                    editStatus = true;
                    $(this).text("Back");

                } else {
                    $("#profile-details").show();
                    $("#profile-edit").hide();
                    editStatus = false;
                    $(this).text("Edit");
                }

            });
        });
    </script>

    <!--Add post Js-->

    <script>

        $(document).ready(function (e) {

            $("#add-post-form").on("submit", function (event) {
//                    This code get called when from is submitted.
                event.preventDefault();

                let form = new FormData(this);

//                    Send AddPostServlet servlet

                $.ajax({
                    url: "AddPostServlet",
                    type: 'POST',
                    data: form,
                    success: function (data, textStatus, jqXHR) {
                        console.log(data);
                        if (data.trim() == "Done") {
                            swal("Good job!", "Posted Successfully !", "success");
                        } else {
                            swal("Error!!", "Something went wrong...try again.", "error");
                        }

                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        swal("Error!!", "Something went wrong...try again.", "error");
                    },
                    processData: false,
                    contentType: false
                });


            });
        });
    </script>

</html>
