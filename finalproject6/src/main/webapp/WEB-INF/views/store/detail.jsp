<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include> 
    


<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>가게상세</title>

    <!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous"> -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/5.1.3/cosmo/bootstrap.min.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"/>
    <style>
      
    </style>
</head>
<body>

    <div id="app" class="container-fluid">
        <div class="row mt-4">
            <div class="col-md-8 offset-md-1">
                <div class="p-4 text-light bg-dark rounded">
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
    			<table class="table">
    				<tr>
    					<td>
    						<h3>가게정보</h3>
    					</td>
    				</tr>
    					<td>
    					<c:choose>
    						<c:when test="${storeAttach == false || passImg}">
    							<img src="${pageContext.request.contextPath}${storeImgUrl}" width="50%">
    						
    					<pre>가게번호: ${storeDto.storeNo}</pre>
						<pre>카테고리:${storeDto.category}</pre>
						<pre>동:${storeDto.dong}</pre>
						<pre>구:${storeDto.gu}</pre>
						<pre>판매자번호:${storeDto.sellerNo}</pre>
						<pre>가게이름:${storeDto.storeName}</pre>
						<pre>post:${storeDto.storePost}</pre>
						<pre>주소:${storeDto.storeAddress}</pre>
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
    					<pre>가게번호: ${storeDto.storeNo}</pre>
						<pre>카테고리:${storeDto.category}</pre>
						<pre>동:${storeDto.dong}</pre>
						<pre>구:${storeDto.gu}</pre>
						<pre>판매자번호:${storeDto.sellerNo}</pre>
						<pre>가게이름:${storeDto.storeName}</pre>
						<pre>post:${storeDto.storePost}</pre>
						<pre>주소:${storeDto.storeAddress}</pre>
						<pre>상세주소:${storeDto.storeDetailAddress}</pre>					
						<pre>사장님이름:${storeDto.storeBossName}</pre>					
						<pre>등록일:${storeDto.storeRegistDate}</pre>
						<pre>좋아요수:${storeDto.storeLikeCount}</pre>
						<pre>점심시간:${storeDto.storeLunchTime}</pre>
						<pre>시작시간:${storeDto.storeStart}</pre>
						<pre>종료시간:${storeDto.storeEnd}</pre>
						<pre>예약가격:${storeDto.storeReservationPrice}</pre>
    						</c:otherwise>
    					</c:choose>
    					</td>
    				</tr>
    				<c:if test="${storeAttach == false}">
    				<tr>
    					<td>
    						<a class="cursor:pointer;" href="${pageContext.request.contextPath}${storeImgUrl}">${attachName}</a>
    					</td>
    				</tr>
    				</c:if>
    				<tr>
    					<td>
    						<a href="#" class="btn btn primary">예약하러가기</a>
    						<a href="#" class="btn btn primary">목록으로 돌아가기</a>
    						<a href="${pageContext.request.contextPath}/review/insert?reviewNo=${reviewDto.reviewNo}" class="btn btn primary">리뷰쓰러가기</a>
    					</td>
    				</tr>
    			</table>
    		</div>
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

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch('서울 영등포구 선유동2로 57', function(result, status) {

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
    
<script>





			<%--
console.log('Script dded succesfully!');
	const app = Vue.createApp({
		data(){
			return{
					storeNo:"",
					category:"",
					dong:"",
					gu:"",
					sellerNo:"",
					storeName:"",
					storeCall:"",
					storePost:"",
					storeAddress:"",
					storeDetailAddress:"",
					storeBossName:"",
					storeRegistDate:"",
					storeLikecount:"",
					storeLunchTime:"",
					storeDinnerime:"",
					storeStart:"",
					storeEnd:"",
					storeReservationPrice:"",
			
			};
		},
		created(){
			
			
			//axios({옵션}).then(성공롤백).catch(에러콜백);
			axios({
					url:"${pageContext.request.contextPath}/rest/store/"+storeNo,
					method:"get"
				})
				.then((resp)=>{
					this.dataList.push(...resp.data);
				})
		},
			
			
		
	});
		
	 
app.mount("#app")
			--%>	
</script>




