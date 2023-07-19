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
        <title>전통주 양조장 관리자 페이지 - 공지사항 등록</title>
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
					<h4>공지사항 등록</h4>
					<table class="table">
						<tr>
							<th>제목</th>
							<td colspan="1">
					        	<input type="text" name="title" id="title" placeholder="제목을 입력하세요(최대 50글자까지 입력 가능합니다)" class="form-control" />
					    	</td>
					    </tr>
					    <tr>
					   		<th>분류</th>
						    	<td colspan="1">
						        <select name="state" id="state" class="form-control">
						        	<option value="" selected>선택하세요</option>
						            <option value="A">회원가입/정보</option>
						            <option value="B">결제/배송</option>
						            <option value="C">교환/환불/반품</option>
						            <option value="D">마일리지</option>
						            <option value="E">기타</option>
						        </select>
				    			</td>
						</tr>
						<tr>
							<th>작성자</th>
							<td>
								관리자
							</td>
						</tr>
						<tr>
						<th>작성일자 </th>
							<td>
								<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) %>
							</td>
						</tr>
						<tr>
						<th>내용</th>
							<td>
							<textarea name="content" id="content" placeholder="내용을 입력하세요(최대 500자까지 입력 가능합니다)" class="form-control" rows="8"></textarea>
							</td>
						</tr>
					</table>
					<div>
					<button class="btn btn-outline-dark mt-auto" onclick="noticeRegisterCheck();"
					type="button">등록</button>
					<button 
						class="btn btn-outline-dark mt-auto" style="float: right;"
						onclick="history.back()">작성취소</button>
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
