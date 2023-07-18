<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>전통주 양조장</title>
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="../resources/css/styles.css" rel="stylesheet" />
<link href="../resources/css/traditional-main.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<!-- axios 비동기 사용 -->
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<!-- jquery 사용 -->
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- daum 주소검색 api 사용 -->

</head>

<body>
	<div class="nav-and-content">
		<!-- logo  -->
		<div class="login-header">
			<a class="navbar-brand" href="index.html"> <img
				src="../resources/image/logo.png" alt="logo" width="200px">
			</a>
		</div>

		<form action="/signUp" id="inputForm" name="inputForm" method="post">
			<div class="content">

				<!-- id, pw, email -->
				<div class="input-wrap">
					<div>
						<i class="bi-person"></i> <input class="user-info-input"
							type="text" name="userId" id="userId" check_result="fail"
							placeholder="아이디(공백X 특문X 4~18글자)" required /> <input
							class="input-right" type="button" name="idCheck" id="idCheck"
							onclick="idDuplicateCheck();" value="중복확인" />
					</div>
					<div>
						<i class="bi-key"></i> <input class="user-info-input"
							type="password" name="userPw" id="userPw"
							autocomplete="new-password" placeholder="비밀번호(공백X 특문X 4~18글자)">
					</div>
					<div>
						<i class="bi-check"></i> <input class="user-info-input"
							type="password" name="userPwCheck" id="userPwCheck"
							placeholder="비밀번호 확인">
					</div>
				</div>

				<!-- id msg -->
				<!--             <div class="error-text" style="display: none;">
                아이디: 사용할 수 없는 아이디입니다. 다른 아이디를 입력해 주세요.
            </div>
            <div class="success-text" style="display: none;">
                아이디: 사용할 수 있는 아이디입니다. 회원가입을 진행해 주세요
            </div> -->
				<br>
				<!-- user private infomation -->
				<div class="input-wrap">
					<div>
						<i class="bi-person"></i> <input class="user-info-input"
							type="text" name="userName" id="userName" autocomplete="false"
							placeholder="이름(한글 2~4글자)">
					</div>
					<div>
						<i class="bi-calendar"></i> <input class="user-info-input"
							name="birth" id="birth" placeholder="생년월일[YYYY-MM-DD]">
					</div>
					<div>
						<i class="bi-telephone"></i> <input class="user-info-input"
							name="phone" id="phone" placeholder="전화번호(숫자 11자리)"> <select
							class="select-box float-right" name="tongsin" id="tongsin">
							<option value="" selected>선택</option>
							<option value="SKT">SKT</option>
							<option value="KT">KT</option>
							<option value="LG">LG</option>
						</select>
					</div>
					<div>
						<i class="bi-mailbox"></i> <input class="user-info-input"
							type="email" name="email" id="email" placeholder="이메일 주소">
					</div>
					<div>
						<i class="bi-signpost"></i> <input class="user-info-input"
							type="text" name="basicAddr" id="basicAddr" placeholder="주소"
							readonly /> <input class="input-right" type="button"
							onclick="addressSearch();" value="주소검색">
					</div>
					<div>
						<i class="bi-signpost"></i> <input class="user-info-input"
							type="text" name="detailAddr" id="detailAddr" placeholder="상세주소">
					</div>
				</div>

				<br>
				<button class="long-btn bg-dark" onclick="registerCheck();"
					type="button">회원가입</button>

			</div>
		</form>

		<!-- Bootstrap core JS-->
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
		<!-- Core theme JS-->
		<script src="js/scripts.js"></script>

		<script type="text/javascript">

function addressSearch() {
    //카카오 주소 api
    new daum.Postcode({
        oncomplete: function(data) { //선택시 입력값 세팅
            document.getElementById("basicAddr").value = data.address; // 주소 넣기
            document.querySelector("input[name=detailAddr]").focus(); //상세입력 포커싱
        }
    }).open();
}





function idDuplicateCheck() {
    $("#userId").change(function () {	//id 입력창의 내용이 변경되면...
        $("#idCheck").show();			//id체크 버튼 다시 보여줌
        $("#userId").attr("check_result", "fail"); //체크 결과 fail로 변경
      })
      
      var userId = document.getElementById("userId");
      var idPwReg = /^[a-zA-Z0-9]{4,18}$/; //공백없는 숫자와 대소문자 4~18글자 정규식
      //중복 체크 전 아이디 유효성 검사
      if (!idPwReg.test(userId.value)) {
          alert("아이디를 입력 조건에 맞게 입력해 주세요");
          userId.focus();
          return;
      };
      //실제 중복 체크를 위한 axios 비동기 로직
      axios.get('http://localhost:8083/api/user/idcheck/'+userId.value)
		.then(response => {
			if(response.data == 0) {	//중복되는 id가 없으면...
				alert("사용가능한 아이디입니다");	//알림창 출력
				$("#userId").attr("check_result", "success");	//체크 결과 success로 변경
				$("#idCheck").hide();
			} else if(response.data >= 1) {	//중복되는 id가 있으면
				alert("이미 존재하는 아이디 입니다."); //알림창 출력
				userId.focus();
				return;
			}
		})
}





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
/*     //아이디 유효성 검사(중복확인에서 체크하므로 필요없음)
    if (!idPwReg.test(userId.value)) {
        alert("아이디가 제대로 입력되지 않았습니다. 입력 조건을 확인해 주세요");
        userId.focus();
        return false;
    }; */
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
    
    //주소 유효성 검사(단순 값이 있는지 없는지만 판단)
    if ((basicAddr.value == "") || (detailAddr.value == "")) {
    	alert("주소가 입력되지 않았습니다.");
        return false;
    };
    
    //아이디 중복체크 여부 검사
    if ($("#userId").attr("check_result") == "fail"){
        alert("아이디 중복체크를 해주시기 바랍니다.");
        userId.focus();
        return false;
      };

   //입력 값 전송
   document.inputForm.submit(); //유효성 검사의 포인트

}


</script>
</body>

</html>