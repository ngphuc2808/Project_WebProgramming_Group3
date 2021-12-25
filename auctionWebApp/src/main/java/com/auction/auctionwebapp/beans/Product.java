package com.auction.auctionwebapp.beans;
import java.util.Date;

public class Product {
    private int idProduct;
    private int idCategory;
    private int idUser;
    private String nameProduct;
    private int price;
    private int priceStep;
    private int buyNowPrice;
    private String detail;
    private String image;
    private int timeInserted;
    private Date startDate;
    private Date endDate;
    public Product() {
    }

    public Product(int idProduct, int idCategory, int idUser, String nameProduct, int price, int priceStep, int buyNowPrice, String detail, String image, int timeInserted, Date startDate, Date endDate) {
        this.idProduct = idProduct;
        this.idCategory = idCategory;
        this.idUser = idUser;
        this.nameProduct = nameProduct;
        this.price = price;
        this.priceStep = priceStep;
        this.buyNowPrice = buyNowPrice;
        this.detail = detail;
        this.image = image;
        this.timeInserted = timeInserted;
        this.startDate = startDate;
        this.endDate = endDate;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
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

    public int getPriceStep() {
        return priceStep;
    }

    public void setPriceStep(int priceStep) {
        this.priceStep = priceStep;
    }

    public int getBuyNowPrice() {
        return buyNowPrice;
    }

    public void setBuyNowPrice(int buyNowPrice) {
        this.buyNowPrice = buyNowPrice;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
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
