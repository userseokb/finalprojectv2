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
					
	<form action="/registerQna/{userNo}" name="qna" id="qna" method="POST">
    <main>
        <div class="main-container">
            
			<h4>QnA</h4>            
            <table class="main-table">
                <tr>
				    <th>제목</th>
					<td colspan="2">
					        <input type="text" name="qna" id="qna" placeholder="제목을 입력하세요" class="form-control" />
					    </td>
					</tr>
					<th>분류</th>
				    <td colspan="2">
				        <select name="category" id="category" class="form-control">
				            <option value="A">상품</option>
				            <option value="B">주문/배송</option>
				            <option value="C">결제</option>
				            <option value="D">교환/환불</option>
				            <option value="E">기타</option>
				            <option value="F">프로모션</option>
				        </select>
				    </td>
					<tr>
					    <th>작성자 : ${userId}</th>
					    <th>작성일자 : <%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) %></th>
					    <th>조회수 : 0</th>
					</tr>
					<tr>
				    <td colspan="3">
				        <textarea name="content" id="content" placeholder="내용을 입력하세요" class="form-control" rows="8"></textarea>
				    </td>
				</tr>
            </table>
            
            
            <div>
                <input type="button" value="작성완료" class="change-option-btn float-right margin-top" onclick="history.back()">
            </div>
        </div>
    </main>
	<%@ include file="mainFooter.jsp" %>
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="../resources/js/scripts.js"></script>
</body>

</html>