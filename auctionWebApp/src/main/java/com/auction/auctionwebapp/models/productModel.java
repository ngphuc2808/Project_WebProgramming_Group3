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

    public static List<Product> findByUserID(int idUser) {
        final String query = "select * from products where idUser = :idUser";
        try (Connection con = dbUtils.getConnection()) {
            return con.createQuery(query)
                    .addParameter("idUser", idUser)
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

    public static List<Product> searchProduct(String nameProduct) {
        final String query = "SELECT * FROM products WHERE MATCH(nameProduct) AGAINST(:nameProduct);";
        try (Connection con = dbUtils.getConnection()) {
            List<Product> list = con.createQuery(query)
                    .addParameter("nameProduct", nameProduct)
                    .executeAndFetch(Product.class);
            if (list.size() == 0) {
                return null;
            }
            return list;
        }
    }

    public static List<Product> searchProductDetail(String detail) {
        final String query = "SELECT * FROM products WHERE MATCH(detail) AGAINST(:detail);";
        try (Connection con = dbUtils.getConnection()) {
            List<Product> list = con.createQuery(query)
                    .addParameter("detail", detail)
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
        String insertSql = "insert into products (idCategory, idUser, nameProduct, price, priceStep, buyNowPrice, detail, image1, image2, image3, image4, timeInserted, startDate, endDate) values (:idCategory,:idUser,:nameProduct,:price,:priceStep,:buyNowPrice,:detail,:image1,:image2,:image3,:image4,:timeInserted,:startDate,:endDate)";
        try (Connection con = dbUtils.getConnection()) {
            con.createQuery(insertSql)
                    .addParameter("idCategory", p.getIdCategory())
                    .addParameter("nameProduct", p.getNameProduct())
                    .addParameter("idUser",p.getIdUser())
                    .addParameter("price", p.getPrice())
                    .addParameter("priceStep", p.getPriceStep())
                    .addParameter("buyNowPrice", p.getBuyNowPrice())
                    .addParameter("detail", p.getDetail())
                    .addParameter("image1", p.getImage1())
                    .addParameter("image2", p.getImage2())
                    .addParameter("image3", p.getImage3())
                    .addParameter("image4", p.getImage4())
                    .addParameter("timeInserted", p.getTimeInserted())
                    .addParameter("startDate", p.getStartDate())
                    .addParameter("endDate", p.getEndDate())
                    .executeUpdate();
        }
    }

    public static Product findById (int idProduct){
        final String query = "select * from products where idProduct = :idProduct";
        try (Connection con = dbUtils.getConnection()) {
            List<Product> list = con.createQuery(query)
                    .addParameter("idProduct",idProduct)
                    .executeAndFetch(Product.class);
            if (list.size() == 0) {
                return null;
            }
            return list.get(0);
        }
    }

    public static void delete(int idProduct) {
        String sql = "delete from products where idProduct = :idProduct";
        try (Connection con = dbUtils.getConnection()) {
            con.createQuery(sql)
                    .addParameter("idProduct", idProduct)
                    .executeUpdate();
        }
    }
    public static void update_highPrice(Product p) {
        String sql = "update products set  price =:price where idProduct = :idProduct";
        try (Connection con = dbUtils.getConnection()) {
            con.createQuery(sql)
                    .addParameter("idProduct", p.getIdProduct())
                    .addParameter("price", p.getPrice())
                    .executeUpdate();
        }
    }
}
