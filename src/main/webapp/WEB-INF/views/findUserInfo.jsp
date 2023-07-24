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
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script> <!-- axios 비동기 사용 -->
    <script src="//code.jquery.com/jquery-3.3.1.min.js"></script> <!-- jquery 사용 -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> <!-- daum 주소검색 api 사용 -->
    <meta http-equiv="cache-control" content="no-cache, no-store, must-revalidate">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="expires" content="0">
</head>

<body>
	<div class="nav-and-content">
    <!-- logo  -->
    <div class="login-header">
        <a class="navbar-brand" href="index.html">
            <img src="../resources/image/logo.png" alt="logo" width="200px">
        </a>
    </div>
   <div class="full">
			<form action="/findUserInfo" id="inputForm" name="inputForm" method="get">
			<div class="content">
				<div style="margin-bottom: 10px;"
					class="custom-control custom-radio custom-control-inline">
					 <input type="radio" class="custom-control-input" id="search_1" name="search_total" onclick="search_check(1)" checked="checked">
   					 <label class="custom-control-label font-weight-bold text-black" for="search_1">아이디 찾기</label>

  					 <input type="radio" class="custom-control-input" id="search_2" name="search_total" onclick="search_check(2)"> 
   					 <label class="custom-control-label font-weight-bold text-black" for="search_2">비밀번호 찾기</label>
				</div>
				<!-- user private infomation -->
				<div class="input-wrap">
					<div>
						<i class="bi-person"></i> 
						<input class="user-info-input"
							type="text" name="inputName_1" id="inputName_1" autocomplete="false"
							placeholder="이름(한글 2~4글자)">
					</div>
					<div id="userId" style="display: none;">
						<i class="bi-person"></i> 
						<input class="user-info-input"
							type="text" name="inputId_1" id="inputId_1" autocomplete="false"
							placeholder="id(4글자 이상)">
					</div>
					<div>
						<i class="bi-telephone"></i> <input class="user-info-input"
							name="inputPhone_1" id="inputPhone_1" placeholder="전화번호(숫자 11자리)"> <select
							class="select-box float-right" name="tongsin1" id="tongsin1">
							<option value="" selected>선택</option>
							<option value="SKT">SKT</option>
							<option value="KT">KT</option>
							<option value="LG">LG</option>
						</select>
				   </div>
				   </div>
				<br>
				<button class="long-btn bg-dark" id="idButton" onclick="validateIdSearch()" id="searchBtn" type="button">아이디찾기</button>
				<button class="long-btn bg-dark" id="pwButton" style="display:none;" onclick="validatePwSearch()" id="searchBtn" type="button">비밀번호찾기</button>
			</div>
		</form>
		
	</div>
	</div>
	<%@ include file="mainFooter.jsp"%>
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="js/scripts.js"></script>

<script type="text/javascript">

function search_check(num) {
	if (num == '1') {
		document.getElementById("userId").style.display = "none";
		document.getElementById("pwButton").style.display = "none";
		document.getElementById("idButton").style.display = "";
	} else {
		document.getElementById("userId").style.display = "";
		document.getElementById("idButton").style.display = "none";
		document.getElementById("pwButton").style.display = "";
	}
}
var idV = "";
var idSearchClick = function(){

	$.ajax({
		type:"GET",
		url:"userId?inputName_1="
				+$('#inputName_1').val()+"&inputPhone_1="+$('#inputPhone_1').val(),
		success:function(data){
			if(data == 0){
				$('#id_value').text("회원 정보를 확인해주세요!");	
			} else {
				$('#id_value').text(data);
				idV = data;
				window.location.href = "${pageContext.request.contextPath}/userInfo?inputName_1=" + encodeURIComponent($('#inputName_1').val()) + "&inputPhone_1=" + $('#inputPhone_1').val();
				submitForm();

			}
		}
	});
}
var pwSearchClick = function(){
	idV="";
	$.ajax({
		type:"GET",
		url:"userPw?inputName_1="
				+$('#inputName_1').val()+"&inputId_1="+$('#inputId_1').val()+"&inputPhone_1="+$('#inputPhone_1').val(),
		success:function(data){
			if(data == 0){
				$('#id_value').text("회원 정보를 확인해주세요!");	
			} else {
				$('#id_value').text(data);
				idV = data;
				window.location.href = "${pageContext.request.contextPath}/userPwSearch?inputName_1=" + encodeURIComponent($('#inputName_1').val()) +"&inputId_1="+$('#inputId_1').val()+ "&inputPhone_1=" + $('#inputPhone_1').val();
				submitForm();

			}
		}
	});
}

function submitForm() {
    // 서버로 폼 제출하는 코드 추가 (AJAX 또는 폼의 action 속성 활용)

    // 폼 초기화
    document.getElementById("inputForm").reset();
  }
  function isNumeric(input) {
    return /^\d+$/.test(input);
  }

  function validateIdSearch() {
    var inputName = $('#inputName_1').val().trim();
    var inputPhone = $('#inputPhone_1').val().trim();
    var tongsinValue = $("#tongsin1").val();
    
    if (inputName === '' || inputPhone === '') {
      alert('이름과 전화번호를 모두 입력해주세요.');
      return;
    }

    if (inputName.length < 2 || inputName.length > 4) {
      alert('이름은 2~4글자로 입력해주세요.');
      return;
    }

    if (!isNumeric(inputPhone) || inputPhone.length !== 11) {
      alert('전화번호는 숫자 11자리로 입력해주세요.');
      return;
    }
    if (tongsinValue === '') {
        alert('통신사를 선택해주세요.');
        return false;
    }
    // 유효성 검사 통과 시 아이디 찾기 로직 진행
    idSearchClick();
    
  }

  function validatePwSearch() {
    var inputName = $('#inputName_1').val().trim();
    var inputPhone = $('#inputPhone_1').val().trim();
    var inputId = $('#inputId_1').val().trim();
    var tongsinValue = $("#tongsin1").val();
    
    if (inputName === '' || inputId === '' || inputPhone === '') {
      alert('이름, 아이디, 전화번호를 모두 입력해주세요.');
      return;
    }

    if (inputName.length < 2 || inputName.length > 4) {
      alert('이름은 2~4글자로 입력해주세요.');
      return;
    }

    if (inputId.length <= 3) {
      alert('아이디는 4글자 이상 입력해주세요.');
      return;
    }

    if (!isNumeric(inputPhone) || inputPhone.length !== 11) {
      alert('전화번호는 숫자 11자리로 입력해주세요.');
      return;
    }
    
    if (tongsinValue === '') {
        alert('통신사를 선택해주세요.');
        return false;
    }
    // 유효성 검사 통과 시 비밀번호 찾기 로직 진행
    pwSearchClick();
  }

  // 이하 생략
</script>
</body>
</html>