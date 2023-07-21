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
        <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    </head>
    <body>
        <div class="d-flex" id="wrapper" >
				<%@ include file="adminSidebar.jsp" %>
            <!-- Page content wrapper-->
            <div id="page-content-wrapper" >
                <%@ include file="adminNav.jsp" %>
                <!-- Page content-->
                <div class="container-fluid">
                    <h2 class="mt-4">상품 월별 총 판매량</h2>
						<div class="widthheight">
						<canvas id="sell-chart"></canvas>
						</div>
                </div>
                <div class="container-fluid">
                    <h2 class="mt-4">판매량 순위(1~3등)</h2>
						<div class="widthheight">
						<canvas id="sellRank-chart"></canvas>
						</div>
                </div>
<!--                 <div class="container-fluid">
                    <h2 class="mt-4">연령별 최다 판매 상품(20~60대)(시계 방향)</h2>
						<div class="widthheight">
						<canvas id="ageRank-chart"></canvas>
						</div>
                </div> -->
    
            </div>
        </div>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="/resources/js/scripts.js"></script>
        <script>
        
        //상품 월별 총 판매량 시작
        
        let sellMonth = new Array();
        let sales = new Array();
        var sellCtx = document.getElementById("sell-chart");
         axios.post('http://localhost:8083/admin/api/monthSales')
        		        .then(response => response.data)
        		        .then(result => {
						for(var i = 0; i<result.length; i++) {
							sellMonth.push(result[i].month);
							sales.push(result[i].sales);
						}
						
				        var sellData = {
				        	    labels: sellMonth,
				        	    datasets: [{ 
				        	        data: sales,
				        	        label: "판매량",
				        	        borderColor: "#3e95cd",
				        	        fill: false
				        	      }
				        	    ]
				        	  }
				        
				        var sellConfig = {
				        	  type: 'line',
				        	  data: sellData,
				        	  options: {
				        		  maintainAspectRatio :false,
				        	    title: {
				        	      display: false,
				        	      text: '상품 월별 총 판매량'
				        	    }
				        	  }
				        	};
				        var mySellChart = new Chart(sellCtx, sellConfig);
        		        }).catch((e) => {
        		        alert("월별 총 판매량 로드 실패");
        		        });
         

        //상품 월별 총 판매량 끝

        
        //상품 판매량 순위(1~3등) 시작
        let itemName = new Array();
        let itemCnt = new Array();
        var sellRankCtx = document.getElementById("sellRank-chart");
        
        axios.post('http://localhost:8083/admin/api/totalSales')
        .then(response => response.data)
        .then(result => {
		for(var i = 0; i<result.length; i++) {
			itemName.push(result[i].name);
			itemCnt.push(result[i].cnt);
		}
		
        var sellRankData = {
            	labels: itemName,
        	    datasets: [{ 
        	        data: itemCnt,
        	        label: "판매량",
        	        backgroundColor: [
        	            'rgba(255, 99, 132, 0.2)',
        	            'rgba(255, 159, 64, 0.2)',
        	            'rgba(255, 205, 86, 0.2)',
        	            'rgba(75, 192, 192, 0.2)',
        	            'rgba(54, 162, 235, 0.2)',
        	            'rgba(153, 102, 255, 0.2)',
        	            'rgba(201, 203, 207, 0.2)'
        	          ],
        	          borderColor: [
        	            'rgb(255, 99, 132)',
        	            'rgb(255, 159, 64)',
        	            'rgb(255, 205, 86)',
        	            'rgb(75, 192, 192)',
        	            'rgb(54, 162, 235)',
        	            'rgb(153, 102, 255)',
        	            'rgb(201, 203, 207)'
        	          ],
        	        fill: false
        	      }
        	    ]
            }
            var sellRankConfig = {
            	type: 'bar',
            	  data: sellRankData,
            	  options: {
            		maintainAspectRatio :false,
            	    title: {
            	      display: false,
            	      text: '판매량 순위(1~3등)'
            	    }
            	  }
            	};

            var mySellRankChart = new Chart(sellRankCtx, sellRankConfig);

        }).catch((e) => {
	        alert("상품 판매량 순위(1~3등) 로드 실패");
	        });
        

        //상품 판매량 순위(1~3등) 끝
        
        //연령별 최대 판매 상품 시작
/*         var ageRankCtx = document.getElementById("ageRank-chart");
        
        var ageRankData = {
  			  labels: [
  			    '술마켓 맑은내일 운암오크 32도 375ml 증류식 소주',
  			    '서울고량주 오크미니어쳐 40도 120ml',
  			    '서울고량주 레드 미니어쳐 35도 120ml',
  			    '황금보리 산삼주 20도 375ml',
  			    '진도 홍주 40도 500ml'
  			  ],
  			  datasets: [{
  			    label: '판매량',
  			    data: [10, 25, 12, 30, 20],
  			    backgroundColor: [
    	            'rgb(255, 99, 132)',
    	            'rgb(255, 159, 64)',
    	            'rgb(255, 205, 86)',
    	            'rgb(75, 192, 192)',
    	            'rgb(54, 162, 235)',
    	            'rgb(153, 102, 255)'
  			    ],
  			    hoverOffset: 4
  			  }]
  			};
			var ageRankConfig = {
					type: 'doughnut',
					data: ageRankData,
	        	    options: {
	        	      maintainAspectRatio :false,
	          	      title: {
	          	        display: false,
	          	        text: '연령별 최다 판매 상품(20~60대)'
	          	      },
	          	    }
			};
        
        var ageRankChart = new Chart(ageRankCtx, ageRankConfig); */
        
        //연령별 최대 판매 상품 끝
        </script>
    </body>
</html>
