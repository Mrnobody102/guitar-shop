/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import dao.CategoryDAO;
import dao.CommentDAO;
import dao.GuitarDAO;
import dao.RatingDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.Category;
import models.Comment;
import models.Guitar;
import models.Rating;
import models.User;

/**
 *
 * @author QUANG HUY
 */
@WebServlet(name = "detail", urlPatterns = {"/detail"})
public class detail extends HttpServlet {

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
        String gid = request.getParameter("gid");
        // load comments
        CommentDAO cDao = new CommentDAO();
        ArrayList<Comment> cms = cDao.getComment(Integer.parseInt(gid));
        request.setAttribute("cms", cms);
        
        //load ratings
        RatingDAO rDao = new RatingDAO();
        ArrayList<Rating> rs = rDao.getRatings(Integer.parseInt(gid));
        request.setAttribute("rs", rs);
        
        loadCategories(request, response);
        loadDetail(request, response);
        loadRatings(request, response);
        
        if (request.getParameter("isFavor") != null){
            int isFavor = Integer.parseInt(request.getParameter("isFavor"));
            request.setAttribute("isFavor", isFavor);
        } else {
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("user");
            if (user != null)
            request.setAttribute("isFavor", rDao.getIsFavor(Integer.parseInt(gid), user.getUserID()));
        }
        request.getRequestDispatcher("Details.jsp").forward(request, response);
        
    }
    
    private void loadCategories(HttpServletRequest request, HttpServletResponse response){
        CategoryDAO catDao = new CategoryDAO();
        ArrayList<Category> cats = catDao.getAllCategories();
        request.setAttribute("cats", cats);
    }
    
    private void loadDetail(HttpServletRequest request, HttpServletResponse response){
        String gid = request.getParameter("gid");
        ArrayList <Integer> guiIds = new ArrayList<>();
        guiIds.add(Integer.parseInt(gid));
        GuitarDAO guiDao = new GuitarDAO();
        ArrayList<Guitar> guitar = guiDao.getGuitar(guiIds);
        request.setAttribute("guitar", guitar);
    }
   
    private void loadRatings(HttpServletRequest request, HttpServletResponse response) {
        RatingDAO rateDao = new RatingDAO();
        request.setAttribute("rateDao", rateDao);
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
