package com.auction.auctionwebapp.models;


import com.auction.auctionwebapp.beans.Product;
import com.auction.auctionwebapp.beans.auction;
import com.auction.auctionwebapp.beans.user;
import com.auction.auctionwebapp.utils.dbUtils;
import org.sql2o.Connection;

import java.util.List;

public class auctionModel {
    public static void add(auction au) {
        String insertSql = "insert into auction (idUser, idProduct, priceBidder, timeBid) values (:idUser, :idProduct, :priceBidder, :timeBid)";
        try (Connection con = dbUtils.getConnection()) {
            con.createQuery(insertSql)
                    .addParameter("idUser", au.getIdUser())
                    .addParameter("idProduct", au.getIdProduct())
                    .addParameter("priceBidder", au.getPriceBidder())
                    .addParameter("timeBid", au.getTimeBid())
                    .executeUpdate();
        }
    }
    public static void updateAuction(auction au) {
        String insertSql = "update auction set priceBidder= :priceBidder, timeBid = :timeBid where idUser= :idUser and idProduct = :idProduct";
        try (Connection con = dbUtils.getConnection()) {
            con.createQuery(insertSql)
                    .addParameter("idUser", au.getIdUser())
                    .addParameter("idProduct", au.getIdProduct())
                    .addParameter("priceBidder", au.getPriceBidder())
                    .addParameter("timeBid", au.getTimeBid())
                    .executeUpdate();
        }
    }

    public static auction byFindIdProductAuction(int idProduct)
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

}
