<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>전통주 양조장</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="../resources/css/styles.css" rel="stylesheet" />
<link href="../resources/css/traditional-main.css" rel="stylesheet" />
</head>

<body>
	<div class="nav-and-content">
		<%@ include file="mainNav.jsp"%>


		<!-- 중앙 메인 컨테이너 -->
		<div class="mypage-container">
			<%@ include file="mypageSidebar.jsp"%>

			<!-- 사이드바 제외 영역 -->
			<div class="mypage-content">

				<%@ include file="mypageHeader.jsp"%>

				<!-- 마이페이지 컨텐츠 영역 -->
				<div class="mypage-content-detail">
					<c:choose>
						<c:when test="${result eq 'success'}">
							<div class="half-area margin-center">
								<div>
									<b>주문이 완료되었습니다.</b>
								</div>
								<div class="border-top-grey">
									<input type="button" value="쇼핑계속하기"
										class="margin-center change-option-btn"
										onclick="location.href='/main'">&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="button" value="주문상세보기"
										class="margin-center change-option-btn"
										onclick="location.href='/orderHistory'">
								</div>
							</div>
						</c:when>
						<c:when test="${result eq 'cancel'}">
							<div class="half-area margin-center">
								<div>
									<b>주문이 취소되었습니다.</b>
								</div>
								<div class="border-top-grey">
									<input type="button" value="쇼핑계속하기"
										class="margin-center change-option-btn"
										onclick="location.href='/main'">
								</div>
							</div>
						</c:when>
						<c:when test="${result eq 'fail'}">
							<div class="half-area margin-center">
								<div>
									<b>결제를 실패했습니다.</b>
								</div>
								<div class="border-top-grey">
									<input type="button" value="쇼핑계속하기"
										class="margin-center change-option-btn"
										onclick="location.href='/main'">
								</div>
							</div>
						</c:when>
					</c:choose>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="mainFooter.jsp"%>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="../resources/js/scripts.js"></script>
	<script>
	
	//브라우저 히스토리 강제주입 
	history.pushState(null, null, "http://localhost:8083/mypage");
	//뒤로가기 탐지후 장바구니로 이동
	window.onpopstate = function(event) {
		location.href="/basket";
	};
	</script>
</body>

</html>