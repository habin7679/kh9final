<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


	<div class="container ma-t-100">
    <div class="row mt-20">
      <div class="col-md-10 offset-md-1">
      
        <div class="row">
      <div class="col-md-8">
        <div class="row">
          <div class="col-md-5">
            <div class="row mt-20">
            <c:choose>
            	<c:when test="${!storeAttach}">
              <img src="${pageContext.request.contextPath}${storeImgUrl}" class="menu-img img-fluid">
              </c:when>
              <c:otherwise>
              	<img src="${pageContext.request.contextPath}/img/mainMap.png" class="menu-img img-fluid">
              </c:otherwise>
              </c:choose>
            </div>
          </div>

          <div class="col-md-7">
            <div class="row mt-10">
            <h3 class="mt-20 mb-20 fw-bold text-center">${storeDto.storeName}</h3>
            </div>
            
            <div class="row mt-3">
            <span>
            주소 : <span class="address">${storeDto.storeAddress}</span>
            </span>
            </div>
            
            <div class="row mt-10">
              <span>카테고리 : ${storeDto.category}</span>
             </div>
             
             <div class="row">
              <span>전화번호 : ${storeDto.storeCall }</span>
              </div>
               <div class="row">
              <span>시작 : ${storeDto.storeStart }</span>
              </div>
              <div class="row">
              <span>휴식 : ${storeDto.storeLunchTime}</span>
              </div>
              <div class="row">
              <span>종료 : ${storeDto.storeDinnerTime }</span>
             </div>
             
             <div class="row mt-10">
              <div class="col-md-6 mt-3">
                <a href="${pageContext.request.contextPath}/reservation/?storeNo=${storeDto.storeNo}" class="btn1">예약하러 가기</a>
              </div>
              <div class="col-md-6"></div>
             </div>
             
          </div>

        </div>

        <div class="row mt-20">
              <div class="col-md-12">
                <span class="fw-bold">소개</span>
                <textarea class="form-control" rows="10" style="resize: none;" >${storeDto.storeContent }</textarea>
              </div>
        </div>


      </div>

      <!--사이드바-->
      <div class="col-md-4 sidebar-widgets ms-10 rounded p-4" style="height:270px; border:2px solid #ecf0f1;">
      <c:set var ="sellerNo2" value="${storeDto.sellerNo}"></c:set>
    	<c:if test="${sellerNo eq sellerNo2}">
     	 <div class="row pt-3"> 
            <h4 class="fw-bold">가게 결제정보</h4>
          </div>
        <div class="row rounded" style="backgorund: #fff;">
             <a href="${pageContext.request.contextPath}/reservation/check?storeNo=${storeDto.storeNo}">가게 예약현황</a>
             <a href="${pageContext.request.contextPath}/regularPay/info?sellerNo=${sellerNo}">정기결제 확인</a>
             <a href="${pageContext.request.contextPath}/seller/pointToMoney?sellerNo=${sellerNo}">환급페이지</a>
        </div>
	</c:if>
		
		<div class="row pt-4"> 
            <h4 class="fw-bold">TOGETHER</h4>
         </div>
          
        <div class="row rounded mt-10">
            <a href="${pageContext.request.contextPath}/together/list">같이가요</a>
            <a href="${pageContext.request.contextPath}/review/list?storeNo=${storeDto.storeNo}">리뷰 보러가기</a>
        </div>
        
        <c:choose>
        <c:when test="${sellerNo eq sellerNo2}">
         <div style="margin-top:70px">
        <div class="row" >
        	<div id="map" style="width:450px;height:230px;" ></div>
        </div>
        </div>
        </c:when>
        <c:otherwise>
       <div style="margin-top:200px">
        <div class="row" >
        	<div id="map" style="width:450px;height:230px;" ></div>
        </div>
        </div>
        </c:otherwise>
        </c:choose>
      </div>
    </div>
    </div>
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