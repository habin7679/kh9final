<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
    <style>
.b{
color:var(--color-primary);
}
</style>

 <section>
<div class="container ma-t-100" style="width:900px;" >
    <div class="section-header mt-4 col-md-8 offset-md-2" >
		<p><span>판매자 신청</span></p>
	</div>
	
	<div class="col-md-8 offset-md-2">
        <div class="row mt-2 text-center mb-2" >
	        <label style="font-size:30px;">판매자 신청이 완료되었습니다!</label>
	        </div><br>
	
	    <div class="row mt-2 text-center mb-2" >
		<h2><a href="${pageContext.request.contextPath}" class="b">메인페이지로 이동</a></h2>
		</div>
	</div>
</div>
</section>

	 <jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>