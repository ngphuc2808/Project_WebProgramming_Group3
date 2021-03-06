package com.auction.auctionwebapp.controllers;

import com.auction.auctionwebapp.utils.servletUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "DefaultServlet", value = "/")
public class defaultServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        servletUtils.forward("/views/404.jsp", request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        servletUtils.forward("/views/404.jsp", request, response);
    }
}
