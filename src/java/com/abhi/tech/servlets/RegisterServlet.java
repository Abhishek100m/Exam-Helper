/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.abhi.tech.servlets;

import com.abhi.tech.Entities.User;
import com.abhi.tech.dao.UserDao;
import com.abhi.tech.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author mahakaal
 */
@MultipartConfig
public class RegisterServlet extends HttpServlet {

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
           // Fetch all form data here

            String cheak = request.getParameter("cheak");
            if (cheak == null) {
                out.println("Box not cheaked , Cheak first !");
            } else {
                // Here we'll fetch , left(baki ka) data 
                String name = request.getParameter("user_name");
                String password = request.getParameter("user_password");
                String email = request.getParameter("user_email");
                String gender = request.getParameter("gender");
                String about = request.getParameter("about");
                //create User object and set all data to that object 
                User user = new User(name, email, password, gender, about);

                //create a UserDao object
                UserDao dao = new UserDao(ConnectionProvider.getC());
                if (dao.saveUser(user)) {
                    //data Saved 
                    out.println("done");
                } else {
                    out.println("Maybe Some Error Occured , i Think Try to change gmail ! and Try again");
                }

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
