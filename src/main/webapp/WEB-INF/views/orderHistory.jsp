<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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

<body onload="rowspan();">
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
						
						
						<c:forEach items="${orderDetailList}" varStatus="status1">
							<c:forEach items="${orderDetailList[status1.index]}" varStatus="status2">
							<tr>
								<td class="orderDate" value="${orderDetailList[status1.index][status2.index].orderNo}" rowspan="1">${orderList[status1.index].orderDate}</td>
								<td>${productList[status1.index].name}</td>
								<td>${orderDetailList[status1.index][status2.index].orderDetailQuantity}</td>
					 			<td>
									<c:choose>
										<c:when test="${orderList[status1.index].orderStatus eq 1}">입금확인
											<div>
												<input type="button" class="change-option-btn" value="주문취소">
											</div>
										</c:when>
										<c:when test="${orderList[status1.index].orderStatus eq 2}">출고처리중</c:when>
										<c:when test="${orderList[status1.index].orderStatus eq 3}">출고 완료</c:when>
										<c:when test="${orderList[status1.index].orderStatus eq 4}">배송중</c:when>
										<c:when test="${orderList[status1.index].orderStatus eq 5}">배송완료
											<div>
												<input type="button" class="change-option-btn" value="교환/환불">
												<input type="button" class="change-option-btn" value="구매확정">
											</div>
										</c:when>
										<c:when test="${orderList[status1.index].orderStatus eq 6}">구매확정
											<a href="/review/${productList[status1.index].productCode}">
												<div>
													<input type="button" class="change-option-btn" value="리뷰작성">
												</div>
											</a>
										</c:when>
										<c:when test="${orderList[status1.index].orderStatus eq 7}">교환/환불</c:when>
									</c:choose>
								</td>
							</tr>
							</c:forEach>
						</c:forEach>
						
						
						<%-- <c:forEach items="${orderList}" var="order" varStatus="status">
								<tr>
									<td></td>
									<td></td>
									<td></td>
									<td class="delivery-status">
										<c:choose>
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
												<a href="/review/${orderDetailList[status.index][status.index].productCode}">
													<div>
														<input type="button" class="change-option-btn" value="리뷰작성">
													</div>
												</a>
											</c:when>
											<c:when test="${order.orderStatus eq 7}">교환/환불</c:when>
										</c:choose>
									</td>
								</tr>
							</c:forEach> --%>
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
	<script>
	function rowspan(){
		let orderDateList = document.querySelectorAll(".orderDate");
		for(let i=1; i<orderDateList.length; i++){
			if(orderDateList[i].getAttribute("value") ==orderDateList[i-1].getAttribute("value")){
				let num = Number(orderDateList[i-1].getAttribute("rowspan"));
				orderDateList[i-1].setAttribute("rowspan",num+1);
				orderDateList[i].remove();
				//재귀함수사용해서 orderDateList개수 최신화
				rowspan();
			}
		}
	}
	

	</script>
</body>

</html>