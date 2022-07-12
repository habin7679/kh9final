<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

 <section>
<form method="post" enctype="multipart/form-data">
	<div class="container ma-t-100" style="width:900px;" >
    <div class="section-header mt-4 col-md-8 offset-md-2" >
	    <h2>Join</h2>
            <p><span>판매자 등록</span></p>
       	</div>
	 <div class="col-md-8 offset-md-2">
   

	    <div class="row text-left mb-2">
            <label>은행명</label>
	        <input type="text" name="sellerBank" required placeholder="" class="form-control me-1">
	    </div>
	   
   		<div class="row text-left mb-2">
	        <label>계좌번호</label>
	        <input type="text" name="sellerAccount" required placeholder = "11자리"class="form-control me-1" autocomplete="off">
	    </div>
	   
	     <div class="row text-left mb-2">
	        <label>사업자번호</label>
	            <input type="text" name="sellerBusinessNum" required placeholder="10자리" autocomplete="off" class="form-control me-1">
	    </div>
	    
	       <div class="row text-left mb-2">
	    	<label>신청 파일</label><br>
	    	<input type="file" name="sellerProfile" class="form-control me-1" style="width:50%;">
	    </div>
	    
	    <div class="row mb-2">
	        <button type="submit" class="btn1 c">판매자 신청</button>
	    </div>
	    </div>
	    </div>
	    </form>
	    </section>
	    
	    

	 <jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>