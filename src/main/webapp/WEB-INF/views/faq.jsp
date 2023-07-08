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
            <h4>FAQ</h4>
            
            <table class="main-table">
                <tr>
                    <th>No.</th>
                    <th>제목</th>
                    <th>분류</th>
                </tr>
                <!-- c태그 반복영역 -->
                <c:forEach items="${faq}" var="faq">
                <tr>
                    <td>${faq.faqNo}</td>
                    <td><a href="faq/${faq.faqNo}">${faq.title}</a></td>
                    
                    <td>
                    <c:choose>
                    	<c:when test="${faq.state == 'A'}">
                    	회원가입/정보
                    	</c:when>
                    	<c:when test="${faq.state == 'B'}">
                    	결제/배송
                    	</c:when>
                    	<c:when test="${faq.state == 'C'}">
                    	교환/환불/반품
                    	</c:when>
                    	<c:when test="${faq.state == 'D'}">
                    	마일리지
                    	</c:when>
                    	<c:when test="${faq.state == 'E'}">
                    	기타
                    	</c:when>
                    </c:choose>
                    </td>
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