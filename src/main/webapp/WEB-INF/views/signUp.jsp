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

    <form action="/signUp" id="inputForm" name="inputForm" method="post">
        <div class="content">

            <!-- id, pw, email -->
            <div class="input-wrap">
                <div>
                    <i class="bi-person"></i>
                    <input class="user-info-input" type="text" name="userId" id="userId" placeholder="아이디(공백X 특문X 4~18글자)">
                    <input class="input-right" type="button" name="idCheck" id="idCheck" value="중복확인">
                </div>
                <div>
                    <i class="bi-key"></i>
                    <input class="user-info-input" type="password" name="userPw" id="userPw" autocomplete="new-password" placeholder="비밀번호(공백X 특문X 4~18글자)">
                </div>
                <div>
                    <i class="bi-check"></i>
                    <input class="user-info-input" type="password" name="userPwCheck" id="userPwCheck" placeholder="비밀번호 확인">
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
                    <input class="user-info-input" type="text" name="userName" id="userName" autocomplete="false" placeholder="이름(한글 2~4글자)">
                </div>
                <div>
                    <i class="bi-calendar"></i>
                    <input class="user-info-input" name="birth" id="birth" placeholder="생년월일[YYYY-MM-DD]">
                </div>
                <div>
                    <i class="bi-telephone"></i>
                    <input class="user-info-input" name="phone" id="phone" placeholder="전화번호(숫자 11자리)">
                        <select class="select-box float-right" name="tongsin" id="tongsin">
                            <option value="" selected>선택</option>
                            <option value="SKT">SKT</option>
                            <option value="KT">KT</option>
                            <option value="LG">LG</option>
                        </select>
                </div>
                <div>
                    <i class="bi-mailbox"></i>
                    <input class="user-info-input" type="email" name="email" id="email" placeholder="이메일 주소">
                </div>
                <div>
                    <i class="bi-signpost"></i>
                    <input class="user-info-input" type="text" name="basicAddr" id="basicAddr" placeholder="주소">
                    <input class="input-right" type="button" value="주소검색">
                </div>
                <div>
                    <i class="bi-signpost"></i>
                    <input class="user-info-input" type="text" name="detailAddr" id="detailAddr" placeholder="상세주소">
                </div>
            </div>

            <br>
            <button class="long-btn bg-dark" onclick = "registerCheck();" type="button">
                                   회원가입
            </button>

        </div>
    </form>
    
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="js/scripts.js"></script>

<script type="text/javascript">
function registerCheck() {
    var userId = document.getElementById("userId");
    var userPw = document.getElementById("userPw");
    var userPwCheck = document.getElementById("userPwCheck");
    var userName = document.getElementById("userName");
    var birth = document.getElementById("birth");
    var phone = document.getElementById("phone");
    var tongsin = document.getElementById("tongsin");
    var email = document.getElementById("email");
    var basicAddr = document.getElementById("basicAddr");
    var detailAddr = document.getElementById("detailAddr");


    var idPwReg = /^[a-zA-Z0-9]{4,18}$/; //공백없는 숫자와 대소문자 4~18글자 정규식
    //아이디 유효성 검사
    if (!idPwReg.test(userId.value)) {
        alert("아이디가 제대로 입력되지 않았습니다. 입력 조건을 확인해 주세요");
        userId.focus();
        return false;
    };
	//비밀번호 유효성 검사
    if (!idPwReg.test(userPw.value)) {
        alert("비밀번호가 제대로 입력되지 않았습니다. 입력 조건을 확인해 주세요");
        userPw.focus();
        return false;
    };
	//비밀번호 일치 유효성 검사
	if(userPw.value != userPwCheck.value) {
		alert("비밀번호가 일치하지 않습니다.");
		userPwCheck.focus();
		return false;
	}
	 var nameReg = /^[ㄱ-ㅎ|가-힣]{2,4}$/; //한글 2~4글자 정규식
	//이름 유효성 검사
    if (!nameReg.test(userName.value)) {
        alert("이름이 제대로 입력되지 않았습니다. 입력 조건을 확인해 주세요");
        userName.focus();
        return false;
    };

    var birthReg =/^\d{4}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[01])$/ //YYYY-MM-DD 날짜 정규식
    //생년월일 유효성 검사
    if (!birthReg.test(birth.value)) {
        alert("생일이 제대로 입력되지 않았습니다. 입력 조건을 확인해 주세요");
        birth.focus();
        return false;
    };
    
    var phoneReg =/^01([0|1|6|7|8|9])([0-9]{4})([0-9]{4})$/ //휴대폰번호 정규식
    //전화번호 유효성 검사
    if (!phoneReg.test(phone.value)) {
        alert("휴대폰 번호가 제대로 입력되지 않았습니다. 입력 조건을 확인해 주세요");
        phone.focus();
        return false;
    };
    
    //통신사 유효성 검사
    var tongsinValue = (tongsin.options[tongsin.selectedIndex].value);
    if(tongsinValue == "") {
        alert("통신사를 선택해 주세요");
        return false;
    };
    //이메일 유효성 검사
    var emailReg =/^[a-z0-9]+@[a-z]+\.[a-z]{2,3}$/ //이메일 주소 정규식
    if (!emailReg.test(email.value)) {
    	alert("이메일이 제대로 입력되지 않았습니다. 입력 조건을 확인해 주세요");
    	email.focus();
        return false;
    };
    
    //주소 유효성 검사(주소검색 api 적용예정으로 단순 값이 있는지 없는지만 판단)
    if ((basicAddr.value == "") || (detailAddr.value == "")) {
    	alert("주소가 입력되지 않았습니다.");
        return false;
    };

   //입력 값 전송
   document.inputForm.submit(); //유효성 검사의 포인트

}
</script>

</body>

</html>