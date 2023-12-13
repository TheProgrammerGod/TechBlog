/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.tech.blog.servlets;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helpers.ConnectionProvider;
import com.tech.blog.helpers.Helper;
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
 * @author KIIT
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

            //fetching the form data
            String userName = request.getParameter("user_name");
            String userEmail = request.getParameter("user_email");
            String userPassword = request.getParameter("user_pass");
            Part part = request.getPart("user_pic");
            String userProfile = part.getSubmittedFileName();

            //fetching the current user object
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("currentUser");
            user.setName(userName);
            user.setEmail(userEmail);
            user.setPassword(userPassword);
            String oldPath = user.getProfile();
            user.setProfile(userProfile.equals("") ? user.getProfile() : userProfile);

            //updating the DB
            UserDao dao = new UserDao(ConnectionProvider.getConnection());
            boolean ans = dao.updateUser(user);

            if (ans) {
                out.println("Profile Updated");
                if (!userProfile.equals("")) {
                    String path = request.getRealPath("/") + "pictures" + File.separator;
                    if (oldPath.equals("default.png")) {
                        Helper.deleteFile(path + oldPath);
                    }
                    path += userProfile;
                    if (Helper.saveFile(part.getInputStream(), path)) {
                        out.println("Picture updated");
                    } else {
                        out.println("Picture cannot be updated");
                    }
                }
                Message msg = new Message("Profile updated Successfully", "success", "bg-green-200");
                session.setAttribute("msg", msg);
                response.sendRedirect("profile_page.jsp");
            } else {
                Message msg = new Message("Profile cannot be updated", "error", "bg-red-300");
                session.setAttribute("msg", msg);
                response.sendRedirect("profile_page.jsp");
                out.println("not updated to DB");
            }

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
