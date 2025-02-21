
<%@page import="com.tech.blog.entities.User"%>

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
