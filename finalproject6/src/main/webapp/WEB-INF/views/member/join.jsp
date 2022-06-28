<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


   
    <!-- 프로필 이미지를 추가하기 위해 enctype을 multipart/form-data로 변경 -->
<form action="join" method="post" enctype="multipart/form-data">
	<div class="container w450 m30">
	    
	    <div class="row center">
	        <h1>회원가입</h1>
	    </div>	
	
	<div>
	        <label>이메일</label>    
	        <input type="text" name="memberId" autocomplete="off" required class="form-input fill input-round"><span>@</span>
    <select name="memberId">
        <option>gmail.com</option>
        <option>hanmail.net</option>
        <option>naver.com</option>
        <option>직접입력</option>
    </select>
    	<input type ="hidden" value="">
    </div>

	    
	    <div class="row">
	        <label>비밀번호</label>
	        <input type="password" name="memberPw" required placeholder="" class="form-input fill input-round">
	    </div>
	   
	    <div class="row">
	        <label>이름</label>
	        <input type="text" name="memberName" required placeholder = "정규식"class="form-input input-round" autocomplete="off">
	    </div>
	   
	    <div>
	        <label>
	           	닉네임
	            <input type="text" name="memberNick" required placeholder="정규식" autocomplete="off" class="form-input fill input-round">
	        </label>
	    </div>
	    
	    <div class="row">
	        <label>생년월일</label><br>
	        <input type="date" name="memberBirth" required class="form-input input-round" autocomplete="off">
	    </div>
	    
	    <div class="row">
	        <label>전화번호</label>
	        <input type="tel" name="memberPhone" required placeholder="- 제외하고 입력" class="form-input fill input-round" autocomplete="off">
	    </div>
	    
	     <div class="row" >
	        <label>성별</label>
	        <select name="memberGender">
	        	<option>남성</option>
	        	<option>여성 </option>
	        </select>
	    </div>
	     	
	     	<
	     	
	    <div class="row">
	        <button type="submit" class="btn btn-primary fill">회원가입</button>
	    </div>
	    
	</div>
</form>


