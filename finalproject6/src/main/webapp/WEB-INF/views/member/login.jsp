<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="saveIdExist" value="${cookie.saveId != null}"></c:set>


<form action="login" method="post">
	<input type="hidden" name="referer" value="${referer}">

    <div class="container w400 m30">
        <div class="row center">
            <h1>로그인</h1>
        </div>
        <div class="row">
            <label>아이디</label>
    		<input type="text" name="memberId" required class="form-input fill input-round" autocomplete="off" value="${cookie.saveId.value}">
        </div>
        <div class="row">
            <label>비밀번호</label>
            <input type="password" name="memberPw" required class="form-input fill input-round">
        </div>
        <div class="row">
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
        <div class="row">
            <input type="submit" value="로그인" class="btn btn-primary fill">
        </div>
        <div class="row center">
            <a href="find_id" class="link">아이디가 기억나지 않아요</a>
        </div>
        <div class="row center">
            <a href="find_pw" class="link">비밀번호가 기억나지 않아요</a>
        </div>
        
		<%-- 에러 표시가 있는 경우 메세지를 출력 --%>
		<c:if test="${param.error != null}">
		<div class="row center">
			<h3 style="color:red;">로그인 정보가 일치하지 않습니다</h3>	
		</div>
		</c:if>
    </div>
</form>
