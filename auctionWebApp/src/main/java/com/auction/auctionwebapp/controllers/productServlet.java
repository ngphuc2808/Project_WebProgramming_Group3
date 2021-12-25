package com.auction.auctionwebapp.controllers;

import at.favre.lib.crypto.bcrypt.BCrypt;
import com.auction.auctionwebapp.beans.Product;
import com.auction.auctionwebapp.beans.category;
import com.auction.auctionwebapp.beans.myPermission;
import com.auction.auctionwebapp.beans.user;
import com.auction.auctionwebapp.models.categoryModel;
import com.auction.auctionwebapp.models.permissionModel;
import com.auction.auctionwebapp.models.productModel;
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
import java.util.Base64;
import java.util.List;

@WebServlet(name = "productServlet", value = "/product/*")
@MultipartConfig(
        fileSizeThreshold = 2 * 1024 * 1024,
        maxFileSize = 50 * 1024 * 1024,
        maxRequestSize = 50 * 1024 * 1024
)
public class productServlet extends HttpServlet {
    private String dbURL = "jdbc:mysql://localhost:3306/daugiatructuyen";
    private String dbUser = "root";
    private String dbPass = "root";
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
            default:
                servletUtils.forward("/views/404.jsp", request, response);
                break;
        }
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
        Part fileImage = request.getPart("jpgImage");
        String imageStr = toBase64(fileImage.getInputStream());

        user c = userModel.findByUsername(username);
        int id = c.getIdUser();
        if(c != null){
            BCrypt.Result result = BCrypt.verifyer().verify(password.toCharArray(), c.getPassword());
            if (result.verified) {
                if (c.getQueue() == 1) {
                    Product p = new Product(0, idCat, id, nameProduct, price, priceStep, buyNowPrice, detail, imageStr, 0);
                    productModel.add(p);
                    servletUtils.redirect("/category", request, response);
                }
                else {
                    request.setAttribute("Error", true);
                    System.out.println("Error 1");
                    servletUtils.redirect("/views/vwCategory/upload.jsp", request, response);
                    System.out.println("Error 1'");
                }
            }
            else {
                request.setAttribute("Error", true);
                servletUtils.redirect("/views/vwCategory/upload.jsp", request, response);
                System.out.println("Error 2");
            }
        }
        else {
            request.setAttribute("Error", true);
            servletUtils.redirect("/views/vwCategory/upload.jsp", request, response);
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