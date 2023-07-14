<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>전통주 양조장 관리자 페이지 - 메인</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="../resources/assets/favicon.ico" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="../resources/css/adminStyles.css" rel="stylesheet" />
        <link href="../resources/css/traditional-admin.css" rel="stylesheet" />
        <script src="https://cdn.jsdelivr.net/npm/chart.js@4.3.0/dist/chart.umd.min.js"></script>
        <!-- <style>
	        .canvas {
				display: block; 
				box-sizing: border-box; 
				height: 20%; 
				width: 20%;
	      	}
        </style> -->
    </head>
    <body>
        <div class="d-flex" id="wrapper">
				<%@ include file="adminSidebar.jsp" %>
            <!-- Page content wrapper-->
            <div id="page-content-wrapper">
                <%@ include file="adminNav.jsp" %>
                <!-- Page content-->
                <div class="container-fluid">
                    <h1 class="mt-4">상품 월별 총 판매량</h1>
						<div class="width50">
						<canvas id="sell-chart"></canvas>
						</div>
                </div>
                <div class="container-fluid">
                    <h1 class="mt-4">판매 요약</h1>
                    <p>The starting state of the menu will appear collapsed on smaller screens, and will appear non-collapsed on larger screens. When toggled using the button below, the menu will change.</p>
                    <p>
                        Make sure to keep all page content within the
                        <code>#page-content-wrapper</code>
                        . The top navbar is optional, and just for demonstration. Just create an element with the
                        <code>#sidebarToggle</code>
                        ID which will toggle the menu when clicked.
                    </p>
                </div>
            </div>
        </div>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="/resources/js/scripts.js"></script>
        <script>
        
        var sellCtx = document.getElementById("sell-chart");
        
        var sellConfig = {
        	  type: 'line',
        	  data: {
        	    labels: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
        	    datasets: [{ 
        	        data: [100,114,106,106,107,111,133,221,403,300,11,23],
        	        label: "판매량",
        	        borderColor: "#3e95cd",
        	        fill: false
        	      }
        	    ]
        	  },
        	  options: {
        	    title: {
        	      display: false,
        	      text: '상품 월별 총 판매량'
        	    }
        	  }
        	};
        
        var mySellChart = new Chart(sellCtx, sellConfig);
        
        </script>
    </body>
</html>
