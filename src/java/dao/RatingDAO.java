/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.Comment;
import models.Guitar;
import models.Rating;
import models.User;

/**
 *
 * @author QUANG HUY
 */
public class RatingDAO extends DBContext {

    public ArrayList<Rating> getRatings(int gid) {
        ArrayList<Rating> list = new ArrayList<>();
        UserDAO uDao = new UserDAO();
        GuitarDAO gDao = new GuitarDAO();
        try {
            String sql = "Select r.* from Ratings r where r.guitarID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, gid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Guitar g = gDao.getGuitarsByID(rs.getInt("GuitarID"));
                User u = uDao.getUsersByID(rs.getInt("UserID"));
                Rating r = new Rating(
                        rs.getInt("RatingID"),
                        g,
                        u,
                        rs.getInt("Rate"),
                        rs.getInt("isFavor")
                );
                list.add(r);
            }
        } catch (Exception ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public ArrayList<Rating> getRatings(int gid, int uid) {
        ArrayList<Rating> list = new ArrayList<>();
        UserDAO uDao = new UserDAO();
        GuitarDAO gDao = new GuitarDAO();
        try {
            String sql = "Select r.* from Ratings r where r.guitarID = ? and r.UserID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, gid);
            stm.setInt(2, uid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Guitar g = gDao.getGuitarsByID(rs.getInt("GuitarID"));
                User u = uDao.getUsersByID(rs.getInt("UserID"));
                Rating r = new Rating(
                        rs.getInt("RatingID"),
                        g,
                        u,
                        rs.getInt("Rate"),
                        rs.getInt("isFavor")
                );
                list.add(r);
            }
        } catch (Exception ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public int getIsFavor(int gid, int uid) {
        int n = 0;
        UserDAO uDao = new UserDAO();
        GuitarDAO gDao = new GuitarDAO();
        try {
            String sql = "Select r.* from Ratings r where r.guitarID = ? and r.UserID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, gid);
            stm.setInt(2, uid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Guitar g = gDao.getGuitarsByID(rs.getInt("GuitarID"));
                User u = uDao.getUsersByID(rs.getInt("UserID"));
                Rating r = new Rating(
                        rs.getInt("RatingID"),
                        g,
                        u,
                        rs.getInt("Rate"),
                        rs.getInt("isFavor")
                );
                n = r.getIsFavor();
            }
        } catch (Exception ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }
    
    public int getAverageStars(int gid) {
        ArrayList<Rating> list = new ArrayList<>();
        int as = 0;
        try {
            String sql = "Select r.Rate from Ratings r where r.guitarID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, gid);
            ResultSet rs = stm.executeQuery();
            int totalStar = 0;
            int size = 0;
            while (rs.next()) {
                if(rs.getInt("Rate") != 0){
                    totalStar += rs.getInt("Rate");
                    size++;
                }
            }
            as = totalStar * 2 / size;
        } catch (Exception ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return as;
    }
    
    

    public ArrayList<Rating> getUserRating(int gid, User u) {
        ArrayList<Rating> list = new ArrayList<>();
        UserDAO uDao = new UserDAO();
        GuitarDAO gDao = new GuitarDAO();
        try {
            String sql = "Select r.* from Ratings r where r.guitarID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, gid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Guitar g = gDao.getGuitarsByID(rs.getInt("GuitarID"));
                Rating r = new Rating(
                        rs.getInt("RatingID"),
                        g,
                        u,
                        rs.getInt("Rate"),
                        rs.getInt("isFavor")
                );
                list.add(r);
            }
        } catch (Exception ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public void addRate(int gid, int uid, int Rate, int isFavor) {
        try {
            String sql = "INSERT INTO Ratings(GuitarID, UserID, Rate, isFavor)"
                    + " VALUES (?, ?, ?, ?)";
            PreparedStatement stm = connection.prepareStatement(sql);

            stm.setInt(1, gid);
            stm.setInt(2, uid);
            stm.setInt(3, Rate);
            stm.setInt(4, isFavor);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void addFavor(int gid, int uid, int isFavor) {
        try {
            String sql = "INSERT INTO Ratings(GuitarID, UserID, Rate, isFavor)"
                    + " VALUES (?, ?, 0, ?)";
            PreparedStatement stm = connection.prepareStatement(sql);

            stm.setInt(1, gid);
            stm.setInt(2, uid);
            stm.setInt(3, isFavor);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void editRate
        (int gid, int uid, int Rate, int isFavor) {
        try {
            String sql = "Update Ratings set "
                    + "Rate = ?, isFavor = ? where GuitarID = ? and UserID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            
            stm.setInt(3, gid);
            stm.setInt(4, uid);
            stm.setInt(1, Rate);
            stm.setInt(2, isFavor);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}

class Test1 {
    public static void main(String[] args) {
        RatingDAO ad = new RatingDAO();
        Rating a = ad.getRatings(1, 1).get(0);
//        Entry b = ad.getEntry(5);
//        for(Rating a : list) {
            System.out.println(a.getUser().getUserName()+ "\t" +a.getIsFavor());
//        }
//        System.out.println(b.getContent());
    }
}