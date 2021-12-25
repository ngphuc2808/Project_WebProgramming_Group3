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
    public  user(int idUser, String name, String email)
    {
        this.idUser = idUser;
        this.name = name;
        this.email = email;
    }

    public user(int idUser, String password)
    {
        this.idUser = idUser;
        this.password = password;
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

    public void setUsername(String username) {
        this.username = username;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public void setQueue(int queue) {
        this.queue = queue;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setDob(LocalDateTime dob) {
        this.dob = dob;
    }

    public void setPoint(int point) {
        this.point = point;
    }
}
