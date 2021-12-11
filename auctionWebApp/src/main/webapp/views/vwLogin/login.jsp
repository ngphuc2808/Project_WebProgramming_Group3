<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
        <form action="">
            <h3>ĐĂNG NHẬP</h3>
            <input type="text" placeholder="EMAIL">
            <input type="text" placeholder="PASSWORD">
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
