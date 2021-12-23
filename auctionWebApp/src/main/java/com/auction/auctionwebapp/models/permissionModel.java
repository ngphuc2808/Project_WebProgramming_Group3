package com.auction.auctionwebapp.models;
import com.auction.auctionwebapp.beans.myPermission;
import com.auction.auctionwebapp.beans.user;
import com.auction.auctionwebapp.utils.dbUtils;
import org.sql2o.Connection;

import java.util.List;

public class permissionModel {
    public static myPermission findById(int userId) {
        final String query = "select * from permission where userId = :userId";
        try (Connection con = dbUtils.getConnection()) {
            List<myPermission> list = con.createQuery(query)
                    .addParameter("userId", userId)
                    .executeAndFetch(myPermission.class);

            if (list.size() == 0) {
                return null;
            }

            return list.get(0);
        }
    }

    public static void create(myPermission p) {
        Connection conn = dbUtils.getConnection();

        conn.createQuery("INSERT INTO permission (userId, permission, startDate, endDate) " +
                        "VALUES (:userId, :permission, :startDate, :endDate)")
                .addParameter("userId", p.getUserId())
                .addParameter("permission", p.getPermission())
                .addParameter("startDate", p.getStartDate())
                .addParameter("endDate", p.getEndDate())
                .executeUpdate();
    }

    public static void update(myPermission p) {
        Connection conn = dbUtils.getConnection();

        conn.createQuery("UPDATE permission SET userId = :userId, permission = :permission, startDate = :startDate, endDate = :endDate WHERE userId = :userId")
                .addParameter("userId", p.getUserId())
                .addParameter("permission", p.getPermission())
                .addParameter("startDate", p.getStartDate())
                .addParameter("endDate", p.getEndDate())
                .executeUpdate();
    }
}
