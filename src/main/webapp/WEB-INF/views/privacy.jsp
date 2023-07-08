<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>전통주 양조장</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <!-- Bootstrap icons-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="css/styles.css" rel="stylesheet" />
    <link href="css/traditional-main.css" rel="stylesheet" />
</head>

<body>
    <%@ include file="mainNav.jsp" %>


    <!-- 중앙 메인 컨테이너 -->
    <div class="mypage-container">
       	<%@ include file="mypageSidebar.jsp" %>

        <!-- 사이드바 제외 영역 -->
        <div class="mypage-content">

            <%@ include file="mypageHeader.jsp" %>

                <!-- 회원정보 변경 -->
                <table class="mypage-table first-row-text-center">
                    <tr>
                        <td>아이디</td>
                        <td>testId</td>
                    </tr>
                    <tr>
                        <td>비밀번호</td>
                        <td>*******
                            <input class="change-option-btn float-right" type="button" value="비밀번호 변경">
                        </td>
                    </tr>
                    <tr>
                        <td>이름</td>
                        <td>탁형제</td>
                    </tr>
                    <tr>
                        <td>이메일</td>
                        <td>test@test.com
                            <input class="change-option-btn float-right" type="button" value="이메일 변경">
                        </td>
                    </tr>
                    <tr>
                        <td>휴대전화</td>
                        <td>
                            <select id="" class="select-box">
                                <option value="SKT">SKT</option>
                                <option value="KT">KT</option>
                                <option value="LG">LG</option>
                            </select>
                            <span>01012341234</span>
                            <input class="change-option-btn float-right" type="button" value="전화번호 변경">
                        </td>
                    </tr>
                    <tr>
                        <td>배송지</td>
                        <td>경기 성남시 분당구 판교역로 166
                            <input class="change-option-btn float-right" type="button" value="주소 변경">
                        </td>
                    </tr>
                    <tr>
                        <td>상세 주소</td>
                        <td>카카오 판교아지트</td>
                    </tr>
                    <tr>
                        <td colspan="2"><input class="change-option-btn" type="button" value="회원탈퇴" onclick="withdrawal()"></td>
                    </tr>
                    <!-- 회원탈퇴 버튼 -->
                    <tr id="withdrawal" style="display:none;">
                        <td class="warn-color">탈퇴 확인</td>
                        <td>
                            <input class="user-info-input" type="password" name="" id="" placeholder="비밀번호를 입력해주세요">
                            <input class="change-option-btn float-right warn-color" type="button" value="탈퇴하기">
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>

	<%@ include file="mainFooter.jsp" %>
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="js/scripts.js"></script>
    <script>
        function withdrawal(){
            document.getElementById("withdrawal").style.display="";
        }

    </script>
</body>

</html>