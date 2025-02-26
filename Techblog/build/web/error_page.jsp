<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Sorry ! Something went wrong...</title>
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
        </style>
    </head>
    <body>
        <div class="container text-center">
            <img src="img/computer.png" class="img-fluid">
            <h3 class="display-3">Sorry ! Something went wrong...</h3>
            <%= exception %>
            <br>
            <a href="index.jsp" class="btn primary-background btn-lg text-white mt-3"> Home </a>
        </div>
    </body>
</html>
