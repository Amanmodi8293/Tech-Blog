<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.dao.PostDao"%>

<div class="row">
    <%

        User u = (User) session.getAttribute("currentUser");

        Thread.sleep(100);
        PostDao p = new PostDao(ConnectionProvider.getConnection());

        int cId = Integer.parseInt(request.getParameter("cid"));
        List<Post> posts = null;
        if (cId == 0) {
            posts = p.getAllPosts();
        } else {
            posts = p.getPostByCatId(cId);
        }
        if (posts.size() == 0) {
            out.println("<h5 class='display-3 text-center'>Sorry ! No post availabel in this category..</h5>");
            return;
        }
        for (Post post : posts) {
    %>
    <div class="col-md-6 mt-2">
        <div class="card">
            <img class="card-img-top" src="blog_pics/<%= post.getpPic()%>" alt="Card image cap" style="max-height: 200px ">
            <div class="card-body">
                <b><%= post.getpTitle()%></b>
                <p><%= post.getpContent()%></p>
            </div>
            <%
                LikeDao l = new LikeDao(ConnectionProvider.getConnection());
            %>
            <div class="card-footer text-center primary-background">
                <a href="#" onclick="doLike(<%= post.getpId()%>,<%= u.getId()%>)" class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"><span class="like-counter"><%= l.countLikeOnPost(post.getpId())%></span></i></a>
                <a href="show_blog_page.jsp?post_id=<%= post.getpId()%>" class="btn btn-outline-light btn-sm">Read More...</a>
            </div>
        </div>
    </div>

    <%
        }

    %>
</div>

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