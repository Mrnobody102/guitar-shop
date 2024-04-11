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
import models.Cart;
import models.Guitar;
import models.Order;
import models.OrderDetail;

/**
 *
 * @author QUANG HUY
 */
public class OrderDetailDAO extends DBContext{
    public void addOrderDetail(int orderId, int guitarID, int quantity) {
        try {
            String sql = "insert into OrderDetails(orderId, guitarID, quantity, discount) "
                    + " values (?, ?, ?, 0)";
            PreparedStatement stm = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stm.setInt(1, orderId);
            stm.setInt(2, guitarID);
            stm.setInt(3, quantity);
            stm.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public ArrayList<OrderDetail> getOrderDetailsByOrderID(int oId){
        ArrayList<OrderDetail> list = new ArrayList<>();
        GuitarDAO gDao = new GuitarDAO();
        OrderDAO oDao = new OrderDAO();
        try{
            String sql = "Select od.*, o.* from Orders o, OrderDetails od where "
                    + "od.orderId = o.orderId and od.orderID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, oId);
            ResultSet rs = stm.executeQuery();
            while (rs.next())
            {
                Guitar g = gDao.getGuitarsByID(rs.getInt("GuitarId"));
                Order o = oDao.getOrderByID(oId);
                Cart c = new Cart(g, rs.getInt("Quantity"));
                OrderDetail od = new OrderDetail(
                        o,
                        c,
                        rs.getFloat("Discount")
                );
                list.add(od);
            }
        }
        catch(Exception ex)
        {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
}
