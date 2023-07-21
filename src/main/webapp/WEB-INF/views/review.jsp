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

<body>
    <%@ include file="mainNav.jsp" %>

	<form action="/review/${productCode}" id="reviewForm" name="reviewForm" method="post">
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
                        <td>${products.name}
                        <input type="hidden" id="productNameInput" name="productName" value="${products.name}">
                        </td>
                        	
                    </tr>
                   <tr>
  				  <td>제목</td>
 					   <td>
					        <input type="text" id="titleInput" name="title" placeholder="제목을 입력해주세요" value="${review.title}">
					    </td>
					</tr>
					<tr>
                        <td>별점</td>
                        <td>
                            <i class="bi-star" onclick="rateCalc(this)" value="1"></i>
                            <i class="bi-star" onclick="rateCalc(this)" value="2"></i>
                            <i class="bi-star" onclick="rateCalc(this)" value="3"></i>
                            <i class="bi-star" onclick="rateCalc(this)" value="4"></i>
                            <i class="bi-star" onclick="rateCalc(this)" value="5"></i>
                             <input type="hidden" id="rateInput" name="rate" value="${review.rate}">
                        </td>
                    </tr>
					<tr>
				    <td>용도</td>
				    <td>
				        <label><input type="radio" name="usage" value="1" onclick="setPurposeValue(1)"> 선물용</label>
				        <label><input type="radio" name="usage" value="2" onclick="setPurposeValue(2)"> 직접음용</label>
				        <input type="hidden" id="usageInput" name="purpose" value="${review.purpose}">
				    </td>
				</tr>
					<tr>
                       <td>대상자 연령</td>
						<td>
						    <label><input type="radio" name="age" value="1" onclick="setAgeGroupValue(1)"> 20</label>
						    <label><input type="radio" name="age" value="2" onclick="setAgeGroupValue(2)"> 30</label>
						    <label><input type="radio" name="age" value="3" onclick="setAgeGroupValue(3)"> 40</label>
						    <label><input type="radio" name="age" value="4" onclick="setAgeGroupValue(4)"> 50</label>
						    <label><input type="radio" name="age" value="5" onclick="setAgeGroupValue(5)"> 60이상</label>
						    <input type="hidden" id="ageGroupInput" name="agegroup" value="${review.agegroup}">
						</td>
                       
                    </tr>
                    
				<tr>
    <td colspan="2">
        <textarea class="review-textarea" name="content" placeholder="리뷰를 작성해주세요(500자 이하)"
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
                            <input type="submit" value="리뷰등록" class="change-option-btn">
                        </td>
                    </tr>
                </table>


            </div>
        </div>
    </div>
    
    <input type="hidden" name="userNo" value="${userNo}">
</form>
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

        function rateCalc(rate) {
            let starsFill = document.querySelectorAll(".bi-star-fill");
            let tmp = rate.getAttribute("value");

            for (let i = 0; i < starsFill.length; i++) {
                starsFill[i].setAttribute("class", "bi-star");
            }
            let stars = document.querySelectorAll(".bi-star");
            for (let i = 0; i < tmp; i++) {
                stars[i].setAttribute("class", "bi-star-fill");
            }

            // rateInput에 별점 값 설정
            document.getElementById("rateInput").value = tmp;
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
        // 라디오 버튼 클릭 시 숨겨진 입력란의 값을 설정하는 함수
        function setPurposeValue(value) {
            document.getElementById("usageInput").value = value;
        }

        
    </script>
	<script>
	    // 라디오 버튼 클릭 시 숨겨진 입력란의 값을 설정하는 함수
	    function setAgeGroupValue(value) {
	        document.getElementById("ageGroupInput").value = value;
	    }
	</script>
    
</body>

</html>