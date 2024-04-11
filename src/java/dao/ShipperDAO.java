/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.Shipper;
import models.User;

/**
 *
 * @author QUANG HUY
 */
public class ShipperDAO extends DBContext{
    public Shipper getShippersByID(int sid)
    {
        Shipper s = null;
        try{
            String sql = "Select * from Shippers where ShipperID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, sid);
            ResultSet rs = stm.executeQuery();
            while (rs.next())
            {
                s = new Shipper(
                        rs.getInt("ShipperID"), 
                        rs.getString("CompanyName"), 
                        rs.getString("ShipperPhone")
                );
            }
        }
        catch(Exception ex)
        {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return s;
    }
}
