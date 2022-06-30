<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<form action="insert" method="post">
<div>
${storeDto}
<input type="hidden" name="storeNo" value="${storeDto.storeNo}">
</div>
<div>
${memberNo}
<input type="hidden" name="memberNo" value="${memberNo}">
</div>
<div>
	<span>가게명 : ${storeDto.storeName}</span>
</div>
	
<div>
	<span>우편 번호 : ${storeDto.storePost }</span>
</div>
<div>
	<span>주소 : ${storeDto.storeAddress }</span>
</div>
<div>
	<span>상세 주소 : ${storeDto.storeDetailAddress }</span>
</div>

<div>
	<span>예약금 : ${storeDto.storeReservationPrice}</span>
</div>
<div>
	인원수 : <input type="number" name="reservationPeople">
</div>
<div>
	<span>토탈 : ${storeDto.storeReservationPrice}  </span>
</div>
<div>
	예약일 ; <input type="date" name="reservationDate">
</div>
<div>
	<label>
	런치값
	<input type="checkbox" name=reservationTime value="${storeDto.storeLunchTime }">
	</label>
</div>

<div>
	요청사항 : <textarea rows="10" cols="10" name="reservationContent"></textarea>
</div>

<input type="submit" value="예약하기">

</form>



<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
