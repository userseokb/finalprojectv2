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


    <!-- 중앙 메인 컨테이너 -->
    <div class="mypage-container">
    <%@ include file="mypageSidebar.jsp" %>
        
        <!-- 사이드바 제외 영역 -->
        <div class="mypage-content">

			<%@ include file="mypageHeader.jsp" %>
            
            <!-- 마이페이지 컨텐츠 영역 -->
            <div class="mypage-content-detail">
              <form action="/qna" name = "qna" id = "qna" method="POST">
            

                <!-- 기본 마이페이지 진입시 표 -->
               <main>
			        <div class="main-container">
			            <h4>QNA</h4>
			            
			            <table class="main-table">
			                <tr>
			                    <th>No.</th>
			                    <th>제목</th>
			                    <th>분류</th>
			                </tr>
			                <!-- c태그 반복영역 -->
			                <c:forEach items="${qna}" var="qna">
			                <tr> 
			                    <td><c:set var = "i" value ="${i+1}"></c:set> ${i} </td>
			                    <td><a href="qna/${qna.qnaNo}">${qna.title}</a></td>
			                    
			                    <td>
			                    <c:choose>
			                    	<c:when test="${qna.state == 'A'}">
			                    	상품
			                    	</c:when>
			                    	<c:when test="${qna.state == 'B'}">
			                    	주문/배송
			                    	</c:when>
			                    	<c:when test="${qna.state == 'C'}">
			                    	결제
			                    	</c:when>
			                    	<c:when test="${qna.state == 'D'}">
			                    	교환/환불/반품
			                    	</c:when>
			                    	<c:when test="${qna.state == 'E'}">
			                    	기타
			                    	</c:when>
			                    	<c:when test="${qna.state == 'F'}">
			                    	프로모
			                    	</c:when>
			                    </c:choose>
			                    </td>
			                </tr>
			                </c:forEach>
			                <!-- 반복 종료 -->
			            </table>
			        </div>
			    </main>
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