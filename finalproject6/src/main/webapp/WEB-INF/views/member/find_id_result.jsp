<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<div class="container w500 m30">
	<div class="row center m30">
		<h1>아이디 검색 결과</h1>
	</div>
	<div class="row center">
		찾으시는 아이디는 ${findUserId} 입니다
	</div>
	<div class="row center m30">
		<h2><a href="login">로그인 하러가기</a></h2>
	</div>
	<div class="row center m30">
		<h2><a href="${pageContext.request.contextPath}">메인 페이지로 이동</a></h2>
	</div>
</div>
