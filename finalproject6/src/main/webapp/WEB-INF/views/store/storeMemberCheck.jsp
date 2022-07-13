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
</style>

<div id="app" class="container-fluid ma-t-100">

<div class="section-header mt-4" >
            <h2>Reservation Confirm</h2>
            <p><span>예약 확인</span></p>
          </div>
	<div class="row mt-2">
		<div class="col-md-8 offset-md-2">
			<table class="table table-bordered rounded">
				<thead class="text-center">
					<tr>
						<th>예약자명</th>
						<th>예약 인원수</th>
						<th>예약 날짜</th>
						<th>예약 시간</th>
						<th>예약자 번호</th>
						<th>예약금</th>
						<th>방문</th>
						<th>미방문</th>
					</tr>
				</thead>
				<tbody class="text-center">
					<tr v-for="(storeMemberCheck,index) in storeMemberCheckList"
						v-bind:key="index">
						<td>{{storeMemberCheck.memberName}}</td>
						<td>{{storeMemberCheck.reservationPeople}}</td>
						<td>{{convertTime(storeMemberCheck.reservationDate)}}</td>
						<td>{{storeMemberCheck.reservationTime}}</td>
						<td>{{storeMemberCheck.memberPhone}}</td>
						<td>{{storeMemberCheck.reservationPrice}}</td>
						<td><i class="fa-solid fa-square-check"
							v-on:click="confirmSeller(index)"></i></td>
						<td><i class="fa-solid fa-square-xmark"
							v-on:click="cancelSeller(index)"></i></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>

<!-- vue js도 lazy loading을 사용한다 -->
<script src="https://unpkg.com/vue@next"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script>
        //div[id=app]을 제어할 수 있는 Vue instance를 생성
        const app = Vue.createApp({
            //data : 화면을 구현하는데 필요한 데이터를 작성해 둔다
            data(){
                return{
                	storeMemberCheckList:[],

                    storeNo:${storeNo}
                    
                };
            },
             //computed : data를 기반으로 하여 실시간 계산이 필요한 경우 작성한다.
            // - 3줄보다 많다면 사용하지 않는 것을 권장한다(복잡한 계산시 성능 저하가 발생)
            // - 반드시 return을 통해 값을 반환해야함
            computed:{

            },
            //methods : 애플리케이션 내에서 언제든 호출 가능한 코드 집합이 필요한 경우 작성한다.
            methods:{
              loadPage(){
                axios.get("${pageContext.request.contextPath}/rest/storeMemberCheck/"+this.storeNo)
                .then(resp=>{
                    this.storeMemberCheckList= resp.data;
                });
              },

              confirmSeller(index){
                const choice = window.confirm("해당 이용자가 방문을 하였습니까?")
		          	if(!choice) return;

                const storeMemberCheck = this.storeMemberCheckList[index]
                  axios({
                    url:"${pageContext.request.contextPath}/rest/storeMemberCheck/sellerConfirm/"+storeMemberCheck.paymentNo,
                    method : "put"
                  })
                  .then(resp=>{
                    this.loadPage()
                  });
              },
                
                cancelSeller(index){
                    const choice = window.confirm("해당 이용자가 방문하지 않았습니까? \n 예약금은 포인트로 반환 됩니다.")
    		          	if(!choice) return;

                    const storeMemberCheck = this.storeMemberCheckList[index]
                      axios({
                        url:"${pageContext.request.contextPath}/rest/storeMemberCheck/sellerCancel/"+storeMemberCheck.paymentNo,
                        method : "put"
                      })
                      .then(resp=>{
                        this.loadPage()
                      });
              },

              convertTime(time){
              	return moment(time).format('YYYY-MM-DD');
              },

            
            },
             //watch : 특정 data를 감시하여 연계 코드를 실행하기 위해 작성한다
             watch:{
             
            },
            created(){
              this.loadPage();
            },

        });
        app.mount("#app")
    </script>



<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>