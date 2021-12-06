package com.auction.auctionwebapp.beans;

public class category {
    private int idCategory;
    private String nameCategory;

    public category() {
    }

    public category(int idCategory, String nameCategory) {
        this.idCategory = idCategory;
        this.nameCategory = nameCategory;
    }

    public category(String nameCategory) {
        this.idCategory = -1;
        this.nameCategory = nameCategory;
    }

    public int getIdCategory() {
        return idCategory;
    }

    public String getNameCategory() {
        return nameCategory;
    }
}
