<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<form action="information" method="post">
	<div class="container ma-t-100" style="width:900px;" >
 	<div class="section-header mt-4 col-md-8 offset-md-2" >
	        <h1>change</h1>
	        <p><span>개인정보 변경</span></p>
	    </div>
	    
	    
	 <div class="col-md-8 offset-md-2">
       <div class="row mt-2 text-left mb-2" >
	       <label>이름</label>
	       <input type="text" name="memberName" autocomplete="off" required class= "form-control me-1"  value="${memberDto.memberName}">
		</div>
	    
	     <div class="row mt-2 text-left mb-2" >
	        <label>닉네임</label>
	        <input type="text" name="memberNick" autocomplete="off" required class="form-control me-1" value="${memberDto.memberNick}">
	    </div>
	    
	       <div class="row mt-2 text-left mb-2" >
	        <label>생년월일</label><br>
	        <input type="date" name="memberBirth" autocomplete="off" required class="form-control me-1"  value="${memberDto.memberBirth}">
	    </div>
	    
	      <div class="row mt-2 text-left mb-2" >
	        <label>전화번호</label>
	        <input type="tel" name="memberPhone" autocomplete="off" required class="form-control me-1"  value="${memberDto.memberPhone}">
	    </div>
	   
	     <div class="row mt-2 text-left mb-2" >
	        <label>성별</label>
	        <select name="memberGender"  class="form-select me-1">
	        	<option >남성</option>
	        	<option>여성 </option>
	        </select>
	    </div>
	    
	    <div class="row mt-2 text-left mb-2" >
	        <label>비밀번호 확인</label>
	        <input type="password" name="memberPw" required class="form-control me-1" >
	    </div>
	    
	    <div class="row mb-2">
	        <button type="submit" class="btn1 c">정보 변경하기</button>
	    </div>
	    
	    <c:if test="${param.error != null}">
		<div class="row center">
			<h3 style="color:red;">비밀번호가 일치하지 않습니다</h3>		
		</div>	    
		</c:if>
	</div>
	
	</table>
	</div>
</form>


  <jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>