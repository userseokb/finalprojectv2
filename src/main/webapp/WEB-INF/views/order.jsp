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
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- daum 주소검색 api 사용 -->
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
</head>

<body onload="toLocaleString();">
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
					<!-- 기본 마이페이지 진입시 표 -->
					<form id=>
						<table class="mypage-table table-text-center">
							<tr>
								<th>번호</th>
								<th>상품명</th>
								<th>가격</th>
								<th>수량</th>
							</tr>

							<!-- c태그 반복영역 -->
							<c:forEach items="${orderList}" var="basket" varStatus="status">
								<tr>
									<td id="productCode${productList[status.index].productCode}"
										productCode="${productList[status.index].productCode}"
										basketNo="${basket.basketNo}">${status.count}</td>
									<td id="name${status.count}">${productList[status.index].name}</td>
									<td id="price${status.count}">${productList[status.index].price}</td>
									<td><input class="count-input" type="number"
										value="${basket.productQuantity}" id="quantity${status.count}"
										readonly></td>
								</tr>
							</c:forEach>
							<!-- 반복 여기까지 -->

						</table>

						<div class="flex-row">

							<div class="half-area">

								<c:forEach items="${orderList}" var="basket" varStatus="status">
									<c:set var="sum"
										value="${sum = sum + basket.productQuantity * productList[status.index].price}" />
								</c:forEach>
								<c:set var="delivery" value="0" />
								<c:if test="${delivery = sum > 30000 ? '0' : '3000'}">
								</c:if>

								<div>
									<span>총 상품 금액</span> <span><input id="productPrice"
										type="text" class="price-input" readonly value="${sum}">원</span>
								</div>

								<div>
									<span>총 배송비</span> <span><input id="deliveryPrice"
										type="text" class="price-input" readonly value="${delivery}">원</span>
								</div>
								<div>
									<span>총 결제예정금액</span> <span><input id="totalPrice"
										type="text" class="price-input" readonly
										value="${sum+delivery}">원</span>
								</div>

							</div>
							<div class="half-area">
								<div>
									<span>사용 가능 포인트</span> <input type="text" class="price-input"
										id="userPoint" readonly value="${userInfo.point}">
								</div>
								<div>
									<span>사용할 포인트</span> <input id="usePoint" type="text"
										class="price-input" placeholder="사용할 포인트" 
										onchange="verifyPoint(this);" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');">
								</div>
							</div>
						</div>
						<span class="small">&nbsp;기본 배송지정보와 동일 <input
							type="checkbox" id="defaultAddressCheck"
							onclick="defaultAddress();">
						</span>
						<table class="mypage-table" id="newAddrTable" style="">
							<tr>
								<th>이름</th>
								<td>${userInfo.userName}</td>
							</tr>
							<tr>
								<th>연락처</th>
								<td>0${userInfo.phone}</td>
							</tr>
							<tr>
								<th>배송지 입력</th>
								<td><span id="newAddr"></span> <input class="input-right"
									type="button" value="주소검색" onclick="addressSearch();"></td>
							</tr>
							<tr>
								<th>상세주소</th>
								<td><input type="text" placeholder="상세주소를 입력해 주세요"
									id="newAddrDetail" class="width100"></td>
							</tr>
						</table>

						<table class="mypage-table" id="defaultAddrTable"
							style="display: none;">
							<tr>
								<th>이름</th>
								<td>${userInfo.userName}</td>
							</tr>
							<tr>
								<th>연락처</th>
								<td>0${userInfo.phone}</td>
							</tr>
							<tr>
								<th>배송지 입력</th>
								<td>${userInfo.basicAddr}</td>
							</tr>
							<tr>
								<th>상세주소</th>
								<td>${userInfo.detailAddr}</td>
							</tr>
						</table>

						<div class="flex-row">
							<div class="half-area">
								<div>
									<span><b>결제수단</b></span> <span> <label> <input
											type="radio" name="method" id="" value="creditCard">
											신용카드
									</label><br> <label> <input type="radio" name="method"
											id="" value="kakaoPay"> <img
											src="../resources/image/payment_icon_yellow_small.png"
											width="50px" id="kakao"></label>
									</span>
								</div>
								<div class="border-top-grey">
									<span><b>품절시 환불안내</b></span> <span>재고가 없을시 안내 후 환불</span>
								</div>
								<div class="border-top-grey">
									<span><b>주문자 동의</b></span> <span>전체 동의하기&nbsp;<input
									 id="agreement" type="checkbox"></span>
								</div>
							</div>

							<div class="flex-row right-bottom">
								<div>
									<input type="button" value="결제하기" class="change-option-btn"
										onclick="payment();">
								</div>
							</div>
						</div>



					</form>
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
	
		function defaultAddress(){
			let checkbox = document.getElementById("defaultAddressCheck");
			let newAddrTable = document.getElementById("newAddrTable");
			let defaultAddrTable = document.getElementById("defaultAddrTable");
			if(checkbox.checked){
				newAddrTable.style.display = "none";
				defaultAddrTable.style.display ="";
			}else{
				newAddrTable.style.display = "";
				defaultAddrTable.style.display ="none";
			}
		}
		
		function addressSearch() {
		    //카카오 지도 api
		    new daum.Postcode({
		        oncomplete: function(data) { //선택시 입력값 세팅
		            document.getElementById("newAddr").innerText = data.address; // 주소 넣기
		           	document.getElementById("newAddrDetail").focus();
		        }
		    }).open();
		}
		
		async function kakaoPayAPI(data){
			let tid = "";
			axios({
				url : "/kakaoPayment",
				method : "POST",
				data : data
			})
			.then((response)=>{
				let qrcode = response.data.next_redirect_pc_url;
				tid=response.data;
				console.log(response.data);
				location.href=qrcode;
			})
			.catch((error)=>{
				console.log(error);
				alert("!!");
			});
			
			
		}
		
		function verifyPoint(point){
			let userPoint = document.getElementById("userPoint");
			let totalPrice = document.getElementById("totalPrice");
			userPoint.value = userPoint.value.replace(",","");
			totalPrice.value = totalPrice.value.replace(",","");
			totalPrice.value = Number(${sum + derivery});
			if(Number(point.value.replace(",","")) > Number(userPoint.value.replace(",",""))) {
				point.value = userPoint.value;
			}
			totalPrice.value = Number(totalPrice.value) - Number(point.value); 
			toLocaleStringLogic(userPoint);
			toLocaleStringLogic(point);
			toLocaleStringLogic(totalPrice);
		}
		
		function payment(){
			let productQuantity = document.querySelectorAll("[id^='quantity']");
			let productCodeList = document.querySelectorAll("[id^='productCode']");
			let defaultAddressCheck = document.getElementById("defaultAddressCheck");
			let basicAddr = "${userInfo.basicAddr}";
			let detailAddr = "${userInfo.detailAddr}";
			
			//basketcode배열 생성
			let basketNoArr = [];
			for(let i=0; i<productCodeList.length; i++){
				let tmpno = productCodeList[i].getAttribute("basketNo");
				basketNoArr.push(tmpno);
			}
			
			//제품코드, 수량 배열
			let productCodeQuantityArr = [];
			for(let i=0; i<productCodeList.length; i++){
				let tmpcode = productCodeList[i].getAttribute("productCode");
				let tmpQuantity = productQuantity[i].value;
				productCodeQuantityArr.push([tmpcode,tmpQuantity]);
			}
			
			//제품 이름 붙이기
			let productNameList = document.querySelectorAll("[id^='name']");
			let addName = "";
			for(let i=0; i<productNameList.length; i++){
				if(addName != "") addName += ",";
				addName += productNameList[i].innerText;
			}
			
			//총수량 확인
			let totalProductQuantity = 0;
			for(let i=0; i<productQuantity.length; i++){
				totalProductQuantity += Number(productQuantity[i].value);
			}
			
			//기본배송지 확인
			if(!defaultAddressCheck.checked){
				basicAddr = document.getElementById("newAddr").innerText;
				detailAddr = document.getElementById("newAddrDetail").value;
			}
			
			//주소 입력확인
			if(basicAddr == ""||basicAddr == null||detailAddr == ""||detailAddr == null) {
				alert("배송지를 확인해주세요");
				return;
			}
			
			//결제 방법
			let radioList = document.querySelectorAll("[name='method']");
			let paymentMethod = "";
			for(let i=0; i<radioList.length; i++){
				if(radioList[i].checked) paymentMethod = radioList[i].value;
			}
			
			
			//결제 동의
			let agreement = document.getElementById("agreement");
			if(!agreement.checked){
				alert("주문자 동의를 확인해주세요");
				return;
			}
			
			//포인트 디폴트값 설정
			let usedPoint = document.getElementById("usePoint").value;
			if(usedPoint == "" || usedPoint == "0" || usedPoint == 0) usedPoint = 0;
			else{
				usedPoint = usedPoint.replace(",","")
			}
			let data = {
				productList : productCodeQuantityArr,
				productQuantity : totalProductQuantity, 
				usedPoint : usedPoint,
				basicAddr : basicAddr,
				detailAddr : detailAddr,
				paymentMethod : paymentMethod,
				deliveryCharge : document.getElementById("deliveryPrice").value.replace(",",""),
				price : document.getElementById("totalPrice").value.replace(",",""),
				joinName : addName,
				basketNoArr : basketNoArr
			};
			
			//결제 수단 확인
			switch(paymentMethod){
				case "" : {
					alert("결제 수단을 선택해주세요");
				}break; 
				case "creditCard" : {}break;
				case "kakaoPay" : {
					kakaoPayAPI(data);
				}break
			}
		}
		
		function toLocaleString(){
        	let productPriceList = document.querySelectorAll("[id^=price]");
        	let productPrice = document.getElementById("productPrice");			
            let deliveryPrice = document.getElementById("deliveryPrice");
            let totalPrice = document.getElementById("totalPrice");
            let userPoint = document.getElementById("userPoint");
            let usePoint = document.getElementById("usePoint");
        	for(let i=0; i<productPriceList.length; i++){
        		productPriceList[i].innerText = Number(productPriceList[i].innerText).toLocaleString("ko-KR");
        	}
        	toLocaleStringLogic(productPrice);
        	toLocaleStringLogic(deliveryPrice);
        	toLocaleStringLogic(totalPrice);
        	toLocaleStringLogic(userPoint);
        	toLocaleStringLogic(usePoint);
        }
        
        function toLocaleStringLogic(input){
        	input.value = Number(input.value).toLocaleString("ko-KR");
        }
		
</script>
<body>
</html>