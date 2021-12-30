package com.auction.auctionwebapp.beans;
import java.time.LocalDateTime;

public class auction {
    private int priceBidder;
    private LocalDateTime timeBid;
    private int idUser;
    private int idProduct;


    public auction(int idUser,int idProduct,int priceBidder, LocalDateTime timeBid)
    {
        this.idUser = idUser;
        this.idProduct=idProduct;
        this.priceBidder = priceBidder;
        this.timeBid = timeBid;
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



}
