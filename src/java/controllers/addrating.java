/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import dao.RatingDAO;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Rating;

/**
 *
 * @author QUANG HUY
 */
@WebServlet(name = "addrating", urlPatterns = {"/addrating"})
public class addrating extends HttpServlet {

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
        String type = request.getParameter("type");
        String direct = request.getParameter("to");
        int gid = Integer.parseInt(request.getParameter("gid"));
        int uid = Integer.parseInt(request.getParameter("uid"));

        RatingDAO rDao = new RatingDAO();
        ArrayList<Rating> rs = rDao.getRatings(gid, uid);
        boolean checkToRating = true;
        int isFavorExist = 0;
        int isRateExist = 0;
        for (Rating r : rs) {
            if (r.getGuitar().getGuitarID() == gid && r.getUser().getUserID() == uid) {
                checkToRating = false;
                isFavorExist = r.getIsFavor();
                isRateExist = r.getRate();
                break;
            }
        }

        if (type.equals("heart")) {
            if (checkToRating) {
                rDao.addFavor(gid, uid, ((isFavorExist == 1) ? 0 : 1));
            } else {
                rDao.editRate(gid, uid, isRateExist, ((isFavorExist == 1) ? 0 : 1));
            }
            if (direct.equals("home")) {
                response.sendRedirect("home");
            } else {
                response.sendRedirect("detail?gid=" + gid + "&isFavor=" + ((isFavorExist == 1) ? 0 : 1));
            }
        } else {
            int vote = Integer.parseInt(request.getParameter("rate"));
            if (checkToRating) {
                rDao.addRate(gid, uid, vote, isFavorExist);
            } else {
                rDao.editRate(gid, uid, vote, isFavorExist);
            }
            if (direct.equals("home")) {
                response.sendRedirect("home");
            } else {
                response.sendRedirect("detail?gid=" + gid + "&isFavor=" + isFavorExist);
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
