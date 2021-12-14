package com.auction.auctionwebapp.models;

import com.auction.auctionwebapp.beans.admin;
import com.auction.auctionwebapp.utils.dbUtils;
import org.sql2o.Connection;

import java.util.List;

public class adminModel {
    public static admin findByNameAdmin(String nameAdmin) {
        final String query = "select * from admin where nameAdmin = :nameAdmin";
        try (Connection con = dbUtils.getConnection()) {
            List<admin> list = con.createQuery(query)
                    .addParameter("nameAdmin", nameAdmin)
                    .executeAndFetch(admin.class);
            if (list.size() == 0) {
                return null;
            }
            return list.get(0);
        }
    }
}