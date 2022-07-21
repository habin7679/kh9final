<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.b-input {
	width: 100%;
	padding: 5px;
}
</style>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script>

</script>
<div class="container ma-t-100">



	<div class="row mt-2">
		<div class="col-md-8 offset-md-2">
			<a href="insert" class="btn1 col-md-1 offset-md-11">리뷰쓰기</a>
		</div>
	</div> 

	<div class="row mt-2">
		<div class="col-md-8 offset-md-2">
			<table class="table">
				<thead class="text-center">
					<tr>
						<th>작성자</th>
						<th>작성일</th>
						<th class="w-50">리뷰내용</th>
						<th>평점</th>
					</tr>
				</thead>
				<tbody class="text-center">
					<c:forEach var="reviewDto" items="${list}">
						<tr>
							<td style="text-align: left !important"><a
								href="detail?reviewNo=${reviewDto.reviewNo}">

									${reviewDto.reviewWriter} </a></td>
							<td>${reviewDto.reviewTime}</td>
							<td>${reviewDto.reviewContent}</td>
							<td>${reviewDto.reviewScore}</td>
							
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<c:if test="${list.isEmpty()}">
				<div class="row mt-2 text-center">
					<h4>검색 결과가 없습니다.</h4>
				</div>
			</c:if>
		</div>
	</div>


	<div class="row mt-2 text-center">
		<div class="col-md-8 offset-md-2">
			<!--검색창-->
			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-6">
					<form action="list" method="get">
						<div class="d-flex justify-content-center">
							<select name="type" class="form-select me-1" style="width: 15%;">
								<option value="review_writer"
									<c:if test="${type == 'review_writer'}">selected</c:if>>작성자</option>
							</select> <input type="search" name="keyword" placeholder="검색어 입력"
								value="${keyword}" class="form-control me-1" style="width: 50%;"
								autocomplete="off"> <input type="submit" value="검색"
								class="btn btn-outline-danger" style="width: 15%;">
						</div>
					</form>
				</div>
				<div class="col-md-3"></div>
			</div>
		</div>
	</div>
</div>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>