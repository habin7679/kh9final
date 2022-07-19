 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

 
 <div align='center' class="col-md-8 offset-md-2">
                <div  class="p-6 text-light bg-dark rounded">
                    <h1>더미가게</h1>
                    <img src="${pageContext.request.contextPath}${storeImgUrl}" width="100" height="100">
                    <img src="https://via.placeholder.com/300"/>
                    <img src="https://via.placeholder.com/300"/>
                    <img src="https://via.placeholder.com/300"/>

                </div>
            </div>
        </div>
         <div class="container-fluid">
    	<div class="row">
    		<div class="col-md-8 offset-md-2">
    			<table border=1 style='font-size:12pt' class="table">
    				
    					<td>
    						<c:when test="${storeAttach == false || passImg}">
    							<img src="${pageContext.request.contextPath}${storeImgUrl}" width="50%" height="750">
						</td>
						<td>
						<pre>가게이름:${storeDto.storeName}</pre>
						<pre>카테고리:${storeDto.category}</pre>
						<pre>상세주소:${storeDto.storeDetailAddress}</pre>					
						<pre>사장님이름:${storeDto.storeBossName}</pre>					
						<pre>등록일:${storeDto.storeRegistDate}</pre>
						<pre>좋아요수:${storeDto.storeLikeCount}</pre>
						<pre>점심시간:${storeDto.storeLunchTime}</pre>
						<pre>시작시간:${storeDto.storeStart}</pre>
						<pre>종료시간:${storeDto.storeEnd}</pre>
						<pre>예약가격:${storeDto.storeReservationPrice}</pre>
    						</c:when>
    						<c:otherwise>
    					<pre> </pre>
						
    						</c:otherwise>
    					</td>
    				</tr>
    				<c:if test="${storeAttach == false}">
    				<tr>
    					<td align='center'>
    					메뉴판 다운받기:<a class="cursor:pointer;" href="${pageContext.request.contextPath}${storeImgUrl}">${attachName}</a>
    					</td>
    				</tr>
    				</c:if>
    				<tr align='center'>
    					<td>
    						<a href="${pageContext.request.contextPath}/reservation/?storeNo=${storeDto.storeNo}" class="btn1">예약하러가기</a>
    						<a href="#" class="btn1">목록으로 돌아가기</a>
    						<a href="${pageContext.request.contextPath}/review/insert?reviewNo=${reviewDto.reviewNo}" class="btn1">리뷰쓰러가기</a>
    					</td>
    				</tr>
    			</table>
    		
    		</div>
    	</div>
    </div>    

    <div id="map" style="width:100%;height:350px;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=85dadd42b9eaa3324f969eda3e18fe08&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  
// 지도를 생성합니다    

var map = new kakao.maps.Map(mapContainer, mapOption); 
var adress = $(".adress").val();
var name =
// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();
// 주소로 좌표를 검색합니다

var adress = '서울 영등포구 선유동2로 56'

geocoder.addressSearch(adress, function(result, status) {
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
            content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
        });
        infowindow.open(map, marker);
        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
</script>
 <script src="https://unpkg.com/vue@next"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
