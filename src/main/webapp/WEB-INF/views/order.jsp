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
                        <th>상품명</th>
                        <th>가격</th>
                        <th>수량</th>
                    </tr>

                    <!-- c태그 반복영역 -->
                    <tr>
                        <td>1</td>
                        <td id="price1">test 막걸리</td>
                        <td>4000</td>
                        <td>
                            <input class="count-input" type="number" value="1" readonly>
                        </td>
                    </tr>
                    <!-- 반복 여기까지 -->

                </table>

                <div class="flex-row">
                    <div class="half-area">
                        <div>
                            <span>총 상품 금액</span>
                            <span><input id="productPrice" type="text" class="price-input" readonly value="1">원</span>
                        </div>
                        <div>
                            <span>총 배송비</span>
                            <span><input id="deliveryPrice" type="text" class="price-input" readonly value="1">원</span>
                        </div>
                        <div>
                            <span>총 결제예정금액</span>
                            <span><input id="totalPrice" type="text" class="price-input" readonly value="">원</span>
                        </div>
                    </div>

                    <div class="half-area">
                        <div>
                            <span>사용 가능 포인트</span>
                            <input id="productPrice" type="text" class="price-input" readonly value="1">
                        </div>
                        <div>
                            <span>사용할 포인트</span>
                            <input id="productPrice" type="text" class="price-input" readonly value="1">
                        </div>
                    </div>
                </div>
                <span class="small">&nbsp;기본 배송지정보와 동일
                    <input type="checkbox">
                </span>
                <table class="mypage-table">
                    <tr>
                        <th>이름</th>
                        <td>탁형제</td>
                    </tr>
                    <tr>
                        <th>연락처</th>
                        <td>01012341234</td>
                    </tr>
                    <tr>
                        <th>배송지 입력</th>
                        <td>
                            성남시 
                            <input class="input-right" type="button" value="주소검색">
                        </td>
                    </tr>
                    <tr>
                        <th>상세주소</th>
                        <td>카카오 판교</td>
                    </tr>
                </table>

                <div class="flex-row">
                    <div class="half-area">
                        <div>
                            <span><b>결제수단</b></span>
                            <span>
                                <label><input type="radio" name="method" id=""> 신용카드</label><br>
                                <label><input type="radio" name="method" id=""> 계좌이체</label><br>
                                <label><input type="radio" name="method" id=""> xx페이</label>
                            </span>
                        </div>
                        <div class="border-top-grey">
                            <span><b>품절시 환불안내</b></span>
                            <span>재고가 없을시 안내 후 환불</span>
                        </div>
                        <div class="border-top-grey">
                            <span><b>주문자 동의</b></span>
                            <span>전체 동의하기&nbsp;<input type="checkbox"></span>
                        </div>
                    </div>
                    
                    <div class="flex-row right-bottom">
                        <div>
                            <input type="button" value="결제하기" class="change-option-btn">
                        </div>
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

</body>

</html>