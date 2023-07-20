<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>전통주 양조장 관리자 페이지 - FAQ 상세</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="../resources/assets/favicon.ico" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="/resources/css/adminStyles.css" rel="stylesheet" />
        <link href="/resources/css/traditional-admin.css" rel="stylesheet" />
        <script src="https://cdn.jsdelivr.net/npm/chart.js@4.3.0/dist/chart.umd.min.js"></script>
    </head>
    <body>
        <div class="d-flex" id="wrapper">
				<%@ include file="adminSidebar.jsp" %>
            <!-- Page content wrapper-->
            <div id="page-content-wrapper">
                <%@ include file="adminNav.jsp" %>
                <!-- Page content-->
                <div class="container-fluid">
					<div class="container">
					<h4>FAQ</h4>
					<table class="table">
						<tr>
							<th>제목</th>
							<td colspan="2">${faq.title}</td>
						</tr>
						<tr>
							<th>작성자 : 관리자</th>
							<th>작성일자 : ${faq.writeDate}</th>
							<th>조회수 : ${faq.kinds}</th>
						</tr>
						<tr>
							<th>
								<c:choose>
			                    	<c:when test="${faq.state == 'A'}">
			                    	분류 : 회원가입/정보
			                    	</c:when>
			                    	<c:when test="${faq.state == 'B'}">
			                    	분류 : 결제/배송
			                    	</c:when>
			                    	<c:when test="${faq.state == 'C'}">
			                    	분류 : 교환/환불/반품
			                    	</c:when>
			                    	<c:when test="${faq.state == 'D'}">
			                    	분류 : 마일리지
			                    	</c:when>
			                    	<c:when test="${faq.state == 'E'}">
			                    	분류 : 기타
			                    	</c:when>
		                   		</c:choose>
							</th>
						</tr>
						<tr>
							<td colspan="3">${faq.content}</td>
						</tr>
					</table>
					<div>
					<input type="button" value="목록으로"
						class="btn btn-outline-dark mt-auto"
						onclick="history.back()">
				</div>
				</div>
            </div>
            </div>
        </div>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="/resources/js/scripts.js"></script>
        <script>
        </script>
    </body>
</html>
