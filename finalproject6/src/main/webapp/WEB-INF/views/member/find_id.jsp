<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<section>
<form action="find_id" method="post">
	<div class="container ma-t-100" style="width:900px;">
    <div class="section-header mt-4 col-md-8 offset-md-2" >
            <p><span>아이디찾기</span></p>
       	</div>
	    <div class="col-md-8 offset-md-2">
        <div class="row mt-2 text-left mb-2" >
	        <label>이름</label>
	        <input type="text" name="memberName" autocomplete="off" required class="form-control me-1">
	    </div>
	    <div class="row mt-2 text-left mb-2" >
	        <label>전화번호</label>
	        <input type="tel" name="memberPhone" autocomplete="off" required class="form-control me-1">
	    </div>
	    <div class="row mt-2 text-left mb-3" >
	        <label>생년월일</label><br>
	        <input type="date" name="memberBirth" autocomplete="off" required class="form-control me-1">
	    </div>
	    <div class="row mb-2">
	        <button type="submit" class="btn1 ">아이디 찾기</button>
	    </div>
	    <c:if test="${param.error != null}">
		<div class="row center">
			<h3 style="color:red;">정보가 일치하는 아이디가 존재하지 않습니다</h3>
		</div>
		</c:if>
	</div>
	</div>
</form>
</section>
    <jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>

