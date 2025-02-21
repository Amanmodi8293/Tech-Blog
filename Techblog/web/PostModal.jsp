<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>

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
                        <label><h6>Select your pic..</h6></label>
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


