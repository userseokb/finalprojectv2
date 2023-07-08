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

<body onload="deliveryStatus()">
    <%@ include file="mainNav.jsp" %>
    
    <!-- 중앙 메인 컨테이너 -->
    <div class="mypage-container">
       <%@ include file="mypageSidebar.jsp" %>

        <!-- 사이드바 제외 영역 -->
        <div class="mypage-content">

            <%@ include file="mypageHeader.jsp" %>

            <!-- 마이페이지 컨텐츠 영역 -->
            <div class="mypage-content-detail">

                <!-- 주문내역 조회 -->
                <table class="mypage-table table-text-center">
                    <tr>
                        <th>주문 날짜</th>
                        <th>주문 상세</th>
                        <th>배송 현황</th>
                    </tr>
                    <tr>
                        <td>2023-07-04</td>
                        <td>for test</td>
                        <td class="delivery-status">배송시작</td>
                    </tr>
                    <tr>
                        <td>2023-07-04</td>
                        <td>for test</td>
                        <td class="delivery-status">입금확인</td>
                    </tr>
                    <tr>
                        <td>2023-07-04</td>
                        <td>for test</td>
                        <td class="delivery-status">배송완료</td>
                    </tr>
                    <tr>
                        <td>2023-07-04</td>
                        <td>for test</td>
                        <td class="delivery-status">출고처리중</td>
                    </tr>
                    <tr>
                        <td>2023-07-04</td>
                        <td>for test</td>
                        <td class="delivery-status">구매확정</td>
                    </tr>
                </table>
            </div>
        </div>
    </div>

	<%@ include file="mainFooter.jsp" %>
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="js/scripts.js"></script>
    <script>
        // 배송상태에 따른 버튼 세팅
        function deliveryStatus(){
            ds = document.querySelectorAll('.delivery-status');
            for(let i=0; i<ds.length; i++){
                switch (ds[i].innerText){
                    case "입금확인": {
                        let btn = document.createElement("input");
                        let div = document.createElement("div");
                        btn.setAttribute("type","button");
                        btn.setAttribute("class","change-option-btn");
                        btn.setAttribute("value","주문취소");
                        div.appendChild(btn);
                        ds[i].appendChild(div);
                    }break;
                    case "배송완료": {
                        let btn1 = document.createElement("input");
                        let btn2 = document.createElement("input");
                        let div = document.createElement("div");
                        btn1.setAttribute("type","button");
                        btn1.setAttribute("class","change-option-btn");
                        btn1.setAttribute("value","환불/교환");
                        btn2.setAttribute("type","button");
                        btn2.setAttribute("class","change-option-btn");
                        btn2.setAttribute("value","구매확정");
                        div.appendChild(btn1);
                        div.appendChild(btn2);
                        ds[i].appendChild(div);
                    }break;
                    case "구매확정": {
                        let btn = document.createElement("input");
                        let div = document.createElement("div");
                        let a = document.createElement("a");
                        btn.setAttribute("type","button");
                        btn.setAttribute("class","change-option-btn");
                        btn.setAttribute("value","리뷰작성");
                        a.setAttribute("href","review.html");
                        div.appendChild(btn);
                        a.appendChild(div);
                        ds[i].appendChild(a);
                    }break;
                }
            }
        }
    </script>
</body>

</html>