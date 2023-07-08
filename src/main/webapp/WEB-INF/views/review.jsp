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
                <!-- 리뷰 작성 -->
                <table class="mypage-table first-row-text-center">
                    <tr>
                        <td>상품</td>
                        <td>test</td>
                    </tr>
                    <tr>
                        <td>제목</td>
                        <td>무진장 맛있는 막걸리</td>
                    </tr>
                    <tr>
                        <td>별점</td>
                        <td>
                            <i class="bi-star" onclick="rateCalc(this)" value="1"></i>
                            <i class="bi-star" onclick="rateCalc(this)" value="2"></i>
                            <i class="bi-star" onclick="rateCalc(this)" value="3"></i>
                            <i class="bi-star" onclick="rateCalc(this)" value="4"></i>
                            <i class="bi-star" onclick="rateCalc(this)" value="5"></i>
                        </td>
                    </tr>
                    <tr>
                        <td>용도</td>
                        <td>
                            <label><input type="radio" name="usage" id=""> 선물용</label>
                            <label><input type="radio" name="usage" id=""> 직접음용</label>
                        </td>
                    </tr>
                    <tr>
                        <td>대상자 연령</td>
                        <td>
                            <label><input type="radio" name="age" id=""> 20</label>
                            <label><input type="radio" name="age" id=""> 30</label>
                            <label><input type="radio" name="age" id=""> 40</label>
                            <label><input type="radio" name="age" id=""> 50</label>
                            <label><input type="radio" name="age" id=""> 60이상</label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <textarea class="review-textarea" placeholder="리뷰를 작성해주세요(500자 이하)"
                                onkeyup="textLengthCalc(this)" maxlength="500"></textarea>
                            <div class="float-right small" id="subtext">500</div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <input class="float-left" type="file">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <input type="button" value="리뷰등록" class="change-option-btn">
                        </td>
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
        
        // 리뷰 글자수 제한
        function textLengthCalc(text) {
            let textLength = text.value.length;
            let subText = document.getElementById("subtext");
            subText.innerText = 500 - textLength;
        }

        // 별 갯수 확인
        function rateCalc(rate) {
            let starsFill = document.querySelectorAll(".bi-star-fill");
            let tmp = rate.getAttribute("value");
            // 별이 이미있다면 초기화
            if (starsFill.length > 0) {
                for (let i = 0; i < starsFill.length; i++) {
                    starsFill[i].setAttribute("class", "bi-star");
                }
                let stars = document.querySelectorAll(".bi-star");
                for (let i = 0; i < tmp; i++) {
                    stars[i].setAttribute("class", "bi-star-fill");
                }
            } else {
                let stars = document.querySelectorAll(".bi-star");
                for (let i = 0; i < tmp; i++) {
                    stars[i].setAttribute("class", "bi-star-fill");
                }
            }
        }

        // let getAll = (target) => document.querySelectorAll(target);
        // let buttons = getAll('.usage');
        // buttons.forEach((button) => {
        //     button.addEventListener('click', console.log(1));
        // });


        {
            // 라디오 버튼 색상 변경
            let usage = document.querySelectorAll("input[name='usage']");
            let age = document.querySelectorAll("input[name='age']");
            for (let i = 0; i < usage.length; i++) {
                usage[i].addEventListener("click", () => {
                    for (let i = 0; i < usage.length; i++) {
                        usage[i].parentElement.style.color = "grey";
                    }
                    if (usage[i].checked) {
                        usage[i].parentElement.style.color = "black";
                    }
                });
            }
            for (let i = 0; i < age.length; i++) {
                age[i].addEventListener("click", () => {
                    for (let i = 0; i < age.length; i++) {
                        age[i].parentElement.style.color = "grey";
                    }
                    if (age[i].checked) {
                        age[i].parentElement.style.color = "black";
                    }
                });
            }
        }

    </script>
</body>

</html>