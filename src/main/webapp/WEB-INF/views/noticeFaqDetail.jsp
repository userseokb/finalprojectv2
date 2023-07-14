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
            <c:if test="${!empty notice}">
			<h4>공지사항</h4>            
            <table class="main-table">
                <tr>
                    <th>제목</th>
                    <td colspan="2">${notice.title}</td>
                </tr>
                <tr>
                    <th>작성자 : 관리자</th>
                    <th>작성일자 : ${notice.writeDate}</th>
                    <th>조회수 : ${notice.kinds}</th>
                </tr>
                <tr>
                    <td colspan="3">
                        ${notice.content}
                     </td>
                </tr>
            </table>
            </c:if>
            
            <c:if test="${!empty faq}">
			<h4>FAQ</h4>            
            
            <table class="main-table">
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
                    <td colspan="3">
                        ${faq.content}
                     </td>
                </tr>
            </table>
            </c:if>
            <div>
                <input type="button" value="목록으로" class="change-option-btn float-right margin-top" onclick="history.back()">
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