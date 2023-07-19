<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>전통주 양조장</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="/resources/assets/favicon.ico" />
    <!-- Bootstrap icons-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="/resources/css/styles.css" rel="stylesheet" />
    <link href="/resources/css/traditional-main.css" rel="stylesheet" />
</head>

<body>
    <!-- logo  -->
    
    <div class="login-header">
        <a class="navbar-brand" href="/main">
            <img src="/resources/image/logo.png" alt="logo" width="200px">
            <br><br><br>
            <div>${userPw }</div>
        </a>
    </div>
</body>
<%@ include file="mainFooter.jsp"%>
</html>
