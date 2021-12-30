package com.auction.auctionwebapp.beans;
import java.time.LocalDateTime;

public class auction {
    private int priceBidder;
    private LocalDateTime timeBid;
    private int idUser;
    private int idProduct;
    private String username;
    private int idAuction;


    public auction(int idUser,int idProduct,int priceBidder, LocalDateTime timeBid, String username, int idAuction)
    {
        this.idUser = idUser;
        this.idProduct=idProduct;
        this.priceBidder = priceBidder;
        this.timeBid = timeBid;
        this.username = username;
        this.idAuction = idAuction;
    }
    public auction(int idUser,int idProduct,int priceBidder)
    {
        this.idUser = idUser;
        this.idProduct=idProduct;
        this.priceBidder = priceBidder;
    }

    public int getIdProduct() {
        return idProduct;
    }

    public void setIdProduct(int idProduct) {
        this.idProduct = idProduct;
    }

    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }

    public int getPriceBidder() {
        return priceBidder;
    }

    public void setPriceBidder(int priceBidder) {
        this.priceBidder = priceBidder;
    }

    public LocalDateTime getTimeBid() {
        return timeBid;
    }

    public void setTimeBid(LocalDateTime timeBid) {
        this.timeBid = timeBid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getIdAuction() {
        return idAuction;
    }

    public void setIdAuction(int idAuction) {
        this.idAuction = idAuction;
    }
}
