package com.auction.auctionwebapp.beans;



public class Product {
    private int idProduct;
    private int idCategory;
    private String nameProduct;
    private int price;
    private String detail;
    private int quantity;
    private int priceStep;
    private String image;
    private String createdDate;
    private String bidder;
    private String timeRemaining;
    private int timeInserted;

    public Product() {
    }

    public Product(int idProduct, int idCategory, String nameProduct, int price, String detail, int quantity,
                   int priceStep, String image, String createdDate, String bidder, String timeRemaining, int timeInserted) {
        this.idProduct = idProduct;
        this.idCategory = idCategory;
        this.nameProduct = nameProduct;
        this.price = price;
        this.detail = detail;
        this.quantity = quantity;
        this.priceStep = priceStep;
        this.image = image;
        this.createdDate = createdDate;
        this.bidder = bidder;
        this.timeRemaining = timeRemaining;
        this.timeInserted = timeInserted;
    }

    public String getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(String createdDate) {
        this.createdDate = createdDate;
    }

    public String getBidder() {
        return bidder;
    }

    public void setBidder(String bidder) {
        this.bidder = bidder;
    }

    public String getTimeRemaining() {
        return timeRemaining;
    }

    public void setTimeRemaining(String timeRemaining) {
        this.timeRemaining = timeRemaining;
    }

    public int getIdProduct() {
        return idProduct;
    }

    public void setIdProduct(int idProduct) {
        this.idProduct = idProduct;
    }

    public int getIdCategory() {
        return idCategory;
    }

    public void setIdCategory(int idCategory) {
        this.idCategory = idCategory;
    }

    public String getNameProduct() {
        return nameProduct;
    }

    public void setNameProduct(String nameProduct) {
        this.nameProduct = nameProduct;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getPriceStep() {
        return priceStep;
    }

    public void setPriceStep(int priceStep) {
        this.priceStep = priceStep;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getTimeInserted() {
        return timeInserted;
    }

    public void setTimeInserted(int timeInserted) {
        this.timeInserted = timeInserted;
    }
}
