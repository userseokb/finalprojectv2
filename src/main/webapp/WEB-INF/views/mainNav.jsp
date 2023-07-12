<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

		<!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="/main">
                    <img src="../resources/image/logo.png" alt="logo" width="110px">
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <li class="nav-item dropdown">
							 <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">우리 술 한눈에 보기</a>
                        	 <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="/category/${categoryCode='A'}">소주/증류주</a></li>
                                <li><a class="dropdown-item" href="/category/${categoryCode='B'}">리큐르</a></li>
                                <li><a class="dropdown-item" href="/category/${categoryCode='C'}">막걸리</a></li>
                                <li><a class="dropdown-item" href="/category/${categoryCode='D'}">약주/청주</a></li>
                             </ul>
                        </li>

                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">고객센터</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="/notice">공지사항</a></li>
                                <li><a class="dropdown-item" href="/faq">FAQ</a></li>
                            </ul>
                        </li>
                    </ul>
                    <sec:authorize access="isAuthenticated()">
                    <div class="search-input">
                    	<form action="/search" method="get">
                        <input type="search" name="keyword" placeholder="검색어를 입력하세요">
                        <button type="submit" class="search-button">
                        <i class="bi-search"></i>
                        </button>
                        </form>
                    </div>
                    </sec:authorize>
                    
                    <sec:authorize access="!isAuthenticated()">
                    <button class="btn btn-outline-dark" onclick="location.href='/login'"> 
                        <i class="bi-person-circle"></i>
                       	 로그인
                    </button> &nbsp;&nbsp;&nbsp;
                    </sec:authorize>
                    
                    <sec:authorize access="!isAuthenticated()">
                    <button class="btn btn-outline-dark" onclick="location.href='/signUp'"> 
                        <i class="bi-person-circle"></i>
                       	 회원가입
                    </button>
                    </sec:authorize>
                    
                    <sec:authorize access="isAuthenticated()">
                    <button class="btn btn-outline-dark btn-small" onclick="location.href='/mypage'"> 
                        <i class="bi-info-circle"></i>
                       	 마이페이지
                    </button>&nbsp;&nbsp;&nbsp;
                    </sec:authorize>
                    
                    <sec:authorize access="isAuthenticated()">
                    <button class="btn btn-outline-dark btn-small" onclick="location.href='/basket'"> 
                        <i class="bi-cart"></i>
                       	 장바구니
                    </button>&nbsp;&nbsp;&nbsp;
                    </sec:authorize>
                    
                    <sec:authorize access="isAuthenticated()">
                    <button class="btn btn-outline-dark btn-small" onclick="location.href='/logout'"> 
                        <i class="bi-person-circle"></i>
                       	 로그아웃
                    </button>
                    </sec:authorize>
                    
                    
                    
                </div>
            </div>
        </nav>