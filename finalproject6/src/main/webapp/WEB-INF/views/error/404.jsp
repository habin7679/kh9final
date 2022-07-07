<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<div class="container w700 m30">

	<div class="row center m30">
		<h1>페이지를 찾을 수 없습니다</h1>
	</div>
	
	<div class="row">
		<img src="${pageContext.request.contextPath}/resources/img/404.gif" class="fill img img-shadow">
	</div>
	
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>