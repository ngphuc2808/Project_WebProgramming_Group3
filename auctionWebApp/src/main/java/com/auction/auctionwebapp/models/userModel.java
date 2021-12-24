package com.auction.auctionwebapp.models;

import com.auction.auctionwebapp.beans.user;
import com.auction.auctionwebapp.utils.dbUtils;
import org.sql2o.Connection;

import java.util.List;

public class userModel {
    public static List<user> findAll() {
        final String query = "select * from users";
        try (Connection con = dbUtils.getConnection()) {
            return con.createQuery(query)
                    .executeAndFetch(user.class);
        }
    }

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
    public static user findByEmail(String email) {
        final String query = "select * from users where email = :email";
        try (Connection con = dbUtils.getConnection()) {
            List<user> list = con.createQuery(query)
                    .addParameter("email", email)
                    .executeAndFetch(user.class);
            if (list.size() == 0) {
                return null;
            }
            return list.get(0);
        }
    }

    public static List<user> findByRole() {
        final String query = "select * from users where role = 1 and queue = 0";
        try (Connection con = dbUtils.getConnection()) {
            return con.createQuery(query)
                    .executeAndFetch(user.class);
        }
    }

    public static user findById(int idUser) {
        final String query = "select * from users where idUser = :idUser";
        try (Connection con = dbUtils.getConnection()) {
            List<user> list = con.createQuery(query)
                    .addParameter("idUser", idUser)
                    .executeAndFetch(user.class);

            if (list.size() == 0) {
                return null;
            }

            return list.get(0);
        }
    }

    public static void add(user c) {
        String insertSql = "insert into users (username, password, name, email, address, dob, point, role, queue) values (:username,:password,:name,:email,:address,:dob,:point,:role,:queue)";
        try (Connection con = dbUtils.getConnection()) {
            con.createQuery(insertSql)
                    .addParameter("username", c.getUsername())
                    .addParameter("password", c.getPassword())
                    .addParameter("name", c.getName())
                    .addParameter("email", c.getEmail())
                    .addParameter("address", c.getAddress())
                    .addParameter("dob", c.getDob())
                    .addParameter("point", c.getPoint())
                    .addParameter("role", c.getRole())
                    .addParameter("queue", c.getQueue())
                    .executeUpdate();
        }
    }
    public static void allowPermission(user c) {
        String updateSql = "update users set role = :role where username = :username";
        try (Connection con = dbUtils.getConnection()) {
            con.createQuery(updateSql)
                    .addParameter("role",c.getRole())
                    .addParameter("username",c.getUsername())
                    .executeUpdate();
        }

    }
    public static void update(user c) {
        String sql = "update users set username = :username, name =:name, email = :email,role = :role, queue = :queue where idUser = :idUser";
        try (Connection con = dbUtils.getConnection()) {
            con.createQuery(sql)
                    .addParameter("idUser", c.getIdUser())
                    .addParameter("username", c.getUsername())
                    .addParameter("name", c.getName())
                    .addParameter("email", c.getEmail())
                    .addParameter("role", c.getRole())
                    .addParameter("queue", c.getQueue())
                    .executeUpdate();
        }
    }

    public static void delete(int id) {
        String sql = "delete from users where idUser = :idUser";
        try (Connection con = dbUtils.getConnection()) {
            con.createQuery(sql)
                    .addParameter("idUser", id)
                    .executeUpdate();
        }
    }
    public static void updateProfile(user c) {
        String sql = "update users set  name =:name, email = :email where idUser = :idUser";
        try (Connection con = dbUtils.getConnection()) {
            con.createQuery(sql)
                    .addParameter("idUser", c.getIdUser())
                    .addParameter("name", c.getName())
                    .addParameter("email", c.getEmail())
                    .executeUpdate();
        }
    }
    public static void updatePassword(user c) {
        System.out.println("ss2");
        String sql = "update users set  password= :password where idUser = :idUser";

        try (Connection con = dbUtils.getConnection()) {
            con.createQuery(sql)
                    .addParameter("idUser", c.getIdUser())
                    .addParameter("password", c.getPassword())
                    .executeUpdate();
        }
    }
}
