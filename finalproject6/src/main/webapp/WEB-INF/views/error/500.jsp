<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<div class="container w700 m30">

	<div class="row center m30">
		<h1>일시적인 오류가 발생했습니다</h1>
	</div>
	
	<div class="row">
		<img src="${pageContext.request.contextPath}/image/500.png" class="fill img img-shadow">
	</div>
	
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>