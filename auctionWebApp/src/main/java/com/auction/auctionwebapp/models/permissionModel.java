package com.auction.auctionwebapp.models;
import com.auction.auctionwebapp.beans.myPermission;
import com.auction.auctionwebapp.beans.user;
import com.auction.auctionwebapp.utils.dbUtils;
import org.sql2o.Connection;

import java.util.List;

public class permissionModel {
    public static myPermission findById(int idUser) {
        final String query = "select * from permission where idUser = :idUser";
        try (Connection con = dbUtils.getConnection()) {
            List<myPermission> list = con.createQuery(query)
                    .addParameter("idUser", idUser)
                    .executeAndFetch(myPermission.class);

            if (list.size() == 0) {
                return null;
            }

            return list.get(0);
        }
    }
}
