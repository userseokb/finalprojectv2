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
    
</head>

<body>
    <!-- logo  -->
    <div class="login-header">
        <a class="navbar-brand" href="index.html">
            <img src="../resources/image/logo.png" alt="logo" width="200px">
        </a>
    </div>
   <div class="full">
		<div class="container">
			<div class="area_inputs wow fadeIn">
				<div class="sub_title font-weight-bold text-black">
					<h3>아이디|비밀번호 찾기</h3>
				</div>
				<div style="margin-bottom: 10px;"
					class="custom-control custom-radio custom-control-inline">
					<input type="radio" class="custom-control-input" id="search_1" name="search_total" onclick="search_check(1)" checked="checked">
					<label class="custom-control-label font-weight-bold text-black"	for="search_1">아이디 찾기</label>
				</div>
				<div class="custom-control custom-radio custom-control-inline">
					<input type="radio" class="custom-control-input" id="search_2" name="search_total" onclick="search_check(2)"> 
					<label class="custom-control-label font-weight-bold text-black" for="search_2">비밀번호 찾기</label>
				</div>
				<div id="searchId">
					<div class="form-group">
						<label class="font-weight-bold text-black" for="inputName_1">이름</label>
						<div>
							<input type="text" class="form-control" id="inputName_1" name="inputName_1" placeholder="ex) 홍길동">
						</div>
					</div>
					<div class="form-group">
						<label class="font-weight-bold text-black" for="inputPhone_1">휴대폰번호</label>
						<div>
							<input type="text" class="form-control" id="inputPhone_1" name="inputPhone_1" placeholder="ex) 01077779999">
						</div>
					</div>
					<div class="form-group">
						<button id="searchBtn" type="button" onclick="idSearch_click()" class="btn btn-primary btn-block">확인</button>
					<a class="btn btn-danger btn-block"	href="${pageContext.request.contextPath}">취소</a>
					</div>
				</div>
				<div id="searchPw" style="display: none;">
				<div class="form-group">
						<label class="font-weight-bold text-black" for="inputName_2">이름</label>
						<div>
							<input type="text" class="form-control" id="inputName_2" name="inputName_2" placeholder="ex) 홍길동">
						</div>
					</div>
					<div class="form-group">
						<label class="font-weight-bold text-black" for="inputId_2">아이디</label>
						<div>
							<input type="text" class="form-control" id="inputId_2" name="inputId_2" placeholder="ex) godmisu">
						</div>
					</div>
					<div class="form-group">
						<label class="font-weight-bold text-black" for="inputPhone_2">휴대폰번호</label>
						<div>
							<input type="text" class="form-control" id="inputPhone_2" name="inputPhone_2" placeholder="ex) 01077779999">
						</div>
					</div>
					<div class="form-group">
						<button id="searchBtn" type="button" onclick="pwSearch_click()" class="btn btn-primary btn-block">확인</button>
					<a class="btn btn-danger btn-block"	href="${pageContext.request.contextPath}">취소</a>
				</div>
				</div>
			</div>
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
		document.getElementById("searchPw").style.display = "none";
		document.getElementById("searchId").style.display = "";	
	} else {
		document.getElementById("searchId").style.display = "none";
		document.getElementById("searchPw").style.display = "";
	}
}
var idV = "";
var idSearch_click = function(){
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


			}
		}
	});
}
var pwSearch_click = function(){
	idV="";
	$.ajax({
		type:"GET",
		url:"userPw?inputName_2="
				+$('#inputName_2').val()+"&inputId_2="+$('#inputId_2').val()+"&inputPhone_2="+$('#inputPhone_2').val(),
		success:function(data){
			if(data == 0){
				$('#id_value').text("회원 정보를 확인해주세요!");	
			} else {
				$('#id_value').text(data);
				idV = data;
				window.location.href = "${pageContext.request.contextPath}/userPwSearch?inputName_2=" + encodeURIComponent($('#inputName_2').val()) +"&inputId_2="+$('#inputId_2').val()+ "&inputPhone_2=" + $('#inputPhone_2').val();


			}
		}
	});
}

</script>

</body>

</html>