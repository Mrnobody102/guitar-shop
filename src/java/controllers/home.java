/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import dao.CategoryDAO;
import dao.GuitarDAO;
import dao.RatingDAO;
import java.io.IOException;
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
@WebServlet(name = "home", urlPatterns = {"/home"})
public class home extends HttpServlet {

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
        loadGuitars(request, response);
        loadLastedGuitars(request, response);

        RatingDAO rateDao = new RatingDAO();
        request.setAttribute("rateDao", rateDao);
        request.getRequestDispatcher("Home.jsp").forward(request, response);
    }

    private void loadCategories(HttpServletRequest request, HttpServletResponse response) {
        CategoryDAO catDao = new CategoryDAO();
        ArrayList<Category> cats = catDao.getAllCategories();
        request.setAttribute("cats", cats);
    }

    private void loadGuitars(HttpServletRequest request, HttpServletResponse response) {
        int CatId;
        GuitarDAO guiDao = new GuitarDAO();
        ArrayList<Guitar> guitars;
        int pageSize = 6;

        int numberOfGuitars = guiDao.countGuitars();
        int endPage = numberOfGuitars / pageSize;
        if (numberOfGuitars % pageSize != 0) {
            endPage++;
        }
        String pageIndex = request.getParameter("page");
        if (pageIndex == null) {
            pageIndex = "1";
        }
        int page = Integer.parseInt(pageIndex);
        request.setAttribute("pageIndex", pageIndex);
        request.setAttribute("endPage", endPage);
        if (request.getParameter("cid") != null) {
            CatId = Integer.parseInt(request.getParameter("cid"));
            guitars = guiDao.getGuitarsByCategory(CatId);
            request.setAttribute("isHidden", "none");
            request.setAttribute("isActive", CatId);
        } else {
            guitars = guiDao.pagingGuitars(page, pageSize);
            request.setAttribute("isHidden", "block");
        }

        request.setAttribute("guitars", guitars);
        
    }

    private void loadLastedGuitars(HttpServletRequest request, HttpServletResponse response) {
        GuitarDAO guiDao = new GuitarDAO();
        ArrayList<Guitar> lastguitars;
        lastguitars = guiDao.getLastedguitars();
        request.setAttribute("lastguitars", lastguitars);
    }

    private void loadRatings(HttpServletRequest request, HttpServletResponse response) {

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
