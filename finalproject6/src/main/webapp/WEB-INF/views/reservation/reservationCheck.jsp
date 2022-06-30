<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--  <fmt:formatDate value="${reservationDto.reservationDate }" pattern="y년 M월 d일 E a h시 m분 s초"/></div> --%>
 <jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
 <div><h1>예약 확인!</h1></div>

<div>가게 이름 : ${storeDto.storeName }</div>
<div>이름 : ${memberDto.memberName}</div>
<div>닉네임 : ${memberDto.memberNick}</div>
<div>가게 예약금 : ${storeDto.storeReservationPrice}</div>
<div>예약 인원수 : ${reservationDto.reservationPeople } </div>
<div>총 예약금 : ${reservationDto.reservationPrice } </div>
<div>예약 날짜 : <fmt:formatDate value="${reservationDto.reservationDate }" pattern="y년 M월 d일"/></div>
<div>예약 시간 : ${reservationDto.reservationTime}</div>
<div>가게 지번 : ${storeDto.storePost }</div>
<div>가게 주소 : ${storeDto.storeAddress}</div>
<div>가게 상세주소 ${storeDto.storeDetailAddress }</div>

<form action="pay" method="post">
<input type="hidden" name="storeNo" value="${reservationDto.storeNo}">
<input type="hidden" name="memberNo" value="${reservationDto.memberNo}">
<input type="hidden" name="reservationNo" value="${reservationDto.reservationNo}"> 
<button type="submit">결제하기</button>
</form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>