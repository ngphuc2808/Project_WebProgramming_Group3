package com.auction.auctionwebapp.controllers;

import com.auction.auctionwebapp.beans.category;
import com.auction.auctionwebapp.models.categoryModel;
import com.auction.auctionwebapp.utils.servletUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "categoryServlet", value = "/category/*")
public class categoryServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        if (path == null || path.equals("/")) {
            path = "/index";
        }

        switch (path) {
            case "/index":
                List<category> list = categoryModel.findAll();
                request.setAttribute("categories", list);
                servletUtils.forward("/views/vwCategory/category.jsp", request, response);
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