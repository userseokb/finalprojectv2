<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이 페이지 회원정보 변경</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <!-- Bootstrap icons-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="../resources/css/styles.css" rel="stylesheet" />
    <link href="../resources/css/traditional-main.css" rel="stylesheet" />
</head>

<body>
    <%@ include file="mainNav.jsp" %>


    <!-- 중앙 메인 컨테이너 -->
    <div class="mypage-container">
    <%@ include file="mypageSidebar.jsp" %>
        
        <!-- 사이드바 제외 영역 -->
        <div class="mypage-content">

			<%@ include file="mypageHeader.jsp" %>
            
            <!-- 마이페이지 컨텐츠 영역 -->
            <div class="mypage-content-detail">

                <!-- 기본 마이페이지 진입시 표 -->
                <table class="mypage-table table-text-center">
                  <form action="/updateForm" name = "updateForm" id = "updateForm" method="POST">
                	<!-- <input type="hidden" name="_method" value="PUT" /> -->
 			        <div class="content">
				
				            <!-- id, pw, email -->
				            <div class="input-wrap">
				                <div>
				                    <i class="bi-person"></i>
				                    <input class="user-info-input" type="text" name="userId" id="userId" value="${user.userId}" readonly="readonly">
				                </div>
				                <div>
				                    <i class="bi-key"></i>
				                    <input class="user-info-input" type="password" name="userPw" id="userPw" placeholder="비밀번호(공백X 특문X 4~18글자)">
				                </div>
				                <div>
				                    <i class="bi-check"></i>
				                    <input class="user-info-input" type="password" name="userPwCheck" id="userPwCheck"placeholder="비밀번호 확인">
				                </div>
				            </div>
				
				          
				            <!-- user private infomation -->
				            <div class="input-wrap">
				                <div>
				                    <i class="bi-person"></i>
				                    <input class="user-info-input" type="text" name="userName" id="userName" value="${user.userName}" readonly="readonly">
				                </div>
				                <div>
				                    <i class="bi-calendar"></i>
				                    <input class="user-info-input" name="birth" id="birth" placeholder="생년월일[YYYY-MM-DD]" value="${user.birth}" readonly="readonly">
				                </div>
				                <div>
				                    <i class="bi-telephone"></i>
				                    <input class="user-info-input" name="phone" id="phone" placeholder="전화번호(숫자 11자리)" value="${user.phone}">
				                        <select class="select-box float-right" name="tongsin" id="tongsin" value="${user.tongsin}">
				                            <option value="">선택</option>
				                            <option value="SKT">SKT</option>
				                            <option value="KT">KT</option>
				                            <option value="LG">LG</option>
				                        </select>
				                </div>
				                <div>
				                    <i class="bi-mailbox"></i>
				                    <input class="user-info-input" type="email" name="email" id="email" placeholder="[선택] 비밀번호 분실 시 확인용 이메일" value="${user.email}">
				                </div>
				                <div>
				                    <i class="bi-signpost"></i>
				                    <input class="user-info-input" type="text" name="basicAddr" id="basicAddr" placeholder="주소" value="${user.basicAddr}">
				                    <input class="input-right" type="button" value="주소검색">
				                </div>
				                <div>
				                    <i class="bi-signpost"></i>
				                    <input class="user-info-input" type="text" name="detailAddr" id ="detailAddr" placeholder="상세주소" value="${user.detailAddr}">
				                </div>
				            </div>
				
				            <br>
							<button class="long-btn bg-dark" onclick="updateCheck();" type="button">수정완료</button>
		
				        </div>
				    </form>
                </table>
            </div>
        </div>
    </div>

	<%@ include file="mainFooter.jsp" %>
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="js/scripts.js"></script>
    
<script type="text/javascript">

function updateCheck() {
    var userPw = document.getElementById("userPw");
    var userPwCheck = document.getElementById("userPwCheck");
    var birth = document.getElementById("birth");
    var phone = document.getElementById("phone");
    var tongsin = document.getElementById("tongsin");
    var email = document.getElementById("email");
    var basicAddr = document.getElementById("basicAddr");
    var detailAddr = document.getElementById("detailAddr");

    var idPwReg = /^[a-zA-Z0-9]{4,18}$/;
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
    
    /* console.log('1');
    let updateForm = document.getElementById('updateForm');
    let input = document.createElement('input');
    input.type = 'hidden';
    input.name = '_method';
    input.value = 'PUT';
    updateForm.appendChild(input); */

    // 입력 값 전송
    document.updateForm.submit();
    
  	//입력 값 전송
   /*  document.updateForm.submit(); //유효성 검사의 포인트 */

}

</script>
 
</body>

</html>