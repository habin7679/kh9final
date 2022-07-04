<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <div class="container-fluid top">
    	<div class="row">
    		<div class="col-md-8 offset-md-2">
    			<table class="table">
    				<tr>
    					<td>
    						<h3>[${togetherDto.togetherTitle }]</h3>
    					</td>
    				</tr>
    				
    				<tr>
    					<td>${togetherDto.togetherWriter}</td>
    				</tr>
    				
    				<tr>
    					<td>
    						<pre>${togetherDto.togetherContent}</pre>
    					</td>
    				</tr>
    				<tr>
    					<td>
    						<a href="${pageContext.request.contextPath}/together/edit?togetherNo=${togetherDto.togetherNo}" class="btn btn primary">수정</a>
    						<a href="${pageContext.request.contextPath}/together/delete?togetherNo=${togetherDto.togetherNo}" class="btn btn primary">삭제</a>
    						<a href="${pageContext.request.contextPath}/together/list" class="btn btn primary">목록</a>
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
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>