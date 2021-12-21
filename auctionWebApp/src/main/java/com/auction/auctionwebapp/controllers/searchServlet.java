package com.auction.auctionwebapp.controllers;

import com.auction.auctionwebapp.beans.Product;
import com.auction.auctionwebapp.models.productModel;
import com.auction.auctionwebapp.utils.servletUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "searchServlet", value = "/search")
public class searchServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> productList = new ArrayList<>();
        if (request.getParameter("category") != null) {
            int category;
            try {
                category = Integer.parseInt(request.getParameter("category"));
                productList = productModel.findAllProductByCategory(category);
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        } else {
            productList = productModel.findAllProduct();
        }
        request.setAttribute("productList", productList);
        servletUtils.forward("/views/vwProduct/list_product.jsp", request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}