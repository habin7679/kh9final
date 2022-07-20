<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<section>
<form action="find_pw" method="post">
<div class="container ma-t-100" style="width:900px;">
    <div class="section-header mt-4 col-md-8 offset-md-2" >
            <p><span>비밀번호</span> 찾기</p>
       	</div>
	    <div class="col-md-8 offset-md-2">
        <div class="row mt-2 text-left mb-2" >
	        <label>이메일</label>
	        <input type="text" name="memberId" autocomplete="off" required  class="form-control me-1">
	    </div>
	    <div class="row mt-2 text-left mb-2" >
	        <label>이름</label>
	        <input type="text" name="memberName" autocomplete="off" required  class="form-control me-1">
	    </div>
	    <div class="row mt-2 text-left mb-2" >
	        <label>전화번호</label>
	        <input type="tel" name="memberPhone" autocomplete="off" required  class="form-control me-1">
	    </div>
	    <div class="row mt-2 text-left mb-3" >
	        <label>생년월일</label><br>
	        <input type="date" name="memberBirth" autocomplete="off" required  class="form-control me-1">
	    </div>
	     <div class="row mb-2">
	        <button type="submit" class="btn1 ">비밀번호 찾기</button>
	    </div>
		<%-- 에러 표시가 있는 경우 메세지를 출력 --%>
		<% if(request.getParameter("error") != null) { %>
		<div class="row center">
			<h3 style="color:red;">입력한 정보와 일치하는 데이터가 없습니다</h3>
		</div>
		<% } %>
	</div>
	</div>
</form>
</section>
    <jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
