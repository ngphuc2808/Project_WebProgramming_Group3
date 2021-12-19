<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Thông tin tài khoản</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/public/css_Account/style_account.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/public/css_Account/reset_account.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
</head>
<body>

<div class="info-user bg-main">
    <div class="container">

        <div class="category-user">

            <div class="image-user">
                <div class="avatar">
                    <img src="${pageContext.request.contextPath}/public/image/PortalAgares.png">
                </div>
                <div class="name-user">
                    <span class="title-name">Tài khoản của</span>
                    <span class="name">QuynhNhut</span>
                </div>
            </div>

            <ul>

                <li class="account">
                    <a href="${pageContext.request.contextPath}/views/vwAccount/infoAccount.jsp">
                        <i class="fas fa-user"></i>
                        <span>Thông tin tài khoản</span>
                    </a>
                </li>

                <li class="become-store">
                    <a href="become_store.html">
                        <i class="fas fa-store"></i>
                        <span>Trở thành người bán</span>
                    </a>
                </li>

                <li class="notify">
                    <a href="notify.html">
                        <i class="fas fa-bell"></i>
                        <span>Thông báo</span>
                    </a>
                </li>

                <li class="address">
                    <a href="${pageContext.request.contextPath}/views/vwAccount/address.jsp">
                        <i class="fas fa-map-marker-alt"></i>
                        <span>Địa chỉ</span>
                    </a>
                </li>

                <li class="trading-history">
                    <a href="trading_his.html">
                        <i class="fas fa-history"></i>
                        <span>Lịch sử giao dịch</span>
                    </a>
                </li>



            </ul>

        </div>

        <div class="LayoutInner bg-white address_layout">
            <div class="container-layoutInner ">

                <div class="title">

                    <h2>Địa chỉ của tôi</h2>

                    <div class="btn-saveAddress">
                        <button>
                            <i class="fas fa-plus"></i>
                            <span>Thêm địa chỉ mới</span>
                        </button>
                    </div>

                </div>

                <form action="">

                    <div class="address_1">

                        <div class="fullName">
                            <label>Họ và Tên</label>
                            <span >Phạm Quỳnh Nhựt</span>
                        </div>

                        <div class="phone space-top">
                            <label>Số điện thoại</label>
                            <span >19110258</span>
                        </div>

                        <div class="addr space-top">
                            <label>Địa chỉ</label>
                            <span>Đồng Tháp</span>
                        </div>
                    </div>

                </form>

            </div>
        </div>

    </div>
</div>

</body>
</html>
