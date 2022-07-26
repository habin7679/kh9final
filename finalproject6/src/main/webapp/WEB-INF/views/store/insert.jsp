<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet">
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
	rel="stylesheet">
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- include libraries(jQuery, bootstrap) -->
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- include summernote css/js -->
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<style>
.passSpace {
	word-break: break-all;
}

.fa-cursor {
	cursor: pointer;
}

.a {
	border-collapse: separate;
}

.d {
	border-bottom-left-radius: 1em;
	border-bottom-right-radius: 1em;
}

.e {
	border-top-left-radius: 1em;
	border-top-right-radius: 1em;
}

.tb-color {
	background-color: #f1f2f6;
}

.circle-head {
	background-color: #57606f;
	border-radius: 1.2em;
	color: white;
	padding: 0.4em;
	font-size: 14px;
}

.title-size {
	font-size: 22px;
}
</style>
	<div id = "app" class = "container ma-t-100">
	<div class="section-header mt-4 col-md-6 offset-md-3">
		<h2>store</h2>
		<p>
			<span>가게</span>등록
		</p>
		<h2>내 가게 등록하기</h2>
	</div>
	
<form action="${pageContext.request.contextPath}/store/insert" method="post" enctype="multipart/form-data">
	<div class="mt-5">
		<div class="col-md-6 offset-md-3 tb-color rounded">
			<div class="row mt-4">
				<div>
					<label>음식점 종류</label> <br> 
					<input type="radio" name="category" value="스시" checked required>스시 
					<input type="radio"	name="category" value="한우" required>한우
					<input type="radio"name="category" value="꼬치" required>꼬치
					<input type="radio"name="category" value="디저트" required>디저트
				</div>
				<div>
					<label>동</label> 
					<input type="text" name="dong" autocomplete="off"required class="form-control me-1">
				</div>
				<div>
					<label>구</label> <input type="text" name="gu" autocomplete="off"
						required class="form-control me-1">
				</div>
				<%--
     
     
       <label>판매자번호뭐지</label>
                <textarea name="sellerNo" required 
                class="textarea form-input fill" rows="12">판매자번호:${sellerDto.sellerNo}</textarea>
               
     
      --%>

				<div>
					<label>가게이름</label> <input type="text" name="storeName"
						autocomplete="off" required class="form-control me-1"">
				</div>
				<div>
					<label>가게전화번호</label> <input type="text" name="storeCall"
						autocomplete="off" required class="form-control me-1"">
				</div>
				<div>
					<label>post</label> <input type="text" name="storePost"
						autocomplete="off" required class="form-control me-1"">
				</div>
				<div>
					<label>가게주소</label> <input type="text" name="storeAddress"
						autocomplete="off" required class="form-control me-1"">
				</div>
				<div>
					<label>가게상세주소</label> <input type="text" name="storeDetailAddress"
						autocomplete="off" required class="form-control me-1"">
				</div>
				<div>
					<label>사장님이름</label> <input type="text" name="storeBossName"
						autocomplete="off" required class="form-control me-1"">
				</div>

				<div>
					<label>가게컨텐츠</label> <input type="text" name="storeContent"
						autocomplete="off" required class="form-control me-1"">
				</div>
				<div>
					<input type="hidden" name="storeLikeCount" autocomplete="off"
						value='0' required class="form-control me-1"">
				</div>
				<div>
					<label>점심시간</label> <input type="text" name="storeLunchTime"
						autocomplete="off" required class="form-control me-1"">
				</div>
				<div>
					<label>저녁시간</label> <input type="text" name="storeDinnerTime"
						autocomplete="off" required class="form-control me-1"">
				</div>
				<div>
					<label>가게시작시간</label> <input type="text" name="storeStart"
						autocomplete="off" required class="form-control me-1"">
				</div>
				<div>
					<label>휴무일</label> <br> <input type="radio" name="offKind"
						value="정기" checked required>정기 <input type="radio"
						name="offKind" value="수동" required>수동
				</div>
				<div>
					<label>휴무 시작일</label> <input type="date" name="offStart"
						autocomplete="off" required class="form-control me-1"">
				</div>
				<div>
					<label>휴무 종료일</label> <input type="date" name="offEnd"
						autocomplete="off" required class="form-control me-1"">
				</div>
				<div>
					<label>바 가격</label> <input type="number" name="barPrice"
						autocomplete="off" required class="form-control me-1"">
				</div>
				<div>
					<label>바 인원수</label> <input type="number" name="barCount"
						autocomplete="off" required class="form-control me-1"">
				</div>
				<div>
					<label>룸 가격</label> <input type="number" name="roomPrice"
						autocomplete="off" required class="form-control me-1"">
				</div>
				<div>
					<label>매장내 룸 개수</label> <input type="number" name="roomCount"
						autocomplete="off" required class="form-control me-1"">
				</div>
				<div>
					<label>4인실 개수</label> <input type="number" name="roomFour"
						autocomplete="off" required class="form-control me-1"">
				</div>
				<div>
					<label>6인실 개수</label> <input type="number" name="roomSix"
						autocomplete="off" required class="form-control me-1">
				</div>
				<div>
					<label>8인실 개수</label> <input type="number" name="roomEight"
						autocomplete="off" required class="form-control me-1"">
				</div>


				<div>
					<label>가게문닫는시간</label> <input type="text" name="storeEnd"
						autocomplete="off" required class="form-control me-1"">
				</div>
				<div>
					<label>가게사진</label>
					<input type="file" name="storeImg"
						accept=".jpg, .png, .gif, .pdf, .ppt, .txt, .hwp" multiple>
				</div>


				<div>
					<label>예약금</label> <input type="number"
						name="storeReservationPrice" autocomplete="off" required
						class="form-control me-1"">
				</div>
				<br> <br> <br> <br>



				<div class="row mt-2">
					<button type="submit" class="btn1">등록하기</button>
				</div>
			</div>
	</div>
	</div>
</form>
</div>



<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>

