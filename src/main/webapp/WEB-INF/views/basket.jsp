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

<body onload="onloadCheck();totalPrice();">
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

				<c:if test="${empty basketList}">
					<div class="half-area margin-center">
						<div>
							<b>장바구니에 담긴 상품이 없습니다.</b>
						</div>
						<div class="small">원하는 상품을 장바구니에 담아보세요.</div>
						<div class="border-top-grey">
							<input type="button" value="쇼핑계속하기"
								class="margin-center change-option-btn"
								onclick="location.href='/main'">
						</div>
					</div>
				</c:if>

				<c:if test="${!empty basketList}">
					<!-- 기본 마이페이지 진입시 표 -->
					<form id="basketForm">
					<table class="mypage-table table-text-center">
						<tr>
							<th><input type="checkbox" id="totalCheck"
								onclick="allCheck();totalPrice();"></th>
							<th>상품명</th>
							<th>가격</th>
							<th>수량</th>
							<th>삭제</th>
						</tr>

						<!-- c태그 반복영역 -->
					
						<c:forEach items="${basketList}" var="basket" varStatus="status">
							<tr>
								<td>
									<div class="flex-row">
										<input type="checkbox" class="items" name="productCheck"
											id="checkbox${status.index}" onclick="totalPrice()"
											value="${basket.basketNo}">
										<img
											src="../resources/image/productimage/${productList[status.index].productCode}.png"
											width="100px">
									</div>
								</td>
								<td>${productList[status.index].name}</td>
								<td id="price${status.index}">${productList[status.index].price}</td>
								<td>
									<div class="count-btn">
										<button onclick="minus(this,${status.index})" type="button">-</button>
										<input class="count-input" type="number" name=""
											value="${basket.productQuantity}"
											id="productQuantity${status.index}" onchange="totalPrice(); 
											createButton(${status.index});" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');">
										<button onclick="plus(this,${status.index})" type="button">+</button>
										
									</div><br>
									<input id="quantityChange${status.index}" style="display: none;" type="button" value="수량 변경" class="change-option-btn" 
									onclick="changeQuantity(${basket.basketNo},${status.index})">
								</td>
								<td><input type="button" value="항목 삭제"
									class="change-option-btn"
									onclick="deleteProduct('${basket.basketNo}')"></td>
							</tr>
						</c:forEach>
						<!-- 반복 여기까지 -->

					</table>
					</form>
					
						<div class="half-area margin-center">
							<div>
								<span>총 상품 금액</span> <span><input id="productPrice"
									type="text" class="price-input" readonly value="0">원</span>
							</div>
							<div>
								<span>총 배송비 <span class="small">(30,000원 이상 무료배송)</span></span> <span><input id="deliveryPrice"
									type="text" class="price-input" readonly value="0">원</span>
							</div>
							<div class="border-top-grey">
								<span>총 결제예정금액</span> <span><input id="totalPrice"
									type="text" class="price-input" readonly value="0">원</span>
							</div>
							<div class="border-top-grey">
								<input type="button" value="주문하기"
									class="margin-center change-option-btn"
									onclick="order();">
							</div>
						</div>

					
				</c:if>


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
        const checkbox = document.getElementById("totalCheck");
        const items = document.querySelectorAll(".items");

        // 페이지 로드후 체크박스 모두 선택
        function onloadCheck(){
        	if(!document.getElementById("basketForm"))return;
        	checkbox.checked = true;
        	for(let i=0; i<items.length; i++){
                items[i].checked = true;
            }
        }
        // 전체선택
        function allCheck(){
            if(checkbox.checked){
                for(let i=0; i<items.length; i++){
                    items[i].checked = true;
                }
            }else{
                for(let i=0; i<items.length; i++){
                    items[i].checked = false ;
                }
            }
        }
                
        // 전체선택 후 개별 체크박스 해제시 이벤트
        {
            for (let i = 0; i < items.length; i++) {
                items[i].addEventListener("click", () => {
                    if (!items[i].checked) {
                        checkbox.checked = false;
                        return;
                    }
                });
                
            }
        }

        // 수량감소
        function minus(tag,index){
            let curNum = tag.nextElementSibling;
            curNum.value -= 1;
            if(Number(curNum.value) < 1){
                curNum.value = 1;
            }
            totalPrice();
            createButton(index);
        }

        // 수량증가
        function plus(tag,index){
            let curNum = tag.previousElementSibling;
            curNum.value = Number(curNum.value) + 1;
          	totalPrice();
          	createButton(index);
          	
        }

        // 총 가격 계산,출력
        function totalPrice(){
            let productPrice = document.getElementById("productPrice");			
            let deliveryPrice = document.getElementById("deliveryPrice");
            let totalProductPrice = 0;
            let productPriceList = document.querySelectorAll("[id^=price]");
            let productQuantityList = document.querySelectorAll("[id^=productQuantity]");
            let checkboxList = document.querySelectorAll("[id^=checkbox]");
            let totalPrice = document.getElementById("totalPrice");
            
            deliveryPrice.value = 3000;
            
            for(let i=0; i<productPriceList.length; i++){
            	productPriceList[i].innerText = productPriceList[i].innerText.split(",").join("");
            	if(checkboxList[i].checked){
            		totalProductPrice += Number(productPriceList[i].innerText) * Number(productQuantityList[i].value);
            	}
            }
            productPrice.value = totalProductPrice;
            if(totalProductPrice >= 30000 ||totalProductPrice == 0) deliveryPrice.value = 0;
            
            totalPrice.value = Number(productPrice.value) + Number(deliveryPrice.value);
            toLocaleString();
        }
        
        function deleteProduct(basketCode){
        	if(!confirm("상품을 삭제하겠습니까?")) return;
        	let basketForm = document.getElementById("basketForm");
        	
        	let input = document.createElement('input'); 
			input.type = 'hidden'; 
			input.name = '_method'; 
			input.value  = 'DELETE'; 
			basketForm.appendChild(input); 
        	basketForm.action = "/basket/" + basketCode;
        	basketForm.method = "POST";
        	basketForm.submit();
        }
        
        function createButton(index){
        	let btn = document.getElementById("quantityChange"+index);
        	btn.style.display="";
        }
        
        function changeQuantity(basketNo,index){
			let basketForm = document.getElementById("basketForm");
			let quantity = document.getElementById("productQuantity"+index);
        	let input = document.createElement('input'); 
			input.type = 'hidden'; 
			input.name = '_method'; 
			input.value  = 'PUT'; 
			basketForm.appendChild(input); 
        	basketForm.action = "/basket/" + basketNo + "/" + quantity.value;
        	basketForm.method = "POST";
        	basketForm.submit();
        }
        
        function order(){
        	// 상품 체크 유효성 검사
        	let noCheck = true;
        	for(let i=0; i<items.length; i++){
        		if(items[i].checked){
        			noCheck =false;
        			break;
        		}
        	}
        	// 상품 체크 0개시 경고
			if(noCheck) {
				alert("구매할 상품을 확인해주세요");
				return;
			}
        	let basketForm = document.getElementById("basketForm");
        	basketForm.action="/order";
        	basketForm.method = "POST";
        	basketForm.submit();
        }
        
        function toLocaleString(){
        	let productPriceList = document.querySelectorAll("[id^=price]");
        	let productPrice = document.getElementById("productPrice");			
            let deliveryPrice = document.getElementById("deliveryPrice");
            let totalPrice = document.getElementById("totalPrice");
        	for(let i=0; i<productPriceList.length; i++){
        		productPriceList[i].innerText = Number(productPriceList[i].innerText).toLocaleString("ko-KR");
        	}
        	toLocaleStringLogic(productPrice);
        	toLocaleStringLogic(deliveryPrice);
        	toLocaleStringLogic(totalPrice);
        }
        
        function toLocaleStringLogic(input){
        	input.value = Number(input.value).toLocaleString("ko-KR");
        }
        
    </script>
</body>

</html>