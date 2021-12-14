package com.auction.auctionwebapp.beans;

import java.time.LocalDateTime;

public class admin {
    private int idAdmin;
    private String nameAdmin, password;

    public admin() {
    }

    public admin(int idAdmin, String nameAdmin, String password) {
        this.idAdmin = idAdmin;
        this.nameAdmin = nameAdmin;
        this.password = password;
    }

    public int getIdAdmin() {
        return idAdmin;
    }

    public String getNameAdmin() {
        return nameAdmin;
    }

    public String getPassword() {
        return password;
    }
}
