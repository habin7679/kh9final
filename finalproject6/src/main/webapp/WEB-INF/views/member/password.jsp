<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
   <section>
<form action="password" method="post">
	<div class="container ma-t-100" style="width:900px;">
    <div class="section-header mt-4 col-md-8 offset-md-2" >
            <h2>password</h2>
            <p><span>비밀번호</span>변경</p>
       	</div>
	    <div class="col-md-8 offset-md-2">
        <div class="row mt-2 text-left mb-2" >

	        <label>현재 비밀번호</label>
	        <input type="password" name="currentPw" required class="form-control me-1">
	    </div>
	    <div class="row mt-2 text-left mb-2" >
	        <label>바꿀 비밀번호</label>
	        <input type="password" name="changePw" required class="form-control me-1">
	    </div>
	    <div class="row mb-2">
	        <button type="submit" class="btn1 ">비밀번호 변경하기</button>
	    </div>
	    
		<c:if test="${param.error != null}">
		<div class="row center">
			<h3 style="color:red;">비밀번호가 일치하지 않습니다</h3>
		</div>
		</c:if>
	</div>
	</div>
</form>
</section>
  <jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>

