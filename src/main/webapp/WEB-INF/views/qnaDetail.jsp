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
            
			<h4>QnA</h4>            
            <table class="main-table">
                <tr>
                    <th>제목</th>
                    <td colspan="2">${qna.title}</td>
                </tr>
                <tr>
                    <th>작성자 : ${userId}</th>
                    <th>작성일자 : ${qna.writeDate}</th>
                    <th>조회수 : ${qna.kinds}</th>
                </tr>
                <tr>
                    <td colspan="3" >
                    	내용:
                    	<br>
                        ${qna.content}
                     </td>
                </tr>
                <tr>
                    <td colspan="3" id="answer">
                    	답변:
                    	<br>
                        ${qna.answer}
                     </td>
                </tr>
            </table>
            
            
            <div>
                <input type="button" value="목록으로" class="change-option-btn float-right margin-top" onclick="history.back()">
            </div>
        </div>
    </main>
	<%@ include file="mainFooter.jsp" %>
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="../resources/js/scripts.js">
   
    function answerCheck() {
        var answer = document.getElementById("answer");

        if (answer.innerText.trim() === "") {
            answer.innerText = "친절한 직원이 답변을 준비중입니다.";
        }
    }
    </script>
</body>

</html>