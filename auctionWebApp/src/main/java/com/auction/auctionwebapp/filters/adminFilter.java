package com.auction.auctionwebapp.filters;

import com.auction.auctionwebapp.utils.servletUtils;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(filterName = "adminFilter")
public class adminFilter implements Filter {
    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest) req;

        HttpSession session = request.getSession();
        boolean auth = (boolean) session.getAttribute("authAd");
        if (!auth) {
            session.setAttribute("retUrl", request.getRequestURI());
            servletUtils.redirect("/admin/login", request, (HttpServletResponse) res);
            return;
        }

        chain.doFilter(req, res);
    }
}
