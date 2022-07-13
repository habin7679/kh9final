<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>



<form action="insert" method="post" enctype="multipart/form-data">
	<div class="container-fluid">
	    <div class ="row mt-4">
	    	<div class="p-4 text-light bg-dark rounded">
		        <h1>리뷰등록</h1>
		    </div>	
		</div>
	<div>
	
	<div class="row mt-4">	      
	<%--	아이디로그인후에 이걸로 바꿔치기
			<input type="hidden" name="reviewNo" value="${reviewDto.reviewNo}"> 
	        <input type="hidden" name="memberNo" value="${memberDto.memberNo}"> 
	        <input type="hidden" name="storeNo"  value="${storeDto.storeNo}"> 
	        <input type="hidden" name="reviewWriter" value="${reviewDto.reviewWriter}">
	         --%>    
	        <input type="hidden" name="reviewNo" autocomplete="off" value='1'   class="form-input fill input-round"> 
	        <input type="hidden" name="memberNo" autocomplete="off" value='0'   class="form-input fill input-round"> 
	        <input type="hidden" name="storeNo" autocomplete="off" value='0'   class="form-input fill input-round"> 
     <div>
	        <label>작성자</label>    
	        <input type="text" name="reviewWriter" autocomplete="off" required class="form-input fill input-round">
    </div>
    
   
    <div>
	        <label>평점</label> <br>
	        <input type="radio" name="reviewScore" value="1" checked required class="form-input fill input-round">1점
			<input type="radio" name="reviewScore" value="2" required class="form-input fill input-round">2점
			<input type="radio" name="reviewScore" value="3" required class="form-input fill input-round">3점
			<input type="radio" name="reviewScore" value="4"required class="form-input fill input-round">4점
			<input type="radio" name="reviewScore" value="5"required class="form-input fill input-round">5점   
	   
    </div>
    <div>
	        <label>리뷰내용</label>    
	        <input type="text" name="reviewContent" autocomplete="off" required class="form-input fill input-round">
	        파일 : <input type="file" name="reviewImg" accept=".jpg, .png, .gif, .pdf, .ppt, .txt, .hwp">
    </div>
    <br>
    <br>
    <br>
    <br>
    <br>
   
     	
	    <div class="row">
	        <button type="submit" class="btn btn-success">등록하기</button>
	    </div>
	    </div>
	    </div>
	</div>
</form>


