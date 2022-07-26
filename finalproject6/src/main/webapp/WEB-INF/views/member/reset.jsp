<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>    

<section>
<form action="${pageContext.request.contextPath}/member/reset" method="post">
<div class="container ma-t-100" style="width:900px;">
<div class="section-header mt-4 col-md-8 offset-md-2" >
            <p><span>비밀번호</span> 재설정</p>
       	</div>
       <div class="col-md-8 offset-md-2">
	<input type="hidden" name="cert" value="${cert}">
	<input type="hidden" name="memberId" value="${param.memberId}">
	<div class="row mt-2 text-left mb-2" >
	<label>변경할 비밀번호를 입력해주세요</label>
	<input type="password" name="memberPw" required  class="form-control me-1">
	</div>
	 <div class="row mb-2">
	<input type="submit" value="변경" class="btn1">
	</div>
	</div>
	</div>
</form>
</section>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>