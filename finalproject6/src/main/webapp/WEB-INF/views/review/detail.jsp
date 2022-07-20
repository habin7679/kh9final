<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.passSpace {
	word-break: break-all;
}

.fa-cursor {
	cursor: pointer;
}

.fa-solid:hover {
	color: red;
}

.a {
	border-collapse: separate;
}

.d {
	border-bottom-left-radius: 1em;
	border-bottom-right-radius: 1em;
}

.e {
	border-top-left-radius: 1em;
	border-top-right-radius: 1em;
}

.tb-color {
	background-color: #f1f2f6;
}

.circle-head {
	background-color: #57606f;
	border-radius: 1.2em;
	color: white;
	padding: 0.5em;
	font-size: 14px;
}

.title-size {
	font-size: 22px;
}
</style>

<div id"app" class="container ma-t-100">

	<div class="section-header mt-4 col-md-6 offset-md-3">
		<h2>Review</h2>
		<p>
			<span>리뷰</span> 게시판
		</p>
	</div>

	<table class="table">
		<tr>
			<td>
				<h3>나의 리뷰</h3>
			</td>
			<c:if test="1=1"></c:if>
		</tr>
		<tr>
			<td>${reviewDto.reviewWriter}</td>
		</tr>
		<tr height="400" class="tb-color">
			<td class="p-4 d" style="border-bottom: none;"><c:choose>
					<c:when test="${reviewAttach == false || passImg}">
						<img src="${pageContext.request.contextPath}${reviewImgUrl}"
							width="50%">
						<pre>${reviewDto.reviewContent}</pre>
						<pre>평점: ${reviewDto.reviewScore}</pre>
					</c:when>
					<c:otherwise>
						<pre>${reviewDto.reviewContent}</pre>
						<pre>평점: ${reviewDto.reviewScore}</pre>
					</c:otherwise>
				</c:choose></td>
		</tr>
		<c:if test="${reviewAttach == false}">
			<tr>
				<td><a class="cursor:pointer;"
					href="${pageContext.request.contextPath}${reviewImgUrl}">${attachName}</a>
				</td>
			</tr>
		</c:if>
		<tr style="text-align: right;">
			<td style="border-bottom: none;"><c:set var="memberNo"
					value="${reviewDto.memberNo}" /> <c:if test="${no eq memberNo}">
					<a
						href="${pageContext.request.contextPath}/review/edit?reviewNo=${reviewDto.reviewNo}"
						class="btn btn primary">수정</a>
					<a
						href="${pageContext.request.contextPath}/review/delete?reviewNo=${reviewDto.reviewNo}&storeNo=${reviewDto.storeNo}"
						class="btn btn primary">삭제</a>
				</c:if> <a
				href="${pageContext.request.contextPath}/review/list?storeNo=${reviewDto.storeNo}"
				class="btn btn primary">목록</a></td>
		</tr>
		</tbody>
	</table>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>