<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!-- 좌측 사이드바 -->
        <div class="mypage-sidebar">
            <div class="user-private-info">
                <ul class="sidebar-grade">
                    <li>등급 : </li>
                    <li>다음등급까지 :</li>
                </ul>
            </div>
            <ul class="sidebar-nav">
                <li><a href="/updateForm">회원 정보 변경</a></li>
                <li><a href="/orderHistory">주문 내역 조회<br>및 리뷰 작성</a></li>
                <li><a href="/qna">Q&A(1:1문의)</a></li>
            </ul>
        </div>