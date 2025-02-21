
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>

<!--Start main body-->

<main>
    <div class="container">

        <div class="row mt-4">
            <!--First column-->
            <div class="col-md-4">
                <!--Categories-->
                <div class="list-group">
                    <a href="#" onclick="getPosts(0, this)" class=" c-link list-group-item list-group-item-action">
                        All Posts
                    </a>

                    <!--Categories-->
                    <%
                        PostDao d = new PostDao(ConnectionProvider.getConnection());
                        ArrayList<Category> l = d.getCategory();
                        for (Category e : l) {
                    %>
                    <a href="#" onclick="getPosts(<%= e.getCid()%>, this)" class="c-link list-group-item list-group-item-action"><%= e.getName()%></a>
                    <%
                        }
                    %>     

                </div>

            </div>

            <!--Second column-->
            <div class="col-md-8">
                <!--Posts-->
                <div class="container text-center" id="loader">
                    <i class="fa fa-refresh fa-4x fa-spin"></i>
                    <h3 class="mt-2">Loading...</h3>
                </div>

                <div class="container-fluid" id="post-container">

                </div>


            </div>

        </div>

    </div>

</main>



<!--End main body-->