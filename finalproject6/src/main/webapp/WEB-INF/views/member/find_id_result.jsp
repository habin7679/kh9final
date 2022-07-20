<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<style>
.b{
color:var(--color-primary);
}

</style>
<section>
 <div class="container ma-t-100" style="width:900px;">
    <div class="section-header mt-4 col-md-8 offset-md-2" >
            <p><span>아이디</span> 검색 결과</p>
       	</div>
        <div class="row text-center mb-1 mt-5"  >
		<label >찾으시는 아이디는 <label class="b">${findUserId}</label> 
		입니다</label>
	</div>
	 <div class="row text-center mb-1 mt-4" >
	<a href="login"  >로그인 하러가기</a>
	</div>
	<div class="row text-center mb-1">
		<a href="${pageContext.request.contextPath}">메인 페이지로 이동</a>
	</div>
</div>
</section>
    <jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>