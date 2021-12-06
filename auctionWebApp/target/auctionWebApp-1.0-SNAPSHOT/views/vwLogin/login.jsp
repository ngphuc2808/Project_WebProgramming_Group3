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
            </form>
            <p><a href="">ĐĂNG NHẬP</a></p>
            <div class="register">
                <span>Bạn chưa có tài khoản →</span>
                <button onclick="document.getElementById('id01').style.display='block'">Đăng ký ngay</button>
            </div>
        </div>
    </div>
    <div id="id01" class="register-form">
        <div class="inform">
            <form action="">
                <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
                <h3>ĐĂNG KÝ</h3>
                <input type="text" placeholder="User Name">
                <input type="text" placeholder="Email">
                <input type="text" placeholder="Password">
                <input type="text" placeholder="Confirm Password">
            </form>
        </div>
        <p><button>Đăng ký</button></p>
    </div>
</body>
<script>
    const modal = document.getElementById('id01');
    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function(event) {
        if (event.target === modal) {
            modal.style.display = "none";
        }
    }
</script>
</html>
