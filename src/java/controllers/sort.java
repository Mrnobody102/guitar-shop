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
@WebServlet(name = "sort", urlPatterns = {"/sort"})
public class sort extends HttpServlet {

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
        loadCategories(request, response);
        loadLastedGuitars(request, response);
        String sort = request.getParameter("sort");

        GuitarDAO guiDao = new GuitarDAO();
        ArrayList<Guitar> sortedUpList = guiDao.sortUp();
        ArrayList<Guitar> sortedDownList = guiDao.sortDown();

        if (sort.equals("up")) {
            request.setAttribute("price", "up");
            request.setAttribute("guitars", sortedUpList);
            // not relate 
            request.setAttribute("pageIndex", 1);
            request.setAttribute("endPage", 2);
            request.setAttribute("isHidden", "none");

            request.getRequestDispatcher("Home.jsp").forward(request, response);
        } else if (sort.equals("down")) {
            request.setAttribute("price", "down");
            request.setAttribute("guitars", sortedDownList);
            // not relate 
            request.setAttribute("pageIndex", 1);
            request.setAttribute("endPage", 2);
            request.setAttribute("isHidden", "none");

            request.getRequestDispatcher("Home.jsp").forward(request, response);
        } else {
            response.sendRedirect("home");
        }

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
