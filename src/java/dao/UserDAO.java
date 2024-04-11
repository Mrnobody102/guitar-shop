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
import models.User;

/**
 *
 * @author QUANG HUY
 */
public class UserDAO extends DBContext {

    public User login(String username, String password) {
        User u = null;
        try {
            String sql = "Select * from Users where [UserName] = ? and PassWord = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            stm.setString(2, password);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                u = new User(
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
            }
        } catch (Exception ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return u;
    }

    public ArrayList<User> getAllUsers() {
        ArrayList<User> list = new ArrayList<>();
        try {
            String sql = "Select * from Users";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                User u = new User(
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
                if (u.getIsAdmin() != 1) {
                    list.add(u);
                }
            }
        } catch (Exception ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public User getUsersByID(int uid) {
        User u = null;
        try {
            String sql = "Select * from Users where UserID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, uid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                u = new User(
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
            }
        } catch (Exception ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return u;
    }

    public ArrayList<User> getUsersByRole(int isSeller, int isAdmin) {
        ArrayList<User> list = new ArrayList<>();
        try {
            String sql = "Select * from Users where isSeller = ? or isAdmin = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, isSeller);
            stm.setInt(2, isAdmin);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                User u = new User(
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
                list.add(u);
            }
        } catch (Exception ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public void deleteUser(String uId) {
        try {
            String sql = "Delete from Users where userID=?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, uId);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteConcernUser(String uId) {
        try {
            String sql = "DELETE FROM OrderDetails WHERE \n"
                    + "OrderID in (SELECT OrderID FROM Orders WHERE UserID = ?);\n"
                    + " DELETE FROM Orders WHERE UserID = ?;\n"
                    + "	DELETE FROM Comments WHERE UserID = ?;\n"
                    + "	DELETE FROM Ratings WHERE UserID = ?;\n"
                    + "	DELETE FROM Notifications WHERE UserID = ?;\n"
                    + "	DELETE FROM Messages WHERE (FromID = ? or ToID = ?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, uId);
            stm.setString(2, uId);
            stm.setString(3, uId);
            stm.setString(4, uId);
            stm.setString(5, uId);
            stm.setString(6, uId);
            stm.setString(7, uId);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void addUser(String userName, String fullName, String address, String avt, String phone, String passWord, int isSeller, int isAdmin) {
        try {
            String sql = "INSERT INTO Users(userName, fullName, address, avatar, UserPhone, passWord, isSeller, isAdmin) \n"
                    + " VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, userName);
            stm.setString(2, fullName);
            stm.setString(3, address);
            stm.setString(4, avt);
            stm.setString(5, phone);
            stm.setString(6, passWord);
            stm.setInt(7, isSeller);
            stm.setInt(8, isAdmin);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void editUser(String userName, String fullName, String address, String avt, String phone, String passWord, int isSeller, int isAdmin, int uid) {
        try {
            String sql = "Update [Users] set [userName] = ?, [fullName] = ?, address = ?, "
                    + "[avatar] = ?, [UserPhone] = ?, [passWord] = ?, [isSeller] = ?, isAdmin = ? where UserID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, userName);
            stm.setString(2, fullName);
            stm.setString(3, address);
            stm.setString(4, avt);
            stm.setString(5, phone);
            stm.setString(6, passWord);
            stm.setInt(7, isSeller);
            stm.setInt(8, isAdmin);
            stm.setInt(9, uid);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void signUp(String userName, String passWord) {
        try {
            String sql = "INSERT INTO Users(userName, fullName, address, avatar, UserPhone, passWord, isSeller, isAdmin) \n"
                    + " VALUES (?, ?, null, ?, null, ?, 0, 0)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, userName);
            stm.setString(2, "new user");
            stm.setString(3, "https://www.kindpng.com/picc/m/22-223863_no-avatar-png-circle-transparent-png.png");
            stm.setString(4, passWord);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}

// TEST CLASS
class Test2 {
    public static void main(String[] args) {
        UserDAO ad = new UserDAO();
        ArrayList<User> list = ad.getUsersByRole(1,1);
//        Entry b = ad.getEntry(5);
        for(User a : list) {
            System.out.println(a.getFullName()+ "\t" +a.getFullName());
        }
//        System.out.println(b.getContent());
    }
}