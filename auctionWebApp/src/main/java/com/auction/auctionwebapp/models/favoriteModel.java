package com.auction.auctionwebapp.models;
import com.auction.auctionwebapp.beans.Product;
import com.auction.auctionwebapp.beans.favorite;
import com.auction.auctionwebapp.beans.user;
import com.auction.auctionwebapp.utils.dbUtils;
import org.sql2o.Connection;

import java.util.List;

public class favoriteModel {
    public static void add(favorite f) {
        String insertSql = "insert into favorite (idProduct, idUser, nameProduct, buyNowPrice, detail, image1, image2, image3, image4) values (:idProduct,:idUser,:nameProduct,:buyNowPrice,:detail,:image1,:image2,:image3,:image4)";
        try (Connection con = dbUtils.getConnection()) {
            con.createQuery(insertSql)
                    .addParameter("idProduct", f.getIdProduct())
                    .addParameter("idUser", f.getIdUser())
                    .addParameter("nameProduct", f.getNameProduct())
                    .addParameter("buyNowPrice", f.getBuyNowPrice())
                    .addParameter("detail", f.getDetail())
                    .addParameter("image1", f.getImage1())
                    .addParameter("image2", f.getImage2())
                    .addParameter("image3", f.getImage3())
                    .addParameter("image4", f.getImage4())
                    .executeUpdate();
        }
    }

    public static List<favorite> findByUserID(int idUser) {
        final String query = "select * from favorite where idUser = :idUser";
        try (Connection con = dbUtils.getConnection()) {
            return con.createQuery(query)
                    .addParameter("idUser", idUser)
                    .executeAndFetch(favorite.class);
        }
    }
}
