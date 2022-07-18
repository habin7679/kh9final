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
<form action="insert" method="post" enctype="multipart/form-data">
	<div class="container-fluid">
	    <div class ="row mt-4">
	    	<div class="p-4 text-light bg-dark rounded">
		        <h1>가게등록</h1>
		    </div>	
		</div>
	<div>
	
	<div class="row mt-4">
		<div >
	           <%--	아이디 로그인후에 바꿔치기 
	             <input type="hidden" name="storeNo" value="${storeDto.storeNo}">
	              <input type="hidden" name="storeNo" autocomplete="off" value=''>
	         <input type="hidden" name="seo" autocomplete="off" value="${sellerDto.sellerNo}">
	            --%>
	       
    </div>
    <div>
	        <label>음식점 종류</label> <br>
	        <input type="radio" name="category" value="스시" checked required >스시
			<input type="radio" name="category" value="한우" required>한우
			<input type="radio" name="category" value="꼬치" required>꼬치
			<input type="radio" name="category" value="커피" required>커피   
	   
    </div>
    <div>
	        <label>동</label>    
	        <input type="text" name="dong" autocomplete="off" required class="form-input fill input-round">
    </div>
    <div>
	        <label>구</label>    
	        <input type="text" name="gu" autocomplete="off" required class="form-input fill input-round">
    </div>
     <%--
     
     
       <label>판매자번호뭐지</label>
                <textarea name="sellerNo" required 
                class="textarea form-input fill" rows="12">판매자번호:${sellerDto.sellerNo}</textarea>
               
     
      --%>
  
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
	        <label>휴무일</label> <br>
	        <input type="radio" name="offKind" value="정기" checked required >정기
			<input type="radio" name="offKind" value="수동" required>수동
    </div>
    <div>
	        <label>시작일</label>    
	        <input type="date" name="offStart" autocomplete="off" required class="form-input fill input-round">
    </div>
    <div>
	        <label>종료일</label>    
	        <input type="date" name="offEnd" autocomplete="off" required class="form-input fill input-round">
    </div>
    <div>
	        <label>바 가격</label>    
	        <input type="number" name="barPrice" autocomplete="off" required class="form-input fill input-round">
    </div>
    <div>
	        <label>바 인원수</label>    
	        <input type="number" name="barCount" autocomplete="off" required class="form-input fill input-round">
    </div>
    <div>
	        <label>룸가격</label>    
	        <input type="number" name="roomPrice" autocomplete="off" required class="form-input fill input-round">
    </div>
    <div>
	        <label>룸 인원수</label>    
	        <input type="number" name="roomCount" autocomplete="off" required class="form-input fill input-round">
    </div>
    <div>
	        <label>4인실 개수</label>    
	        <input type="number" name="roomFour" autocomplete="off" required class="form-input fill input-round">
    </div>
    <div>
	        <label>6인실</label>    
	        <input type="number" name="roomSix" autocomplete="off" required class="form-input fill input-round">
    </div>
    <div>
	        <label>8인실</label>    
	        <input type="number" name="roomEight" autocomplete="off" required class="form-input fill input-round">
    </div>
    
    
    <div>
	        <label>가게문닫는시간</label>    
	        <input type="text" name="storeEnd" autocomplete="off" required class="form-input fill input-round">
    	
    		  가게사진 : <input type="file" name="storeImg" accept=".jpg, .png, .gif, .pdf, .ppt, .txt, .hwp">
    		
    		<%--
    		
    		
    		 --%>
    		
    </div>
    <div>
	        <label>예약금</label>    
	        <input type="number" name="storeReservationPrice" autocomplete="off" required class="form-input fill input-round">
    </div>
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


