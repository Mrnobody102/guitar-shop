/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author QUANG HUY
 */
public class ProductDAO extends DBContext{
    public void deleteProduct(String pId) {
        try {
            String sql = "Delete from Guitars where GuitarID=?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, pId);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
     public void deleteConcernProduct(String pId) {
        try {
            String sql = "DELETE FROM OrderDetails WHERE GuitarID = ?\n" +
                    "	DELETE FROM Comments WHERE GuitarID = ?\n" +
                    "	DELETE FROM Ratings WHERE GuitarID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, pId);
            stm.setString(2, pId);
            stm.setString(3, pId);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    
    
    public void addProduct
        (String GuitarName, int CategoryID, int BrandID, float UnitPrice, int UnitsInStock, String Description, String GuitarImage) {
        try {
            String sql = "INSERT INTO Guitars(GuitarName, CategoryID, BrandID, UnitPrice, UnitsInStock, Description, GuitarImage) \n" +
                            " VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, GuitarName);
            stm.setInt(2, CategoryID);
            stm.setInt(3, BrandID);
            stm.setFloat(4, UnitPrice);
            stm.setInt(5, UnitsInStock);
            stm.setString(6, Description);
            stm.setString(7, GuitarImage);
            stm.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void editProduct
        (String GuitarName, int CategoryID, int BrandID, float UnitPrice, int UnitsInStock, String Description, String GuitarImage, int guitarID) {
        try {
            String sql = "Update [Guitars] "
                    + "set [GuitarName] = ?, [CategoryID] = ?, BrandID = ?, [UnitPrice] = ?, [UnitsInStock] = ?, [Description] = ?, [GuitarImage] = ? where GuitarID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(8, guitarID);
            stm.setString(1, GuitarName);
            stm.setInt(2, CategoryID);
            stm.setInt(3, BrandID);
            stm.setFloat(4, UnitPrice);
            stm.setInt(5, UnitsInStock);
            stm.setString(6, Description);
            stm.setString(7, GuitarImage);

            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
