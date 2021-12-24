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
            case "/Details":
                int proId = Integer.parseInt(request.getParameter("id"));
                Product product = productModel.findById(proId);

                if (product != null){
                    request.setAttribute("product",product);
                    servletUtils.forward("/views/vwCategory/Detail.jsp",request,response);

                }
                else {
                    servletUtils.redirect("/category/index",request,response);
                }

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