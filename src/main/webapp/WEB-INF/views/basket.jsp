<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>전통주 양조장</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <!-- Bootstrap icons-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="css/styles.css" rel="stylesheet" />
    <link href="css/traditional-main.css" rel="stylesheet" />
</head>

<body>
    <%@ include file="mainNav.jsp" %>


    <!-- 중앙 메인 컨테이너 -->
    <div class="mypage-container">
        <%@ include file="mypageSidebar.jsp" %>

        <!-- 사이드바 제외 영역 -->
        <div class="mypage-content">

            <%@ include file="mypageHeader.jsp" %>

            <!-- 마이페이지 컨텐츠 영역 -->
            <div class="mypage-content-detail">

                <!-- 기본 마이페이지 진입시 표 -->
                <table class="mypage-table table-text-center">
                    <tr>
                        <th>번호</th>
                        <th>
                            <input type="checkbox" id="totalCheck" onclick="allCheck()">
                        </th>
                        <th>상품명</th>
                        <th>가격</th>
                        <th>수량</th>
                        <th>삭제</th>
                    </tr>

                    <!-- c태그 반복영역 -->
                    <tr>
                        <td>1</td>
                        <td><input type="checkbox" class="items"></td>
                        <td id="price1">test 막걸리</td>
                        <td>4000</td>
                        <td>
                            <div class="count-btn">
                                <button onclick="minus(this)">-</button>
                                <input class="count-input" type="number" name="" value="1">
                                <button onclick="plus(this)">+</button>
                            </div>
                        </td>
                        <td><input type="button" value="항목 삭제" class="change-option-btn"></td>
                    </tr>
                    <!-- 반복 여기까지 -->

                </table>
                
                <div class="half-area margin-center">
                    <div>
                        <span>총 상품 금액</span>
                        <span><input id="productPrice" type="text" class="price-input" readonly value="1">원</span>
                    </div>
                    <div>
                        <span>총 배송비</span>
                        <span><input id="deliveryPrice" type="text" class="price-input" readonly value="1">원</span>
                    </div>
                    <div class="border-top-grey">
                        <span>총 결제예정금액</span>
                        <span><input id="totalPrice" type="text" class="price-input" readonly value="">원</span>
                    </div>
                    <div class="border-top-grey">
                        <input type="button" value="주문하기" class="margin-center change-option-btn">
                    </div>
                </div>
            </div>
        </div>
    </div>

	<%@ include file="mainFooter.jsp" %>
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="js/scripts.js"></script>
    <script>
        const checkbox = document.getElementById("totalCheck");
        const items = document.querySelectorAll(".items");

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

        function minus(tag){
            let curNum = tag.nextElementSibling;
            curNum.value -= 1;
            if(Number(curNum.value) < 1){
                curNum.value = 1;
            }
        }

        function plus(tag){
            let curNum = tag.previousElementSibling;
            curNum.value = Number(curNum.value) + 1;
        }

        function totalPrice(){
            let productPrice = document.getElementById("productPrice").value;
            let deliveryPrice = document.getElementById("deliveryPrice").value;
            let totalPrice = document.getElementById("totalPrice");

            totalPrice.value = Number(productPrice) + Number(deliveryPrice);
        }
    </script>
</body>

</html>