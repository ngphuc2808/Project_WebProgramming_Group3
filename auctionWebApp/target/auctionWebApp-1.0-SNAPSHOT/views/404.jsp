<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>404</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        body {
            height: 100vh;
        }
    </style>
</head>
<body>
<div class="container-fluid h-100">
    <div class="row h-100 align-items-center">
        <div class="col-sm-12">
            <div class="card shadow w-50 mx-auto">
                <div class="card-body">
                    <h1 class="card-title">ERROR!</h1>
                    <h2 class="text-danger">404. Page not found.</h2>
                    <p class="card-text">
                        Sorry, an error has occured. The requested page not found.
                    </p>
                    <div>
                        <a class="btn btn-primary" href="${pageContext.request.contextPath}/home" role="button">
                            <i class="fa fa-home" aria-hidden="true"></i>
                            Home
                        </a>
                        <a class="btn btn-success" href="#" role="button">
                            <i class="fa fa-envelope" aria-hidden="true"></i>
                            Contact Support
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js" integrity="sha384-VHvPCCyXqtD5DqJeNxl2dtTyhF78xXNXdkwX1CZeRusQfRKp+tA7hAShOK/B/fQ2" crossorigin="anonymous"></script>
</body>
</html>