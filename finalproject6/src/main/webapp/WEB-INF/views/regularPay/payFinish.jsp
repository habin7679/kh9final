<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%--  <fmt:formatDate value="${reservationDto.reservationDate }" pattern="y년 M월 d일 E a h시 m분 s초"/></div> --%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<style>
.fa-solid {
	cursor: Pointer !important;
}

.fa-solid:hover {
	color: rgba(206, 18, 18, 0.8);
	background: white;
}
</style>

<div class="container ma-t-100" data-aos="fade-up" id="app">

	<div class="section-header mt-4">
		<h2>RegularPayment complete</h2>
		<p>
			<span>정기 결제가 완료되었습니다!</span>
		</p>
	</div>
	<div class='row mt-4'>
		<div class="col-md-3 offset-md-4">
		<a href="${pageContext.request.contextPath}">
			<i class="fa-solid fa-house-chimney fa-3x"></i> 
		</a>
			<div><label>홈으로</label></div>
		</div>
		<div class="col-md-3">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/regularPay/info?sellerNo=${sellerNo}" >
			<i class="fa-solid fa-money-check-dollar fa-3x"></i>
		</a>
			<div><label>정기결제 관리 하기</label></div>
		</div>
	</div>
</div>





<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>