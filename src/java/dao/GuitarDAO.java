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
import models.Category;
import models.Guitar;

/**
 *
 * @author QUANG HUY
 */
public class GuitarDAO extends DBContext{
    // DELETE
    public void delete(String pId) {
        try {
            String sql = "Delete from Guitars where GuitarID=?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, pId);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    // DELETE IF CONFLICT WITH OTHER TABLES
     public void deleteConcern(String pId) {
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
    
    // ADD
    public void addProduct
        (String GuitarName, int CategoryID, int BrandID, float UnitPrice, int UnitsInStock, String Description, String GuitarImage) {
        try {
            String sql = "INSERT INTO Guitars(GuitarName, CategoryID, BrandID, UnitPrice, "
                        + "UnitsInStock, Description, GuitarImage) \n" 
                        + "VALUES (?, ?, ?, ?, ?, ?, ?)";
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
        
    // EDIT / UPDATE
    public void editProduct
        (String GuitarName, int CategoryID, int BrandID, float UnitPrice, int UnitsInStock, String Description, String GuitarImage, int guitarID) {
        try {
            String sql = "Update [Guitars] "
                    + "set [GuitarName] = ?, [CategoryID] = ?, BrandID = ?, [UnitPrice] = ?, "
                    + "[UnitsInStock] = ?, [Description] = ?, [GuitarImage] = ? where GuitarID = ?";
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
    
    // GET ALL
    public ArrayList<Guitar> getAllguitars()
    {
        ArrayList<Guitar> list = new ArrayList<>();
        try{
            String sql = "Select g.*, c.CategoryName, b.* from Guitars g, Categories C, Brands b "
                    + "where g.CategoryId = c.CategoryId and b.BrandID = g.BrandID";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next())
            {
                Category cat = new Category(
                        rs.getInt("CategoryId"), 
                        rs.getString("CategoryName")
                );
                Brand brand = new Brand(
                        rs.getInt("BrandID"), 
                        rs.getString("BrandName"),
                        rs.getString("BrandOrigin"));
                Guitar g = new Guitar(
                        rs.getInt("GuitarID"), 
                        rs.getString("GuitarName"), 
                        cat, 
                        brand,
                        rs.getInt("UnitPrice"), 
                        rs.getInt("UnitsInStock"),
                        rs.getString("Description"),
                        rs.getString("GuitarImage")
                );
                list.add(g);
            }
        }
        catch(Exception ex)
        {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    // GET BY ID
    public Guitar getGuitarsByID(int id)
    {
        try{
            String sql = "Select g.*, c.CategoryName, b.* from Guitars g, Categories C, Brands b "
                    + "where g.CategoryId = c.CategoryId and b.BrandID = g.BrandID and g.GuitarID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next())
            {
                Category cat = new Category(
                        rs.getInt("CategoryId"), 
                        rs.getString("CategoryName")
                );
                Brand brand = new Brand(
                        rs.getInt("BrandID"), 
                        rs.getString("BrandName"),
                        rs.getString("BrandOrigin"));
                return new Guitar(
                        rs.getInt("GuitarID"), 
                        rs.getString("GuitarName"), 
                        cat, 
                        brand,
                        rs.getInt("UnitPrice"), 
                        rs.getInt("UnitsInStock"),
                        rs.getString("Description"),
                        rs.getString("GuitarImage")
                );
            }
        }
        catch(Exception ex)
        {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    // GET LAST TOP 6
    public ArrayList<Guitar> getLastedguitars()
    {
        ArrayList<Guitar> list = new ArrayList<>();
        try{
            String sql = "Select top 6 g.*, c.CategoryName, b.* from Guitars g, Categories C, Brands b where g.CategoryId = c.CategoryId and b.BrandID = g.BrandID order by -g.GuitarID";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next())
            {
                Category cat = new Category(
                        rs.getInt("CategoryId"), 
                        rs.getString("CategoryName")
                );
                Brand brand = new Brand(
                        rs.getInt("BrandID"), 
                        rs.getString("BrandName"),
                        rs.getString("BrandOrigin"));
                Guitar g = new Guitar(
                        rs.getInt("GuitarID"), 
                        rs.getString("GuitarName"), 
                        cat, 
                        brand,
                        rs.getInt("UnitPrice"), 
                        rs.getInt("UnitsInStock"),
                        rs.getString("Description"),
                        rs.getString("GuitarImage")
                );
                list.add(g);
            }
        }
        catch(Exception ex)
        {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    // GET BY CATEGORY
    public ArrayList<Guitar> getGuitarsByCategory(int catId)
    {
        ArrayList<Guitar> list = new ArrayList<>();
        try{
            String sql = "Select g.*, c.CategoryName, b.* from Guitars g, Categories C, Brands b where g.CategoryId = c.CategoryId and b.BrandID = g.BrandID and c.CategoryId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, catId);
            ResultSet rs = stm.executeQuery();
            while (rs.next())
            {
                Category cat = new Category(
                        rs.getInt("CategoryId"), 
                        rs.getString("CategoryName")); 
                Brand brand = new Brand(
                        rs.getInt("BrandID"), 
                        rs.getString("BrandName"),
                        rs.getString("BrandOrigin"));
                Guitar g = new Guitar(
                        rs.getInt("GuitarID"), 
                        rs.getString("GuitarName"), 
                        cat, 
                        brand,
                        rs.getInt("UnitPrice"), 
                        rs.getInt("UnitsInStock"),
                        rs.getString("Description"),
                        rs.getString("GuitarImage")
                );
                list.add(g);
            }
        }
        catch(Exception ex)
        {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    // GET BY LIST
    public ArrayList<Guitar> getGuitar(ArrayList<Integer> guitarIds)
    {
        String guitarsStr = guitarIds.toString();//[1,2,3]
        guitarsStr = '(' + guitarsStr.substring(1);
        guitarsStr = guitarsStr.substring(0, guitarsStr.length()-1) + ')';
        
        ArrayList<Guitar> list = new ArrayList<>();
        try{
            String sql = "Select g.*, c.CategoryName, b.* from Guitars g, Categories C, Brands b where g.CategoryId = c.CategoryId and b.BrandID = g.BrandID and g.guitarID in " +guitarsStr;
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next())
            {
                Category cat = new Category(
                        rs.getInt("CategoryId"), 
                        rs.getString("CategoryName"));
                Brand brand = new Brand(
                        rs.getInt("BrandID"), 
                        rs.getString("BrandName"),
                        rs.getString("BrandOrigin"));
                Guitar g = new Guitar(
                        rs.getInt("GuitarID"), 
                        rs.getString("GuitarName"), 
                        cat, 
                        brand,
                        rs.getInt("UnitPrice"), 
                        rs.getInt("UnitsInStock"),
                        rs.getString("Description"),
                        rs.getString("GuitarImage")
                );
                list.add(g);
            }
        }
        catch(Exception ex)
        {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return list;
    }
    
    // COUNT
    public int countGuitars() {
        try {
            String sql = "SELECT count(*) FROM Guitars";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }
    
    // PAGING
    public ArrayList<Guitar> pagingGuitars(int index, int pageSize){
        ArrayList<Guitar> list = new ArrayList<>();
        try {
            String sql = "SELECT g.*, c.CategoryName, b.* from Guitars g, Categories C, Brands b where g.CategoryId = c.CategoryId and b.BrandID = g.BrandID " +
                            " ORDER BY g.GuitarID\n" +
                            " OFFSET (?-1)*? ROWS\n" +
                            " FETCH NEXT ? ROWS ONLY;";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, index);
            stm.setInt(2, pageSize);
            stm.setInt(3, pageSize);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Category cat = new Category(
                        rs.getInt("CategoryId"), 
                        rs.getString("CategoryName"));
                Brand brand = new Brand(
                        rs.getInt("BrandID"), 
                        rs.getString("BrandName"),
                        rs.getString("BrandOrigin"));
                Guitar g = new Guitar(
                        rs.getInt("GuitarID"), 
                        rs.getString("GuitarName"), 
                        cat, 
                        brand,
                        rs.getInt("UnitPrice"), 
                        rs.getInt("UnitsInStock"),
                        rs.getString("Description"),
                        rs.getString("GuitarImage")
                );
                list.add(g);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    // SEARCH:
//    LIKE Operator                     Description
//    WHERE CustomerName LIKE 'a%'	Finds any values that start with "a"
//    WHERE CustomerName LIKE '%a'	Finds any values that end with "a"
//    WHERE CustomerName LIKE '%or%'	Finds any values that have "or" in any position
//    WHERE CustomerName LIKE '_r%'	Finds any values that have "r" in the second position
//    WHERE CustomerName LIKE 'a_%'	Finds any values that start with "a" and are at least 2 characters in length
//    WHERE CustomerName LIKE 'a__%'	Finds any values that start with "a" and are at least 3 characters in length
//    WHERE ContactName LIKE 'a%o'	Finds any values that start with "a" and ends with "o"
    
    public ArrayList<Guitar> search(String text){
        ArrayList<Guitar> list = new ArrayList<>();
        try {
            String sql = "select * from guitars g, Brands b, Categories c where g.BrandID = b.BrandID and c.CategoryID = g.CategoryID \n" +
                        "and (GuitarName like ? or Description like ? or c.CategoryName like ? or b.BrandName like ?)" ;
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, "%" + text + "%");
            stm.setString(2, "%" + text + "%");
            stm.setString(3, "%" + text + "%");
            stm.setString(4, "%" + text + "%");
            
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Category cat = new Category(
                        rs.getInt("CategoryId"), 
                        rs.getString("CategoryName"));
                Brand brand = new Brand(
                        rs.getInt("BrandID"), 
                        rs.getString("BrandName"),
                        rs.getString("BrandOrigin"));
                Guitar g = new Guitar(
                        rs.getInt("GuitarID"), 
                        rs.getString("GuitarName"), 
                        cat, 
                        brand,
                        rs.getInt("UnitPrice"), 
                        rs.getInt("UnitsInStock"),
                        rs.getString("Description"),
                        rs.getString("GuitarImage")
                );
                list.add(g);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    // FILTER BETWEEN
    public ArrayList<Guitar> priceFilter(int minp, int maxp){
        ArrayList<Guitar> list = new ArrayList<>();
        try {
            String sql = "select * from guitars g, Brands b, Categories c where g.BrandID = b.BrandID and c.CategoryID = g.CategoryID \n" +
                        "and (UnitPrice between ? and ?)" ;
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, minp);
            stm.setInt(2, maxp);
            
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Category cat = new Category(
                        rs.getInt("CategoryId"), 
                        rs.getString("CategoryName"));
                Brand brand = new Brand(
                        rs.getInt("BrandID"), 
                        rs.getString("BrandName"),
                        rs.getString("BrandOrigin"));
                Guitar g = new Guitar(
                        rs.getInt("GuitarID"), 
                        rs.getString("GuitarName"), 
                        cat, 
                        brand,
                        rs.getInt("UnitPrice"), 
                        rs.getInt("UnitsInStock"),
                        rs.getString("Description"),
                        rs.getString("GuitarImage")
                );
                list.add(g);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    //SORT UP
    public ArrayList<Guitar> sortUp(){
        ArrayList<Guitar> list = new ArrayList<>();
        try {
            String sql = "select * from guitars g, Brands b, Categories c where g.BrandID = b.BrandID and c.CategoryID = g.CategoryID \n" +
                        "order by g.UnitPrice" ;
            PreparedStatement stm = connection.prepareStatement(sql);
            
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Category cat = new Category(
                        rs.getInt("CategoryId"), 
                        rs.getString("CategoryName"));
                Brand brand = new Brand(
                        rs.getInt("BrandID"), 
                        rs.getString("BrandName"),
                        rs.getString("BrandOrigin"));
                Guitar g = new Guitar(
                        rs.getInt("GuitarID"), 
                        rs.getString("GuitarName"), 
                        cat, 
                        brand,
                        rs.getInt("UnitPrice"), 
                        rs.getInt("UnitsInStock"),
                        rs.getString("Description"),
                        rs.getString("GuitarImage")
                );
                list.add(g);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    //SORT DOWN
    public ArrayList<Guitar> sortDown(){
        ArrayList<Guitar> list = new ArrayList<>();
        try {
            String sql = "select * from guitars g, Brands b, Categories c where g.BrandID = b.BrandID and c.CategoryID = g.CategoryID \n" +
                        "order by -g.UnitPrice" ;
            PreparedStatement stm = connection.prepareStatement(sql);
            
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Category cat = new Category(
                        rs.getInt("CategoryId"), 
                        rs.getString("CategoryName"));
                Brand brand = new Brand(
                        rs.getInt("BrandID"), 
                        rs.getString("BrandName"),
                        rs.getString("BrandOrigin"));
                Guitar g = new Guitar(
                        rs.getInt("GuitarID"), 
                        rs.getString("GuitarName"), 
                        cat, 
                        brand,
                        rs.getInt("UnitPrice"), 
                        rs.getInt("UnitsInStock"),
                        rs.getString("Description"),
                        rs.getString("GuitarImage")
                );
                list.add(g);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
}

// TEST CLASS
class Test {
    public static void main(String[] args) {
        GuitarDAO ad = new GuitarDAO();
        ArrayList<Guitar> list = ad.search("class");
//        Entry b = ad.getEntry(5);
        for(Guitar a : list) {
            System.out.println(a.getGuitarID()+ "\t" +a.getGuitarName());
        }
//        System.out.println(b.getContent());
    }
}