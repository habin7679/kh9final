<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
 
<section>
<form action="exit" method="post">
	<div class="container ma-t-100" style="width:900px;">
    <div class="section-header mt-4 col-md-8 offset-md-2" >
            <p><span>탈퇴</span></p>
       	</div>
	    <div class="col-md-8 offset-md-2">
        <div class="row mt-2 text-center mb-2" >

			<h3>비밀번호를 입력해주세요</h3>
	</div>
	<div class="row mt-2 text-left mb-2">
		<input type="password" name="memberPw" required class="form-control me-1">
	</div>
	<div class="row mb-2">
		<button type="submit" class= "btn1">탈퇴하겠습니다</button>
	</div>
</div>
</form>
</section>
    <jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
