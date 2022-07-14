<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

    <!-- 프로필 이미지를 추가하기 위해 enctype을 multipart/form-data로 변경 -->
 <section> 
 <script type="text/javascript">
 $(function(){
     $("textarea[name=noticeContent]").summernote({
         height: 350
         });
 });
</script>
     
<form method="post" >
	<div class="container ma-t-100" style="width:900px;" >
    <div class="section-header mt-4 col-md-8 offset-md-2" >
	    <h2>msg</h2>
            <p><span>쪽지</span>보내기</p>
       	</div>
	 <div class="col-md-8 offset-md-2">
        <div class="row mt-2 text-left mb-2" >
            <label>제목</label>
	        <input type="text" name="sendNote" autocomplete="off" required class="form-control me-1">
   		 </div>

	    <div class="row text-left mb-2">
            <label>비밀번호</label>
	        <input type="password" name="memberPw" required placeholder="" class="form-control me-1">
	    </div>
	   
   		<div class="row text-left mb-2">
	        <label>이름</label>
	        <input type="text" name="memberName" required placeholder = "정규식"class="form-control me-1" autocomplete="off">
	    </div>
	   
	     <div class="row text-left mb-2">
	        <label>닉네임</label>
	            <input type="text" name="memberNick" required placeholder="정규식" autocomplete="off" class="form-control me-1">
	    </div>
	    
		<div class="row text-left mb-2">
	        <label>생년월일</label><br>
	        <input type="date" name="memberBirth" required class="form-control me-1" autocomplete="off">
	    </div>
	    
	    <div class="row text-left mb-2">
	        <label>전화번호</label>
	        <input type="tel" name="memberPhone" required placeholder="- 제외하고 입력" class="form-control me-1" autocomplete="off">
	    </div>
	    
	     <div class="row text-left mb-2">
	        <label>성별</label>
	        <select name="memberGender"  class="form-select me-1">
	        	<option>남성</option>
	        	<option>여성 </option>
	        </select>
	    </div>
	    
	    <div class="row text-left mb-2">
	    	<label>프로필 이미지</label><br>
	    	<input type="file" name="memberProfile" class="form-control me-1" style="width:50%;">
	    </div>
	     	
	    <div class="row mb-2">
	        <button type="submit" class="btn1 c">회원가입</button>
	    </div>
	    </div>
	    </div>
	    </form>
	    </section>
	 <jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>