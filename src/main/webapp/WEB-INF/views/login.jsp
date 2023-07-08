<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>전통주 양조장</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="/resources/assets/favicon.ico" />
    <!-- Bootstrap icons-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="/resources/css/styles.css" rel="stylesheet" />
    <link href="/resources/css/traditional-main.css" rel="stylesheet" />
</head>

<body>
    <!-- logo  -->
    <div class="login-header">
        <a class="navbar-brand" href="/main">
            <img src="/resources/image/logo.png" alt="logo" width="200px">
        </a>
    </div>

    <!-- login form -->
    <form method="post" id="login-form">
    	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
        <div class="content">
            <div class="input-wrap">
                <div>
                    <i class="bi-person"></i>
                    <input class="user-info-input" type="text" name="id" placeholder="아이디">
                </div>
                <div>
                    <i class="bi-key"></i>
                    <input class="user-info-input" type="password" name="pw" placeholder="비밀번호">

                </div>
            </div>
            <div class="login-info-signin">
                <div>
                    <a class="login-info-signin-anchor" href="">아이디찾기</a>
                </div>
                <div>
                    <a class="login-info-signin-anchor" href="">비밀번호찾기</a>
                </div>
                <div>
                    <a class="login-info-signin-anchor" href="/signUp">회원가입</a>
                </div>
            </div>
	    		<c:if test="${error}">
	    		<script>
					alert('${exception}');
				</script>
	    		</c:if>

            <input class="long-btn bg-dark" type="submit" value="로그인">

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
    <script src="/resources/js/scripts.js"></script>

</body>

</html>