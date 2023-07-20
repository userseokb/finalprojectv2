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
        <title>전통주 양조장 관리자 페이지 - 공지사항 관리</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="../resources/assets/favicon.ico" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="../resources/css/adminStyles.css" rel="stylesheet" />
        <link href="../resources/css/traditional-admin.css" rel="stylesheet" />
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
					<h4>공지사항 관리</h4>
					<a class="btn btn-outline-dark mt-auto" onclick="deleteValue();">선택삭제</a>
					<table class="table">
						<tr>
							<th>선택</th>
							<th>No.</th>
							<th>제목</th>
							<th>날짜</th>
							<th>작성자</th>
							<th>조회수</th>
							<th>관리</th>
						</tr>
						<!-- c태그 반복영역 -->
						<c:forEach items="${noticeList}" var="notice">
							<tr>
								<td>
									<input type="checkbox" id="delCheck${notice.noticeNo}" name="delCheck" value="${notice.noticeNo}">
								</td>
								<td>${notice.noticeNo}</td>
								<td><a href="noticeManage/detail?no=${notice.noticeNo}">${notice.title}</a></td>
								<td>${notice.writeDate }</td>
								<td>관리자</td>
								<td>${notice.kinds}</td>
								<td>
									<a class="btn btn-outline-dark mt-auto" href="noticeManage/modify?no=${notice.noticeNo}">수정</a>
								</td>
							</tr>
						</c:forEach>
						<!-- 반복 종료 -->
					</table>
					<a class="btn btn-outline-dark mt-auto" href="noticeManage/register">등록</a>
				</div>
            </div>
            </div>
        </div>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="/resources/js/scripts.js"></script>
        <script>
        
    	function deleteValue() {
    		var cbArray = document.getElementsByName('delCheck');
    		var checkedArray = new Array();
    		for(let i = 0; i<cbArray.length; i++) {
    			if(cbArray[i].checked == true) {
    				let checkedValue = cbArray[i].value;
    				checkedArray.push(checkedValue);
    			}
    		}
    		if(checkedArray.length == 0) {
    			alert("선택된 체크박스가 없습니다");
    			return false;
    		}
    		
    		let ckStr = checkedArray.join();
    		

    		
            if (!confirm("정말로 삭제하시겠습니까?")) {
            } else {
                var newForm = document.createElement("form");
                newForm.setAttribute("action", "noticeManage/delete"); //요청 보낼 주소
                newForm.setAttribute("method", "post");  //Post 방식 

               // input 태그 생성 & 속성부여
               var newInput = document.createElement("input");
               newInput.setAttribute("type", "text");
               newInput.setAttribute("id", "ckStr");
               newInput.setAttribute("name", "ckStr");
               newInput.setAttribute("value", ckStr);
               
               newForm.appendChild(newInput);
               document.body.appendChild(newForm); 
               newForm.submit();
               }
    	}
	        
        </script>
    </body>
</html>
