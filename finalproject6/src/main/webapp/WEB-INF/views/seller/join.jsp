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
	    <h2>Join</h2>
            <p><span>판매자 등록</span></p>
       	</div>
	 <div class="col-md-8 offset-md-2">
   

	    <div class="row text-left mb-2">
            <label>은행명</label>
	        <input type="text" name="sellerBank" required placeholder="" class="form-control me-1" v-bind:class="bankClassObject" v-model="seller.sellerBank"
            v-on:blur="bankValidation">
            <div class="valid-feedback">올바른 형식입니다</div>
			<div class="invalid-feedback">적합하지 않은 형식입니다</div>
        </div>
	   
   		<div class="row text-left mb-2">
	        <label>계좌번호</label>
	        <input type="text" name="sellerAccount" required placeholder = " -없이 11자리를 입력해주세요"class="form-control me-1" autocomplete="off" v-bind:class="accountClassObject" v-model="seller.sellerAccount"
            v-on:blur="accountValidation" maxlength="11">
            <div class="valid-feedback">올바른 형식입니다</div>
			<div class="invalid-feedback">적합하지 않은 형식입니다</div>
        </div>
	   
	     <div class="row text-left mb-2">
	        <label>사업자번호</label>
	            <input type="text" name="sellerBusinessNum" required placeholder=" - 없이 10자리를 입력해주세요" autocomplete="off" class="form-control me-1" v-bind:class="businessnumClassObject" v-model="seller.sellerBusinessNum"
                v-on:blur="businessValidation" maxlength="10">
                <div class="valid-feedback">올바른 형식입니다</div>
			    <div class="invalid-feedback">적합하지 않은 형식입니다</div>
        </div>
	    
	       <div class="row text-left mb-2">
	    	<label>신청 파일</label><br>
	    	<input type="file" name="sellerProfile" class="form-control me-1" style="width:50%;">
	    </div>
	    
	    <div class="row mb-2">
	        <button type="submit" class="btn1 c">판매자 신청</button>
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
                    seller:{
                            sellerBank:"",
                            sellerAccount:"",
                            sellerBusinessNum:"",
                
                            
                            get sellerBankValid(){
                                const regex = /^[가-힣a-zA-Z]+$/;
                                return this.sellerBank.length > 0 && regex.test(this.sellerBank);
                            },
                            get sellerAccountValid(){
                                const regex = /[0-9]{11}$/;
                                return this.sellerAccount.length > 0 && regex.test(this.sellerAccount);
                            },
    
                            get sellerBusinessNumValid(){
                                const regex = /[0-9]{10}$/;
                                return this.sellerBusinessNum.length > 0 && regex.test(this.sellerBusinessNum);
                            },
    
                            
                        },
    
                        bankClassObject:{
                            'is-valid':false,
                            'is-invalid':false,
                        },
                        accountClassObject:{
                            'is-valid':false,
                            'is-invalid':false,
                        },
    
                        businessnumClassObject:{
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


                    bankValidation(){
                        this.bankClassObject["is-valid"] = this.seller.sellerBankValid;
                        this.bankClassObject["is-invalid"] = !this.seller.sellerBankValid;
                    },
    
                    accountValidation(){
                        this.accountClassObject["is-valid"] = this.seller.sellerAccountValid;
                        this.accountClassObject["is-invalid"] = !this.seller.sellerAccountValid;
                    },
    
                    businessValidation(){
                        this.businessnumClassObject["is-valid"] = this.seller.sellerBusinessNumValid;
                        this.businessnumClassObject["is-invalid"] = !this.seller.sellerBusinessNumValid;
                    },
                    
            
                    sendForm(e){
                        if(this.isForm)
                        e.preventDefault();
                    },
                
            },
        });
        app.mount("#app");
    </script>
	    
	    

	 <jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>