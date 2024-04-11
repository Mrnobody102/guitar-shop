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
import models.Brand;

/**
 *
 * @author QUANG HUY
 */
public class BrandDAO extends DBContext{
    public ArrayList<Brand> getAllBrands()
    {
        ArrayList<Brand> list = new ArrayList<>();
        try{
            String sql = "Select * from Brands";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next())
            {
                Brand brand = new Brand(
                        rs.getInt("BrandID"), 
                        rs.getString("BrandName"),
                        rs.getString("BrandOrigin")
                        );
                list.add(brand);
            }
        } catch(SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public ArrayList<Integer> sumByBrands()
    {
        ArrayList<Integer> list = new ArrayList<>();
        try{
            String sql = "Select sum(g.UnitsInStock) from Guitars g group by g.BrandID";
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
