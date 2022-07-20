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
		<p><span>그동안 예야쿠를 이용해주셔서 감사합니다</span></p>
	</div>
	
	<div class="section-header mt-4 col-md-8 offset-md-2" >
		<h5 style="font-size:30px;">가까운 시일에 다시 볼 수 있겠죠?</h5><br>
	</div>
	<div class="row center m30">
		
		<img src="<%=request.getContextPath()%>/img/you.jpg" width="300" height="500"></a>
	</div>
</div>
</section>

 <jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>