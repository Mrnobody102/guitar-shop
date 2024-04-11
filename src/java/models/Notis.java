/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

/**
 *
 * @author QUANG HUY
 */
public class Notis {
    private User user;
    private Order vozer;
    private String dateCreate;

    public Notis() {
    }

    public Notis(User user, Order order, String dateCreate) {
        this.user = user;
        this.vozer = vozer;
        this.dateCreate = dateCreate;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Order getOrder() {
        return vozer;
    }

    public void setOrder(Order vozer) {
        this.vozer = vozer;
    }

    public String getDateCreate() {
        return dateCreate;
    }

    public void setDateCreate(String dateCreate) {
        this.dateCreate = dateCreate;
    }
    
    public String getNotiTime() {
        return dateCreate.substring(11,19);
    }
    
    public String getOnlyNotiDate() {
        return  dateCreate.substring(8,10) + "/" + dateCreate.substring(5,7) + "/" + dateCreate.substring(0,4);
    }
}
