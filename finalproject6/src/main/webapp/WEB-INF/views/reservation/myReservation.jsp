<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%--  <fmt:formatDate value="${reservationDto.reservationDate }" pattern="y년 M월 d일 E a h시 m분 s초"/></div> --%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<style>
.fa-solid {
	cursor: Pointer !important;
}

.fa-solid:hover {
	color: rgba(206, 18, 18, 0.8);
	background: white;
}

.modal{
  position: fixed;
  top:0; left: 0; bottom: 0; right: 0;
  background: rgba(0, 0, 0, 0.8);
}

.modal_content{
  position: absolute;
  top: calc(50vh - 100px); left: calc(50vw - 200px);
  background-color: white;
  display: flex; justify-content: center;
  align-items: center;
  border-radius: 10px;
  width: 400px;
  height: 200px;
}

</style>
<div class="container ma-t-100" data-aos="fade-up" id="app">

	<c:forEach var="myReservationVO" items="${list}" varStatus="status">
		<div class="layer">
			<div class="section-header mt-4">
				<h2>Reservation Check</h2>
				<p>
					<span>${myReservationVO.storeName}</span>
				</p>
			</div>
			<div class="col align-items-center reservation-form-bg">
				<div class="col-md-4 offset-md-4">
					<label>이름 <i class="fa-solid fa-user-tag"></i></label> <input
						type="text" class="form-control"
						value="${myReservationVO.memberName}" readonly>
				</div>
				<div class="col-md-4 offset-md-4">
					<label>인원수 <i class="fa-solid fa-people-group"></i></label><input
						type="number" class="form-control"
						value="${myReservationVO.reservationPeople }" readonly>
				</div>
				<div class="col-md-4 offset-md-4">
					<label>총예약금(<i class="fa-solid fa-won-sign"></i>)
					</label> <input type="number" class="form-control"
						value="${myReservationVO.reservationPrice}" readonly>
				</div>
				<div class="col-md-4 offset-md-4">
					<label>예약일 <i class="fa-solid fa-calendar-days"></i></label> <input
						type="text" class="form-control"
						value="<fmt:formatDate value="${myReservationVO.reservationDate}" pattern="y년 M월 d일"/>"
						readonly>
				</div>
				<div class="col-md-4 offset-md-4">
					<label>예약시간 <i class="fa-solid fa-clock"></i></label> <input
						type="text" class="form-control"
						value="${myReservationVO.reservationTime}" readonly>
				</div>
				<div class="col-md-4 offset-md-4">
					<label>주소 <i class="fa-solid fa-map-location-dot"></i></label>
					 <input type="text" class="form-control" value="${myReservationVO.storePost }" readonly> 
					 <div>
					 <input type="text" class="form-control" value="${myReservationVO.storeAddress}" readonly> 
					 </div>
					 <div>
					<input type="text" class="form-control" value="${myReservationVO.storeDetailAddress }" readonly>
					</div>
				</div>
				<div class="col-md-4 offset-md-4">
					<label>요청사항 <i class="fa-solid fa-comment-dots"></i></label>
					<textarea class="form-control" name="reservationContent" rows="5"
						style="resize: none" readonly>${myReservationVO.reservationContent }</textarea>
				</div>
				<div class="row mt-2">
				<div class="col-md-2 offset-md-4">
					<i class="fa-solid fa-caret-left fa-2x prevBtn"></i>
				</div>
					<div class="col-md-2  text-md-end">
					<i class="fa-solid fa-caret-right fa-2x nextBtn"></i>
					</div>
				</div>
				
				<div class="col-md-4 offset-md-4 text-md-center">
					<button class="m-btn btn btn-secondary">예약 취소하기</button>
					
				</div>
				</div>
				
				<div class="modal">
				  <div class="modal_content" >
				  <div>
						    <p> 예약금 취소 환불 기준(예약일 기준)<br>
						    7일 전은 예약금의 100% 환불,<br>
						    2일~6일은 예약금의 50% 환불,<br>
						   1일 전 부터 당일은 환불이 불가합니다.<br>
						   </p>
						   
					 <button class="btn btn-danger toback">뒤로가기</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				     <a class="btn btn-secondary" href="${pageContext.request.contextPath}/reservation/cancel?paymentNo=${myReservationVO.paymentNo}">예약 취소하기</a>
				   </div>
				      		
				  </div>
				</div>
			</div>
	</c:forEach>

	
</div>

<script src = "https://code.jquery.com/jquery-3.6.0.js"></script>

    <script type="text/javascript">
        $(function(){
        	
        	var index = 0;
            more(index);

        	$(".nextBtn").not(":last").click(function(){
        			more(++index);
        		$('html').scrollTop(0);
        	});
        	
        	$(".prevBtn").not(":first").click(function(){
	    			more(--index);
	    		$('html').scrollTop(0);
    		});

        	 $(".m-btn").click(function(){
       		    $(".modal").fadeIn();
       		  });
       		  
       		  $(".toback").click(function(){
       		    $(".modal").fadeOut();
       		  });
        	
            function more(index){
                $(".layer").hide();
                $(".layer").eq(index).show();
            }

        });
     </script>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>