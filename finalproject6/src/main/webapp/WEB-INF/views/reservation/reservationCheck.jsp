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
			<div class="col-md-4 offset-md-4">
				<label>이름 <i class="fa-solid fa-user-tag"></i></label> <input type="text" class="form-control"
					value="${memberDto.memberName}" readonly>
			</div>
			<div class="col-md-4 offset-md-4">
				<label>인원수 <i class="fa-solid fa-people-group"></i></label> <input type="number" class="form-control"
					value="${reservationDto.reservationPeople }" readonly>
			</div>
			<div class="col-md-4 offset-md-4">
				<label>총예약금(<i class="fa-solid fa-won-sign"></i>)</label> <input type="number" class="form-control"
					value="${reservationDto.reservationPrice}" readonly>
			</div>
			<div class="col-md-4 offset-md-4">
				<label>예약일 <i class="fa-solid fa-calendar-days"></i></label> <input type="text" class="form-control"
					value="<fmt:formatDate value="${reservationDto.reservationDate }" pattern="y년 M월 d일"/>"
					readonly>
			</div>
			<div class="col-md-4 offset-md-4">
				<label>예약시간 <i class="fa-solid fa-clock"></i></label> <input type="text" class="form-control"
					value="${reservationDto.reservationTime}" readonly>
			</div>
			<div class="col-md-4 offset-md-4">
				<label>주소 <i class="fa-solid fa-map-location-dot"></i></label>
				 <input type="text" class="form-control"
					value="${storeDto.storePost }" readonly>
				<input type="text" class="form-control"
					value="${storeDto.storeAddress}" readonly>
				<input type="text" class="form-control"
					value="${storeDto.storeDetailAddress }" readonly>
			</div>
			<!-- 			<div class="col-md-6 offset-md-3"> -->
			<!-- 			<div id="map" style="width:500px;height:400px;"></div> -->
			<!-- 			</div> -->
			<div class="col-md-4 offset-md-4 d-grid">
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