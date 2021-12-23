package com.auction.auctionwebapp.beans;

import java.time.LocalDate;
import java.util.Date;

public class myPermission {
    private Integer id;
    private Integer userId;
    private Integer permission;
    private Date startDate;
    private Date endDate;

    public myPermission() {

    }
    public myPermission(Integer userId, Integer permission, Date startDate, Date endDate) {
        this.userId = userId;
        this.permission = permission;
        this.startDate = startDate;
        this.endDate = endDate;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getPermission() {
        return permission;
    }

    public void setPermission(Integer permission) {
        this.permission = permission;
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
