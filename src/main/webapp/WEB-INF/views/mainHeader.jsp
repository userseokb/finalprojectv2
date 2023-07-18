<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Header-->
<header class="bg-right">

	<!-- <div class="container px-4 px-lg-5 my-5"> -->
<%-- 		<div class="text-center text-white">
		<img alt="" src="../resources/image/traditional.png" style="width:80%;">
			<h4 class="display-4 fw-bolder">${category}</h4>
		</div> --%>
		
		<c:if test="${empty category}">
		<div class="text-center text-white">
		<img alt="" src="../resources/image/main-banner.png" style="width:1320px;">
			<h4 class="display-4 fw-bolder"></h4>
		</div>
		</c:if>
		
		<c:choose>
			<c:when test="${category eq 'A'}">
			<div class="text-center text-white">
			<img alt="" src="../resources/image/main-banner.png" style="width:1320px;">
				<h4>소주 / 증류주</h4>
			</div>
			</c:when>
			<c:when test="${category eq 'B'}">
			<div class="text-center text-white">
			<img alt="" src="../resources/image/main-banner.png" style="width:1320px;">
				<h4>리큐르</h4>
			</div>
			</c:when>
			<c:when test="${category eq 'C'}">
			<div class="text-center text-white">
			<img alt="" src="../resources/image/main-banner.png" style="width:1320px;">
				<h4>막걸리</h4>
			</div>
			</c:when>
			<c:when test="${category eq 'D'}">
			<div class="text-center text-white">
			<img alt="" src="../resources/image/main-banner.png" style="width:1320px;">
				<h4>약주 / 청주</h4>
			</div>
			</c:when>
		</c:choose>
	<!-- </div> -->

</header>