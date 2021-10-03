<%-- 
    Document   : profile.jsp
    Created on : Sep 18, 2021, 5:01:46 PM
    Author     : mahakaal
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.abhi.tech.Entities.Category"%>
<%@page import="com.abhi.tech.dao.PostDao"%>
<%@page import="com.abhi.tech.helper.ConnectionProvider"%>
<%@page import="com.abhi.tech.Entities.Message"%>
<%@page import="com.abhi.tech.Entities.User"%>
<%@page errorPage="Error_page.jsp" %>
<%
    User user = (User) session.getAttribute("currentuser");
    if (user == null) {
        response.sendRedirect("login_page.jsp");
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome to ABHi's Tutorials</title>
        <!------css-------->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="CSS/Style.css" rel="stylesheet" type="text/css"/>
        <!--For awesome font-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
       <style>
            .banner-background{
           clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 93%, 66% 94%, 30% 100%, 0 94%, 0 0);
            }
        body{
                background:url(Images/free-background-wallpaper-1.jpg);
                background-size:cover;
                background-attachment: fixed;
            }
       </style>
        <!--CSS End-->
    </head>
    <!--After login NavBar--> 


    <nav class="navbar navbar-expand-lg navbar-dark primary-background">
        <a class="navbar-brand" href="#"><span class="fa fa-asterisk"></span>ABHi's Tutorials</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="#"> <span class='fa fa-coffee'></span> Home <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#"><span class="fa fa-arrows"></span> Explore</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Categories
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="#"><span class="fa fa-code"> </span>Data Structure</a>
                        <a class="dropdown-item" href="#"><span class="fa fa-cogs"> </span>Opreating System</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="#">more</a>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link " href="#"><span class="fa fa-phone-square"></span>Contact</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link " href="#" data-toggle="modal" data-target="#add-post-modal" ><span class="fa fa-code"></span>Do Post</a>
                </li>


                

            </ul>
            <ul class="navbar-nav mr-right">
                <li class="nav-item">
                    <a class="nav-link" href="#!" data-toggle="modal" data-target="#profilemodel" ><span class="fa fa-user-circle"></span> <%= user.getName()%> </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="LogoutServlet"><span class="fa fa-handshake-o"></span>Logout </a>
                </li>
            </ul>

        </div>
    </nav>

    <!--NavBar End--> 



    <!--for Success or error Message--> 

    <%
        Message m = (Message) session.getAttribute("msg");
        if (m != null) {
    %>
    <div class="alert <%= m.getCssClass()%>" role="alert">
        <strong> <%=m.getContent()%> </strong> <%= m.getType()%>
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
    </div>

    <%
            session.removeAttribute("msg");
        }

    %>

    <!--End of Message--> 

    <!------------------------------Main Body of the Page--------------------------------------------->



    <main>
        <div class="container">
            <div class="row mt-4">


                <!--***--first column--***-->
                <div class="col-md-3">
                    <!--categories-->
                    <div class="list-group">
                        <a href="#" onclick="getPosts(0,this)" class="c-link list-group-item list-group-item-action active">
                            All Posts 
                        </a>
                        <!--Fetching categories of post from PostDao Class--> 
                        <%                             PostDao pd = new PostDao(ConnectionProvider.getC());
                            ArrayList<Category> al = pd.getAllCategoies();
                            for (Category c : al) {
                        %>   
                        <a href="#" onclick="getPosts(<%= c.getcId() %>,this)" class="c-link list-group-item list-group-item-action"><%= c.getName()%></a>
                        <%
                            }
                        %>
                    </div>

                </div>


                <!--***--Second Column--***-->
                <div class="col-md-9">
                    <!--fetching posts--> 
                    <div id="loader" class="container text-center">
                        <i class="fa fa-refresh fa-4x fa-spin"></i>
                        <h3 class="mt-2">Loading.. wait !</h3>
                    </div>
                    <div class="container-fluid" id="post-container">

                    </div>
                </div>

            </div>
        </div>
    </main>





    <!--------------------------------End of Main Body of the Page--------------------------------------->









    <!--Profile Model-->  
    <!-- Modal -->

    <div class="modal fade" id="profilemodel" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header primary-background text-white ">
                    <h5 class="modal-title" id="exampleModalLongTitle">ABHi's Tutorials</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">

                    <div class="container text-center">
                        <img src="pics/<%= user.getProfile()%>" class="img-fluid" style="border-radius:40% ;max-width:120px; "/>
                        <br>
                        <h5 class="modal-title mt-3" id="exampleModalLongTitle">Name - <%= user.getName()%></h5>
                        <!--Details-->

                        <div id="profile-details" >

                            <table class="table">

                                <tbody>
                                    <tr>
                                        <th scope="row">ID :</th>
                                        <td><%= user.getId()%></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Email :</th>
                                        <td><%= user.getEmail()%></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Gender</th>
                                        <td><%= user.getGender()%></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Status</th>
                                        <td><%= user.getAbout()%></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Registered On </th>
                                        <td><%= user.getDateTime().toString()%></td>
                                    </tr>
                                </tbody>
                            </table> 

                        </div> 

                        <!--Profile Editable Module-->
                        <!--Starting--> 

                        <div id="profile-edit" style="display: none " > 
                            <h3 class="mt-2" >Please Edit Carefully</h3>
                            <form action="EditServlet" method="post" enctype="multipart/form-data" >
                                <table class="table">
                                    <tr>
                                        <td> ID :</td>
                                        <td><%= user.getId()%></td>
                                    </tr>
                                    <tr>
                                        <td> Email :</td>
                                        <td><input type="email" class="form-control" name="user_email" value="<%= user.getEmail()%>" ></td>
                                    </tr>
                                    <tr>
                                        <td> Name :</td>
                                        <td><input type="text" class="form-control" name="user_name" value="<%= user.getName()%>" ></td>
                                    </tr>
                                    <tr>
                                        <td> Password :</td>
                                        <td><input type="password" class="form-control" name="user_password" value="<%= user.getPassword()%>" ></td>
                                    </tr>
                                    <tr>
                                        <td> Gender :</td>
                                        <td><%= user.getGender().toUpperCase()%></td>
                                    </tr>
                                    <tr>
                                        <td> About :</td>
                                        <td>
                                            <textarea rows="3" class="form-control" name="user_about"><%=user.getAbout()%></textarea>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td> Profile Pic :</td>
                                        <td>
                                            <input type="file" name="image" class="form-control"><!-- comment -->
                                        </td>
                                    </tr>
                                </table>

                                <!--for save button-->
                                <br>
                                <div class="container" >
                                    <button type="submit" class="btn btn-outline-primary">Save</button>
                                </div>
                                <!--end-->


                            </form>

                        </div>   



                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button id="edit-profile-button" type="button" class="btn btn-primary">Edit </button>
                </div>
            </div>
        </div>
    </div>


    <!-------------**************----------End of Profile model----------------**********------------>


    <!---------------Add Post Modal---------------------->

    <!-- Modal -->
    <div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Provide the Post Details </h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">


                    <form id="add-post-form" action="AddPostServlet" method="POST">

                        <div class="form-group">
                            <select class="form-control" name="cid" >
                                <option selected disabled>---Select category---</option>

                                <%
                                    PostDao postdao = new PostDao(ConnectionProvider.getC());
                                    ArrayList<Category> list = postdao.getAllCategoies();
                                    for (Category c : list) {
                                %>
                                <option value="<%= c.getcId()%>"><%= c.getName()%></option>
                                <%
                                    }
                                %>
                            </select>

                        </div>

                        <div class="form-group">
                            <input name="pTitle" type="text" placeholder="Enter Post Tittle"  class="form-control"/>
                        </div>
                        <div class="form-group">
                            <textarea name="pContent" class="form-control" style="height: 150px"  placeholder="Enter your Content"></textarea>
                        </div>
                        <div class="form-group">
                            <textarea name="pCode" class="form-control" style="height: 150px"  placeholder="Enter Code(if you want to attech)"></textarea>
                        </div>
                        <div class="form-group" >
                            <label>Enter your Photo(if Required)</label>
                            <br>
                            <input type="file" name="pic">
                        </div>

                        <div class="container text-center">
                            <button type="submit" class="btn btn-outline-primary">Post</button>
                        </div>

                    </form>


                </div>

            </div>
        </div>
    </div>

    <!-----------------------End of add post modal------------------------->




    <!-----JavaScript----->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="javaScript/JS.js" type="text/javascript"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
    <!--for Editable Module-->  


    <script>
        $(document).ready(function () {
        let editStatus = false;
        $('#edit-profile-button').click(function ()
        {
        if (editStatus == false)
        {
        $("#profile-details").hide()
                $("#profile-edit").show();
        editStatus = true;
        $(this).text("Back")
        } else
        {
        $("#profile-details").show()
                $("#profile-edit").hide();
        editStatus = false;
        $(this).text("Edit")
        }
        })
        });
    </script>

    <!--End JavaScript--> 

    <!----------------------------------Now Add Post JS------> 
    <script> // Asyncronus Request using ajax
        $(document).ready(function (e) {
        $("#add-post-form").on("submit", function (event) {
        //this code gets called when form is submited 
        event.preventDefault();
        console.log("before ajacxx   , cheakpoint1")

                let form = new FormData(this);
        //Now requesting to Server 
        $.ajax({
        url: "AddPostServlet",
                type: 'POST',
                data: form,
                success: function (data, textStatus, jqXHR) {
                console.log("Success ajax form , cheakpoint 2");
                if (data.trim() == 'Done') {
                swal("Good job!", "Post Saved Successfully !", "success");
                } else {
                swal("Eroor", "Something went wrongGG!", "error");
                }
                },
                error: function (jqXHR, textStatus, errorThrown) {
                swal("Eroor", "Something went wrong! Error", "error");
                console.log("Failed ajax form ,cheakpoint 3 ");
                },
                processData: false,
                contentType: false

        })
        })
        })

    </script>
    <!-------Loading post Using Ajax-->
    <script>

                function getPosts(catId,temp) {
                $("#loader").show();
                $("#post-container").hide();
                $(".c-link").removeClass('active');
                

                $.ajax({
                url: "show_Post.jsp",
                data: { cid : catId },
                success: function (data, textStatus, jqXHR) {
                console.log(data);
                $("#loader").hide();
                $("#post-container").show();
                $("#post-container").html(data);
                $(temp).addClass('active');
                }
                });

                }

        $(document).ready(function(event){
        
        let allPostRef =  $('.c-link')[0]
        getPosts(0, allPostRef)
        })
    </script>



</body>
</html>
