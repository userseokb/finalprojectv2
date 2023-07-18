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

					<!-- 주문내역 조회 -->
					<table class="mypage-table table-text-center">
						<tr>
							<th>주문 날짜</th>
							<th>주문 상세</th>
							<th>주문 수량</th>
							<th>배송 현황</th>
						</tr>
						<c:forEach items="${orderList}" var="order" varStatus="status">
							<tr>
								<td>${order.orderDate}</td>
								<td>${productList[status.index].name}</td>
								<td>${orderDetailList[status.index].orderDetailQuantity}</td>
								<td class="delivery-status"><c:choose>
										<c:when test="${order.orderStatus eq 1}">입금확인
										<div>
											<input type="button" class="change-option-btn" value="주문취소">
										</div>
										</c:when>
										<c:when test="${order.orderStatus eq 2}">출고처리중</c:when>
										<c:when test="${order.orderStatus eq 3}">출고 완료</c:when>
										<c:when test="${order.orderStatus eq 4}">배송중</c:when>
										<c:when test="${order.orderStatus eq 5}">배송완료
										<div>
											<input type="button" class="change-option-btn" value="교환/환불">
											<input type="button" class="change-option-btn" value="구매확정">
										</div>
										</c:when>
										<c:when test="${order.orderStatus eq 6}">구매확정
										<a href="/review/${orderDetailList[status.index].productCode}">
											<div>
												<input type="button" class="change-option-btn" value="리뷰작성">
											</div>
										</a>
										</c:when>
										<c:when test="${order.orderStatus eq 7}">교환/환불</c:when>
									</c:choose></td>
							</tr>
						</c:forEach>
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