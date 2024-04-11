/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import dao.MessageDAO;
import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.Message;
import models.User;

/**
 *
 * @author QUANG HUY
 */
@WebServlet(name = "chat", urlPatterns = {"/chat"})
public class chat extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");
        
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
        MessageDAO mDao = new MessageDAO();
        HttpSession session = request.getSession();
        User uS = (User) session.getAttribute("user");
        ArrayList<Message> ms = mDao.getMessFromByUserID(uS.getUserID());
        request.setAttribute("ms", ms);
        request.setAttribute("mDao", mDao);
        request.getRequestDispatcher("chat.jsp").forward(request, response);
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
        HttpSession session = request.getSession();
        User uS = (User) session.getAttribute("user");
        UserDAO uDao = new UserDAO();
        String mes = request.getParameter("mes");
        MessageDAO mDao = new MessageDAO();
        ArrayList<User> usell = uDao.getUsersByRole(1, 1);
        usell.forEach((u) -> {
            mDao.addMes(uS.getUserID(), u.getUserID(), mes);
        });
        ArrayList<Message> ms = mDao.getMessByUserID(uS.getUserID());

        response.sendRedirect("chat");
//        request.setAttribute("ms", ms);
//        request.setAttribute("mDao", mDao);
//        request.getRequestDispatcher("chat.jsp").forward(request, response);
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
