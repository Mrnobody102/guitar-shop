/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import dao.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.User;

/**
 *
 * @author QUANG HUY
 */
@WebServlet(name = "updateproduct", urlPatterns = {"/updateproduct"})
public class updateproduct extends HttpServlet {

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
//        HttpSession session = request.getSession();
//        User user = (User) session.getAttribute("user");
//        int id = user.getUserID();
        
        String name = request.getParameter("name");
        String desc = request.getParameter("desc");
        String img = request.getParameter("img");
        int brandID = Integer.parseInt(request.getParameter("brand"));
        int categoryID = Integer.parseInt(request.getParameter("category"));
        float uPrice = Float.parseFloat(request.getParameter("uPrice"));
        int uiStock = Integer.parseInt(request.getParameter("uiStock"));
        ProductDAO proDAO = new ProductDAO();
        String update = request.getParameter("update");
        if (update.equals("add")){
            proDAO.addProduct(name, categoryID, brandID, uPrice, uiStock, desc, img);
        } 
        if (update.equals("edit")){
            int gid = Integer.parseInt(request.getParameter("gid"));
            proDAO.editProduct(name, categoryID, brandID, uPrice, uiStock, desc, img, gid);
        }
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("user");
        if(u.getIsAdmin() == 1){
            response.sendRedirect("admin?manage=products");
        } else {
            response.sendRedirect("seller?manage=products");
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
