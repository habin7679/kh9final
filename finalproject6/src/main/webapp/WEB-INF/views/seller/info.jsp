<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container ma-t-100" style="width:900px;" >
<div class="container w400 m30">
	<div class="col-md-8 offset-md-4">
		<h1>판매자 정보</h1>
	</div>
	<br><br>
	<div class="row">
	     <table class="table">
                    <thead class="text-center">
                        <tr>
                            <th>등록일</th>
                            <th>은행명</th>
                            <th>계좌번호</th>
                            <th>포인트 금액</th>
                            <th>상태</th>
                            <th>사업자번호</th>
                        </tr>
                    </thead>
                    <tbody class="text-center">
                    	<c:forEach var="sellerDto" items="${list}">
	                        <tr>
	                            <td>${sellerDto.sellerRegistDate}</td>
	                            <td>${sellerDto.sellerBank}</td><!-- 작성자 닉네임 클릭 시 쪽지 -->
	                            <td>${sellerDto.sellerAccount}</td>
	                            <td>${sellerDto.sellerPoint}</td>
	                            <td>${sellerDto.sellerType}</td>
	                            <td>${sellerDto.sellerBusinessNum}</td>
	                        </tr>
                        </c:forEach>
                    </tbody>
                </table>

	</div>
	</div>
	</div>
	
