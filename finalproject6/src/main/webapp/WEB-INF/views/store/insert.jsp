<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>


    <!-- 프로필 이미지를 추가하기 위해 enctype을 multipart/form-data로 변경 -->
   <form action="delete" method="post">
   <a href="${pageContext.request.contextPath}/store/delete?storeNo=${storeDto.storeNo}" class="btn btn primary">삭제</a>
   	<input type="number" name="storeNo"  value ='50' autocomplete="off"  class="form-input fill input-round">
   	<div class="row">
	        <button type="submit" class="btn btn-primary fill">삭제하기</button>
	    </div>
   </form>
<form action="insert" method="post" >
	<div class="container-fluid">
	    <div class ="row mt-4">
	    	<div class="p-4 text-light bg-dark rounded">
		        <h1>가게등록</h1>
		    </div>	
		</div>
	<div>
	
	<div class="row mt-4">
		<div class="col-md-8 offset-md-2 d-grid gap-2">
	           
	        <input type="hidden" name="storeNo" autocomplete="off" value='1'   class="form-input fill input-round">
    </div>
    <div>
	        <label>음식점 종류</label> <br>
	        <input type="radio" name="category" value="스시" checked required class="form-input fill input-round">스시
			<input type="radio" name="category" value="한우" required class="form-input fill input-round">한우
			<input type="radio" name="category" value="꼬치" required class="form-input fill input-round">꼬치
			<input type="radio" name="category" value="커피"required class="form-input fill input-round">커피   
	   
    </div>
    <div>
	        <label>동</label>    
	        <input type="text" name="dong" autocomplete="off" required class="form-input fill input-round">
    </div>
    <div>
	        <label>구</label>    
	        <input type="text" name="gu" autocomplete="off" required class="form-input fill input-round">
    </div>
    <div>
	        <label>휴대폰 번호</label>    
	        <input type="number" name="sellerNo" autocomplete="off" required class="form-input fill input-round">
    </div>
    <div>
	        <label>가게이름</label>    
	        <input type="text" name="storeName" autocomplete="off" required class="form-input fill input-round">
    </div>
	<div>
	        <label>가게전화번호</label>    
	        <input type="text" name="storeCall" autocomplete="off" required class="form-input fill input-round">
    </div><div>
	        <label>post</label>    
	        <input type="text" name="storePost" autocomplete="off" required class="form-input fill input-round">
    </div><div>
	        <label>가게주소</label>    
	        <input type="text" name="storeAddress" autocomplete="off" required class="form-input fill input-round">
    </div><div>
	        <label>가게상세주소</label>    
	        <input type="text" name="storeDetailAddress" autocomplete="off" required class="form-input fill input-round">
    </div><div>
	        <label>사장님이름</label>    
	        <input type="text" name="storeBossName" autocomplete="off" required class="form-input fill input-round">
    </div>
    <div>
	        <label>가게등록일</label>    
	        <input type="date" name="storeRegistDate" autocomplete="off" required class="form-input fill input-round">
    </div>
    <div>
	        <label>가게컨텐츠</label>    
	        <input type="text" name="storeContent" autocomplete="off" required class="form-input fill input-round">
    </div>
    <div>	      
	        <input type="hidden" name="storeLikeCount" autocomplete="off" value='0' required class="form-input fill input-round">
    </div>
    <div>
	        <label>점심시간</label>    
	        <input type="text" name="storeLunchTime" autocomplete="off" required class="form-input fill input-round">
    </div>
    <div>
	        <label>저녁시간</label>    
	        <input type="text" name="storeDinnerTime" autocomplete="off" required class="form-input fill input-round">
    </div>
    <div>
	        <label>가게시작시간</label>    
	        <input type="text" name="storeStart" autocomplete="off" required class="form-input fill input-round">
    </div>
    <div>
	        <label>가게문닫는시간</label>    
	        <input type="text" name="storeEnd" autocomplete="off" required class="form-input fill input-round">
    </div>
    <div>
	        <label>예약금</label>    
	        <input type="number" name="storeReservationPrice" autocomplete="off" required class="form-input fill input-round">
    </div>
    
	    
	     	
	    <div class="row">
	        <button type="submit" class="btn btn-primary fill">등록하기</button>
	    </div>
	    </div>
	    </div>
	</div>
</form>


