/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.abhi.tech.servlets;
import com.abhi.tech.Entities.Post;
import com.abhi.tech.Entities.User;
import com.abhi.tech.dao.PostDao;
import com.abhi.tech.helper.ConnectionProvider;
import com.abhi.tech.helper.Helper;
import static com.sun.tools.doclint.Entity.part;
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
@MultipartConfig///  Accpet multipart data // Anotation
public class AddPostServlet extends HttpServlet {

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
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title> AddPostServlet</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("cheakpoint 1     ,    addpostervlet");
            int cid= Integer.parseInt(request.getParameter("cid"));
            String pTitle = request.getParameter("pTitle");
            String pContent = request.getParameter("pContent");
            String pCode = request.getParameter("pCode");
            Part part = request.getPart("pic");

      //            getting currentuser id  
           HttpSession session = request.getSession();
           User user = (User) session.getAttribute("currentuser");
         
           
           /// Here we creating object of post 
        Post op = new Post(pTitle, pContent, pCode, part.getSubmittedFileName(), cid, user.getId());
            PostDao pdao = new PostDao(ConnectionProvider.getC());
            if(pdao.savePost(op)){
                  String path = request.getRealPath("/")+"Post_pictures"+File.separator+part.getSubmittedFileName();
                  Helper.saveFile(part.getInputStream(), path);
               
                
                out.println("Done");
//                out.println("Photo also uploaded ! Done");
            }else 
            {
                out.println("Error");
            }
            
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
