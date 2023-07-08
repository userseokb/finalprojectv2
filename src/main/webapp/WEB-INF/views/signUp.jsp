<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>전통주 양조장</title>
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
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

    <form action="/signUp" method="post">
        <div class="content">

            <!-- id, pw, email -->
            <div class="input-wrap">
                <div>
                    <i class="bi-person"></i>
                    <input class="user-info-input" type="text" name="userId" id="userId" placeholder="아이디">
                    <input class="input-right" type="button" value="중복확인">
                </div>
                <div>
                    <i class="bi-key"></i>
                    <input class="user-info-input" type="password" name="userPw" id="userPw" placeholder="비밀번호">
                </div>
                <div>
                    <i class="bi-check"></i>
                    <input class="user-info-input" type="password" placeholder="비밀번호 확인">
                </div>
            </div>

            <!-- id msg -->
            <div class="error-text" style="display: none;">
                아이디: 사용할 수 없는 아이디입니다. 다른 아이디를 입력해 주세요.
            </div>
            <div class="success-text" style="display: none;">
                아이디: 사용할 수 있는 아이디입니다. 회원가입을 진행해 주세요
            </div>
            <br>
            <!-- user private infomation -->
            <div class="input-wrap">
                <div>
                    <i class="bi-person"></i>
                    <input class="user-info-input" type="text" name="userName" id="userName" placeholder="이름">
                </div>
                <div>
                    <i class="bi-calendar"></i>
                    <input class="user-info-input" name="birth" id="birth" placeholder="생년월일[8자리]">
                </div>
                <div>
                    <i class="bi-telephone"></i>
                    <input class="user-info-input" name="phone" placeholder="전화번호">
                        <select class="select-box float-right" name="tongsin" id="tongsin">
                            <option value="" selected>선택</option>
                            <option value="SKT">SKT</option>
                            <option value="KT">KT</option>
                            <option value="LG">LG</option>
                        </select>
                </div>
                <div>
                    <i class="bi-mailbox"></i>
                    <input class="user-info-input" type="email" name="email" id="email" placeholder="[선택] 비밀번호 분실 시 확인용 이메일">
                </div>
                <div>
                    <i class="bi-signpost"></i>
                    <input class="user-info-input" type="text" name="basicAddr" placeholder="주소">
                    <input class="input-right" type="button" value="주소검색">
                </div>
                <div>
                    <i class="bi-signpost"></i>
                    <input class="user-info-input" type="text" name="detailAddr" placeholder="상세주소">
                </div>
            </div>

            <br>
            <input class="long-btn bg-dark" type="submit" value="회원가입">

        </div>
    </form>
    
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="js/scripts.js"></script>

    <script>

    </script>
</body>

</html>