<%-- 
    Document   : index
    Created on : Sep 16, 2021, 10:26:14 PM
    Author     : mahakaal
--%>

<%@page import="com.abhi.tech.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page errorPage="Error_page.jsp" %>
<!DOCTYPE html>
<html>
    <head> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Abhi's Tutorials</title>
        <!------css-------->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="CSS/Style.css" rel="stylesheet" type="text/css"/>
        <!--For awesome font-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .banner-background{
           clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 93%, 66% 94%, 30% 100%, 0 94%, 0 0);
            }
        </style>
        <!--CSS End--> 
    </head>

    <body>
        <!-------Navbar------->
        <%@include file="normalNavbar.jsp" %>
        <!--banner-->
        
        <div class="container-fluid p-0 m-0">
            <div class="jumbotron primary-background text-white banner-background">
                <div class="container">
                    <h3 class="display-3">Welcome to Our World </h3>
                     <h3> Our Goal to Teach Everything.. </h3>
                     <p>Most programming languages consist of instructions for computers. There are programmable machines that use a set of specific instructions, rather than general programming languages.[1] The programs for these machines (such as a player piano's scrolls) did not produce different behavior in response to different inputs or conditions.Thousands of different programming languages have been created, and more are being created every year. Many programming languages are written in an imperative form (i.e., as a sequence of operations to perform) while other languages use the declarative form (i.e. the desired result is specified, not how to achieve it).</p>
                <h4 >Introduction About 'C'</h4>
                <p>C is an imperative procedural language. It was designed to be compiled to provide low-level access to memory and language constructs that map efficiently to machine instructions, all with minimal runtime support. Despite its low-level capabilities, the language was designed to encourage cross-platform programming. A standards-compliant C program written with portability in mind can be compiled for a wide variety of computer platforms and operating systems with few changes to its source code.</p>
                <button class="btn btn-outline-light btn-ln"> <span class="fa fa-blind">;-)</span> Let's Go..</button>
                <a href="login_page.jsp" class="btn btn-outline-light btn-ln"><span class="fa fa-globe fa-spin"></span>_LOGIN</a>
                </div>
            </div>
            
        </div>


  <!--cards-->
  <div class="container">
      
      <div class="row">
       
          <div class="col-md-4">
              
              <div class="card" ">
  <div class="card-body">
    <h5 class="card-title">Java Programming</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn primary-background text-white">Read More</a>
  </div>
</div>
              
          </div>
          <div class="col-md-4">
              
              <div class="card" ">
  <div class="card-body">
    <h5 class="card-title">Data Structure</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn primary-background text-white">Read More</a>
  </div>
</div>
              
          </div>
<div class="col-md-4">
              
              <div class="card" ">
  <div class="card-body">
    <h5 class="card-title">Python Programming</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn primary-background text-white">Read More</a>
  </div>
</div>
              
          </div>

      
      </div>
      <br>
      <br>
      
      <div class="row">
       
          <div class="col-md-4">
              
              <div class="card" ">
  <div class="card-body">
    <h5 class="card-title">Java Programming</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn primary-background text-white">Read More</a>
  </div>
</div>
              
          </div>
          <div class="col-md-4">
              
              <div class="card" ">
  <div class="card-body">
    <h5 class="card-title">Data Structure</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn primary-background text-white">Read More</a>
  </div>
</div>
              
          </div>
<div class="col-md-4">
              
              <div class="card" ">
  <div class="card-body">
    <h5 class="card-title">Python Programming</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn primary-background text-white">Read More</a>
  </div>
</div>
              
          </div>

      
      </div>
      
  </div>








        <!-----JavaScript----->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="javaScript/JS.js" type="text/javascript"></script>
        <!--End JavaScript--> 
    </body>
</html>
