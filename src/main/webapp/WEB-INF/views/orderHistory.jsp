<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
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
					<table class="mypage-table table-text-center" id="myTable">
						<tr>
							<th>주문 날짜</th>
							<th>주문 상세</th>
							<th>주문 수량</th>
							<th>배송 현황</th>
						</tr>
						
						
						<c:forEach items="${orderDetailList}" varStatus="status1">
							<c:forEach items="${orderDetailList[status1.index]}" varStatus="status2">
							<tr>
							<c:set var="count" value="${count + 1}"></c:set>
								<td class="orderDate" value="${orderDetailList[status1.index][status2.index].orderNo}" rowspan="1">
								<fmt:formatDate pattern="yy.MM.dd" value="${orderList[status1.index].orderDate}"/><br>
								<fmt:formatDate pattern="HH:mm" value="${orderList[status1.index].orderDate}"/>
								</td>
								<td>${productList[count-1].name}</td>
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

	function rowspanSameValues() {
		  const table = document.getElementById('myTable');
		  const orderDetailCells = table.getElementsByClassName('orderDate');

		  let currentVal = null;
		  let count = 0;

		  for (let i = 0; i < orderDetailCells.length; i++) {
		    const cell = orderDetailCells[i];
		    const val = cell.getAttribute('value');

		    if (val === currentVal) {
		      count++;
		      cell.style.display = 'none'; 
		    } else {
		      if (count > 0) {
		        const rowspan = count + 1;
		        const previousCell = orderDetailCells[i - count - 1];
		        previousCell.setAttribute('rowspan', rowspan);
		      }
		      currentVal = val;
		      count = 0;
		    }
		  }
		  
		  if (count > 0) {
		    const rowspan = count + 1;
		    const previousCell = orderDetailCells[orderDetailCells.length - count - 1];
		    previousCell.setAttribute('rowspan', rowspan);
		  }
		}
		// 페이지 로딩후 병합실행
		window.addEventListener('load', rowspanSameValues);

	</script>
</body>

</html>