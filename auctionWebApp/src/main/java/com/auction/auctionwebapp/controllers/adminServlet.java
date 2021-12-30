package com.auction.auctionwebapp.controllers;

import com.auction.auctionwebapp.beans.*;
import com.auction.auctionwebapp.models.*;
import com.auction.auctionwebapp.utils.servletUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@WebServlet(name = "adminServlet", value = "/admin/*")
public class adminServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        if (path == null || path.equals("/")) {
            path = "/empty";
        }

        switch (path) {
            case "/empty":
                servletUtils.forward("/views/vwAdmin/empty.jsp", request, response);
                break;
            case "/index":
                List<user> list = userModel.findAll();
                request.setAttribute("users", list);
                List<user> list1 = userModel.findByRole();
                request.setAttribute("users1", list1);
                List<category> list2 = categoryModel.findAll();
                List<Product> productList = productModel.findAllProduct();
                request.setAttribute("categories", list2);
                request.setAttribute("products", productList);
                servletUtils.forward("/views/vwAdmin/admin.jsp", request, response);
                break;
            case "/login":
                servletUtils.forward("/views/vwLogin/login.jsp", request, response);
                break;
            case  "/edit":
                int id = 0;
                try {
                    id = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException e) {}
                user c = userModel.findById(id);
                if (c != null) {
                    request.setAttribute("user", c);
                    servletUtils.forward("/views/vwLogin/edit.jsp", request, response);
                } else {
                    servletUtils.redirect("/admin/index", request, response);
                }
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
            case "/adminDetails":
                id = 0;
                try {
                    id = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException e) {}
                Product p = productModel.findById(id);
                List<auction> au = auctionModel.findByProductID(id);
                if (p != null && au != null) {
                    request.setAttribute("product", p);
                    request.setAttribute("auctions",au);
                    servletUtils.forward("/views/vwAdmin/productDetail.jsp", request, response);
                } else {
                    servletUtils.redirect("/admin/index", request, response);
                }
                break;
            case "/search":
                List<category> listCat = categoryModel.findAll();
                request.setAttribute("categories", listCat);
                String txtSearch = request.getParameter("txtSearch");
                List<Product> pp = productModel.searchProduct(txtSearch);
                List<Product> pp1 = productModel.searchProductDetail(txtSearch);
                if (pp != null || pp1 != null) {
                    request.setAttribute("products", pp);
                    request.setAttribute("products", pp1);
                    servletUtils.forward("/views/vwAdmin/search.jsp", request, response);
                } else {
                    servletUtils.redirect("/admin/index", request, response);
                }
                break;
            case "/byCatAdmin":
                List<category> pl = categoryModel.findAll();
                request.setAttribute("categories", pl);
                int idCat = 0;
                try {
                    idCat = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException e) {}
                List<Product> ppl = productModel.findByCatID(idCat);
                if (ppl != null) {
                    request.setAttribute("products", ppl);
                    servletUtils.forward("/views/vwAdmin/byCatAdmin.jsp", request, response);
                } else {
                    servletUtils.redirect("/admin/index", request, response);
                }
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
            case "/update":
                updateUser(request, response);
                break;
            case "/delete":
                deleteUser(request, response);
                break;
            case "/deleteProduct":
                deleteProduct(request, response);
                break;
            case "/checkPermission":
                checkPermission(request, response);
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
                    url = "/admin/index";
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
    private void updateUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("idUser"));
        int permission = Integer.parseInt(request.getParameter("queue"));
        int role;
        String username = request.getParameter("username");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        user c = new user();
        Date now = new Date();
        Calendar ca = Calendar.getInstance();
        ca.setTime(now);
        ca.add(Calendar.DATE, 7);
        Date endDate = ca.getTime();
        c.setIdUser(id);
        c.setUsername(username);
        c.setName(name);
        c.setEmail(email);
        c.setQueue(permission);
        if (permission == 1){
            role = 1;
            c.setRole(role);
        }
        else if (permission == 0){
            role = 0;
            c.setRole(role);
        }
        userModel.update(c);

        myPermission pms = permissionModel.findById(id);
        if (pms != null) {
            if (permission == 1) {
                myPermission newPms= new myPermission(id, 1, now, endDate);
                permissionModel.update(newPms);
            } else if ( permission == 0) {
                myPermission newPms = new myPermission(id, 0, null, null);
                permissionModel.update(newPms);
            }
        }
        servletUtils.redirect("/admin/index", request, response);
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("idUser"));
        userModel.delete(id);
        servletUtils.redirect("/admin/index", request, response);
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("idProduct"));
        productModel.delete(id);
        servletUtils.redirect("/admin/index", request, response);
    }

    public void checkPermission(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("idUser"));
        myPermission pms = permissionModel.findById(id);
        if (pms == null) {
            myPermission newPms = new myPermission(id, 0, null, null);
            permissionModel.update(newPms);
        }

        Date now = new Date();

        if (pms.getPermission() == 0) {
            myPermission newPms = new myPermission(id, 0, null, null);
            permissionModel.update(newPms);
        }

        if (pms.getEndDate() == null || now.getTime() > pms.getEndDate().getTime()) {
            myPermission newPms = new myPermission(id, 0, null, null);
            permissionModel.update(newPms);
            user c = new user();
            c.setRole(1);
            c.setQueue(1);
            userModel.update(c);
        }

        servletUtils.redirect("/admin/index", request, response);
    }
}