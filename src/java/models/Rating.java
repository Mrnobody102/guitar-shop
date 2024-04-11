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
public class Rating {
    private int ratingID;
    private Guitar guitar;
    private User user;
    private int rate;
    int isFavor;

    public Rating() {
    }

    public Rating(int ratingID, Guitar guitar, User user, int rate, int isFavor) {
        this.ratingID = ratingID;
        this.guitar = guitar;
        this.user = user;
        this.rate = rate;
        this.isFavor = isFavor;
    }

    public int getIsFavor() {
        return isFavor;
    }

    public void setIsFavor(int isFavor) {
        this.isFavor = isFavor;
    }

    

    public int getRatingID() {
        return ratingID;
    }

    public void setRatingID(int ratingID) {
        this.ratingID = ratingID;
    }

    public Guitar getGuitar() {
        return guitar;
    }

    public void setGuitar(Guitar guitar) {
        this.guitar = guitar;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public int getRate() {
        return rate;
    }

    public void setRate(int rate) {
        this.rate = rate;
    }
    
    
}
