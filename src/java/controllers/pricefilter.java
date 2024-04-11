/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import dao.CategoryDAO;
import dao.GuitarDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Category;
import models.Guitar;

/**
 *
 * @author QUANG HUY
 */
@WebServlet(name = "pricefilter", urlPatterns = {"/pricefilter"})
public class pricefilter extends HttpServlet {

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
        loadCategories(request, response);
        loadLastedGuitars(request, response);
        GuitarDAO gDao = new GuitarDAO();
        int minp, maxp;
        String minps = request.getParameter("minprice");
        String maxps = request.getParameter("maxprice");

        char[] minCharArray = minps.toCharArray();
        char[] maxCharArray = maxps.toCharArray();
        int minPindex = 0;
        int maxPindex = 0;
        for(char c:minCharArray){
            if((c+"").matches("[0-9]")) minPindex++;
        }
        for(char c:maxCharArray){
            if((c+"").matches("[0-9]")) maxPindex++;
        }
        minp = Integer.parseInt(minps.substring(0, minPindex) + "000");
        maxp = Integer.parseInt(maxps.substring(0, maxPindex) + "000");

//        request.setAttribute("minp", Integer.parseInt(minps.substring(0, minPindex)));
//        request.setAttribute("maxp", Integer.parseInt(maxps.substring(0, maxPindex)));
        ArrayList<Guitar> result = gDao.priceFilter(minp, maxp);
        request.setAttribute("guitars", result);

        // not relate 
        request.setAttribute("pageIndex", 1);
        request.setAttribute("endPage", 2);
        request.setAttribute("isHidden", "none");

        request.getRequestDispatcher("Home.jsp").forward(request, response);
    }

    private void loadCategories(HttpServletRequest request, HttpServletResponse response) {
        CategoryDAO catDao = new CategoryDAO();
        ArrayList<Category> cats = catDao.getAllCategories();
        request.setAttribute("cats", cats);
    }

    private void loadLastedGuitars(HttpServletRequest request, HttpServletResponse response) {
        GuitarDAO guiDao = new GuitarDAO();
        ArrayList<Guitar> lastguitars;
        lastguitars = guiDao.getLastedguitars();
        request.setAttribute("lastguitars", lastguitars);
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
