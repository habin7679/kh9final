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
		<form action="pay" method="post">
				<div>
					<label>결제명</label>
					<input type="text" name="storeNo" value="${storeNo}" readonly>
				</div>
			<button type="submit" class="btn btn1">결제하기</button>
		</form>
	</div>
	
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>