<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%--  <fmt:formatDate value="${reservationDto.reservationDate }" pattern="y년 M월 d일 E a h시 m분 s초"/></div> --%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<!-- 특정 영역을 생성하여 이 부분만 vue로 제어한다 -->
<div id="app" class="container-fluid">

	<form method="post" enctype="multipart/form-data"
		v-on:submit="sendForm($event)">
		<div class="container ma-t-100" style="width: 900px;">
			<div class="section-header mt-4 col-md-8 offset-md-2">
				<h2></h2>
				<p>
					<span>회원가입</span>
				</p>
			</div>

			<div class="col-md-8 offset-md-2">
				<div class="row mt-2 text-left mb-2">
					<label>아이디(이메일 형식)</label> <input type="text" name="memberId"
						autocomplete="off" required class="form-control me-1"
						v-bind:class="idClassObject" v-model="member.memberId"
						v-on:blur="idValidation">
					<div class="valid-feedback">사용 가능한 이메일입니다</div>
					<div class="invalid-feedback">적합하지 않은 이메일 형식이거나 중복된 아이디입니다</div>
					<!-- v-on:blur="idValidation" -->

				</div>

				<div class="row text-left mb-2">
					<label>비밀번호</label> <input v-bind:type="passwordInputType"
						name="memberPw" required placeholder="" class="form-control me-1"
						v-bind:class="pwClassObject" v-model="member.memberPw"
						v-on:blur="pwValidation">
					<div class="valid-feedback">올바른 비밀번호입니다</div>
					<div class="invalid-feedback">비밀번호는 영문 대문자,소문자,숫자,특수문자가 반드시
						1개 이상 포함된 8~16자 이내여야 합니다</div>
				</div>

				<div class="row text-left mb-2">
					<label>비밀번호 재확인</label> <input v-bind:type="passwordInputType"
						placeholder="" class="form-control me-1"
						v-model="member.memberPwAgain" v-on:blur="pwAgainValidation">
					<div class="valid-feedback">비밀번호가 일치합니다</div>
					<div class="invalid-feedback">비밀번호가 불일치합니다</div>
				 <div>
                      <label><input type="checkbox" v-model="showPassword">비밀번호 표시</label>
                  </div>
				</div>


				<div class="row text-left mb-2">
					<label>이름</label> <input type="text" name="memberName" required
						placeholder="" class="form-control me-1" autocomplete="off"
						v-bind:class="nameClassObject" v-model="member.memberName"
						v-on:blur="nameValidation">
					<div class="valid-feedback"></div>
					<div class="invalid-feedback">한글만 입력이 가능합니다</div>
				</div>


				<div class="row text-left mb-2">
					<label>닉네임</label> <input type="text" name="memberNick" required
						placeholder="" autocomplete="off" class="form-control me-1"
						v-bind:class="nickClassObject" v-model="member.memberNick"
						v-on:blur="nickValidation">
					<div class="valid-feedback">적합한 닉네임입니다</div>
					<div class="invalid-feedback">닉네임은 한글과 숫자로 2~10자 이내로만 작성
						가능합니다</div>
				</div>

				<div class="row text-left mb-2">
					<label>생년월일</label><br> <input type="date" name="memberBirth"
						required class="form-control me-1" autocomplete="off"
						v-bind:class="birthClassObject" v-model="member.memberBirth"
						v-on:blur="birthValidation">
					<div class="valid-feedback">올바른 생년월일 형식입니다</div>
					<div class="invalid-feedback">생년월일 형식이 올바르지 않습니다</div>
				</div>

				<div class="row text-left mb-2">
					<label>휴대폰번호</label> <input type="tel" name="memberPhone" required
						placeholder="- 제외하고 입력" class="form-control me-1"
						autocomplete="off" v-bind:class="phoneClassObject"
						v-model="member.memberPhone"
						v-on:input="member.memberPhone = $event.target.value"
						v-on:blur="phoneValidation">
					<div class="valid-feedback">올바른 형식입니다</div>
					<div class="invalid-feedback">적합하지 않은 형식입니다</div>
				</div>


				<div class="row text-left mb-2">
					<label>성별</label> <select name="memberGender"
						class="form-select me-1">
						<option>남성</option>
						<option>여성</option>
					</select>
				</div>

				<div class="row text-left mb-2">
					<label>프로필 이미지</label><br> <input type="file"
						name="memberProfile" class="form-control me-1" style="width: 50%;">
				</div>

				<div class="row mb-2">
					<button type="submit" class="btn1 c">회원가입</button>
				</div>
			</div>
		</div>


	</form>

</div>

<!-- vue js도 lazy loading을 사용한다 -->

<script src="https://unpkg.com/vue@next"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script>

        //div[id=app]을 제어할 수 있는 Vue instance를 생성
        const app = Vue.createApp({
            //data : 화면을 구현하는데 필요한 데이터를 작성한다.
            data(){
                return {
                    showPassword:false,

                    member:{
                        memberId:"",
                        memberPw:"",
                        memberPwAgain:"",
                        memberName:"",
                        memberNick:"",
                        memberPhone:"",
                        memberBirth:"",
 
                        
                        get memberIdValid(){
                            const regex = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
                            return this.memberId.length > 0 && regex.test(this.memberId);
                        },
                        get memberPwValid(){
                            const regex = /^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$%])[A-Za-z0-9!@#$%]{8,16}$/;
                            return this.memberPw.length > 0 && regex.test(this.memberPw);
                        },

                        get memberNameValid(){
                            const regex = /^[가-힣]{2,7}$/;
                            return this.memberName.length > 0 && regex.test(this.memberName);
                        },

                        get memberNickValid(){
                            const regex = /^[가-힣0-9]{2,10}$/;
                            return this.memberNick.length > 0 && regex.test(this.memberNick)
                        },

                        get memberPhoneValid(){
                            const regex = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/; 
                            return this.memberPhone.length > 0 && regex.test(this.memberPhone);
                        },

                        get memberBirthValid(){
                            const regex = /^(19|20)\d{2}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[0-1])$/; 
                            return this.memberBirth.length > 0 && regex.test(this.memberBirth);
                        },


                    },

                    idClassObject:{
                        'is-valid':false,
                        'is-invalid':false,
                    },
                    pwClassObject:{
                        'is-valid':false,
                        'is-invalid':false,
                    },

                    pwAgainClassObject:{
                        'is-valid':false,
                        'is-invalid':false, 
                    },

                    nameClassObject:{
                        'is-valid':false,
                        'is-invalid':false,
                    },

                    nickClassObject:{
                        'is-valid':false,
                        'is-invalid':false,
                    },

                    phoneClassObject:{
                        'is-valid':false,
                        'is-invalid':false, 
                    },

                    birthClassObject:{
                        'is-valid':false,
                        'is-invalid':false, 
                    },
                  
                    
           
                };
            },
            //computed : data를 기반으로 하여 실시간 계산이 필요한 경우 작성한다.
            // - 3줄보다 많다면 사용하지 않는 것을 권장한다(복잡한 계산 시 성능 저하가 발생)
            computed:{

                passwordInputType(){
                    return this.showPassword ? "text" : "password";
                    }
             
            },
            //methods : 애플리케이션 내에서 언제든 호출 가능한 코드 집합이 필요한 경우 작성한다.
            methods:{
                idValidation(){
                	this.idClassObject["is-valid"] = this.member.memberIdValid;
                    if(this.member.memberIdValid){
                        axios.get("${pageContext.request.contextPath}/rest/member/idcheck/"+this.member.memberId)
                     .then(resp=>{
                    	 console.log(resp.data);
                         if(resp.data == "111"){
                             this.idClassObject["is-valid"] = true;
                             this.idClassObject["is-invalid"] = false;     
                         } else{
                        	this.idClassObject["is-valid"] = false;
                            this.idClassObject["is-invalid"] = true;                	 
                         }
                     
                    });
                    
                    }
                    this.idClassObject["is-invalid"] = !this.member.memberIdValid;
                },
                pwValidation(){
                    this.pwClassObject["is-valid"] = this.member.memberPwValid;
                    this.pwClassObject["is-invalid"] = !this.member.memberPwValid;
                },

                pwAgainValidation() {
                   this.pwAgainClassObject["is-valid"] = this.member.memberPw == this.member.memberPwAgain;
                   this.pwAgainClassObject["is-invalid"] = !(this.member.memberPw == this.member.memberPwAgain);
                },
					
                nickValidation(){
                        	this.nickClassObject["is-valid"] = this.member.memberNickValid;
                            if(this.member.memberNickValid){
                                axios.get("${pageContext.request.contextPath}/rest/member/nickcheck/"+this.member.memberNick)
                             .then(resp=>{
                            	 console.log(resp.data);
                                 if(resp.data == "2222"){
                                     this.nickClassObject["is-valid"] = true;
                                     this.nickClassObject["is-invalid"] = false;     
                                 } else{
                                	this.nickClassObject["is-valid"] = false;
                                    this.nickClassObject["is-invalid"] = true;                	 
                                 }
                             
                            });
                            
                            }
                            this.nickClassObject["is-invalid"] = !this.member.memberNickValid;
                        },

                nameValidation(){
                    this.nameClassObject["is-valid"] = this.member.memberNameValid;
                    this.nameClassObject["is-invalid"] = !this.member.memberNameValid;
                },

                phoneValidation(){
                    this.phoneClassObject["is-valid"] = this.member.memberPhoneValid;
                    this.phoneClassObject["is-invalid"] = !this.member.memberPhoneValid;
                },

                birthValidation(){
                    this.birthClassObject["is-valid"] = this.member.memberBirthValid;
                    this.birthClassObject["is-invalid"] = !this.member.memberBirthValid;
                },
                

                sendForm(e){
                    if((this.member. memberIdValid && this.member.memberPwValid && this.member.memberNameValid &&
                    	this.member.memberNickValid && this.member.memberPhoneValid && this.member.memberBirthValid) == false){
                    e.preventDefault();
                    }
                },
				
                

                
            },  
        });
        app.mount("#app");

    </script>

</html>
  <jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>