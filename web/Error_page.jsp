<%-- 
    Document   : Error_page
    Created on : Sep 18, 2021, 1:12:17 PM
    Author     : mahakaal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true"  %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sorry Something went wrong</title>
        <!------css-------->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="CSS/Style.css" rel="stylesheet" type="text/css"/>
        <!--For awesome font-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
       
    </head>
    <body>
        <div class="container text-center">
            <img src="Images/error.png" class="img-fluid "><!-- comment -->
            <h3 class="display-3" >Something Went Wrong </h3>
            <%= exception %>
            <a href="index.jsp" class="btn primary-background btn-lg text-white mt-3">Home</a>
        </div>
        
    </body>
</html>
