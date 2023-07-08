<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 로그인</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="../resources/assets/favicon.ico" />
    <!-- Bootstrap icons-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="../resources/css/styles.css" rel="stylesheet" />
    <link href="../resources/css/traditional-main.css" rel="stylesheet" />
</head>

<body>
    <!-- logo  -->
    <div class="login-header">
        <a class="navbar-brand" href="index.html">
            <img src="../resources/image/logo.png" alt="logo" width="200px">
        </a>
    </div>

    <!-- login form -->
    <form action="/adminLogin" method="post">
        <div class="content">

            <div class="input-wrap">
                <div>
                    <i class="bi-person"></i>
                    <input class="user-info-input" type="text" name="" id="userId" placeholder="아이디">
                </div>
                <div>
                    <i class="bi-key"></i>
                    <input class="user-info-input" type="password" id="userPw" placeholder="비밀번호">

                </div>
            </div>
            <br>
            <input class="long-btn bg-dark" type="submit" value="관리자 로그인">

        </div>
    </form>

    <!-- Footer-->
    <footer class="py-5 bg-dark">
        <div class="container">
            <p class="m-0 text-center text-white">Copyright &copy; Korea Traditional 2023</p>
        </div>
    </footer>
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="js/scripts.js"></script>

</body>

</html>