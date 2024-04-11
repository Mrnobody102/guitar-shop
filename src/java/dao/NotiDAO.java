/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.Notis;
import models.Order;
import models.Shipper;
import models.User;

/**
 *
 * @author QUANG HUY
 */
public class NotiDAO extends DBContext{
    
    public void addNoti(int userId, int orderId) {
        try {
            String sql = "insert into Notifications(userId, orderId, DateCreate)"
                    + " values (?, ?, getDate())";
            PreparedStatement stm = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stm.setInt(1, userId);
            stm.setInt(2, orderId);
            stm.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public ArrayList<Notis> getNotisByUserID(int uId){
        ArrayList<Notis> list = new ArrayList<>();
        try{
            String sql = "Select * from Notifications where UserID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, uId);
            ResultSet rs = stm.executeQuery();
            while (rs.next())
            {
                UserDAO uDao = new UserDAO();
                OrderDAO oDao = new OrderDAO();
                User u = uDao.getUsersByID(rs.getInt("UserID"));
                Order o = oDao.getOrderByID(rs.getInt("OrderID"));
                Notis n = new Notis(u, o, rs.getString("DateCreate"));
                list.add(n);
            }
        }
        catch(Exception ex)
        {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
}
