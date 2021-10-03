<%-- 
    Document   : register_page
    Created on : Sep 17, 2021, 1:16:03 PM
    Author     : mahakaal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
        <!------css-------->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="CSS/Style.css" rel="stylesheet" type="text/css"/>
        <!--For awesome font-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    </head>
    <body>
        <%@include  file="normalNavbar.jsp" %>

        <main class="p-5 "style="background: #bbdefb">

            <div class="container">

                <div class="col-md-8 offset-md-2">

                    <div class="card">
                        <div class="card-header text-center primary-background text-white ">
                            <span class="fa fa-gavel fa fa-3x"></span>
                            <br> Register Here !
                        </div>
                        <div class="card-body">
                            <form id="reg-form" action="RegisterServlet" method="POST">


                                <div class="form-group">
                                    <label for="user_name">User Name</label>
                                    <input name="user_name" type="text" class="form-control" id="user_name" aria-describedby="emailHelp" placeholder="Enter Name">
                                </div>
                                <div class="form-group">
                                    <label for="gender">Select Gender</label>
                                    <br><!-- comment -->
                                    <input type="radio" id="gende" name="gender" value="male" >Male
                                    <input type="radio" id="gender" name="gender" value="female">Female
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
                                <!--For about yourself--> 
                                <div class="form-group">
                                    <textarea name="about" class="form-control" id="" rows="5" placeholder="Enter Something about Yourself"></textarea>
                                </div>

                                <div class="form-check">
                                    <input name="cheak" type="checkbox" class="form-check-input" id="exampleCheck1">
                                    <label class="form-check-label" for="exampleCheck1">Terms and Conditions</label>
                                </div>
                                <br>
                                <div class="container text-center"  id="loader" style="display: none;">
                                    <span class="fa fa-refresh fa-3x fa-spin"></span>
                                    <h4>Please wait</h4>
                                </div>
                                <button id="submit-btn" type="submit" class="btn btn-primary">Submit</button>
                            </form>
                        </div>

                    </div>

                </div>
            </div>

        </main>


        <!-----JavaScript----->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="javaScript/JS.js" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <script>
            $(document).ready(function () {
                console.log("loaded........")
                $('#reg-form').on('submit', function    (event) {
                    event.preventDefault();
                    let form = new FormData(this);
                    $("#sumbimt-btn").hide();
                    $("#loader").show();
                    //send register servlet:
                    $.ajax({
                        url: "RegisterServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data)
                            $("#sumbimt-btn").show();
                            $("#loader").hide();
                            if(data.trim()==='done'){
                                swal("Registered successfully..We are going to redirect to login page")
                                        .then((value) => {
                                            window.location = "login_page.jsp"
                                        });
                                    }else{
                                        swal(data);
                                    }         
                            
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            $("#sumbimt-btn").show();
                            $("#loader").hide();
                            swal("something went wrong..try again");
                        },
                        processData: false,
                        contentType: false
                    });
                });
            });
        </script>

    </body>
</html>
