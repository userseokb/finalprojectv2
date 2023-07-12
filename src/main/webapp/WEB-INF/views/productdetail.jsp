<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
        <!-- <script src="../resources/jquery/jquery-3.3.1.min.js"></script> -->
    </head>
    <body>
        <%@ include file="mainNav.jsp" %>
        
	<form action="/productdetail/${product.productCode}" method="GET" name="detailForm" id="detailForm">        
        <!-- Product section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="row gx-4 gx-lg-5 align-items-center">
                    <div class="col-md-6"><img class="card-img-top mb-5 mb-md-0" src=../resources/image/productimage/${products.productCode}.png alt="..." /></div>
                    <div class="col-md-6">
                        <div class="small mb-1">분류: ${products.categoryCode}</div>
                        <h1 class="display-5 fw-bolder">${products.name}
                        </h1>
                        <div class="fs-5 mb-5">
                            <br>
                            <h5>판매가 : ₩${products.price}</h5>
                            <br>
                            <h5>제조사 : 더한</h5>
                            <br>
                            <h5>원산지 : 한국</h5>
                            <br>
                            <h5>구매제한 : 1주문 당 100병</h5>
                            <br>
                            <h5>적립 포인트 : +750p (₩1,000당 50포인트)</h5>
                            <br>
                            <h5>배송비 : ₩3,000 (₩30,000이상 주문 시 무료배송)</h5>
                        </div>


                        <div class="d-flex" > <!--수량버튼, 장바구니, 바로구매 -->
                            <!-- <button type ="button" class="plus">+</button>
                            <input class="form-control " id="inputQuantity" type="num" value="1" style="max-width: 3rem" />
                            <button type="button" class="minus">-</button> -->

                            <div class="count-btn float-right">
								<button type="button" onclick="minus(this)">-</button>
									<input class="count-input" type="number" name=""
									value="1"
									id="productQuantity">
								<button type="button" onclick="plus(this)">+</button>
							</div>	
								
                            <button class="btn btn-outline-dark flex-shrink-0" type="button" onclick="addToBasket(${products.productCode});">
                                <i class="bi-cart-fill me-1"></i>
                                장바구니
                            </button>
                           
                            
                            <button class="btn btn-outline-dark flex-shrink-0" type="button">
                                 <i class="bi bi-cash"></i>
                                바로구매
                            </button>
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
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    <p>${products.content}</p>
                    <!-- 글로 작성시 p태그 사용  <p></p>   -->
                </div>
            </div>
        </section>

        <!--상품 후기 -->
        <section class="mb-5">
            <div class="card bg-light">
    
                <!-- 리뷰 전체 조회 -->
                <div class="card m-3" th:each="review : ${reviews}" th:id="|review-${review.id}|" >
                    <div th:replace="~{review/reviews::reviewHeader(
                            ${review.getId()},
                            ${item.getId()},
                            ${review.getNickname()},
                            ${review.getStar()},
                            ${review.getComment()})}"></div>
                    <div th:replace="~{review/reviews::reviewBody(${review.getComment()})}"></div>
                </div>
            </div>
        </section>
        
     
        <%@ include file="mainFooter.jsp" %>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
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
        </script>
    </body>
</html>
