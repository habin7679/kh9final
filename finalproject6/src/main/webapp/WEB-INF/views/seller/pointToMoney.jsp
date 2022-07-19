<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%--  <fmt:formatDate value="${reservationDto.reservationDate }" pattern="y년 M월 d일 E a h시 m분 s초"/></div> --%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>


<div id="app" class="container-fluid ma-t-100">

	<div class="section-header mt-4">
		<h2>Point To Moeny</h2>
		<p>
			<span>환급받기</span>
		</p>
	</div>
	<div class="row mt-2">
		<div class="col-md-4 offset-md-4">
			<table class="table mt-4">
				<tr>
					<th>이름</th>
					<td>${sellerInfoVO.memberName}</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td>${sellerInfoVO.memberPhone}</td>
				</tr>
				<tr>
					<th>포인트</th>
					<td><input type="text" v-model="point" readonly
						v-bind:class="availablePointObject">
						<div class="valid-feedback">환급이 가능합니다!</div>
						<div class="invalid-feedback">5만 포인트 이상이어야 환급이 가능합니다.</div></td>
				</tr>
				<tr>
					<th>은행</th>
					<td>${sellerInfoVO.sellerBank}</td>
				</tr>
				<tr>
					<th>계좌번호</th>
					<td>${sellerInfoVO.sellerAccount}</td>
				</tr>
			</table>
		</div>
	</div>
		<div class="row mt-2">
			<div class="col-md-4 offset-md-4">
				<label>비밀번호 확인</label> <input type="password" name=memberPw
					class="form-control" v-model="memberPw" v-on:blur="rightPassword"
					v-bind:class="rightPwObject" v-on:blur="pwValidation">
				<div class="valid-feedback">비밀번호 확인 완료</div>
				<div class="invalid-feedback">비밀번호가 정확하지 않습니다.</div>
			</div>
		</div>
		<div class="row mt-2">
	<form action="pointToMoney" method="post">
			<div class="col-md-4 offset-md-4 d-grid">
			<input type="hidden" name="sellerNo" value="${param.sellerNo}">
				<button type="submit" class="btn1" v-bind:disabled="!isRight">현금으로
					변환하기</button>
			</div>
	</form>
		</div>
</div>

<!-- vue js도 lazy loading을 사용한다 -->
<script src="https://unpkg.com/vue@next"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script>
        const app = Vue.createApp({
            data(){
                return{
                    point: ${sellerInfoVO.sellerPoint},
                    memberId : "${sellerInfoVO.memberId}" ,
                    memberPw : "",
                    
                    rightPwObject:{
                        'is-valid':false,
                        'is-invalid':false,
                    },
                    availablePointObject:{
                        'is-valid':false,
                        'is-invalid':false,
                    },
                    
                    isPassword:false, //비밀번호가 맞는지
                };
            },
            computed:{
				availablePoint(){ //포인트가 5만이 넘으면 true
					return this.point >= 50000
				},
				
                isRight(){
             	   return this.isPassword && this.availablePoint;
                },
            },

            methods:{
            	 async rightPassword(){
            		 // destructuring assignment (구조분해할당)
                    const {status, data} = await axios.get("${pageContext.request.contextPath}/rest/payToMoney/memberId/"+this.memberId+"/memberPw/"+this.memberPw);
                   	 console.log(data);
                        if(data == '111111'){
                       	 this.isPassword = true;
                       	 this.rightPwObject["is-valid"] =  true;
                       	 this.rightPwObject["is-invalid"] = false;      
                        } else{
                       	 this.isPassword = false;
                       	 this.rightPwObject["is-valid"] =  false;
                            this.rightPwObject["is-invalid"] = true;                        	 
                        }
                   },
            },
             watch:{
             
            },
            created(){
            	
            },

            mounted(){
                       this.availablePointObject["is-valid"] = this.availablePoint;
                       this.availablePointObject["is-invalid"] = !this.availablePoint;
            },
        });
        app.mount("#app")
    </script>



<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>