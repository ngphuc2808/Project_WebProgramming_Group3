package com.auction.auctionwebapp.models;

import com.auction.auctionwebapp.beans.Product;
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
    public static void add(Product p) {
        String insertSql = "insert into products (idCategory, idUser, nameProduct, price, priceStep, buyNowPrice, detail, image, timeInserted) values (:idCategory,:idUser,:nameProduct,:price,:priceStep,:buyNowPrice,:detail,:image,:timeInserted)";
        try (Connection con = dbUtils.getConnection()) {
            con.createQuery(insertSql)
                    .addParameter("idCategory", p.getIdCategory())
                    .addParameter("nameProduct", p.getNameProduct())
                    .addParameter("idUser",p.getIdUser())
                    .addParameter("price", p.getPrice())
                    .addParameter("priceStep", p.getPriceStep())
                    .addParameter("buyNowPrice", p.getBuyNowPrice())
                    .addParameter("detail", p.getDetail())
                    .addParameter("image", p.getImage())
                    .addParameter("timeInserted", p.getTimeInserted())
                    .executeUpdate();
        }
    }
}
