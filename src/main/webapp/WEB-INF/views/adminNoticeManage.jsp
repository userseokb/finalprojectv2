<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>전통주 양조장 관리자 페이지 - 공지사항 관리</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="../resources/assets/favicon.ico" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="../resources/css/adminStyles.css" rel="stylesheet" />
        <link href="../resources/css/traditional-admin.css" rel="stylesheet" />
        <script src="https://cdn.jsdelivr.net/npm/chart.js@4.3.0/dist/chart.umd.min.js"></script>
    </head>
    <body>
        <div class="d-flex" id="wrapper">
				<%@ include file="adminSidebar.jsp" %>
            <!-- Page content wrapper-->
            <div id="page-content-wrapper">
                <%@ include file="adminNav.jsp" %>
                <!-- Page content-->
                <div class="container-fluid">
                    <h2 class="mt-4">상품 월별 총 판매량</h2>
						<div class="width50">
						<canvas id="sell-chart"></canvas>
						</div>
                </div>
            </div>
        </div>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="/resources/js/scripts.js"></script>
        <script>
        </script>
    </body>
</html>
