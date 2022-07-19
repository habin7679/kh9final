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

.left-rounded{
    border-top-left-radius: 1em;
        }
.right-rounded{
     border-top-right-radius: 1em;
        }
</style>

<div id="app" class="container-fluid ma-t-100">

		<div class="section-header mt-4" >
            <h2>RegularPayment</h2>
            <p><span>정기결제</span> 관리</p>
          </div>

	<div class="row mt-2">
		<div class="col-md-6 offset-md-3">
			<table class="table rounded  table-striped">
				<thead class="text-center">
					<tr style="background:var(--color-primary); color:#fff;">
						<th class="left-rounded">정기결제 등록명</th>
						<th>사업자명</th>
						<th>정기결제 시작일</th>
						<th>정기결제 가격(월)</th>
						<th>결제 변경</th>
						<th class="right-rounded">취소</th>
					</tr>
				</thead>
				<tbody class="text-center">
					<tr v-for="(regularPayment,index) in regularPaymentList"
						v-bind:key="index" >
						<td>{{regularPayment.regularPaymentName}}</td>
						<td>{{regularPayment.regularPaymentUserId}}</td>
						<td>{{convertTime(regularPayment.regularPaymentTime)}}</td>
						<td>{{regularPayment.regularPaymentPrice}}</td>
						<td><a @click="change" v-bind:href="linkIndex(index)"><i
								class="fa-solid fa-money-check-dollar"></i></a></td>
						<td><i class="fa-solid fa-rectangle-xmark"
							@click="cancelRegularPayment(index)"></i></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>

<!-- vue js도 lazy loading을 사용한다 -->
<script src="https://unpkg.com/vue@next"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"> </script>
<script>
        //div[id=app]을 제어할 수 있는 Vue instance를 생성
        const app = Vue.createApp({
            //data : 화면을 구현하는데 필요한 데이터를 작성해 둔다
            data(){
                return{
                    regularPaymentList:[],

                    sellerNo:${sellerNo},
                    
                    link:"",
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
                axios.get("${pageContext.request.contextPath}/rest/regularPayment/list/"+this.sellerNo)
                .then(resp=>{
                    this.regularPaymentList= resp.data;
                });
              },

              cancelRegularPayment(index){
                const choice = window.confirm("정기결제를 취소하시겠습니까?\n 등록된 가게는 삭제됩니다.")
		          	if(!choice){
		          		return;
		          	}
		          	else{
                const regularPayment = this.regularPaymentList[index]
                  axios({
                    url:"${pageContext.request.contextPath}/rest/regularPayment/delete/"+regularPayment.regularPaymentNo,
                    method : "delete"
                  })
                  .then(resp=>{
                    this.loadPage()
                  });
		          	}
              },

              convertTime(time){
                	return moment(time).format('YYYY-MM-DD');
                },

              
              linkIndex(index){
            	  const regularPayment = this.regularPaymentList[index];
                  return this.link = "${pageContext.request.contextPath}/changePay/change/"+regularPayment.regularPaymentNo;
              },
              change(){
            	  window.alert(" 정기결제 방법 변경시 변경된 카드로 0원이 결제 됩니다. \n 정기 결제일은 결제방법 변경일과 매달 같은 일에 결제 됩니다. \n 결제방법을 변경하시겠습니까?")
  		          
              }
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