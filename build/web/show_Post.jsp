<%@page import="java.util.List"%>
<%@page import="com.abhi.tech.Entities.Post"%>
<%@page import="com.abhi.tech.helper.ConnectionProvider"%>
<%@page import="com.abhi.tech.dao.PostDao"%>

<div class="row">
<%  
    Thread.sleep(500);
    PostDao pd = new PostDao(ConnectionProvider.getC());
    
    int cid= Integer.parseInt(request.getParameter("cid"));
   List<Post> posts=null;
    if(cid==0){
    posts = pd.getAllPosts();
    }else{
        posts =pd.getPostByCatId(cid);
    }
    if(posts.size()==0){
    out.println("<h3 class='display-3 text-center'>No Post in This Category </h3>");
    return; 
    }
    for (Post p : posts) {
%>
   <!--Html-->
   <!--here we need cards because,-->
   <!--we want to show posts in cards , thats why we create cards--> 
   <div class="col-md-6 mt-2 text-center">
       <div  class="card">
           <img class="card-img-top" src="Post_pictures/<%=p.getpPic() %>" alt="Card image cap">
           <div class="card-body">
               <b><%= p.getpTitle() %></b>    
               <p><%= p.getpContent() %></p>
           </div>
           <div class="card-footer primary-background text-center">
               <a href="#" class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"></i><span>10</span></a>
               <a href="#" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o"></i><span>20</span></a>
               <a  href="show_read_more.jsp?post_id=<%=p.getPid() %>" class="btn btn-outline-light btn-sm">Read More</a>
           </div>
       </div>
   </div>
<%
    }


%>
</div>