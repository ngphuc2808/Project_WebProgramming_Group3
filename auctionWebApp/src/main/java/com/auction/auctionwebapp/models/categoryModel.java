package com.auction.auctionwebapp.models;
import com.auction.auctionwebapp.beans.category;
import com.auction.auctionwebapp.utils.dbUtils;
import org.sql2o.Connection;

import java.util.List;

public class categoryModel {
    public static List<category> findAll() {
        final String query = "select * from categories";
        try (Connection con = dbUtils.getConnection()) {
            return con.createQuery(query)
                    .executeAndFetch(category.class);
        }
    }

    public static category findById(int id) {
        final String query = "select * from categories where idCategory = :idCategory";
        try (Connection con = dbUtils.getConnection()) {
            List<category> list = con.createQuery(query)
                    .addParameter("idCategory", id)
                    .executeAndFetch(category.class);
            if (list.size() == 0) {
                return null;
            }
            return list.get(0);
        }
    }
}
