package com.auction.auctionwebapp.controllers;

import at.favre.lib.crypto.bcrypt.BCrypt;
import com.auction.auctionwebapp.beans.Product;
import com.auction.auctionwebapp.beans.favorite;
import com.auction.auctionwebapp.beans.auction;
import com.auction.auctionwebapp.beans.category;
import com.auction.auctionwebapp.beans.myPermission;
import com.auction.auctionwebapp.beans.user;
import com.auction.auctionwebapp.models.categoryModel;
import com.auction.auctionwebapp.models.permissionModel;
import com.auction.auctionwebapp.models.productModel;
import com.auction.auctionwebapp.models.favoriteModel;
import com.auction.auctionwebapp.models.auctionModel;
import com.auction.auctionwebapp.models.userModel;
import com.auction.auctionwebapp.utils.servletUtils;
import org.apache.commons.io.IOUtils;


import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.InputStream;
import java.sql.DriverManager;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;

@WebServlet(name = "productServlet", value = "/product/*")
@MultipartConfig(
        fileSizeThreshold = 2 * 1024 * 1024,
        maxFileSize = 50 * 1024 * 1024,
        maxRequestSize = 50 * 1024 * 1024
)
public class productServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        switch (path) {
            case "/byCat":
                List<category> list = categoryModel.findAll();
                request.setAttribute("categories", list);
                int idCat = 0;
                try {
                    idCat = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException e) {}
                List<Product> productList = productModel.findByCatID(idCat);
                if (productList != null) {
                    request.setAttribute("products", productList);
                    servletUtils.forward("/views/vwCategory/byCat.jsp", request, response);
                } else {
                    servletUtils.redirect("/category/index", request, response);
                }
                break;
            case "/details":
                int id = 0;
                try {
                    id = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException e) {}
                Product p = productModel.findById(id);
                List<auction> au = auctionModel.findByProductID(id);
                if (p != null && au != null) {
                    request.setAttribute("product", p);
                    request.setAttribute("auctions",au);
                    servletUtils.forward("/views/vwCategory/detail.jsp", request, response);
                } else {
                    servletUtils.redirect("/category/index", request, response);
                }
                break;
            case "/editProduct":
                id = 0;
                try {
                    id = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException e) {}
                p = productModel.findById(id);
                au = auctionModel.findByProductID(id);
                if (p != null && au != null) {
                    request.setAttribute("product", p);
                    request.setAttribute("auctions",au);
                    request.setAttribute("auction",au);
                    servletUtils.forward("/views/vwAccount/editProduct.jsp", request, response);
                } else {
                    servletUtils.redirect("/category/index", request, response);
                }
                break;
            case "/deleteBidder":
                id = 0;
                try {
                    id = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException e) {}
                p = productModel.findById(id);
                au = auctionModel.findByProductID(id);
                if (p != null && au != null) {
                    request.setAttribute("product", p);
                    request.setAttribute("auctions",au);
                    servletUtils.forward("/views/vwAccount/deleteBidder.jsp", request, response);
                } else {
                    servletUtils.redirect("/category/index", request, response);
                }
                break;
            case "/upload":
                List<category> list1 = categoryModel.findAll();
                request.setAttribute("categories", list1);
                servletUtils.forward("/views/vwCategory/upload.jsp", request, response);
                break;
            default:
                servletUtils.forward("/views/404.jsp", request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        switch (path) {
            case "/upload":
                uploadProduct(request, response);
                break;
            case "/details":
                System.out.println("details post");
                updatePrice(request,response);
                break;
            case "/delete":
                deleteUser(request, response);
                break;
            case "/addFavorite":
                getFavorite(request, response);
                break;
            default:
                servletUtils.forward("/views/404.jsp", request, response);
                break;
        }
    }
    private void getFavorite(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idUser = Integer.parseInt(request.getParameter("idUser"));
        int idProduct = Integer.parseInt(request.getParameter("idProduct"));
        Product p = productModel.findById(idProduct);
        if(p != null){
            favorite f = new favorite(idProduct, idUser, p.getNameProduct(), p.getBuyNowPrice(), p.getDetail(), p.getImage1(), p.getImage2(), p.getImage3(), p.getImage4());
            favoriteModel.add(f);
        }
        servletUtils.redirect("/home", request, response);
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("idUser"));
        auctionModel.delete(id);
        servletUtils.redirect("/home", request, response);
    }

    private void uploadProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        int idCat = Integer.parseInt(request.getParameter("idCategory"));
        String nameProduct = request.getParameter("nameProduct");
        int price = Integer.parseInt(request.getParameter("startingPrice"));
        int priceStep = Integer.parseInt(request.getParameter("priceStep"));
        int buyNowPrice = Integer.parseInt(request.getParameter("buyNowPrice"));
        String detail = request.getParameter("detail");
        Part fileImage1 = request.getPart("jpgImage1");
        String imageStr1 = toBase64(fileImage1.getInputStream());
        Part fileImage2 = request.getPart("jpgImage2");
        String imageStr2 = toBase64(fileImage2.getInputStream());
        Part fileImage3 = request.getPart("jpgImage3");
        String imageStr3 = toBase64(fileImage3.getInputStream());
        Part fileImage4 = request.getPart("jpgImage4");
        String imageStr4 = toBase64(fileImage4.getInputStream());
        Date now = new Date();
        Calendar ca = Calendar.getInstance();
        ca.setTime(now);
        ca.add(Calendar.DATE, 7);
        Date endDate = ca.getTime();
        user c = userModel.findByUsername(username);
        int id = c.getIdUser();
        if(c != null){
            BCrypt.Result result = BCrypt.verifyer().verify(password.toCharArray(), c.getPassword());
            if (result.verified) {
                if (c.getQueue() == 1 && priceStep < price && price < buyNowPrice) {
                    Product p = new Product(0, idCat, id, nameProduct, price, priceStep, buyNowPrice, detail, imageStr1, imageStr2, imageStr3, imageStr4, 0, now, endDate);
                    productModel.add(p);
                    servletUtils.redirect("/category", request, response);
                }
                else {
                    request.setAttribute("Error", true);
                    servletUtils.redirect("/product/upload", request, response);
                }
            }
            else {
                request.setAttribute("Error", true);
                servletUtils.redirect("/product/upload", request, response);
            }
        }
        else {
            request.setAttribute("Error", true);
            servletUtils.redirect("/product/upload", request, response);
        }
    }

    private void updatePrice(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
        System.out.println("load update price");

        int idProduct = Integer.parseInt(request.getParameter("id"));
        System.out.println(idProduct);

        int idUser = Integer.parseInt(request.getParameter("idUser"));
        System.out.println(idUser);

        int price = Integer.parseInt(request.getParameter("currentPrice"));
        System.out.println(price);

        String username = request.getParameter("username");

       LocalDateTime timeBid = LocalDateTime.now();
       System.out.println(timeBid);

       int idAuction = (idUser*5) + idProduct ;

        auction findIdAuction = auctionModel.findByIdAuction(idAuction);
        auction au = auctionModel.findByIdProductAuction(idProduct);
        Product product = new Product(idProduct,price);
        Product p = productModel.findById(idProduct);


        if(p!=null) {
            productModel.update_highPrice(product);
            System.out.println(" update succeed price");


                auction a = new auction(idUser,idProduct,price,timeBid,username,idAuction);
                if(findIdAuction == null)
                {
                    auctionModel.add(a);
                    System.out.println("not find id  auction");
                }
                else {
                    System.out.println("find by id auction");
                    auctionModel.updateAuction(a);
                }

                System.out.println("update succed auction");
                servletUtils.redirect("/category", request, response);

        }
        else {
            System.out.println("fail");
            request.setAttribute("Error", true);
            servletUtils.redirect("/home", request, response);
        }
    }

    public String toBase64(InputStream inputStream) {
        try {
            byte[] bytes = IOUtils.toByteArray(inputStream);
            return Base64.getEncoder().encodeToString(bytes);
        } catch (Exception e) {
            e.printStackTrace();
            return "";
        }
    }
}