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
import models.Category;

/**
 *
 * @author QUANG HUY
 */
public class CategoryDAO extends DBContext{
    public ArrayList<Category> getAllCategories()
    {
        ArrayList<Category> list = new ArrayList<>();
        try{
            String sql = "Select * from Categories";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next())
            {
                Category category = new Category(
                        rs.getInt("CategoryID"), 
                        rs.getString("CategoryName"));
                list.add(category);
            }
        } catch(SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public ArrayList<Integer> sumByCategories()
    {
        ArrayList<Integer> list = new ArrayList<>();
        try{
            String sql = "Select sum(g.UnitsInStock) from Guitars g group by g.CategoryID";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next())
            {
                int i = rs.getInt(1);
                list.add(i);
            }
        } catch(SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
}
