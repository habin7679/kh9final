 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<!DOCTYPE html>
<html lang="ko">
 <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>

    </style>
</head>
<body>
 <div align='center' class="col-md-8 offset-md-2">
                <div  class="p-6 text-light bg-dark rounded">
                
                    <h1>더미가게</h1>
                    <img src="${pageContext.request.contextPath}${storeImgUrl}" width="100" height="100">
                    <img src="https://via.placeholder.com/300"/>
                    <img src="https://via.placeholder.com/300"/>
                    <img src="https://via.placeholder.com/300"/>
                </div>
            </div>
         <div class="container-fluid">
    	<div class="row">
    		<div class="col-md-8 offset-md-2">
    			<table border=1 style='font-size:12pt' class="table">
    				<tr>
    					<td>
    							<img src="${pageContext.request.contextPath}${storeImgUrl}" width="50%" height="50">
    							<img src="${pageContext.request.contextPath}${storeImgUrl}" width="50%" height="50">
						</td>
						</tr>
						<tr>
						<td>
						<button class="btn btn primary" id="likeButton">좋아요</button>
						<pre>가게이름:${storeDto.storeName}</pre>
						<pre>카테고리:${storeDto.category}</pre>
						<pre>주소:${storeDto.storeAddress}</pre>	
						<pre>주소:${storeDto.sellerNo}</pre>	
						<pre>상세주소:${storeDto.storeDetailAddress}</pre>					
						<pre>사장님이름:${storeDto.storeBossName}</pre>					
						<pre>등록일:${storeDto.storeRegistDate}</pre>
						<pre>좋아요수:${storeDto.storeLikeCount}</pre>
						<pre>점심시간:${storeDto.storeLunchTime}</pre>
						<pre>시작시간:${storeDto.storeStart}</pre>
						<pre>종료시간:${storeDto.storeEnd}</pre>
						<pre>예약가격:${storeDto.storeReservationPrice}</pre>
    					</td>
    					</tr>
    				<tr>
    					<td align='center'>
    					메뉴판 다운받기:<a class="cursor:pointer;" href="${pageContext.request.contextPath}${storeImgUrl}">${attachName}</a>
    					</td>
    				</tr>
    				<tr align='center'>
    					<td>
    					<c:set var ="sellerNo2" value="${storeDto.sellerNo}"></c:set>
    					<c:if test="${sellerNo eq sellerNo2}">
                           <a href="${pageContext.request.contextPath}/regularPay/info?sellerNo=${storeDto.sellerNo}" class="btn btn primary">정기결제정보</a>
                           <a href="${pageContext.request.contextPath}/reservation/check?storeNo=${storeDto.storeNo}" class="btn btn primary">가게예약현황</a>
                           <a href="${pageContext.request.contextPath}/seller/pointToMoney?sellerNo=${storeDto.sellerNo}" class="btn btn primary">환급페이지</a>
                           <a href="${pageContext.request.contextPath}/store/new?storeNo=${storeDto.storeNo}" class="btn btn primary">내가게수정</a>
                           </c:if>
    						<a href="${pageContext.request.contextPath}/reservation/?storeNo=${storeDto.storeNo}" class="btn1">예약하러가기</a>
    						<a href="#" class="btn1">목록으로 돌아가기</a>
    						<a href="${pageContext.request.contextPath}/review/insert?storeNo=${storeDto.storeNo}" class="btn1">리뷰쓰러가기</a>
    						
    					</td>
    				</tr>
    			</table>
    		
    		</div>
    	</div>
    </div>    
    
    <div id="map" style="width:200%;height:350px;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=85dadd42b9eaa3324f969eda3e18fe08&libraries=services"></script>
<script>
$(document).ready(function() {
	function likeStore() {
		
		const store_no = ${storeDto.storeNo};
		const member_no = <%=(Integer) session.getAttribute("no")%>
		
		$.ajax({
			type :'GET',
			url : '/finalproject6/rest/store/like',
			contentType: 'application/json',
			data : 				{
						"store_no" : store_no,
						"member_no" : member_no
					}	,	
				
			success : function(data) {
			}
		})// 아작스 끝
	}

	$('#likeButton').click(likeStore);
});

</script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 2 // 지도의 확대 레벨
    };  
// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 
// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();
// 주소로 좌표를 검색합니다
/*var address = $(".address").val();  */
var address = '서울 동작구 상도로37길 61'
geocoder.addressSearch(address, function(result, status) {
    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {
        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });
        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">가게위치</div>'
        });
        infowindow.open(map, marker);
        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
</script>
 <script src="https://unpkg.com/vue@next"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
</body>
</html>