package com.auction.auctionwebapp.beans;

import java.time.LocalDate;

public class myPermission {
    private int idUser, permission;
    private LocalDate startDate, endDate;

    public myPermission() {
    }

    public myPermission(int idUser, int permission, LocalDate startDate, LocalDate endDate) {
        this.idUser = idUser;
        this.permission = permission;
        this.startDate = startDate;
        this.endDate = endDate;
    }

    public int getIdUser() {
        return idUser;
    }

    public int getPermission() {
        return permission;
    }

    public LocalDate getStartDate() {
        return startDate;
    }

    public LocalDate getEndDate() {
        return endDate;
    }
}
