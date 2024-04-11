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
public class Message {
    private int messageID;
    private int fromID;
    private int toID;
    private String content;
    private String dateCreate;

    public Message() {
    }

    public Message(int messageID, int fromID, int toID, String content, String dateCreate) {
        this.messageID = messageID;
        this.fromID = fromID;
        this.toID = toID;
        this.content = content;
        this.dateCreate = dateCreate;
    }

    public int getMessageID() {
        return messageID;
    }

    public void setMessageID(int messageID) {
        this.messageID = messageID;
    }

    public int getFromID() {
        return fromID;
    }

    public void setFromID(int fromID) {
        this.fromID = fromID;
    }

    public int getToID() {
        return toID;
    }

    public void setToID(int toID) {
        this.toID = toID;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getDateCreate() {
        return dateCreate;
    }

    public void setDateCreate(String dateCreate) {
        this.dateCreate = dateCreate;
    }
    
    public String getMesDateCreate() {
        return dateCreate.substring(11,19);
    }
}
