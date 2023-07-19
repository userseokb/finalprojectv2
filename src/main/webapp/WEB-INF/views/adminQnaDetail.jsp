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
        <title>전통주 양조장 관리자 페이지 - 공지사항 상세</title>
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
               <form action="/admin/qnaManage/detail/${qnaNo}" name="adminQna" id="adminQna" method="POST"> 
                <!-- Page content-->
                <div class="container-fluid">
					<div class="container">
					<h4>Q&A</h4>
					<table class="table">
						<tr>
							<th>제목</th>
							<td colspan="2">${qna.title}</td>
						</tr>
						<tr>
							<th>작성자 : </th>
							<th>작성일자 : ${qna.writeDate}</th>
							<th>조회수 : ${qna.kinds}</th>
						</tr>
						<tr>
							<td colspan="3">${qna.content}</td>
						</tr>
						<tr>
						<td colspan="3">
                            <c:choose>
						        <c:when test="${not empty qna.answer}">
						            <textarea name="answer" id="answer" class="form-control" rows="18">${qna.answer}</textarea>
						        </c:when>
						        <c:otherwise>
						            <textarea name="answer" id="answer" placeholder="답변을 입력하세요" class="form-control" rows="18"></textarea>
						        </c:otherwise>
						    </c:choose>
                        </td>
						</tr>
					</table>
					<div>
					<input type="button" value="작성완료"
						class="btn btn-outline-dark mt-auto"
						onclick="registerCheck();">
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
		    function registerCheck() {
		        var answer = document.getElementById("answer");
		
		        var answerReg = /^[\s\S]{2,}$/;
		        if (!answerReg.test(answer.value)) {
		            alert("답변을 입력해 주세요.");
		            answer.focus();
		            return false;
		        }
		
		        // 입력 값 전송
		        document.adminQna.submit();
		    }
		</script>
    </body>
</html>
