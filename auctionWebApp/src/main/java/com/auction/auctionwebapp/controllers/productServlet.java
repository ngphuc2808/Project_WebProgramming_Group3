package com.auction.auctionwebapp.controllers;

import com.auction.auctionwebapp.beans.Product;
import com.auction.auctionwebapp.beans.category;
import com.auction.auctionwebapp.models.categoryModel;
import com.auction.auctionwebapp.models.productModel;
import com.auction.auctionwebapp.utils.servletUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "productServlet", value = "/product/*")
public class productServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        switch (path) {
            case "/ByCat":
                int idCat = Integer.parseInt(request.getParameter("id"));
                List<Product> productList = productModel.findByCatID(idCat);
                request.setAttribute("products", productList);
                servletUtils.forward("/views/vwCategory/ByCat.jsp", request, response);
                break;

            default:
                servletUtils.forward("/views/404.jsp", request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}