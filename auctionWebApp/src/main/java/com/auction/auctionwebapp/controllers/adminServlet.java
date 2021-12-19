package com.auction.auctionwebapp.controllers;

import com.auction.auctionwebapp.beans.admin;
import com.auction.auctionwebapp.beans.user;
import com.auction.auctionwebapp.beans.category;
import com.auction.auctionwebapp.models.adminModel;
import com.auction.auctionwebapp.models.userModel;
import com.auction.auctionwebapp.models.categoryModel;
import com.auction.auctionwebapp.utils.servletUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "adminServlet", value = "/admin/*")
public class adminServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        if (path == null || path.equals("/")) {
            path = "/index";
        }

        switch (path) {
            case "/index":
                List<user> list = userModel.findAll();
                request.setAttribute("users", list);
                List<user> list1 = userModel.findByRole();
                request.setAttribute("users1", list1);
                servletUtils.forward("/views/vwAdmin/admin.jsp", request, response);
                break;
            case "/login":
                servletUtils.forward("/views/vwLogin/login.jsp", request, response);
                break;
            case "/isAvailable":
                String username = request.getParameter("admin");
                admin admin = adminModel.findByNameAdmin(username);
                boolean isAvailable = (admin == null);
                PrintWriter out = response.getWriter();
                response.setContentType("application/json");
                response.setCharacterEncoding("utf-8");
                out.print(isAvailable);
                out.flush();
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
            case "/login":
                login(request, response);
                break;
            case "/logout":
                logout(request, response);
                break;
            default:
                servletUtils.forward("/views/404.jsp", request, response);
                break;
        }
    }
    private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("user");
        String password = request.getParameter("pass");
        admin admin = adminModel.findByNameAdmin(username);
        if (admin != null) {
            String newPass = admin.getPassword();
            if(newPass.equals(password)){
                HttpSession session = request.getSession();
                session.setAttribute("authAd", true);
                session.setAttribute("authAdmin", admin);
                String url = (String) session.getAttribute("retUrl");
                if (url == null)
                    url = "/admin";
                servletUtils.redirect(url, request, response);
            }
            else {
                request.setAttribute("hasError", true);
                request.setAttribute("errorMessage", "Invalid login.");
                servletUtils.forward("/views/vwLogin/login.jsp", request, response);
            }
        } else {
            request.setAttribute("hasError", true);
            request.setAttribute("errorMessage", "Invalid login.");
            servletUtils.forward("/views/vwLogin/login.jsp", request, response);
        }
    }
    private void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.setAttribute("authAd", false);
        session.setAttribute("authAdmin", new admin());

        String url = request.getHeader("referer");
        if (url == null)
            url = "/admin";
        servletUtils.redirect(url, request, response);
    }
}
