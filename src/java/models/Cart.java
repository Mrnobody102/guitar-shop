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
public class Cart {
    private Guitar guitar;
    private int quantity;

    public Cart() {
    }

    public Cart(Guitar guitar, int quantity) {
        this.guitar = guitar;
        this.quantity = quantity;
    }

    public Guitar getGuitar() {
        return guitar;
    }

    public void setGuitar(Guitar guitar) {
        this.guitar = guitar;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    
    public String getSumPriceString(){
        double price = guitar.getUnitPrice()*quantity;
        String temp = price + "";
        return (price > 0 ? (temp.substring(0, temp.length() - 5) + "." + temp.substring(temp.length() - 5, temp.length() - 2) + ".000đ") : (price+"").substring(0, 1) + "đ");
    }
}
