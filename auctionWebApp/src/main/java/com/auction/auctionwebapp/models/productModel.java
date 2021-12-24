package com.auction.auctionwebapp.models;

import com.auction.auctionwebapp.beans.Product;
import com.auction.auctionwebapp.beans.category;
import com.auction.auctionwebapp.utils.dbUtils;
import org.sql2o.Connection;

import java.util.List;

public class productModel {

        public static List<Product> findAll() {
            final String query = "select * from products";
            try (Connection con = dbUtils.getConnection()) {
                return con.createQuery(query)
                        .executeAndFetch(Product.class);
            }
        }

    public static List<Product> findByCatID(int idCategory) {
        final String query = "select * from products where idCategory = :idCategory";
        try (Connection con = dbUtils.getConnection()) {
            return con.createQuery(query)
                    .addParameter("idCategory", idCategory)
                    .executeAndFetch(Product.class);
        }
    }

    public static List<Product> findAllProductByCategory(int idCategory) {
        final String query = "select * from products where products.idCategory = :category";
        try (Connection con = dbUtils.getConnection()) {
            List<Product> list = con.createQuery(query)
                    .addParameter("idCategory", idCategory)
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

    public static Product findById(int id) {
        final String query = "select * from products where idProduct = :idProduct";
        try (Connection con = dbUtils.getConnection()) {
            List<Product> list = con.createQuery(query)
                    .addParameter("idProduct",id)
                    .executeAndFetch(Product.class);
            if (list.size() == 0) {
                return null;
            }
            return list.get(0);
        }
    }
}
