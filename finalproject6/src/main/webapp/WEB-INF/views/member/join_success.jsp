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
		<h2>join</h2>
            <p><span>회원가입</span></p>
       	</div>
	<div class="col-md-8 offset-md-2">
        <div class="row mt-2 text-center mb-2" >
	        <label style="font-size:25px;">회원가입이 완료되었습니다!</label>
	        </div>
	        <div class="row text-center mb-1 mt-4" >
	<a href="login"  class="b" >로그인 하러가기</a>
	</div>
	<div class="row text-center mb-1">
		<a href="${pageContext.request.contextPath}" class="b">메인 페이지로 이동</a>
	</div>
</div>
</div>
</section>
    <jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>