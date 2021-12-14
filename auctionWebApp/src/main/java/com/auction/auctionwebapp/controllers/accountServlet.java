package com.auction.auctionwebapp.controllers;

import at.favre.lib.crypto.bcrypt.BCrypt;
import com.auction.auctionwebapp.beans.user;
import com.auction.auctionwebapp.models.userModel;
import com.auction.auctionwebapp.utils.servletUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@WebServlet(name = "accountServlet", value = "/account/*")
public class accountServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        System.out.println("Hello");
        switch (path) {
            case "/register":
                servletUtils.forward("/views/vwLogin/register.jsp", request, response);
                break;
            case "/login":
                servletUtils.forward("/views/vwLogin/login.jsp", request, response);
                break;
            case "/profile":
                servletUtils.forward("/views/vwAccount/infoAccount.jsp", request, response);
                break;
            case "/address":
                servletUtils.forward("/views/vwAccount/address.jsp", request, response);
                break;
            case "/isAvailable":
                String username = request.getParameter("user");
                user user = userModel.findByUsername(username);
                boolean isAvailable = (user == null);
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
        System.out.println("ABC");
        switch (path) {
            case "/register":
                registerUser(request, response);
                break;

            case "/login":
//                login(request, response);
                break;

            case "/logout":
//                logout(request, response);
                break;

            default:
                servletUtils.forward("/views/404.jsp", request, response);
                break;
        }
    }
    private void registerUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String rawPass = request.getParameter("password");
        String bcryptHashString = BCrypt.withDefaults().hashToString(12, rawPass.toCharArray());

        String strDob = request.getParameter("dob") + " 00:00";
        DateTimeFormatter df = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm");
        LocalDateTime dob = LocalDateTime.parse(strDob, df);

        String username = request.getParameter("username");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");

        int point = 0;
        int role = 0;
        int queue = 0;

        user c = new user(0, username, bcryptHashString, name, email, phone, address, dob, point, role, queue);
        userModel.add(c);
        servletUtils.forward("/views/vwLogin/register.jsp", request, response);
    }
}
