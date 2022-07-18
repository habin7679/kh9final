<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<div id="app" class="container-fluid">

	<form method="post" enctype="multipart/form-data"
		v-on:submit="sendForm($event)">
		
	<div class="container ma-t-100" style="width:900px;" >
 	<div class="section-header mt-4 col-md-8 offset-md-2" >
	        <h1>change</h1>
	        <p><span>개인정보 변경</span></p>
	    </div>
	    
	    
	 <div class="col-md-8 offset-md-2">
       <div class="row mt-2 text-left mb-2" >
	       <label>이름</label>
	       <input type="text" name="memberName" autocomplete="off" required class= "form-control me-1" v-bind:class="nameClassObject" v-model="member.memberName"
						v-on:blur="nameValidation" value="${memberDto.memberName}">
				<div class="valid-feedback"></div>
				<div class="invalid-feedback">한글만 입력이 가능합니다</div>
		</div>
	    
	     <div class="row mt-2 text-left mb-2" >
	        <label>닉네임</label>
	        <input type="text" name="memberNick" autocomplete="off" required class="form-control me-1" value="${memberDto.memberNick}" v-bind:class="nickClassObject" v-model="member.memberNick"
						v-on:blur="nickValidation" maxlength="10">
	    		<div class="valid-feedback">적합한 닉네임입니다</div>
				<div class="invalid-feedback">
					이미 존재하거나 형식에 어긋난 닉네임 입니다. 
					닉네임은 한글과 숫자로 2~10자 이내로 작성 가능합니다
				</div>
	    </div>
	    
	       <div class="row mt-2 text-left mb-2" >
	        <label>생년월일</label><br>
	        <input type="date" name="memberBirth" autocomplete="off" required class="form-control me-1"  v-bind:class="birthClassObject" v-model="member.memberBirth"
						v-on:blur="birthValidation" value="${memberDto.memberBirth}">
	    				<div class="valid-feedback">올바른 생년월일 형식입니다</div>
					<div class="invalid-feedback">생년월일 형식이 올바르지 않습니다</div>
	    </div>
	    
	      <div class="row mt-2 text-left mb-2" >
	        <label>전화번호</label>
	        <input type="tel" name="memberPhone" autocomplete="off" required class="form-control me-1" v-bind:class="phoneClassObject"
						v-model="member.memberPhone"
						v-on:input="member.memberPhone = $event.target.value"
						v-on:blur="phoneValidation" maxlength="11" value="${memberDto.memberPhone}">
	    			<div class="valid-feedback">올바른 형식입니다</div>
					<div class="invalid-feedback">적합하지 않은 형식입니다</div>
	    </div>
	   
	     <div class="row mt-2 text-left mb-2" >
	        <label>성별</label>
	        <select name="memberGender"  class="form-select me-1">
	        	<option >남성</option>
	        	<option>여성 </option>
	        </select>
	    </div>
	    
	    <div class="row mt-2 text-left mb-2" >
	        <label>비밀번호 확인</label>
	        <input type="password" name="memberPw" required class="form-control me-1" >
	    </div>
	    
	    <div class="row mb-2">
	        <button type="submit" class="btn1 c">정보 변경하기</button>
	    </div>
	    
	    <c:if test="${param.error != null}">
		<div class="row center">
			<h3 style="color:red;" class="mt-2 offset-md-2" >비밀번호가 일치하지 않습니다</h3>		
		</div>	    
		</c:if>
	</div>

	</div>
</form>

<!-- vue js도 lazy loading을 사용한다 -->

<script src="https://unpkg.com/vue@next"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script>

        //div[id=app]을 제어할 수 있는 Vue instance를 생성
        const app = Vue.createApp({
            //data : 화면을 구현하는데 필요한 데이터를 작성한다.
            data(){
                return {

                    member:{
                        memberName:"",
                        memberNick:"",
                        memberPhone:"",
                        memberBirth:"",
 
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

             
            },
            //methods : 애플리케이션 내에서 언제든 호출 가능한 코드 집합이 필요한 경우 작성한다.
            methods:{

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
                    if((this.member.memberNameValid && this.member.memberNickValid && this.member.memberPhoneValid && this.member.memberBirthValid) == false){
                    e.preventDefault();
                    }
                },
				
                

                
            },  
        });
        app.mount("#app");

    </script>
</html>
  <jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>