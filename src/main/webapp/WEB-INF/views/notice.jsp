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
     <link href="../resources/css/styles.css" rel="stylesheet" />
     <link href="../resources/css/traditional-main.css" rel="stylesheet" />
</head>
<body>
    <%@ include file="mainNav.jsp" %>
	
    <main>
        <div class="main-container">
            <h4>공지사항</h4>
            <table class="main-table">
                <tr>
                    <th>No.</th>
                    <th>제목</th>
                    <th>날짜</th>
                    <th>작성자</th>
                    <th>조회수</th>
                </tr>
                <!-- c태그 반복영역 -->
                <c:forEach items="${notice}" var="notice">
                <tr>
                    <td>${notice.noticeNo}</td>
                    <td><a href="notice/${notice.noticeNo}">${notice.title}</a></td>
                    <td>${notice.writeDate }</td>
                    <td>관리자</td>
                    <td>${notice.kinds}</td>
                </tr>
                </c:forEach>
                <!-- 반복 종료 -->
            </table>
        </div>
    </main>
    <%@ include file="mainFooter.jsp" %>
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="js/scripts.js"></script>
</body>
</html>