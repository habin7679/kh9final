<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<style>
.b{
color:var(--color-primary);
}
.c{
color:#fff;
}
</style>

<c:set var="saveIdExist" value="${cookie.saveId != null}"></c:set>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<section>
<form action="login" method="post">
	<input type="hidden" name="referer" value="${referer}">
    
    <div class="container ma-t-100" style="width:900px;">
    <div class="section-header mt-4 col-md-8 offset-md-2" >
            <h2>login</h2>
            <p><span>로그인</span></p>
       	</div>
      
         <div class="col-md-8 offset-md-2">
        <div class="row mt-2 text-left mb-2" >
            <label>아이디</label>
    		<input type="text" name="memberId" required class="form-control me-1"  autocomplete="off" value="${cookie.saveId.value}">
        </div>
        <div class="row text-left mb-2">
            <label>비밀번호</label>
            <input type="password" name="memberPw" required class="form-control me-1" >
        </div>
        <div class="row mb-3">
        	<label>
        		<c:choose>
        			<c:when test="${saveIdExist}">
		        		<input type="checkbox" name="remember" checked>
        			</c:when>
        			<c:otherwise>
        				<input type="checkbox" name="remember">
        			</c:otherwise>
        		</c:choose>
        		아이디 저장하기
        	</label>
        </div>
        <div class="row mb-2">
            <input type="submit" value="로그인" class="btn1 c">
        </div>
        
        <div class="row text-center mb-1 ">
        <div class="row ">
        <div class="col-md-6">
            <a href="find_id" >아이디 찾기</a> 
        </div>
        <div class="col-md-6">
             <a href="find_pw" >비밀번호 찾기</a>
        </div>
        </div>
        </div>
        <div class="row text-center mb-1">
            <a href="join" class="b" >새로 오셨나요?</a>
        </div>
        </div>

        
		<%-- 에러 표시가 있는 경우 메세지를 출력 --%>
		<c:if test="${param.error != null}">
		<div class="row center">
			<h3 style="color:red;" class="mt-2 offset-md-3">로그인 정보가 일치하지 않습니다</h3>	
		</div>
		</c:if>
    </div>
</form>
</section>

    <jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
