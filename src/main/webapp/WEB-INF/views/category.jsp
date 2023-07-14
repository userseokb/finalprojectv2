<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>전통주 양조장</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="../resources/css/styles.css" rel="stylesheet" />
        <link href="../resources/css/traditional-main.css" rel="stylesheet" />
    </head>
    <body onload="toLocaleString();">
        <%@ include file="mainNav.jsp" %>
        <%@ include file="mainHeader.jsp" %>

		<div class="container">
	<!-- https://getbootstrap.com/docs/5.3/components/list-group/ -->
            <div id="product_order_list" style="margin-right: 8em;">
                <p align="right">
                  <a href="/${category}/recentlist">최신순</a>&nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp
          	      <a href="/${category}/pricelist">낮은가격</a>&nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp
           	      <a href="/${category}/pricelistdesc">높은가격</a> 
                </p>
            </div>

            <!-- 상품 -->
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                	<c:forEach var="product" items="${products}">
                    <div class="col mb-5">
                        <div class="card h-100">
                             <!-- best badge-->
                             <div class="position-absolute"><img class="best-banner" src=../resources/image/gift.jpg style="width: 50px;height: 50px;" alt="..." /></div>
                            <!-- Product image-->
                            <img class="card-img-top" src="../resources/image/productimage/${product.productCode}.png" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-3">
                                <div class="text-left">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">${product.name}</h5>
                                    <!-- Product price-->
                                  <span>₩</span>
                                  <span class="price">${product.price}</span>
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="/productdetail/${product.productCode}">상세보기</a></div>
                            </div>
                        </div>
                    </div>
                    </c:forEach>
                </div>
            </div>
			<!-- Paging -->
			<!-- https://getbootstrap.com/docs/5.3/layout/columns/#alignment -->
			<!-- https://getbootstrap.com/docs/5.3/components/pagination/#disabled-and-active-states -->
 			
 			
 					<!-- 카테고리 페이지네이션 -->
 					<c:if test="${!empty pageInfo}">
					<div>
						<nav class="page navigation">
						<ul class="pagination justify-content-center">
							<c:if test="${pageInfo.prev}">
								<li class="page-item prev">
									<a class="page-link" aria-label="Previous" 
									href="/category/${pageInfo.pageRequest.categoryCode}?pageNum=${pageInfo.startPage - 1}&amount=${pageInfo.pageRequest.amount}">이전</a>
								</li>
							</c:if>
							<c:forEach var="num" begin="${pageInfo.startPage}" end="${pageInfo.endPage}">
								<li class="page-item ${pageInfo.pageRequest.pageNum == num ? "active" : "" } ">
									<a class="page-link" 
									href="/category/${pageInfo.pageRequest.categoryCode}?pageNum=${num}&amount=${pageInfo.pageRequest.amount}">${num}</a>
								</li>
							</c:forEach>
							<c:if test="${pageInfo.next}">
								<li class="page-item next">
									<a class="page-link" aria-label="next" 
									href="/category/${pageInfo.pageRequest.categoryCode}?pageNum=${pageInfo.endPage + 1}&amount=${pageInfo.pageRequest.amount}">다음</a>
								</li>
							</c:if>
						</ul>
						</nav>
					</div>
					</c:if>
					
					<!-- 카테고리 정렬 후 페이지네이션 -->
 					<c:if test="${!empty pageInfoSort}">
					<div>
						<nav class="page navigation">
						<ul class="pagination justify-content-center">
							<c:if test="${pageInfoSort.prev}">
								<li class="page-item prev">
									<a class="page-link" aria-label="Previous" 
									href="/${pageInfoSort.pageRequest.categoryCode}/${sort }?pageNum=${pageInfoSort.startPage - 1}&amount=${pageInfo.pageRequest.amount}">이전</a>
								</li>
							</c:if>
							<c:forEach var="num" begin="${pageInfoSort.startPage}" end="${pageInfoSort.endPage}">
								<li class="page-item ${pageInfoSort.pageRequest.pageNum == num ? "active" : "" } ">
									<a class="page-link" 
									href="/${pageInfoSort.pageRequest.categoryCode}/${sort }?pageNum=${num}&amount=${pageInfoSort.pageRequest.amount}">${num}</a>
								</li>
							</c:forEach>
							<c:if test="${pageInfoSort.next}">
								<li class="page-item next">
									<a class="page-link" aria-label="next" 
									href="/${pageInfoSort.pageRequest.categoryCode}/${sort }?pageNum=${pageInfoSort.endPage + 1}&amount=${pageInfoSort.pageRequest.amount}">다음</a>
								</li>
							</c:if>
						</ul>
						</nav>
					</div>
					</c:if>
					
					
					<!-- 검색 페이지네이션 -->
					<c:if test="${!empty searchInfo}">
					<div>
						<nav class="page navigation">
						<ul class="pagination justify-content-center">
							<c:if test="${searchInfo.prev}">
								<li class="page-item prev">
									<a class="page-link" aria-label="Previous" 
									href="/search?keyword=${searchInfo.pageRequest.keyword}&pageNum=${searchInfo.startPage - 1}&amount=${searchInfo.pageRequest.amount}">이전</a>
								</li>
							</c:if>
							<c:forEach var="num" begin="${searchInfo.startPage}" end="${searchInfo.endPage}">
								<li class="page-item ${searchInfo.pageRequest.pageNum == num ? "active" : "" } ">
									<a class="page-link" 
									href="/search?keyword=${searchInfo.pageRequest.keyword}&pageNum=${num}&amount=${searchInfo.pageRequest.amount}">${num}</a>
								</li>
							</c:forEach>
							<c:if test="${searchInfo.next}">
								<li class="page-item next">
									<a class="page-link" aria-label="next" 
									href="/search?keyword=${searchInfo.pageRequest.keyword}&pageNum=${searchInfo.endPage + 1}&amount=${searchInfo.pageRequest.amount}">다음</a>
								</li>
							</c:if>
						</ul>
						</nav>
					</div>
					</c:if>
					
				</div>
			
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="../resources/js/scripts.js"></script>	
    <script>
    	function toLocaleString(){
    		let priceList = document.querySelectorAll(".price");
    		for(let i=0; i<priceList.length; i++){
    			priceList[i].innerText = Number(priceList[i].innerText).toLocaleString("ko-KR");
        	}
    	}
    </script>
</body>
</html>