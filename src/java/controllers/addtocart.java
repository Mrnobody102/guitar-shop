/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import dao.GuitarDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.Cart;
import models.Guitar;

/**
 *
 * @author QUANG HUY
 */
@WebServlet(name = "addtocart", urlPatterns = {"/addtocart"})
public class addtocart extends HttpServlet {

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

        GuitarDAO gDao = new GuitarDAO();
        int gid = Integer.parseInt(request.getParameter("gid"));
        int quan = Integer.parseInt(request.getParameter("quan"));

        Guitar g = gDao.getGuitarsByID(gid);
        ArrayList<Cart> list;
        boolean check = true;
        int quantity;

        if (session.getAttribute("cart") == null) {
            list = new ArrayList<>();
        } else {
            list = (ArrayList<Cart>) session.getAttribute("cart");
        }

        for (Cart c : list) {
            if (c.getGuitar().getGuitarID() == g.getGuitarID()) {
                if (c.getQuantity() >= c.getGuitar().getUnitsInStock() && quan > 0) {
                    quantity = c.getQuantity();
                } else {
                    quantity = c.getQuantity() + quan;
                }
                
                if (quantity < 1) {
                    list.remove(c);
                } else {
                    c.setQuantity(quantity);
                }
                check = false;
                break;
            }
        }

        if (check) {
            quantity = 1;
            Cart cart = new Cart(g, quantity);
            list.add(cart);
        }
        session.setAttribute("cart", list);
        if (request.getParameter("direct") != null) {
            response.sendRedirect("detail?gid=" + gid);
        } else {
            response.sendRedirect("home");
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
