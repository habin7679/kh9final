<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<!-- .item_name("테스트 정기 결제")
.partner_order_id("12345")
.partner_user_id("testuser")
.quantity(1)
.total_amount(50000) -->
	<div class=" container ma-t-100" >
	<div>
		<h1>정기결제</h1>
		<h1>정기결제</h1>
		<h1>정기결제</h1>
		<h1>정기결제</h1>
		<h1>정기결제</h1>
	</div>
		<form action="insert" method="post">
			<c:forEach var="storeNameMemberNameVO" items="${list}">
				<div>
					<label>결제명</label>
					<input type="text" name="item_name" value="${storeNameMemberNameVO.memberName}-${storeNameMemberNameVO.storeName} 정기결제" readonly>
				</div>
				<div>
					<label>이름</label>
					<input type="text" name="partner_user_id" value="${memberDto.memberName}" readonly>
				</div>
					<input type="hidden" name="partner_order_id" value="${sequence}">
					<input type="hidden" name="quantity" value="1">
					<input type="hidden" name="total_amount" value="100000">
			</c:forEach>
			<button type="submit" class="btn btn1">결제하기</button>
		</form>
	</div>
	
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>