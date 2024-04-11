/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import dao.GuitarDAO;
import dao.ProductDAO;
import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.Guitar;
import models.User;

/**
 *
 * @author QUANG HUY
 */
@WebServlet(name = "manage", urlPatterns = {"/manage"})
public class manage extends HttpServlet {

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
        HttpSession session = request.getSession();
        User userS = (User) session.getAttribute("user");
        String type = request.getParameter("type");
        String gid = request.getParameter("gid");
        String uid = request.getParameter("uid");
        if (uid != null) {
            if(type.equals("deleteuser")){
                UserDAO uDao = new UserDAO();
                uDao.deleteConcernUser(uid);
                uDao.deleteUser(uid);
                response.sendRedirect("admin?manage=users");
            }
        } else {
            //add user
            if(type.equals("adduser")){
                RequestDispatcher dispatcher = request.getRequestDispatcher("Adduser.jsp");
                dispatcher.forward(request, response);
            }
        }
        if (gid != null) {
            // delete product
            if (type.equals("deleteproduct")) {
                ProductDAO proDao = new ProductDAO();
                proDao.deleteConcernProduct(gid);
                proDao.deleteProduct(gid);
                if (userS.getIsAdmin() == 1) {
                    response.sendRedirect("admin?manage=products");
                } else {
                    response.sendRedirect("seller?manage=products");
                }
            }

            //edit product
            if (type.equals("editproduct")) {
                ArrayList<Integer> guiIds = new ArrayList<>();
                guiIds.add(Integer.parseInt(gid));
                GuitarDAO guiDao = new GuitarDAO();
                ArrayList<Guitar> guitar = guiDao.getGuitar(guiIds);
                request.setAttribute("guitar", guitar);
                RequestDispatcher dispatcher = request.getRequestDispatcher("EditProduct.jsp");
                dispatcher.forward(request, response);
            }
        } else {
            // add product
            if (type.equals("addproducts")) {
                RequestDispatcher dispatcher = request.getRequestDispatcher("AddProduct.jsp");
                dispatcher.forward(request, response);
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
