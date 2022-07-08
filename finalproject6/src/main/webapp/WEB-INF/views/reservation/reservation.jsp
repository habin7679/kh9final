<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

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
                    <v-date-picker v-model="picker" v-model="date" color= var(--color-primary) full-width :allowed-dates="allowedDates">
                    </v-date-picker>
                  </v-row>
                </v-app>
              </div>
            </div>

            <div class="col-lg-8 align-items-center reservation-form-bg">
              <form action="insert" method="post" class="php-email-form" data-aos="fade-up"data-aos-delay="100">
                <div class="row">
                  <div class="col-lg-4 col-md-6">
                    <input type="radio" name=reservationTime value="${storeDto.storeLunchTime }">
                    <label>${storeDto.storeLunchTime }</label>
                    <div class="validate">점심</div>
                  </div>
                  <div class="col-lg-4 col-md-6">
                   <input type="radio"name=reservationTime value="${storeDto.storeDinnerTime }">
                   <label>${storeDto.storeDinnerTime }</label>
                    <div class="validate">저녁</div>
                  </div>
                  <div class="col-lg-4 col-md-6">
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
                    <input type="text"  name="reservationDate" class="form-control"  v-model="picker" readonly>
                    <div class="validate">예약일</div>
                  </div>
                  <div class="col-lg-4 col-md-6">
                  <input type="number" class="form-control" placeholder="인원수" readonly value="${storeDto.storeReservationPrice}">
                  	 <div class="validate">예약금</div>
                  </div>
                  <div class="col-lg-4 col-md-6">
                    <input type="number" class="form-control" name="reservationPeople" placeholder="인원수" min=1 value=1 max=8>
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
  <script>
    new Vue({
      el: '#app',
      vuetify: new Vuetify(),
      data: () => ({
        picker: (new Date(Date.now() - (new Date()).getTimezoneOffset() * 60000)).toISOString().substr(0, 10),

      }),
      computed: {

      },
      methods: {
//     	  allowedDates: val => parseInt(val.split('-')[2], 10) === 7
      },
      watch: {

      },
    })

  
  </script>
 


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
