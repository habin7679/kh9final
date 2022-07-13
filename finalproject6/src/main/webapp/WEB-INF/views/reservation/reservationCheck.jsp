<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%--  <fmt:formatDate value="${reservationDto.reservationDate }" pattern="y년 M월 d일 E a h시 m분 s초"/></div> --%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<div class="container ma-t-100" data-aos="fade-up" id="app">

	<div class="section-header mt-4">
		<h2>예약 확인</h2>

		<p>
			<span>${storeDto.storeName}</span>
		</p>
	</div>
	<div class="col align-items-center reservation-form-bg">
		<form action="pay" method="post">
			<div class="col-md-6 offset-md-3">
				<label>이름</label> <input type="text" class="form-control"
					value="${memberDto.memberName}" readonly>
			</div>
			<div class="col-md-6 offset-md-3">
				<label>인원수</label> <input type="number" class="form-control"
					value="${reservationDto.reservationPeople }" readonly>
			</div>
			<div class="col-md-6 offset-md-3">
				<label>총예약금</label> <input type="number" class="form-control"
					value="${reservationDto.reservationPrice} " readonly>
			</div>
			<div class="col-md-6 offset-md-3">
				<label>예약일</label> <input type="text" class="form-control"
					value="<fmt:formatDate value="${reservationDto.reservationDate }" pattern="y년 M월 d일"/>"
					readonly>
			</div>
			<div class="col-md-6 offset-md-3">
				<label>예약시간</label> <input type="text" class="form-control"
					value="${reservationDto.reservationTime}" readonly>
			</div>
			<div class="col-md-6 offset-md-3">
				<label>우편번호</label> <input type="text" class="form-control"
					value="${storeDto.storePost }" readonly>
			</div>
			<div class="col-md-6 offset-md-3">
				<label>주소</label> <input type="text" class="form-control"
					value="${storeDto.storeAddress}" readonly>
			</div>
			<div class="col-md-6 offset-md-3">
				<label>상세 주소</label> <input type="text" class="form-control"
					value="${storeDto.storeDetailAddress }" readonly>
			</div>
			<!-- 			<div class="col-md-6 offset-md-3"> -->
			<!-- 			<div id="map" style="width:500px;height:400px;"></div> -->
			<!-- 			</div> -->
			<div class="col-md-6 offset-md-3">
				<input type="hidden" name="storeNo"
					value="${reservationDto.storeNo}"> <input type="hidden"
					name="memberNo" value="${reservationDto.memberNo}"> <input
					type="hidden" name="reservationNo"
					value="${reservationDto.reservationNo}">
				<button type="submit" class="btn btn1">결제하기</button>
			</div>
		</form>
	</div>

</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>