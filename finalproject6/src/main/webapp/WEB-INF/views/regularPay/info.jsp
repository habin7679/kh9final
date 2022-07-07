<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%--  <fmt:formatDate value="${reservationDto.reservationDate }" pattern="y년 M월 d일 E a h시 m분 s초"/></div> --%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<div class="container-fluid top">
	<div class="row">
		<div class="col-md-8 offset-md-2">
			<table class="table table-bordered rounded">
				<thead>
					<tr>
						<th>정기결제 등록명</th>
						<th>사업자명</th>
						<th>정기결제 시작일</th>
						<th>정기결제 가격(월)</th>
						<th>결제 변경</th>
						<th>취소</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="regularPaymentDto" items="${list}">
						<tr>
							<td>${regularPaymentDto.regularPaymentName}</td>
							<td>${regularPaymentDto.regularPaymentUserId}</td>
							<td>${regularPaymentDto.regularPaymentTime}</td>
							<td>${regularPaymentDto.regularPaymentPrice}</td>
							<td><a href="#" class="btn btn1">결제변경</a></td>
							<td><a href="cancel?regularPaymentNo=${regularPaymentDto.regularPaymentNo}" class="btn btn1">취소</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>





<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>