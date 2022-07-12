<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



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
	</div>
	
	</div>
	
