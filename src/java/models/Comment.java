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
public class Comment {
    private int commentID;
    private Guitar guitar;
    private User user;
    private String comment;
    private String dateCreate;

    public Comment() {
    }

    public Comment(int commentID, Guitar guitar, User user, String comment, String dateCreate) {
        this.commentID = commentID;
        this.guitar = guitar;
        this.user = user;
        this.comment = comment;
        this.dateCreate = dateCreate;
    }

    public int getCommentID() {
        return commentID;
    }

    public void setCommentID(int commentID) {
        this.commentID = commentID;
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

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getDateCreate() {
        return dateCreate.substring(8,10) + "/" + dateCreate.substring(5,7) + "/" + dateCreate.substring(0,4);
    }

    public void setDateCreate(String dateCreate) {
        this.dateCreate = dateCreate;
    }
    
    
}
