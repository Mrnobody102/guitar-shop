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
public class Guitar {
    private int guitarID;
    private String guitarName;
    private Category category;
    private Brand brand;
    private float unitPrice;
    private int unitsInStock;
    private String description;
    private String guitarImage;

    public Guitar() {
    }

    public Guitar(int guitarID, String guitarName, Category category, Brand brand, float unitPrice, int unitsInStock, String description, String guitarImage) {
        this.guitarID = guitarID;
        this.guitarName = guitarName;
        this.category = category;
        this.brand = brand;
        this.unitPrice = unitPrice;
        this.unitsInStock = unitsInStock;
        this.description = description;
        this.guitarImage = guitarImage;
    }

    public Brand getBrand() {
        return brand;
    }

    public void setBrand(Brand brand) {
        this.brand = brand;
    }

    public int getGuitarID() {
        return guitarID;
    }

    public void setGuitarID(int guitarID) {
        this.guitarID = guitarID;
    }

    public String getGuitarName() {
        return guitarName;
    }

    public void setGuitarName(String guitarName) {
        this.guitarName = guitarName;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public float getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(float unitPrice) {
        this.unitPrice = unitPrice;
    }

    public int getUnitsInStock() {
        return unitsInStock;
    }

    public void setUnitsInStock(int unitsInStock) {
        this.unitsInStock = unitsInStock;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getGuitarImage() {
        return guitarImage;
    }

    public void setGuitarImage(String guitarImage) {
        this.guitarImage = guitarImage;
    }  
    
    public String getUnitPriceString(){
        return (unitPrice+"").substring(0, (unitPrice+"").length() - 5) + "." + (unitPrice+"").substring((unitPrice+"").length() - 5, (unitPrice+"").length() - 2);
    }
}
