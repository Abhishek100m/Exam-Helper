/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.abhi.tech.servlets;

import com.abhi.tech.Entities.Message;
import com.abhi.tech.Entities.User;
import com.abhi.tech.dao.UserDao;
import com.abhi.tech.helper.ConnectionProvider;
import com.abhi.tech.helper.Helper;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author mahakaal
 */
@MultipartConfig    
public class EditServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditServlet</title>");            
            out.println("</head>");
            out.println("<body>");
           
//            Fetch all Data 
        String userEmail = request.getParameter("user_email");
        String userName = request.getParameter("user_name");
        String userPassword = request.getParameter("user_password");
        String userAbout = request.getParameter("user_about");
        Part part = request.getPart("image");
        String imageName = part.getSubmittedFileName();
        

//  Get the user from the session--..

    HttpSession  s= request.getSession();
      User user =(User)s.getAttribute("currentuser");
      user.setEmail(userEmail);
      user.setName(userName);
      user.setPassword(userPassword);
      user.setAbout(userAbout);
      String oldFile = user.getProfile();
      user.setProfile(imageName);
      
      /// Now , we want to update data in DataBase 
      
     UserDao userDao = new UserDao(ConnectionProvider.getC());
             boolean ans = userDao.updateUser(user);
             if(ans){
               // We need to get path 
                 String path = request.getRealPath("/")+"pics"+File.separator+user.getProfile();
               
                 // Delete Code 
                 String oldpath = request.getRealPath("/")+"pics"+File.separator+ oldFile;
               if(!oldFile.equals("default.png")){
                 Helper.deleteFile(oldpath);
               }
                    if( Helper.saveFile(part.getInputStream(), path)){
                       
                        String content = "Profile Details Updated ! Well Done  ";
                String type = "Success";
                String cssClass = "alert-success";
                Message msg = new Message(content, type, cssClass);
                // For sending this message to profile_jsp page 
                s.setAttribute("msg", msg);
                   
                    }
                    else{
                    
                  String content = "Something went Wrong ";
                String type = "Failed";
                String cssClass = "alert-alert";
                Message msg = new Message(content, type, cssClass);
                // For sending this message to profile_jsp page 
                s.setAttribute("msg", msg);
                    }
                 
  
             }else{
                  String content = "Something went Wrong ";
                String type = "Failed";
                String cssClass = "alert-alert";
                Message msg = new Message(content, type, cssClass);
                // For sending this message to profile_jsp page 
                s.setAttribute("msg", msg);
             
             }
     
      
      
      
      
      
    response.sendRedirect("profile.jsp");
      
            
            
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
