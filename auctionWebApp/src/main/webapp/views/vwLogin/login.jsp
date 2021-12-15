<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Đăng nhập</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/public/css/login.css">
</head>
<body>
<h1>AUCTION.COM</h1>
<div class="login">
    <div class="form">
        <c:if test="${hasError}">
            <div style="margin-bottom: 30px; margin-left: 80px" role="alert">
                <strong>Login failed!</strong> ${errorMessage}
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
        </c:if>
        <form action="" method="post" >
            <h3>ĐĂNG NHẬP</h3>
            <input type="text" id="txtUsername" name="username" autofocus placeholder="Username">
            <input type="password" id="txtPassword" name="password" placeholder="Password">
            <a href="">Quên mật khẩu</a>
            <p><button type="submit">ĐĂNG NHẬP</button></p>
        </form>
        <div class="register">
            <span>Bạn chưa có tài khoản →</span>
            <a href="${pageContext.request.contextPath}/views/vwLogin/register.jsp" style="font-size: 20px; color: yellow">Đăng ký ngay</a>
        </div>
    </div>
</div>
</body>
</html>
