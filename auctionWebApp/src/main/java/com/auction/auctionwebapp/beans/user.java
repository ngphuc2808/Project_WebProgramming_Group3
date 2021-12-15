package com.auction.auctionwebapp.beans;

import java.time.LocalDateTime;

public class user {
    private int idUser;
    private String username, password, name, email, address;
    private LocalDateTime dob;
    private int point, role, queue;

    public user() {
    }

    public user(int idUser, String username, String password, String name, String email, String address, LocalDateTime dob, int point, int role, int queue) {
        this.idUser = idUser;
        this.username = username;
        this.password = password;
        this.name = name;
        this.email = email;
        this.address = address;
        this.dob = dob;
        this.point = point;
        this.role = role;
        this.queue = queue;
    }

    public int getIdUser() {
        return idUser;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    public String getName() {
        return name;
    }

    public String getEmail() {
        return email;
    }


    public String getAddress() {
        return address;
    }

    public LocalDateTime getDob() {
        return dob;
    }

    public int getPoint() {
        return point;
    }

    public int getRole() {
        return role;
    }

    public int getQueue() {
        return queue;
    }
}
