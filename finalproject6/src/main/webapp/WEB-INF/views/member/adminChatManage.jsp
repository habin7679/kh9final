<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
         .fa-cursor{
            cursor: pointer;
        }
        .fa-solid:hover{
        	color:red;
        }
        .inputMsg{
        	position:fixed;
        	left:30;
        	top:60;
        	width:400px;
        	height:400px;
        }
        .noText{
        	font-size: 12px;
        	color:#636e72;
        }
        .bd-rounded{
        	border-top-left-radius: 1em;
            border-top-right-radius: 1em;
        }
</style>

 <div id="app">
        <div class="container ma-t-100">
        
         <div class="section-header mt-4 col-md-8 offset-md-2" >
            <h2>챗봇 메세지 관리</h2>
            <p><span>YEAH BOT</span> 관리</p>
            <h2>현재 메세지 리스트는 답변 순서대로 정렬되어 있습니다.</h2>
       	</div>
		
		<div class="row">
		<div class="col-md-8 offset-md-2">
            <div class="row mt-2">
                <div class="inputMsg">

                    <div class="row" v-if="isEditMode">
                        <label class="form-label fw-bold">일반번호</label>
                        <input type="text" class="form-control" readonly v-model.number="nowData.chatbotNo">
                    </div>

                    <div class="row">
                        <label class="form-label fw-bold">그룹번호</label>
                        <h4 class="noText">일반번호와 그룹번호를 동일하게 입력해야 답변으로 등록됩니다.</h4>
                        <input type="text" class="form-control" placeholder="그룹번호 입력" v-model.number="nowData.superNo">
                    </div>

                    <div class="row" style="margin-top:30px;">
                        <label class="form-label fw-bold">메세지</label>
                        <h4 class="noText">100자 이내로 입력해주세요.</h4>
                        <textarea class="form-control p-3" rows="5" placeholder="내용 입력" v-model="nowData.chatbotContent"></textarea>
                    </div>

                    <div class="row mt-2">
                        <button class="btn1 d-grid mt-3" @click="addMsg">{{buttonText}}</button>
                    </div>

                    <div class="row mt-2">
                        <button class="btn0 d-grid mt-3" @click="clearMsg">초기화</button>
                    </div>
                </div>
                <div class="col-md-4"></div>
                <div class="col-md-7 offset-md-1">
                    <table class="table">
                        <thead >
                            <tr class="text-center bd-rounded" style="background:var(--color-primary); color:#fff;">
                                <th>일반번호</th>
                                <th>그룹번호</th>
                                <th style="width: 50%;">내용</th>
                                <th>관리</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr v-for="(chatbot,index) in dataList" :key="index">
                                <td class="text-center">{{chatbot.chatbotNo}}</td>
                                <td class="text-center">{{chatbot.superNo}}</td>
                                <td>{{chatbot.chatbotContent}}</td>
                                <td class="text-center">
                                    <i class="fa-solid fa-pencil fa-cursor me-3" @click="selectMsg(index)"></i>
                                    <i class="fa-solid fa-circle-xmark fa-cursor" @click="deleteMsg(index)"></i>   
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                </div>
            </div>
			</div>
        </div>
    </div>



<!--vue js도 lazy loading을 사용한다-->
 <script src="https://unpkg.com/vue@next"></script>
 <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
 <script>
        //div[id=app]을 제어할 수 있는 Vue instance를 생성
        const app = Vue.createApp({
            //data : 화면을 구현하는데 필요한 데이터를 작성해둔다
            data(){
                return {
                   dataList:[],
                   nowData:{
                    chatbotNo:"",
                    chatbotContent:"",
                    superNo:"",
                   },
                   index: -1
                };
            },
             //computed : data를 기반으로 하여 실시간 계산이 필요한 경우 작성한다.
            //- 3줄보다 많다면 사용하지 않는 것을 권장한다(복잡한 계산 시 성능 저하가 발생)
            //- 반드시 return을 통해 값을 반환해야 한다
            computed:{
                buttonText(){
                    return this.index < 0 ? "등록" : "수정";
                },
                isAddMode(){
                    return this.buttonText == "등록";
                },
                isEditMode(){
                    return this.buttonText == "수정";
                }
            },
             //methods : 애플리케이션 내에서 언제든 호출 가능한 코드 집합이 필요한 경우 작성한다
             methods:{
               addMsg(){
                let type;
                if(this.isAddMode){
                    type = "post";
                }
                else if(this.isEditMode){
                    type = "put";
                }
                if(!type) return;

                axios({
                    url:"${pageContext.request.contextPath}/admin/chat/",
                    method: type,
                    data: this.nowData,
                })
                .then(resp=>{
                    if(this.isAddMode){
                        this.dataList.push(resp.data);
                        this.clearMsg();
                        window.alert("등록되었습니다.");
                    }
                    else if(this.isEditMode){
                        this.dataList[this.index] = resp.data;
                        this.clearMsg();
                        window.alert("수정되었습니다.");
                    }
                });
               },

               clearMsg(){
                this.nowData = {
                    chatbotNo:"",
                    chatbotContent:"",
                    superNo:"",
                },
                this.index = -1;
               },

               selectMsg(index){
                this.nowData = this.dataList[index];
                this.index = this.dataList[this.index];
               },

               deleteMsg(index){
                let choice = window.confirm("정말 삭제하시겠습니까?");
                if(!choice) return;

                let chatbotNo = this.dataList[index].chatbotNo;

                axios({
                    url:"${pageContext.request.contextPath}/admin/chat/"+chatbotNo,
                    method:"delete",

                })
                .then(resp=>{
                    this.dataList.splice(index,1);
                });
               }
            },
            created(){
                axios({
                    url:"${pageContext.request.contextPath}/admin/chat/",
                    method:"get",
                })
                .then(resp=>{
                    this.dataList= resp.data;
                });
            },
             //watch : 특정 data를 감시하여 연계 코드를 실행하기 위해 작성한다
             watch:{
               
            },
        });
        app.mount("#app");
    </script>
 <jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>