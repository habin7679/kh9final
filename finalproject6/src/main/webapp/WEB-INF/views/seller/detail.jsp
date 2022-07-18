<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container ma-t-100" style="width:900px;" >
 <div class="section-header mt-4 col-md-8 offset-md-2" >
            <h2>seller</h2>
            <p><span>판매자</span> 상세정보</p>
       	</div>
	
	<!-- 프로필 이미지 -->
	 <div class="col-md-8 center offset-md-2" >
	 <div class="row mt-2 text-center mb-2" >
		<img src="${pageContext.request.contextPath}${profileUrl}"
				 class="img img-circle img-shadow " style="width:300px; margin-left:150px; height:400px;">
	</div>
	
	
	<div class="row text-center">
		 <table class="table mt-4">
			<tr>
				<th width="30%">번호</th>
				<td>${sellerDto.sellerNo}</td>
			</tr>
			<tr>
				<th>가입날짜</th>
				<td>${sellerDto.sellerRegistDate}</td>
			</tr>
			<tr>
				<th>은행</th>
				<td>${sellerDto.sellerBank}</td>
			</tr>
			<tr>
				<th>계좌번호</th>
				<td>${sellerDto.sellerAccount}</td>
			</tr>
			<tr>
				<th>사업자번호</th>
				<td>${sellerDto.sellerBusinessNum}</td>
			</tr>
			<tr>
				<th>포인트</th>
				<td>${sellerDto.sellerPoint}</td>
			</tr>
			<tr>
				<th>상태</th>
				<td>${sellerDto.sellerType}</td>
			</tr>
		</table>
	</div>
		
		
	<div class="row mt-2 text-center">
	<div class="row ">
            <div class="col-md-8 offset-md-2">
            <a href ="${pageContext.request.contextPath}/seller/gradeEdit?sellerNo=${sellerDto.sellerNo}" class="btn btn-secondary">승인</a>
            <a href="${pageContext.request.contextPath}/seller/gradeCancel?sellerNo=${sellerDto.sellerNo}"  class="btn btn-secondary">취소</a>
		</div>
		<div class="col-md-8 offset-md-2">
		<a href="adminlist"  class="btn btn-secondary" >목록으로</a>
	</div>
	</div>
	
	</div>
	</div>
	</div>
	    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        
    </script>
    

    
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include> 
	
