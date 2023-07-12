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
                  <form action="/updateForm" method="POST">
                  <input type="hidden" name="_method" value="PUT" />
				        <div class="content">
				
				            <!-- id, pw, email -->
				            <div class="input-wrap">
				                <div>
				                    <i class="bi-person"></i>
				                    <input class="user-info-input" type="text" name="userId" id="userId" value="${user.userId}" readonly="readonly">
				                </div>
				                <div>
				                    <i class="bi-key"></i>
				                    <input class="user-info-input" type="password" name="userPw" id="userPw" placeholder="새로운 비밀번호">
				                </div>
				                <div>
				                    <i class="bi-check"></i>
				                    <input class="user-info-input" type="password" placeholder="비밀번호 확인">
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
				                    <input class="user-info-input" name="birth" id="birth" value="${user.birth}" readonly="readonly">
				                </div>
				                <div>
				                    <i class="bi-telephone"></i>
				                    <input class="user-info-input" name="phone" placeholder="전화번호" value="${user.phone}">
				                        <select class="select-box float-right" name="tongsin" id="tongsin" value="${user.tongsin}">
				                            <option value="" selected>선택</option>
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
				                    <input class="user-info-input" type="text" name="basicAddr" placeholder="주소" value="${user.basicAddr}">
				                    <input class="input-right" type="button" value="주소검색">
				                </div>
				                <div>
				                    <i class="bi-signpost"></i>
				                    <input class="user-info-input" type="text" name="detailAddr" placeholder="상세주소" value="${user.detailAddrt}">
				                </div>
				            </div>
				
				            <br>
				            <input class="long-btn bg-dark" type="submit" value="수정완료">
				
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
</body>

</html>