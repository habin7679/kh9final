<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container ma-t-100" style="width:900px;" >
<div class="container w400 m30">
	<div class="row center m30">
		<h1>판매자 정보</h1>
	</div>
	
	<div class="row">
		<table class="table table-border table-hover">
			<tr>
				<th width="30%">등록일</th>
				<td>${sellerDto.sellerRegistDate}</td>
			</tr>
			<tr>
				<th>은행명</th>
				<td>${seller.Dto.sellerBank}</td>
			</tr>
			<tr>
				<th>계좌번호</th>
				<td>${sellerDto.sellerAccount}</td>
			</tr>
			<tr>
				<th>포인트 금액</th>
				<td>${sellerDto.sellerPoint}</td>
			</tr>
			<tr>
				<th>사업자번호</th>
				<td>${sellerDto.sellerBusinessNum}</td>
			</tr>
			<tr>
				<th>판매자 상태</th>
				<td>${sellerDto.sellerType}</td>
			</tr>
		</table>
		
			 <div class="row mt-2 text-center mb-2" >
		<img src="${pageContext.request.contextPath}${profileUrl}"
				 class="img img-circle img-shadow " style="width:300px; margin-left:150px; height:150px;">
	</div>
	</div>
	</div>
	
