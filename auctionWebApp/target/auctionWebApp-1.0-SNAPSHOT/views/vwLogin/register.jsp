<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Đăng ký</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/public/css/register.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.min.css" integrity="sha512-f0tzWhCwVFS3WeYaofoLWkTP62ObhewQ1EZn65oSYDZUg1+CyywGKkWzm8BxaJj5HGKI72PnMH9jYyIFz+GH7g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <style>
        .classReg {
            font-size: 20px;
            color: white;
            font-weight: bold;
        }
    </style>
</head>
<body>
<div  class="register-form">
    <div class="inform">
        <form action="" method="post" id="frmRegister">
            <h3>TẠO TÀI KHOẢN</h3>
            <div class="form-group">
                <label for="txtUsername" class="classReg">Username</label>
                <input type="text" placeholder="Username" id="txtUsername" name="username" autofocus required>
            </div>
            <div class="form-group">
                <label for="txtPassword" class="classReg">Password</label>
                <input type="password" placeholder="Password" id="txtPassword" name="password" required>
            </div>
            <div class="form-group">
                <label for="txtConfirm" class="classReg">Confirm</label>
                <input type="password" placeholder="Confirm Password" id="txtConfirm" required>
            </div>
            <div class="form-group">
                <label for="txtName" class="classReg">Name</label>
                <input type="text" placeholder="Name" id="txtName" name="name" required>
            </div>
            <div class="form-group">
                <label for="txtEmail" class="classReg">Email</label>
                <input type="text" placeholder="Email" id="txtEmail" name="email" required>
            </div>
            <div class="form-group">
                <label for="txtPhone" class="classReg">Phone</label>
                <input type="text" placeholder="Phone" id="txtPhone" name="phone" required>
            </div>
            <div class="form-group">
                <label for="txtAdd" class="classReg">Address</label>
                <input type="text" placeholder="Address" id="txtAdd" name="address" required>
            </div>
            <div class="form-group">
                <label for="txtDOB" class="classReg">Date of Birth</label>
                <input type="text" placeholder="Date of Birth" id="txtDOB" name="dob" required>
            </div>
            <p style="margin-top: 60px"><button type="submit">Đăng ký</button></p>
        </form>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js" integrity="sha384-VHvPCCyXqtD5DqJeNxl2dtTyhF78xXNXdkwX1CZeRusQfRKp+tA7hAShOK/B/fQ2" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.full.min.js" integrity="sha512-AIOTidJAcHBH2G/oZv9viEGXRqDNmfdPVPYOYKGy3fti0xIplnlgMHUGfuNRzC6FkzIo0iIxgFnr9RikFxK+sw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>
    $('#frmRegister').on('submit', function (e) {
        e.preventDefault();

        const username = $('#txtUsername').val();
        if (username.length === 0) {
            alert('Invalid username.');
            return;
        }

        $.getJSON('${pageContext.request.contextPath}/account/isAvailable?user=' + username, function (data) {
            if (data === true) {
                $('#frmRegister').off('submit').submit();
            } else {
                alert('Username is not available.');
            }
        });
    });
    $('#txtDOB').datetimepicker({
        format: 'd/m/Y',
        timepicker: false,
        mask: true
    });
    $('#txtUsername').select();
</script>
</body>
</html>
