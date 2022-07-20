<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
  
  
  <div id="app" class="container-fluid">

        <form method="post" enctype="multipart/form-data"
            v-on:submit="sendForm($event)">
            <div class="container ma-t-100" style="width:900px;">
                <div class="section-header mt-4 col-md-8 offset-md-2" >
                        <p><span>비밀번호</span>변경</p>
                       </div>
                    <div class="col-md-8 offset-md-2">
                    <div class="row mt-2 text-left mb-2" >
            
                        <label>현재 비밀번호</label>
                        <input v-bind:type="passwordInputType" name="currentPw" required class="form-control me-1" v-bind:class="currentPwClassObject" v-model="member.currentPw"
						v-on:blur="currentPwValidation" maxlength="16">
                        <div class="valid-feedback">올바른 비밀번호입니다</div>
					    <div class="invalid-feedback">비밀번호는 영문 대문자,소문자,숫자,특수문자가 반드시
						1개 이상 포함된 8~16자 이내여야 합니다</div>
                    </div>
                    <div class="row mt-2 text-left mb-2" >
                        <label>바꿀 비밀번호</label>
                        <input v-bind:type="passwordInputType" name="changePw" required class="form-control me-1" v-bind:class="changePwClassObject" v-model="member.changePw" 
                         v-on:blur="changePwValidation" maxlength="16">
                        <div class="valid-feedback">변경 가능한 비밀번호 입니다</div>
					    <div class="invalid-feedback">비밀번호가 형식에 맞지 않거나 현재 비밀번호와 일치합니다</div>
                        <div>
                            <label><input type="checkbox" v-model="showPassword">비밀번호 표시</label>
                        </div>
                    </div>
                    <div class="row mb-2">
                        <button type="submit" class="btn1">비밀번호 변경하기</button>
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
                            currentPw:"",
                            changePw:"",
                            
     
                            get currentPwValid(){
                                const regex = /^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$%])[A-Za-z0-9!@#$%]{8,16}$/;
                                return regex.test(this.currentPw);
                            },

                            get changePwValid(){
                                const regex = /^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$%])[A-Za-z0-9!@#$%]{8,16}$/;
                                return regex.test(this.changePw);
                            },
                        
                            
                            

                        },
    
                       
                        currentPwClassObject:{
                            'is-valid':false,
                            'is-invalid':false,
                        },
    
                        changePwClassObject:{
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
                        },
                 
                    isSame(){
                    	return (this.member.currentPw == this.member.changePw);
                    }
                    
                },
                //methods : 애플리케이션 내에서 언제든 호출 가능한 코드 집합이 필요한 경우 작성한다.
                methods:{
                   
                    currentPwValidation(){
                        this.currentPwClassObject["is-valid"] = this.member.currentPwValid;
                        this.currentPwClassObject["is-invalid"] = !this.member.currentPwValid;
                    },
    
                    changePwValidation() {
                        if(this.member.currentPw == this.member.changePw || !this.member.changePwValid){
                            this.changePwClassObject["is-invalid"] = true;
                            this.changePwClassObject["is-valid"] = false;
                        }
                        else{
                            this.changePwClassObject["is-invalid"] = false;
                            this.changePwClassObject["is-valid"] = true;
                        }
                    },
                    
                    sendForm(e){
                    if((this.member.currentPwValid && this.member.changePwValid && !(this.member.currentPw == this.member.changePw)) == false) {
                    	e.preventDefault();
                      }
                    },
                },
            });
            app.mount("#app");
    
        </script>
  <jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>

