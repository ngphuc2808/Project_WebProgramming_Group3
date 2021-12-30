package com.auction.auctionwebapp.models;


import com.auction.auctionwebapp.beans.Product;
import com.auction.auctionwebapp.beans.auction;
import com.auction.auctionwebapp.beans.user;
import com.auction.auctionwebapp.utils.dbUtils;
import org.sql2o.Connection;

import java.util.List;

public class auctionModel {
    public static void add(auction au) {
        String insertSql = "insert into auction (idUser, idProduct, priceBidder, timeBid, username) values (:idUser, :idProduct, :priceBidder, :timeBid, :username)";
        try (Connection con = dbUtils.getConnection()) {
            con.createQuery(insertSql)
                    .addParameter("idUser", au.getIdUser())
                    .addParameter("idProduct", au.getIdProduct())
                    .addParameter("priceBidder", au.getPriceBidder())
                    .addParameter("timeBid", au.getTimeBid())
                    .addParameter("username", au.getUsername())
                    .executeUpdate();
        }
    }
    public static void updateAuction(auction au) {
        String insertSql = "update auction set priceBidder= :priceBidder, timeBid = :timeBid where idUser= :idUser and idProduct = :idProduct and username = :username";
        try (Connection con = dbUtils.getConnection()) {
            con.createQuery(insertSql)
                    .addParameter("idUser", au.getIdUser())
                    .addParameter("idProduct", au.getIdProduct())
                    .addParameter("priceBidder", au.getPriceBidder())
                    .addParameter("timeBid", au.getTimeBid())
                    .addParameter("username", au.getUsername())
                    .executeUpdate();
        }
    }

    public static auction findByIdProductAuction(int idProduct)
    {
        final String query = "select * from auction where idProduct = :idProduct";
        try (Connection con = dbUtils.getConnection()) {
            List<auction> list = con.createQuery(query)
                    .addParameter("idProduct", idProduct)
                    .executeAndFetch(auction.class);

            if (list.size() == 0) {
                return null;
            }

            return list.get(0);
        }
    }

    public static List<auction> findByProductID(int idProduct) {
        final String query = "select * from auction where idProduct = :idProduct";
        try (Connection con = dbUtils.getConnection()) {
            return con.createQuery(query)
                    .addParameter("idProduct", idProduct)
                    .executeAndFetch(auction.class);
        }
    }

    public static void delete(int id) {
        String sql = "delete from auction where idUser = :idUser";
        try (Connection con = dbUtils.getConnection()) {
            con.createQuery(sql)
                    .addParameter("idUser", id)
                    .executeUpdate();
        }
    }
}
