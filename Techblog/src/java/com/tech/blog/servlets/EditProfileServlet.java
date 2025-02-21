/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.tech.blog.servlets;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.ProfileHelper;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;

/**
 *
 * @author sk
 */
@MultipartConfig
//@WebServlet("/EditProfileServlet")
public class EditProfileServlet extends HttpServlet {

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

//            Fetch all data
            String userName = request.getParameter("user_name");
            String userEmail = request.getParameter("user_email");
            String userPassword = request.getParameter("user_password");
            String userGender = request.getParameter("user_gender");

            Part part = request.getPart("user_profile");
            String imageName = part.getSubmittedFileName();

//            Get the user from the session
            HttpSession s = request.getSession();
            User user = (User) s.getAttribute("currentUser");
            user.setName(userName);
            user.setEmail(userEmail);
            user.setPassword(userPassword);
            user.setGender(userGender);
            String userProfile = user.getProfile();
            user.setProfile(imageName);

//            Update database.
            UserDao userDao = new UserDao(ConnectionProvider.getConnection());

            boolean ans = userDao.updateUser(user);
            if (ans == true) {
                String oldPath = request.getSession().getServletContext().getRealPath("/") + "pics" + File.separator + userProfile;
                if (!userProfile.equals("Default.jpg")) {
                    ProfileHelper.deletefile(oldPath);
                }
                String newPath = request.getSession().getServletContext().getRealPath("/") + "pics" + File.separator + user.getProfile();
                if (ProfileHelper.saveFile(part.getInputStream(), newPath)) {
                    Message msg = new Message("Profile details updated....", "success", "alert-success");
                    s.setAttribute("msg", msg);

                } else {
                    Message msg = new Message("Something went wrong...", "error", "alert-danger");
                    s.setAttribute("msg", msg);
//                        Not save
                }
            } else {
                Message msg = new Message("Something went wrong...", "error", "alert-danger");
                s.setAttribute("msg", msg);

            }
            response.sendRedirect("profile.jsp");

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
