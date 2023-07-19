<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
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
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<!-- <script src="../resources/jquery/jquery-3.3.1.min.js"></script> -->
</head>
<body onload="toLocaleString();">
	<div class="nav-and-content">
		<%@ include file="mainNav.jsp"%>

		<form action="/productdetail/${product.productCode}" method="GET"
			name="detailForm" id="detailForm">
			<!-- Product section-->
			<section class="py-5">
				<div class="container px-4 px-lg-5 my-5">
					<div class="row gx-4 gx-lg-5 align-items-center">
						<div class="col-md-6">
							<img class="card-img-top mb-5 mb-md-0"
								src=../resources/image/productimage/${products.productCode}.png
								alt="..." />
						</div>
						<div class="col-md-6">
							<h2 class="">${products.name}</h2>
							<div class="fs-5 mb-5">
								<br>
								<h6>
									분류 :
									<c:choose>
										<c:when test="${products.categoryCode eq 'A'}">소주/증류주</c:when>
										<c:when test="${products.categoryCode eq 'B'}">리큐르</c:when>
										<c:when test="${products.categoryCode eq 'C'}">막걸리</c:when>
										<c:when test="${products.categoryCode eq 'D'}">약주/청주</c:when>
									</c:choose>
								</h6>
								<br>
								<h6>판매가 : ₩<span id="price">${products.price}</span></h6>
								<br>
								<h6>제조사 : 더한</h6>
								<br>
								<h6>원산지 : 한국</h6>
								<br>
								<h6>구매제한 : 1주문 당 100병</h6>
								<br>
								<h6>적립 포인트 : +750p (₩1,000당 50포인트)</h6>
								<br>
								<h6>배송비 : ₩3,000 (₩30,000이상 주문 시 무료배송)</h6>
							</div>


							<div class="flex-align-center">

								<div class="flex-row">
									<div>수량변경</div>&nbsp;&nbsp;
									<div class="count-btn float-right">
										<button type="button" onclick="minus(this)">-</button>
										<input class="count-input" type="number" name="" value="1"
											id="productQuantity">
										<button type="button" onclick="plus(this)">+</button>
									</div>
								</div>
								<div>
								<button class="btn btn-outline-dark flex-shrink-0" type="button"
									onclick="addToBasket(${products.productCode});">
									<i class="bi-cart-fill me-1"></i> 장바구니
								</button>
								</div>
							</div>
						</div>

					</div>
				</div>
			</section>
		</form>
		<!-- 상세정보 -->
		<section class="py-5 bg-light">
			<div class="container px-4 px-lg-5 mt-5">
				<h2 class="fw-bolder mb-4">상품 상세정보</h2>
				<div class="row justify-content-center">
					<p>${products.content}</p>
					<!-- 글로 작성시 p태그 사용  <p></p>   -->
				</div>
			</div>
		</section>

		<!--상품 후기 -->
		<div class="container px-4 px-lg-5 mt-5">
			<h2 class="fw-bolder mb-4">상품 후기</h2>
			<hr class="reviewSeparator">
			<c:choose>
				<c:when test="${not empty reviews}">
					<c:forEach var="review" items="${reviews}">
						<div class="reviewContainer">
							<div class="review">
								<h6 class="fw-bolder mb-4">제목: ${review.title}</h6>
								<div class="rating">
									평점:
									<c:forEach var="i" begin="1" end="${review.rate}">
										<span class="star-icon bi bi-star-fill active"></span>
									</c:forEach>
								</div>
								<h6>후기내용: ${review.content}</h6>
								<h6>작성일자: ${review.rdate}</h6>
							</div>
						</div>
						<hr class="reviewSeparator">
					</c:forEach>
				</c:when>
				<c:otherwise>
					<p>등록된 리뷰가 없습니다.</p>
				</c:otherwise>
			</c:choose>
		</div>

	</div>
	<%@ include file="mainFooter.jsp"%>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="../resources/js/scripts.js"></script>
	<script>
     // 수량감소
        function minus(tag){
            let curNum = tag.nextElementSibling;
            curNum.value -= 1;
            if(Number(curNum.value) < 1){
                curNum.value = 1;
            }
        }

        // 수량증가
        function plus(tag){
            let curNum = tag.previousElementSibling;
            curNum.value = Number(curNum.value) + 1;
        }
        
        function addToBasket(productCode){
        	let detailForm = document.getElementById("detailForm");
        	let quantity = document.getElementById("productQuantity");
        	
			axios({
					url: "/basket/"+ productCode + "/" + quantity.value,
					method: 'post'
			})
			.then((response)=>{
				if(response.status==200){
					if(confirm("장바구니에 담겼습니다. 장바구니로 이동하겠습니까?")) location.href="/basket";
					else location.href="/productdetail/"+productCode;
				}
			})
			.catch((error)=>{
				console.log(error)
			});
					
        }
        
        function toLocaleString(){
    		let price = document.querySelector("#price");
    		price.innerText = Number(price.innerText).toLocaleString("ko-KR");
        	
    	}
        </script>


</body>
</html>
