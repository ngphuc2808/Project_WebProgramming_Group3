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
import javax.servlet.http.HttpSession;
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
            case "/becomeStore":
                servletUtils.forward("/views/vwAccount/become_store.jsp", request, response);
                break;
            case "/isAvailable":
                String username = request.getParameter("user");
                user user = userModel.findByUsername(username);
                boolean isAvailable = (user == null);
                System.out.println("Username" + " " + isAvailable);
                PrintWriter out = response.getWriter();
                response.setContentType("application/json");
                response.setCharacterEncoding("utf-8");
                out.print(isAvailable);
                out.flush();
                break;
            case "/isAvailableEmail":
                String email = request.getParameter("mail");
                user mail = userModel.findByEmail(email);
                boolean isAvailableEmail = (mail == null);
                System.out.println("Mail" + " " + isAvailableEmail);
                PrintWriter outl = response.getWriter();
                response.setContentType("application/json");
                response.setCharacterEncoding("utf-8");
                outl.print(isAvailableEmail);
                outl.flush();
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
            case "/register":
                registerUser(request, response);
                break;

            case "/login":
                login(request, response);
                break;

            case "/becomeStore":
                permission(request, response);
                break;

            case "/logout":
                logout(request, response);
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

        int point = 0;
        int role = 0;
        int queue = 0;

        user c = new user(0, username, bcryptHashString, name, email, address, dob, point, role, queue);
        userModel.add(c);
        servletUtils.forward("/views/vwLogin/register.jsp", request, response);
    }
    private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("user");
        String password = request.getParameter("pass");

        user user = userModel.findByUsername(username);
        if (user != null) {
            BCrypt.Result result = BCrypt.verifyer().verify(password.toCharArray(), user.getPassword());
            if (result.verified) {
                HttpSession session = request.getSession();
                session.setAttribute("auth", true);
                session.setAttribute("authUser", user);

                String url = (String) session.getAttribute("retUrl");
                if (url == null)
                    url = "/home";
                servletUtils.redirect(url, request, response);
            } else {
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
        session.setAttribute("auth", false);
        session.setAttribute("authUser", new user());

        String url = request.getHeader("referer");
        if (url == null)
            url = "/home";
        servletUtils.redirect(url, request, response);
    }
    private void permission(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        int role = 1;
        user user = userModel.findByUsername(username);
        if (user != null) {
            BCrypt.Result result = BCrypt.verifyer().verify(password.toCharArray(), user.getPassword());
            if (result.verified) {
                user c = new user();
                c.setUsername(username);
                c.setRole(role);
                userModel.allowPermission(c);
                servletUtils.redirect("/account/becomeStore", request, response);
            } else {
                request.setAttribute("Error", true);
                servletUtils.forward("/account/becomeStore", request, response);
            }
        } else {
            request.setAttribute("Error", true);
            servletUtils.forward("/account/becomeStore", request, response);
        }
    }
}