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
public class Shipper {
    private int shipperID;
    private String companyName;
    private String shipperPhone;

    public Shipper() {
    }

    public Shipper(int shipperID, String companyName, String shipperPhone) {
        this.shipperID = shipperID;
        this.companyName = companyName;
        this.shipperPhone = shipperPhone;
    }

    public int getShipperID() {
        return shipperID;
    }

    public void setShipperID(int shipperID) {
        this.shipperID = shipperID;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getShipperPhone() {
        return shipperPhone;
    }

    public void setShipperPhone(String shipperPhone) {
        this.shipperPhone = shipperPhone;
    }
    
    
}
