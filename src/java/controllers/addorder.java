/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import dao.NotiDAO;
import dao.OrderDAO;
import dao.OrderDetailDAO;
import dao.ShipperDAO;
import dao.UserDAO;
import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.Cart;
import models.Shipper;
import models.User;

/**
 *
 * @author QUANG HUY
 */
@WebServlet(name = "addorder", urlPatterns = {"/addorder"})
public class addorder extends HttpServlet {

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
        int uid = Integer.parseInt(request.getParameter("uid"));
        int sid = Integer.parseInt(request.getParameter("shipper"));
        String sadd = request.getParameter("address");
        LocalDate date = LocalDate.parse(request.getParameter("rdate"));
        
        OrderDAO oDao = new OrderDAO();
        UserDAO uDao = new UserDAO();
        User u = uDao.getUsersByID(uid);
        ShipperDAO sDao = new ShipperDAO();
        Shipper s = sDao.getShippersByID(sid);
        ArrayList<Cart> carts = (ArrayList<Cart>) session.getAttribute("cart");
        
        float total = 0;
        total = carts.stream().map((c) -> c.getGuitar().getUnitPrice() * c.getQuantity()).reduce(total, (a, b) -> a + b);
        int oid = oDao.addOrder(uid, u.getUserID() + "-" + s.getShipperID(), date, sid, sadd, 0, LocalDate.parse("2022-04-01"), total);
        
        NotiDAO nDao = new NotiDAO();
        nDao.addNoti(uid, oid);
        
        OrderDetailDAO oddao = new OrderDetailDAO();
        carts.forEach((c) -> {
            oddao.addOrderDetail(oid, c.getGuitar().getGuitarID(), c.getQuantity());
        });
        response.sendRedirect("lastestorder?oid="+oid);
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
