/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import dao.BrandDAO;
import dao.CategoryDAO;
import dao.GuitarDAO;
import dao.MessageDAO;
import dao.OrderDAO;
import dao.UserDAO;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.Brand;
import models.Category;
import models.Guitar;
import models.Message;
import models.Order;
import models.User;

/**
 *
 * @author QUANG HUY
 */
@WebServlet(name = "seller", urlPatterns = {"/seller"})
public class seller extends HttpServlet {

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
        User uS = (User) session.getAttribute("user");
        if (request.getParameter("manage") == null) {
            BrandDAO bDao = new BrandDAO();
            ArrayList<Brand> bs = bDao.getAllBrands();
            CategoryDAO cDao = new CategoryDAO();
            ArrayList<Category> cs = cDao.getAllCategories();
            ArrayList<Integer> cis = cDao.sumByCategories();
            ArrayList<Integer> bis = bDao.sumByBrands();
            OrderDAO oDao = new OrderDAO();
            ArrayList<Order> os = oDao.getAllOrders();
            request.setAttribute("cis", cis);
            request.setAttribute("bis", bis);
            request.setAttribute("bs", bs);
            request.setAttribute("cs", cs);
            request.setAttribute("os", os);
            
            request.getRequestDispatcher("Seller.jsp").forward(request, response);
        } else if (request.getParameter("manage").equals("products")) {
            GuitarDAO guiDao = new GuitarDAO();
            ArrayList<Guitar> guitars = guiDao.getAllguitars();
            request.setAttribute("guitars", guitars);
            request.getRequestDispatcher("SellerProduct.jsp").forward(request, response);
        } else {
            MessageDAO mDao = new MessageDAO();
            UserDAO uDao = new UserDAO();
            ArrayList<User> ums = mDao.getUserWhoHaveMess();
            String uid = request.getParameter("uid");
            int uidInt;
            if(uid == null){
                if (!ums.isEmpty()){
                    uidInt = ums.get(0).getUserID();
                } else {
                    uidInt = 0;
                }
            } else {
                uidInt = Integer.parseInt(uid);
            }
            ArrayList<Message> ms = mDao.getMessFromByUserID(uidInt);
            request.setAttribute("umess", ums);
            request.setAttribute("ms", ms);
            request.setAttribute("isActive", uidInt);
            request.setAttribute("uChat", uDao.getUsersByID(uidInt));
            request.setAttribute("uDao", uDao);
            request.getRequestDispatcher("sellerchat.jsp").forward(request, response);
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
