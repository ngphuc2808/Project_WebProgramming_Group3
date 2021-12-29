package com.auction.auctionwebapp.beans;
import java.sql.Time;
import java.util.Date;
import java.util.Timer;

public class Product {
    private int idProduct;
    private int idCategory;
    private int idUser;
    private String nameProduct;
    private int price;
    private int priceStep;
    private int buyNowPrice;
    private String detail;
    private String image1;
    private String image2;
    private String image3;
    private String image4;
    private int timeInserted;
    private Date startDate;
    private Date endDate;

    public Product(int idProduct, int price) {
        this.idProduct = idProduct;
        this.price = price;
    }

    public Product(int idProduct, int idCategory, int idUser, String nameProduct, int price, int priceStep, int buyNowPrice, String detail, String image1, String image2, String image3, String image4, int timeInserted, Date startDate, Date endDate) {
        this.idProduct = idProduct;
        this.idCategory = idCategory;
        this.idUser = idUser;
        this.nameProduct = nameProduct;
        this.price = price;
        this.priceStep = priceStep;
        this.buyNowPrice = buyNowPrice;
        this.detail = detail;
        this.image1 = image1;
        this.image2 = image2;
        this.image3 = image3;
        this.image4 = image4;
        this.timeInserted = timeInserted;
        this.startDate = startDate;
        this.endDate = endDate;

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

    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
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

    public String getImage1() {
        return image1;
    }

    public void setImage1(String image1) {
        this.image1 = image1;
    }

    public String getImage2() {
        return image2;
    }

    public void setImage2(String image2) {
        this.image2 = image2;
    }

    public String getImage3() {
        return image3;
    }

    public void setImage3(String image3) {
        this.image3 = image3;
    }

    public String getImage4() {
        return image4;
    }

    public void setImage4(String image4) {
        this.image4 = image4;
    }

    public int getTimeInserted() {
        return timeInserted;
    }

    public void setTimeInserted(int timeInserted) {
        this.timeInserted = timeInserted;
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
}
