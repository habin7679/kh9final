<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<div class="container ma-t-100">
	
	<div class="section-header mt-4 col-md-8 offset-md-2" >
            <h1>warning</h1>
            <p><span>권한</span>을 확인하세요.</p>
            <h1>작성자 본인 또는 관리자만 이용할 수 있습니다.</h1>
       	</div>
     <div class="row text-center">
    	<div class="mt-4 col-md-8 offset-md-2" >
           <a href="${pageContext.request.contextPath}" class="btn btn-outline-danger">홈으로</a>
       	</div>   	
     </div>  	
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>