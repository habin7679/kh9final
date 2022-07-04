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
		<form>
			<c:forEach var="storeNameMemberNameVO" items="${list}">
				<div>
					<label>결제명</label>
					<input type="text" name="item_name" value="${storeNameMemberNameVO.memberName}-${storeNameMemberNameVO.storeNo} 정기결제" readonly>
				</div>
				<div>
					<label>아이템 네임</label>
					<input type="text" name="item_name">
				</div>
				<div>
					<label>아이템 네임</label>
					<input type="text" name="item_name">
				</div>
				<div>
					<label>아이템 네임</label>
					<input type="text" name="item_name">
				</div>
			</c:forEach>
		</form>
	</div>