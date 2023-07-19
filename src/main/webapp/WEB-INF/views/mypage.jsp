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
					<form action="/mypage" name="mypage" id="mypage" method="POST">


						<!-- 기본 마이페이지 진입시 표 -->
						<table class="mypage-table table-text-center">
							<tr>
								<th>상품 정보</th>
								<th>주문 일자</th>
								<th>수량/금액</th>
								<th>주문상태</th>
							</tr>

							<!-- c태그 반복영역 -->
							<tr>
								<td>
									<%-- ${orderInfo.} --%>1
								</td>
								<td>
									<%-- ${orderInfo.orderDate} --%>2
								</td>
								<td>
									<%-- ${orderInfo.orderDetailPrice} --%>3
								</td>
								<td>
									<%-- ${orderInfo.orderStatus} --%>4
								</td>

							</tr>
							<!-- 반복 여기까지 -->
						</table>
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
</body>

</html>