<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>    

<h1>비밀번호 재설정 페이지</h1>

<form action="reset" method="post">
	<input type="hidden" name="cert" value="${cert}">
	<input type="hidden" name="memberId" value="${param.memberId}">
	바꿀 비밀번호 : 
	<input type="password" name="memberPw" required>
	<input type="submit" value="변경">
</form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>