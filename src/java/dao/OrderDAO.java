/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.Order;
import models.Shipper;
import models.User;

/**
 *
 * @author QUANG HUY
 */
public class OrderDAO extends DBContext {

    public int addOrder(int userID, String shipName, LocalDate RequireDate, int shipID, String shipAddress, float shipFreight, LocalDate estimatedShipDate, float totalPrice) {
        try {
            String sql = "insert into Orders(UserID, OrderDate, RequireDate, shipName, ShipVia, ShipAddress, ShipFreight, EstimatedShipDate, TotalPrice)"
                    + "values (?, getdate(), ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement stm = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stm.setInt(1, userID);
            stm.setDate(2,  Date.valueOf(RequireDate));
            stm.setString(3, shipName);
            stm.setInt(4, shipID);
            stm.setString(5, shipAddress);
            stm.setFloat(6, shipFreight);
            stm.setDate(7,  Date.valueOf(estimatedShipDate));
            stm.setFloat(8, totalPrice);
            stm.executeUpdate();
            ResultSet rs = stm.getGeneratedKeys();
            if (rs.next()) {
                int orderId = Integer.parseInt(rs.getString(1));
                return orderId;
            }
        } catch (Exception ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }
    
    public ArrayList<Order> getAllOrders()
    {
        ArrayList<Order> list = new ArrayList<>();
        try{
            String sql = "Select o.*, u.*, s.* from Users u, Orders o, Shippers s where u.UserID = o.UserID and o.ShipVia = s.ShipperID order by getDate()-OrderDate";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next())
            {
                User u =  new User(
                        rs.getInt("UserID"), 
                        rs.getString("UserName"), 
                        rs.getString("FullName"),
                        rs.getString("Address"),
                        rs.getString("Avatar"),
                        rs.getString("UserPhone"),
                        rs.getString("PassWord"),
                        rs.getInt("isSeller"),
                        rs.getInt("isAdmin")
                );
                Shipper s = new Shipper(
                        rs.getInt("ShipperID"), 
                        rs.getString("CompanyName"), 
                        rs.getString("ShipperPhone")
                );
                Order o = new Order(
                        rs.getInt("OrderId"),
                        u,
                        rs.getString("OrderDate"),
                        LocalDate.parse(rs.getString("RequireDate").substring(0, 10)),
                        rs.getString("ShipName"),
                        s,
                        rs.getString("ShipAddress"),
                        rs.getFloat("ShipFreight"),
                        LocalDate.parse(rs.getString("EstimatedShipDate").substring(0, 10)),
                        rs.getFloat("TotalPrice")
                );
                list.add(o);
            }
        } catch(SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public ArrayList<Order> getOrdersByUserID(int uId){
        ArrayList<Order> list = new ArrayList<>();
        try{
            String sql = "Select o.*, u.*, s.* from Users u, Orders o, Shippers s where u.UserID = o.UserID and o.ShipVia = s.ShipperID and o.UserID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, uId);
            ResultSet rs = stm.executeQuery();
            while (rs.next())
            {
                User u =  new User(
                        rs.getInt("UserID"), 
                        rs.getString("UserName"), 
                        rs.getString("FullName"),
                        rs.getString("Address"),
                        rs.getString("Avatar"),
                        rs.getString("UserPhone"),
                        rs.getString("PassWord"),
                        rs.getInt("isSeller"),
                        rs.getInt("isAdmin")
                );
                Shipper s = new Shipper(
                        rs.getInt("ShipperID"), 
                        rs.getString("CompanyName"), 
                        rs.getString("ShipperPhone")
                );
                Order o = new Order(
                        rs.getInt("OrderId"),
                        u,
                        rs.getString("OrderDate"),
                        LocalDate.parse(rs.getString("RequireDate").substring(0, 10)),
                        rs.getString("ShipName"),
                        s,
                        rs.getString("ShipAddress"),
                        rs.getFloat("ShipFreight"),
                        LocalDate.parse(rs.getString("EstimatedShipDate").substring(0, 10)),
                        rs.getFloat("TotalPrice")
                );
                list.add(o);
            }
        }
        catch(Exception ex)
        {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    
    public Order getOrderByID(int oId){
        Order o = null;
        try{
            String sql = "Select o.*, u.*, s.* from Users u, Orders o, Shippers s where u.UserID = o.UserID and o.ShipVia = s.ShipperID and o.OrderID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, oId);
            ResultSet rs = stm.executeQuery();
            while (rs.next())
            {
                User u =  new User(
                        rs.getInt("UserID"), 
                        rs.getString("UserName"), 
                        rs.getString("FullName"),
                        rs.getString("Address"),
                        rs.getString("Avatar"),
                        rs.getString("UserPhone"),
                        rs.getString("PassWord"),
                        rs.getInt("isSeller"),
                        rs.getInt("isAdmin")
                );
                Shipper s = new Shipper(
                        rs.getInt("ShipperID"), 
                        rs.getString("CompanyName"), 
                        rs.getString("ShipperPhone")
                );
                o = new Order(
                        rs.getInt("OrderId"),
                        u,
                        rs.getString("OrderDate"),
                        LocalDate.parse(rs.getString("RequireDate").substring(0, 10)),
                        rs.getString("ShipName"),
                        s,
                        rs.getString("ShipAddress"),
                        rs.getFloat("ShipFreight"),
                        LocalDate.parse(rs.getString("EstimatedShipDate").substring(0, 10)),
                        rs.getFloat("TotalPrice")
                );
            }
        }
        catch(Exception ex)
        {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return o;
    }
}

class Test3 {
    public static void main(String[] args) {
       OrderDAO ad = new OrderDAO();
        Order o = ad.getOrderByID(5);
//        Entry b = ad.getEntry(5);
//        for(Guitar a : list) {
            System.out.println(o.getShipName());
//        }
//        System.out.println(b.getContent());
    }
}
