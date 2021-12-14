package com.auction.auctionwebapp.models;

import com.auction.auctionwebapp.beans.user;
import com.auction.auctionwebapp.utils.dbUtils;
import org.sql2o.Connection;

import java.util.List;

public class userModel {
    public static user findByUsername(String username) {
        final String query = "select * from users where username = :username";
        try (Connection con = dbUtils.getConnection()) {
            List<user> list = con.createQuery(query)
                    .addParameter("username", username)
                    .executeAndFetch(user.class);
            if (list.size() == 0) {
                return null;
            }
            return list.get(0);
        }
    }

    public static void add(user c) {
        String insertSql = "insert into users (username, password, name, email, phone, address, dob, point, role, queue) values (:username,:password,:name,:email,:phone,:address,:dob,:point,:role,:queue)";
        try (Connection con = dbUtils.getConnection()) {
            con.createQuery(insertSql)
                    .addParameter("username", c.getUsername())
                    .addParameter("password", c.getPassword())
                    .addParameter("name", c.getName())
                    .addParameter("email", c.getEmail())
                    .addParameter("phone", c.getPhone())
                    .addParameter("address", c.getAddress())
                    .addParameter("dob", c.getDob())
                    .addParameter("point", c.getPoint())
                    .addParameter("role", c.getRole())
                    .addParameter("queue", c.getQueue())
                    .executeUpdate();
        }
    }
}