package com.auction.auctionwebapp.models;

import com.auction.auctionwebapp.beans.Product;
import com.auction.auctionwebapp.utils.dbUtils;
import org.sql2o.Connection;

import java.util.List;

public class productModel {

    public static List<Product> findAllProductByCategory(int category) {
        final String query = "select * from products where products.idCategory = :category";
        try (Connection con = dbUtils.getConnection()) {
            List<Product> list = con.createQuery(query)
                    .addParameter("category", category)
                    .executeAndFetch(Product.class);
            if (list.size() == 0) {
                return null;
            }
            return list;
        }
    }


    public static List<Product> findAllProduct() {
        final String query = "select * from products order by timeInserted";
        try (Connection con = dbUtils.getConnection()) {
            List<Product> list = con.createQuery(query)
                    .executeAndFetch(Product.class);
            if (list.size() == 0) {
                return null;
            }
            return list;
        }
    }
}
