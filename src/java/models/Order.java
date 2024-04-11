/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDate;

/**
 *
 * @author QUANG HUY
 */
public class Order {
    private int order;
    private User user;
    private String orderDate;
    private LocalDate requireDate;
    private String shipName;
    private Shipper shipVia;
    private String shipAddress;
    private float shipFreight;
    private LocalDate estimatedShipDate;
    private float totalPrice;

    public Order() {
    }

    public Order(int order, User user, String orderDate, LocalDate requireDate, String shipName, Shipper shipVia, String shipAddress, float shipFreight, LocalDate estimatedShipDate, float totalPrice) {
        this.order = order;
        this.user = user;
        this.orderDate = orderDate;
        this.requireDate = requireDate;
        this.shipName = shipName;
        this.shipVia = shipVia;
        this.shipAddress = shipAddress;
        this.shipFreight = shipFreight;
        this.estimatedShipDate = estimatedShipDate;
        this.totalPrice = totalPrice;
    }

    public LocalDate getEstimatedShipDate() {
        return estimatedShipDate;
    }
    
    public String getEstimatedDay(){
        SimpleDateFormat df = new SimpleDateFormat("dd-MM-yyyy");
        return df.format(Date.valueOf(estimatedShipDate));
    }

    public void setEstimatedShipDate(LocalDate estimatedShipDate) {
        this.estimatedShipDate = estimatedShipDate;
    }

    

    public String getRequireDate() {
        SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");
        return df.format(Date.valueOf(requireDate));
    }

    public void setRequireDate(LocalDate requireDate) {
        this.requireDate = requireDate;
    }

    public String getShipAddress() {
        return shipAddress;
    }

    public void setShipAddress(String shipAddress) {
        this.shipAddress = shipAddress;
    }

    
    
    public int getOrder() {
        return order;
    }

    public void setOrder(int order) {
        this.order = order;
    }

    public String getShipName() {
        return shipName;
    }

    public void setShipName(String shipName) {
        this.shipName = shipName;
    }

    public Shipper getShipVia() {
        return shipVia;
    }

    public void setShipVia(Shipper shipVia) {
        this.shipVia = shipVia;
    }

    public float getShipFreight() {
        return shipFreight;
    }

    public void setShipFreight(float shipFreight) {
        this.shipFreight = shipFreight;
    }

    public float getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(float totalPrice) {
        this.totalPrice = totalPrice;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getOrderTime() {
        return orderDate.substring(11,19);
    }
    
    public String getOnlyOrderDate() {
        return  orderDate.substring(8,10) + "/" + orderDate.substring(5,7) + "/" + orderDate.substring(0,4);
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }
    
    public String getTotalPriceString(){
        String temp = totalPrice + "";
        return temp.substring(0, temp.length() - 5)+"."+ temp.substring(temp.length() - 5, temp.length() - 2);
    }
}
