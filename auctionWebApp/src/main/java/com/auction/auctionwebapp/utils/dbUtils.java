package com.auction.auctionwebapp.utils;

import org.sql2o.Connection;
import org.sql2o.Sql2o;

public class dbUtils {
    static Sql2o sql2o = new Sql2o("jdbc:mysql://localhost:3306/daugiatructuyen", "qnhut", "Quynhnhut113");
    public static Connection getConnection() {
        return sql2o.open();
    }
}
