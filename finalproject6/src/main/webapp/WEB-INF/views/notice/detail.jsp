<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상세페이지</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>

    </style>
</head>
<body>
    <div class="container-fluid">
    	<div class="row">
    		<div class="col-md-8 offset-md-2">
    			<table class="table">
    				<tr>
    					<td>
    						<h3>[${noticeDto.noticeHead }]</h3>
    					</td>
    				</tr>
    				
    				<tr>
    					<td>${noticeDto.noticeWriter}</td>
    				</tr>
    				
    				<tr>
    					<td>
    					<c:choose>
    						<c:when test="${noAttach == false || passImg}">
    							<img src="${pageContext.request.contextPath}${noticeImgUrl}" width="50%">
    							<pre>${noticeDto.noticeContent }</pre>
    						</c:when>
    						<c:otherwise>
    							<pre>${noticeDto.noticeContent }</pre>
    						</c:otherwise>
    					</c:choose>
    					</td>
    				</tr>
    				<c:if test="${noAttach == false}">
    				<tr>
    					<td>
    						<a class="cursor:pointer;" href="${pageContext.request.contextPath}${noticeImgUrl}">${attachName}</a>
    					</td>
    				</tr>
    				</c:if>
    				<tr>
    					<td>
    						<a href="${pageContext.request.contextPath}/notice/edit?noticeNo=${noticeDto.noticeNo}" class="btn btn primary">수정</a>
    						<a href="${pageContext.request.contextPath}/notice/delete?noticeNo=${noticeDto.noticeNo}" class="btn btn primary">삭제</a>
    						<a href="${pageContext.request.contextPath}/notice/list" class="btn btn primary">목록</a>
    					</td>
    				</tr>
    			</table>
    		</div>
    	</div>
    </div>

    <!--lazy loading 배치 - 기능은 다소 늦게 돌아가지만 화면을 먼저 띄울 수 있다 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script>

    </script>
</body>
</html>