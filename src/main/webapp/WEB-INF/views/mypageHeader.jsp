<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
			<!-- 상단 마이페이지 헤더 -->
            <div class="mypage-header">
                <div></div>
                <div><a href="/basket"><i class="bi-cart"></i> 장바구니 : ${fn:length(basketList)}</a></div>
                <div><i class="bi-cash-stack"></i> 포인트 : ${userInfo.point}</div>
            </div>