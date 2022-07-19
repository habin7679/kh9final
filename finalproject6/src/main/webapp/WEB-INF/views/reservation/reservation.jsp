<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

   <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <!-- <script src = "https://code.jquery.com/jquery-3.6.0.min.js"></script>  경량형!-->

    <style>
        .btn_bg{
            background-color: white;
            border: 1px solid #CE1212;
            border-radius: 10px;
            width: 90px;
            height: 45px;
            font-size: 15px;
            color: #CE1212
        }
        .btn_r_bg{
        background-color: white;
            border: 1px solid #CE1212;
            border-radius: 10px;
            width: 90px;
            height: 45px;
            font-size: 15px;
            color: #CE1212
        }
        .checkBtn {
            border: 4px solid #CE1212;
            background-color: #CE1212;
            color: white;
        }
        #lunch{
            display: none;
        }
        #dinner{
            display: none;
        }
        .ch{
        	display: none;
        }
    </style>
    <script type="text/javascript">
        $(function () {
            $(".dinner_btn").click(function () {
                $(".rad1").attr("checked", false)
                $(".lunch_btn").removeClass("checkBtn")
                $(".dinner_btn").addClass("checkBtn");
                $(".rad2").attr("checked", true)
            });

            $(".lunch_btn").click(function () {
                $(".rad2").attr("checked", false)
                $(".dinner_btn").removeClass("checkBtn")
                $(".lunch_btn").addClass("checkBtn");
                $(".rad1").attr("checked", true)
            });
            
            $(".bar_btn").click(function () {
                $(".bar").attr("checked", true)
                $(".roomfour").attr("checked", false)
                $(".roomsix").attr("checked", false)
                $(".roomeight").attr("checked", false)
                $(".roomfour_btn").removeClass("checkBtn")
                $(".roomsix_btn").removeClass("checkBtn")
                $(".roomeight_btn").removeClass("checkBtn")
                $(".bar_btn").addClass("checkBtn");
            });
            $(".roomfour_btn").click(function () {
                $(".bar").attr("checked", false)
                $(".roomfour").attr("checked", true)
                $(".roomsix").attr("checked", false)
                $(".roomeight").attr("checked", false)
                $(".bar_btn").removeClass("checkBtn")
                $(".roomsix_btn").removeClass("checkBtn")
                $(".roomeight_btn").removeClass("checkBtn")
                $(".roomfour_btn").addClass("checkBtn");
            });
            $(".roomsix_btn").click(function () {
                $(".bar").attr("checked", false)
                $(".roomfour").attr("checked", false)
                $(".roomsix").attr("checked", true)
                $(".roomeight").attr("checked", false)
                $(".bar_btn").removeClass("checkBtn")
                $(".roomfour_btn").removeClass("checkBtn")
                $(".roomeight_btn").removeClass("checkBtn")
                $(".roomsix_btn").addClass("checkBtn");
            });
            $(".roomeight_btn").click(function () {
                $(".bar").attr("checked", false)
                $(".roomfour").attr("checked", false)
                $(".roomsix").attr("checked", false)
                $(".roomeight").attr("checked", true)
                $(".bar_btn").removeClass("checkBtn")
                $(".roomsix_btn").removeClass("checkBtn")
                $(".roomfour_btn").removeClass("checkBtn")
                $(".roomeight_btn").addClass("checkBtn");
            });
            
            
        })
    </script>

<div class="container ma-t-100" data-aos="fade-up" id="app"> 

          <div class="section-header mt-4" >
            <h2>Reservation</h2>
            <p><span>${storeDto.storeName}</span> 예약하기</p>
          </div>

          <div class="row g-0">

            <div class="col-md-4" data-aos="zoom-out" data-aos-delay="200" >
              <div class="mt-1">
                <v-app id="inspire">
                  <v-row justify="center">
                    <v-date-picker v-model="picker" v-on:input="barRoomCnt" color= var(--color-primary) full-width :allowed-dates="allowedDates"  :min="today" @update:picker-date="pickerUpdate($event, id)">
                    </v-date-picker>
                  </v-row>
                </v-app>
              </div>
            </div>

            <div class="col-lg-8 align-items-center reservation-form-bg">
              <form action="insert" method="post" class="php-email-form" data-aos="fade-up"data-aos-delay="100">
                <div class="row">
                  <div class="col-lg-4 col-md-6">
			        <input type="radio" name=reservationTime value="${storeDto.storeLunchTime}" id="lunch" class="rad1">
			        <label for="lunch"><button type="button" class="lunch_btn btn_bg">점심 : ${storeDto.storeLunchTime}</button></label>
			        <input type="radio" name=reservationTime value="${storeDto.storeDinnerTime}" id="dinner" class="rad2">
			        <label for="dinner"><button type="button" class="dinner_btn btn_bg">저녁 : ${storeDto.storeDinnerTime}</button></label>
			    </div>
			    <div class="col-lg-4 col-md-6">
			        <input type="checkbox" name=barCount value="1" class="ch bar" v-bind:disabled="!FullBar == false" >
			        <button type="button" class="btn_r_bg bar_btn" v-bind:disabled="!FullBar == false" v-bind:class="btnClass">바 : {{bar}}/${barRoomVO.barCount}</button>
			        
                  </div>
                  <div class="col-lg-4 col-md-6">
			        <input type="checkbox" name=roomFour value="1" class="ch roomfour" v-bind:disabled="!FullRoomFour == false" >
			        <button type="button" class="btn_r_bg roomfour_btn"  v-bind:disabled="!FullRoomFour == false">4인실 :  {{roomFour}}/${barRoomVO.roomFour}</button>
			        <input type="checkbox" name=roomSix value="1" class="ch roomsix" v-bind:disabled="!FullRoomSix == false" >
			        <button type="button" class="btn_r_bg roomsix_btn"  v-bind:disabled="!FullRoomSix == false">6인실 : {{roomSix}}/${barRoomVO.roomSix}</button>
			        <input type="checkbox" name=roomEight value="1" class="ch roomeight"  v-bind:disabled="!FullRoomEight == false" >
			        <button type="button" class="btn_r_bg roomeight_btn"  v-bind:disabled="!FullRoomEight == false" >8인실 : {{roomEight}}/${barRoomVO.roomEight}</button>
                  </div>
                  <div class="col-lg-4 col-md-6">
                    <input type="text" class="form-control"  placeholder="Your Name" value="${memberDto.memberName}" readonly >
                    <div class="validate">이름</div>
                  </div>
                  <div class="col-lg-4 col-md-6">
                    <input type="email" class="form-control" name="email"  placeholder="Your Email" value="${memberDto.memberId}" readonly>
                    <div class="validate">이메일</div>
                  </div>
                  <div class="col-lg-4 col-md-6">
                    <input type="text" class="form-control" placeholder="Your Phone" value="${memberDto.memberPhone }" readonly >
                    <div class="validate">핸드폰 번호</div>
                  </div>
                  <div class="col-lg-4 col-md-6">
                    <input type="text"  name="reservationDate" class="form-control"  v-model="picker" readonly  >
                    <div class="validate">예약일</div>
                  </div>
                  <div class="col-lg-4 col-md-6">
                  <input type="number" class="form-control" placeholder="인원수" readonly value="${storeDto.storeReservationPrice}">
                  	 <div class="validate">예약금</div>
                  </div>
                  <div class="col-lg-4 col-md-6">
                    <input type="number" class="form-control" name="reservationPeople" placeholder="인원수" min=1 value=1 v-bind:max="maxPeopleBar">
                    <div class="validate">인원수</div>
                  </div>
                </div>
                <div class="form-group mt-3">
                  <textarea class="form-control" name="reservationContent" rows="5" placeholder="요청사항"></textarea>
                  <div class="validate">요청사항</div>
                </div>
                <div class="mb-3">
                  <div class="error-message"></div>
                  <div class="sent-message"></div>
                </div>
                <input type="hidden" name="storeNo" value="${storeDto.storeNo}">
                <input type="hidden" name="memberNo" value="${memberDto.memberNo}">
                <div class="text-center"><button type="submit" class="btn btn1">예약하기</button></div>
              </form>
            </div>

          </div>
        </div>


  <script src="https://cdn.jsdelivr.net/npm/vue@2.x/dist/vue.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/vuetify@2.x/dist/vuetify.js"></script>
      <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
  
  <script>
    new Vue({
      el: '#app',
      vuetify: new Vuetify(),
      data: () => ({
    	  
        picker: (new Date(Date.now() - (new Date()).getTimezoneOffset() * 60000)).toISOString().substr(0, 10),

        today : new Date(Date.now()).toISOString().substr(0, 10),
        
        holidays: [],
        id: 'calendar',
        
        storeNo : ${storeDto.storeNo},
        
        dateData: [],
        
        bar:'0',
        roomFour:'0',
        roomSix:'0',
        roomEight:'0',
        
        storeBar : '${barRoomVO.barCount}',
        storeRoomFour: '${barRoomVO.roomFour}',
        storeRoomSix :  '${barRoomVO.roomSix}',
        storeRoomEight :  '${barRoomVO.roomEight}',
  
		minPeopleRoomFour : 3,
		maxPeopleRoomFour : 4,
		minPeopleRoomSix : 5,
		maxPeopleRoomSix : 6,
		minPeopleRoomEight : 7,
		maxPeopleRoomEight : 8,
        
		
		 btnClass:{
             'checkBtn':false,
         },
        
        
      }),
      computed: {
			FullRoomFour(){
				return ((this.roomFour >= this.storeRoomFour) || this.storeRoomFour == 0) 
			},
			FullRoomSix(){
				return ((this.roomSix >= this.storeRoomSix) || this.storeRoomSix == 0) 
			},
			FullRoomEight(){
				return ((this.roomEight >= this.storeRoomEight) || this.storeRoomEight == 0) 
			},
			FullBar(){
				return (this.bar >= this.storeBar) 
			},
			
			maxPeopleBar(){
				return (this.storeBar - this.bar);
			}
			
      },
      methods: {
//     	  allowedDates: val => parseInt(val.split('-')[2], 10) === 7

    	  allowedDates(a) { // a : 2022-07-01
              return !this.dateData.includes(a);
           },
            pickerUpdate: async function(val, id) {
              // write your async call here
              // val : 2022-07 
              console.log(val);
              const data = await axios.get("${pageContext.request.contextPath}/rest/offDay/"+this.storeNo); // ES6 -> async, await
              this.holidays = data;
              this.dateData = this.holidays.data;
              this.allowedDates();
            },
            
            barRoomCnt(){
           	axios.get("${pageContext.request.contextPath}/rest/barRoom/"+this.picker+"/"+this.storeNo)
           	.then(resp =>{           		
              	 this.bar = resp.data.barCount;
                 this.roomFour = resp.data.roomFour;
                 this.roomSix = resp.data.roomSix;
                 this.roomEight = resp.data.roomEight;
           	});
            },
            
            
      },
      watch: {

      },
    })

  
  </script>
 


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
