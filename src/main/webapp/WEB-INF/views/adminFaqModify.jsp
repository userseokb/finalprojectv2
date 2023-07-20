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
        <title>전통주 양조장 관리자 페이지 - 공지사항 수정</title>
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
					<h4>Faq 수정</h4>
					<form action="modify" id="modifyForm" name="modifyForm" method="post">
					<table class="table">
						<tr>
							<th>제목</th>
							<td colspan="1">
					        	<input type="text" name="title" id="title" maxlength='50' placeholder="제목을 입력하세요(최대 50글자까지 입력 가능합니다)" value = "${faq.title}" class="form-control" />
					    	</td>
					    </tr>
					    <tr>
					   		<th>분류</th>
						    	<td colspan="1">
						        <select name="state" id="state" class="form-control">
						        	<option value="">선택하세요</option> <!-- 셀렉트박스 선택값 유지하는 쉬운 방법 -->
						            <option value="A" ${faq.state == "A" ? 'selected="selected"' : ''}>회원가입/정보</option>
						            <option value="B" ${faq.state == "B" ? 'selected="selected"' : ''}>결제/배송</option>
						            <option value="C" ${faq.state == "C" ? 'selected="selected"' : ''}>교환/환불/반품</option>
						            <option value="D" ${faq.state == "D" ? 'selected="selected"' : ''}>마일리지</option>
						            <option value="E" ${faq.state == "E" ? 'selected="selected"' : ''}>기타</option>
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
								${faq.writeDate}
							</td>
						</tr>
						<tr>
						<th>내용</th>
							<td>
							<textarea name="content" id="content" maxlength='500' placeholder="내용을 입력하세요(최대 500자까지 입력 가능합니다)" class="form-control" rows="8">${faq.content}</textarea>
							<input type="hidden" name="faqNo" value="${faq.faqNo}">
							</td>
						</tr>
					</table>
					</form>
					<div>
					<button class="btn btn-outline-dark mt-auto" onclick="faqModifyCheck();"
					type="button">수정</button>
					<button 
						class="btn btn-outline-dark mt-auto" style="float: right;"
						onclick="history.back()">수정취소</button>
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
        
        function faqModifyCheck() {
            var title = document.getElementById("title");
            var state = document.getElementById("state");
            var content = document.getElementById("content");

            
            var nospaceReg = /^.*\S.*/;	//공백만 입력하는 것을 방지
        	//제목 유효성 검사
            if (!nospaceReg.test(title.value)) {
                alert("제목은 필수 입력입니다");
                title.focus();
                return false;
            };
            
        	//셀렉트박스 유효성 검사
            if (state.value == "") {
                alert("분류를 선택해 주세요");
                return false;
            };
            
            // 내용 유효성 검사
            if (!nospaceReg.test(content.value)) {
                alert("내용은 필수 입력입니다");
                content.focus();
                return false;
            };
            
           //입력 값 전송
           document.modifyForm.submit(); //유효성 검사의 포인트

        }
        
        
        </script>
    </body>
</html>
