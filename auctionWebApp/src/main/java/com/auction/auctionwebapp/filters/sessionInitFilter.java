package com.auction.auctionwebapp.filters;

import com.auction.auctionwebapp.beans.user;
import com.auction.auctionwebapp.beans.admin;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(filterName = "sessionInitFilter")
public class sessionInitFilter implements Filter {
    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpSession session = request.getSession();
        if (session.getAttribute("auth") == null) {
            session.setAttribute("auth", false);
            session.setAttribute("authUser", new user());
        }
        if (session.getAttribute("authAd") == null) {
            session.setAttribute("authAd", false);
            session.setAttribute("authAdmin", new admin());
        }
        chain.doFilter(req, res);
    }
}
