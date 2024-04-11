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
import models.User;

/**
 *
 * @author QUANG HUY
 */
public class CommentDAO extends DBContext{
    public ArrayList<Comment> getComment(int gid){
        ArrayList<Comment> list = new ArrayList<>();
        UserDAO uDao = new UserDAO();
        GuitarDAO gDao = new GuitarDAO();
        try{
            String sql = "Select cm.* from Comments cm where cm.guitarID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, gid);
            ResultSet rs = stm.executeQuery();
            while (rs.next())
            {
                Guitar g = gDao.getGuitarsByID(rs.getInt("GuitarID"));
                User u = uDao.getUsersByID(rs.getInt("UserID"));
                Comment cm = new Comment(
                        rs.getInt("CommentID"), 
                        g, 
                        u, 
                        rs.getString("Comment"),
                        rs.getString("DateCreate")
                );
                list.add(cm);
            }
        }
        catch(Exception ex)
        {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public void addComment(int gid, int uid, String cmt) {
        try {
            String sql = "INSERT INTO Comments(GuitarID, UserID, Comment, DateCreate)"
                    + " VALUES (?, ?, ?, getDate())";
            PreparedStatement stm = connection.prepareStatement(sql);

            stm.setInt(1, gid);
            stm.setInt(2, uid);
            stm.setString(3, cmt);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}

