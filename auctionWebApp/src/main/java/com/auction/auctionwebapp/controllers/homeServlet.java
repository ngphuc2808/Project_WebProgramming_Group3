package com.auction.auctionwebapp.controllers;

import com.auction.auctionwebapp.utils.servletUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "homeServlet", value = "/home/*")
public class homeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        if (path == null || path.equals("/")){
            path = "/index";
        }
        switch (path) {
            case "/index":
                servletUtils.forward("/views/vwHome/index.jsp", request, response);
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
