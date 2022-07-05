<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<form action="password" method="post">
	<div class="container-fluid w400 m30">
	    <div class="row center">
	        <h1>비밀번호 변경</h1>
	    </div>
	    <div class="row">
	        <label>현재 비밀번호</label>
	        <input type="password" name="currentPw" required class="form-input fill input-round">
	    </div>
	    <div class="row">
	        <label>바꿀 비밀번호</label>
	        <input type="password" name="changePw" required class="form-input fill input-round">
	    </div>
	    <div class="row">
	        <button type="submit" class="btn btn-primary fill">비밀번호 변경하기</button>
	    </div>
	    
		<c:if test="${param.error != null}">
		<div class="row center">
			<h3 style="color:red;">비밀번호가 일치하지 않습니다</h3>
		</div>
		</c:if>
	</div>
</form>

