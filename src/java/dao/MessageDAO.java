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
import models.Message;
import models.Notis;
import models.Order;
import models.User;

/**
 *
 * @author QUANG HUY
 */
public class MessageDAO extends DBContext{
    public void addMes(int from, int to, String content) {
        try {
            String sql = "insert into [Messages](FromID, ToID, Content, DateCreate)"
                    + " values (?, ?, ?, getDate())";
            PreparedStatement stm = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stm.setInt(1, from);
            stm.setInt(2, to);
            stm.setString(3, content);
            stm.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public ArrayList<Message> getMessByUserID(int uId){
        ArrayList<Message> list = new ArrayList<>();
        try{
            String sql = "Select * from Messages where ToID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, uId);
            ResultSet rs = stm.executeQuery();
            while (rs.next())
            {
                Message m = new Message(rs.getInt("MessageID"), rs.getInt("FromID"), rs.getInt("ToID"), rs.getString("Content"), rs.getString("DateCreate"));
                list.add(m);
            }
        }
        catch(Exception ex)
        {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public ArrayList<Message> getMessFromByUserID(int uId){
        ArrayList<Message> list = new ArrayList<>();
        try{
            String sql = "Select * from Messages where ((FromID in (Select u.UserID from Users u where isAdmin = 1 or isSeller = 1)) and ToID = ?) \n" +
"or (FromID = ? and ToID = 1)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, uId);
            stm.setInt(2, uId);
            ResultSet rs = stm.executeQuery();
            while (rs.next())
            {
                Message m = new Message(rs.getInt("MessageID"), rs.getInt("FromID"), rs.getInt("ToID"), rs.getString("Content"), rs.getString("DateCreate"));
                list.add(m);
            }
        }
        catch(Exception ex)
        {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public ArrayList<Message> getMessChatCus(int uId){
        ArrayList<Message> list = new ArrayList<>();
        try{
            String sql = "Select * from Messages where ((FromID in (Select u.UserID from Users u where isAdmin = 1 or isSeller = 1)) and ToID = ?) \n" +
"or (FromID = ? and (ToID in (Select u.UserID from Users u where isAdmin = 1 or isSeller = 1)))";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, uId);
            stm.setInt(2, uId);
            ResultSet rs = stm.executeQuery();
            while (rs.next())
            {
                Message m = new Message(rs.getInt("MessageID"), rs.getInt("FromID"), rs.getInt("ToID"), rs.getString("Content"), rs.getString("DateCreate"));
                list.add(m);
            }
        }
        catch(Exception ex)
        {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public ArrayList<User> getUserWhoHaveMess(){
        ArrayList<User> list = new ArrayList<>();
        try{
            String sql = "select * from Users where UserID in (Select distinct u.UserID from Messages m, Users u where m.FromID = u.UserID and ToID = 1 and u.UserID not in \n" +
"(Select u.UserID from Users u where isAdmin = 1 or isSeller = 1))";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next())
            {
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
        }
        catch(Exception ex)
        {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
}

// TEST CLASS
class Test4 {
    public static void main(String[] args) {
        MessageDAO ad = new MessageDAO();
        ArrayList<Message> list = ad.getMessFromByUserID(6);
//        Entry b = ad.getEntry(5);
        for(Message a : list) {
            System.out.println(a.getContent());
        }
//        System.out.println(b.getContent());
    }
}