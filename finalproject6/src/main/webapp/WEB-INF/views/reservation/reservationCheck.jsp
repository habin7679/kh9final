<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%--  <fmt:formatDate value="${reservationDto.reservationDate }" pattern="y년 M월 d일 E a h시 m분 s초"/></div> --%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<div class="container ma-t-100" data-aos="fade-up" id="app">

	<div class="section-header mt-4">
		<h2>예약 확인</h2>

		<p>
			<span>${storeDto.storeName}</span>
		</p>
	</div>
	<div class="col align-items-center reservation-form-bg">
		<form action="pay" method="post">
			<div class="col-md-4 offset-md-4">
				<label>이름 <i class="fa-solid fa-user-tag"></i></label> <input type="text" class="form-control"
					value="${memberDto.memberName}" readonly>
			</div>
			<div class="col-md-4 offset-md-4">
				<label>인원수 <i class="fa-solid fa-people-group"></i></label> <input type="number" class="form-control"
					value="${reservationDto.reservationPeople }" readonly>
			</div>
			<div class="col-md-4 offset-md-4">
				<label>총예약금(<i class="fa-solid fa-won-sign"></i>)</label> <input type="number" class="form-control"
					value="${reservationDto.reservationPrice}" readonly>
			</div>
			<div class="col-md-4 offset-md-4">
				<label>예약일 <i class="fa-solid fa-calendar-days"></i></label> <input type="text" class="form-control"
					value="<fmt:formatDate value="${reservationDto.reservationDate }" pattern="y년 M월 d일"/>"
					readonly>
			</div>
			<div class="col-md-4 offset-md-4">
				<label>예약시간 <i class="fa-solid fa-clock"></i></label> <input type="text" class="form-control"
					value="${reservationDto.reservationTime}" readonly>
			</div>
			<div class="col-md-4 offset-md-4">
				<label>주소 <i class="fa-solid fa-map-location-dot"></i></label>
				 <input type="text" class="form-control"
					value="${storeDto.storePost }" readonly>
				<input type="text" class="form-control address"
					value="${storeDto.storeAddress} " readonly>
				<input type="text" class="form-control"
					value="${storeDto.storeDetailAddress}" readonly>
			</div>
			<div class="col-md-4 offset-md-4">
			<div id="map" style="width:555px;height:400px;" ></div>
			</div>
			<div class="col-md-4 offset-md-4 d-grid">
				<input type="hidden" name="storeNo"
					value="${reservationDto.storeNo}"> <input type="hidden"
					name="memberNo" value="${reservationDto.memberNo}"> <input
					type="hidden" name="reservationNo"
					value="${reservationDto.reservationNo}">
				<button type="submit" class="btn btn1">결제하기</button>
			</div>
		</form>
	</div>

</div>


 <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=85dadd42b9eaa3324f969eda3e18fe08&libraries=services"></script>
    <script type="text/javascript">
        $(function(){
			// 지도가 표시될 영역을 선택한다
			var container = document.querySelector('#map');

			// 지도의 옵션을 설정한다
			// - center : 지도의 중심 좌표(위도/경도)
			// - level : 지도 표시 수준
			var options = {
				center: new kakao.maps.LatLng(37.555055, 126.971106),
				level: 3
			};

			// 지도를 생성한다
			var map = new kakao.maps.Map(container, options);

                
                // 주소를 불러온다.
                var address = $(".address").val();
                

                // 주소를 이용해서 위치를 찾고 지도를 변경하는 코드

                // [1] 탐색 도구 생성
                var geocoder = new kakao.maps.services.Geocoder();

                // [2] 주소 탐색
                geocoder.addressSearch(address, function(result, status){
                    //(참고) 함수 안에서 arguments 를 이용하면 매개변수를 모두 조사할 수 있다.
                    console.log(arguments);

                    //if(status === "OK") {}
                    if(status === kakao.maps.services.Status.OK) {

                        // 검색된 위치의 좌표 객체를 생성한다
                        var lat = result[0].y;
                        var lng = result[0].x;
                        var addr = result[0].address_name;

                        console.log("lat = " + lat)
                        console.log("lng = " + lng)
                        // 지도 위치를 변경하고 마커를 인포윈도우와 함께 출력한다.
                        moveMap(lat, lng);
                        createMarker(lat, lng, addr);
                        
                    }
                });


            // 지도 이동 함수
            function moveMap(lat, lng){
                // 카카오에서 제공하는 위도경도 객체를 주어진 정보로 생성한다
                var moveLocation = new kakao.maps.LatLng(lat, lng);

                map.setCenter(moveLocation);//순간이동
                //map.panTo(moveLocation);//부드럽게이동
            }

            // 마커 생성 함수
            // (1) lat, lng 만 있는 경우 마커만 생성
            // (2) lat, lng, content가 모두 있다면 lat, lng로 마커를 만들고 content로 인포윈도우를 생성
            function createMarker(lat, lng, content) {
                // 카카오에서 제공하는 위도경도 객체를 주어진 정보로 생성한다
                var markerPosition  = new kakao.maps.LatLng(lat, lng); 

                // 배치를 위한 마커를 생성한다
                var marker = new kakao.maps.Marker({
                    position: markerPosition
                });

                // 마커에 표시될 지도의 정보를 설정한다
                marker.setMap(map);

                //세번째 매개변수인 content에 값이 들어온 경우 인포윈도우 생성 코드를 추가
                if(content !== undefined) {
                    //var iwContent = 하단에 있는 템플릿을 불러와서 복사;
                    //var iwContent = document.getElementById("info-window-template").innerHTML;
                    var iwContent = $("#info-window-template").html();
                    iwContent = iwContent.replace("{{content}}", content);

                    var iwPosition = new kakao.maps.LatLng(33.450701, 126.570667); //인포윈도우 표시 위치입니다

                    // 인포윈도우를 생성합니다
                    var infowindow = new kakao.maps.InfoWindow({
                        position : iwPosition, 
                        content : iwContent 
                    });
                    
                    // 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
                    infowindow.open(map, marker); 
                }
            }
		});
    </script>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>