package com.auction.auctionwebapp.beans;



public class Product {
    private int idProduct;
    private int idCategory;
    private String nameProduct;
    private int price;
    private String detail;
    private int quantity;
    private int priceStep;
    private String image,image1,image2,image3;
    private String createdDate;
    private String bidder;
    private String timeRemaining;
    private int timeInserted;

    public Product() {
    }

    public Product(int idProduct, int idCategory, String nameProduct, int price, String detail, int quantity, int priceStep, String image, String image1, String image2, String image3, String createdDate, String bidder, String timeRemaining, int timeInserted) {
        this.idProduct = idProduct;
        this.idCategory = idCategory;
        this.nameProduct = nameProduct;
        this.price = price;
        this.detail = detail;
        this.quantity = quantity;
        this.priceStep = priceStep;
        this.image = image;
        this.image1 = image1;
        this.image2 = image2;
        this.image3 = image3;
        this.createdDate = createdDate;
        this.bidder = bidder;
        this.timeRemaining = timeRemaining;
        this.timeInserted = timeInserted;
    }

    public int getIdProduct() {
        return idProduct;
    }

    public int getIdCategory() {
        return idCategory;
    }

    public String getNameProduct() {
        return nameProduct;
    }

    public int getPrice() {
        return price;
    }

    public String getDetail() {
        return detail;
    }

    public int getQuantity() {
        return quantity;
    }

    public int getPriceStep() {
        return priceStep;
    }

    public String getImage() {
        return image;
    }

    public String getImage1() {
        return image1;
    }

    public String getImage2() {
        return image2;
    }

    public String getImage3() {
        return image3;
    }

    public String getCreatedDate() {
        return createdDate;
    }

    public String getBidder() {
        return bidder;
    }

    public String getTimeRemaining() {
        return timeRemaining;
    }

    public int getTimeInserted() {
        return timeInserted;
    }


    public void setIdProduct(int idProduct) {
        this.idProduct = idProduct;
    }

    public void setIdCategory(int idCategory) {
        this.idCategory = idCategory;
    }

    public void setNameProduct(String nameProduct) {
        this.nameProduct = nameProduct;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public void setPriceStep(int priceStep) {
        this.priceStep = priceStep;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public void setImage1(String image1) {
        this.image1 = image1;
    }

    public void setImage2(String image2) {
        this.image2 = image2;
    }

    public void setImage3(String image3) {
        this.image3 = image3;
    }

    public void setCreatedDate(String createdDate) {
        this.createdDate = createdDate;
    }

    public void setBidder(String bidder) {
        this.bidder = bidder;
    }

    public void setTimeRemaining(String timeRemaining) {
        this.timeRemaining = timeRemaining;
    }

    public void setTimeInserted(int timeInserted) {
        this.timeInserted = timeInserted;
    }
}
