<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
        .passSpace{
            word-break: break-all;
        }
        .fa-cursor{
            cursor: pointer;
        }
        .fa-solid:hover{
        	color:red;
        }
        .a{
            border-collapse: separate;           
        }
        
        .d{
            border-bottom-left-radius: 1em;
            border-bottom-right-radius: 1em;
        }
        .e{
            border-top-left-radius: 1em;
            border-top-right-radius: 1em;
        }

        .tb-color{
            background-color: #f1f2f6;
        }
       .circle-head{
        background-color: #57606f;
        border-radius: 1.2em;
        color: white;
        padding: 0.5em;
        font-size: 14px;
       }
       .title-size{
        font-size: 22px;
       }
     </style>
     
 <div id="app" class="container ma-t-100">
 	
 	<div class="section-header mt-4 col-md-8 offset-md-2" >
            <h2>Together</h2>
            <p><span>같이가요</span> 게시판</p>
            <h2>함께 식사할 동행을 구해보세요.</h2>
       	</div>
 
        <div class="row mt-10">
            <div class="col-md-8 offset-md-2">
                <table class="table mt-2 ">
                    <thead>
                        <tr class="justify-text-center tb-color">
                            <td class="ps-3 pe-3 pt-3 tb-color e" style="border-bottom: none;">
                                <span class="title-size fw-bold">${togetherDto.togetherTitle}</span>
                            </td>
                        </tr>
                        <tr style="text-align: right;" class="tb-color">
                            <td class="p-2">
                            <c:choose>
                            	<c:when test="${togetherDto.togetherWriter == null }">
                            		(탈퇴한 사용자)
                            	</c:when>
                            	<c:otherwise>
	                                <span class="me-3">${togetherDto.togetherWriter}</span>
                            	</c:otherwise>
                            </c:choose>
                                <span class="me-3">${togetherDto.togetherTime}</span>
                            </td>                            
                        </tr>
                    </thead>
                    <tbody>
                        <tr height="400" class="tb-color" >
                            <td class="p-4 d" style="border-bottom: none;">
                                <pre>${togetherDto.togetherContent}</pre>
                            </td>
                        </tr>
                        <tr style="text-align: right;">
                           <td style="border-bottom: none;">
                          <c:if test="${isOwner || isAdmin}">
                            <a href="${pageContext.request.contextPath}/together/edit?togetherNo=${togetherDto.togetherNo}" class="btn0 ms-1">수정</a>
                            <a href="${pageContext.request.contextPath}/together/delete?togetherNo=${togetherDto.togetherNo}" class="btn0 ms-1">삭제</a>
                           </c:if>
                            <a href="${pageContext.request.contextPath}/together/list" class="btn0 ms-1">목록</a>
                           </td>
                        </tr>
						<!-- 댓글 개수 -->
                        <tr>
                            <td>
                                <span>댓글</span>
                                <span style="color:red;" class="fw-bold">{{replyCount}}</span>
                            </td>
                        </tr>
						
                        <tr v-for="(reply,index) in replyList" v-bind:key="index" >
						<!-- 댓글 목록 -->
                            <td v-if="!reply.edit">
                                <div class="row" >
                                    <div class="col-md-1 text-left mt-1 mb-1 passSpace">
                                       <span class="fw-bold">{{reply.replyWriter}}</span>
                                    </div>
                                    <div class="col-md-7 text-left mt-1 mb-1 passSpace">
                                        <span>{{reply.replyContent}}</span>
                                    </div>
                                    <div class="col-md-2 text-center mt-1 mb-1 passSpace">
                                        <span>{{changeTime(reply.replyTime)}}</span>
                                    </div>
                                    <div class="col-md-2 text-center mt-1" v-if="isEditAndDelete(memberNo)">
                                        <i class="fa-solid fa-pencil fa-cursor me-3" @click="editMode(index)"></i>
                                        <i class="fa-solid fa-circle-xmark fa-cursor" @click="deleteReply(index)"></i>                                   
                                    </div>                                    
                                </div>
                            </td>
                            <!-- 댓글 수정 -->
                            <td style="border-bottom: none;" v-else>
                                <div class="row">
                                    <div class="col-md-1 text-center mt-3">
                                        <span>댓글 입력</span>
                                    </div>
                                    <div class="col-md-10 mt-2">
                                        <textarea class="form-control" :disabled="isNoneMember" v-model="replyList[index].replyContent"></textarea>
                                    </div>
                                    <div class="col-md-1 d-grid gap-1">
                                        <button class="btn1" :disabled="isNoneMember" @click="editReply(index)">수정</button>
                                        <button class="btn0" :disabled="isNoneMember" @click="notEditMode(index)">취소</button>
                                    </div>
                                </div>
                            </td>
                        </tr>
                          
						<!-- 댓글 등록 -->
                        <tr>
                            <td style="border-top-width: 0.1em; border-bottom: none;">
                                <div class="row">
                                    <div class="col-md-1 text-center mt-2">
                                        <span>댓글 입력</span>
                                    </div>
                                    <div class="col-md-10">
                                        <textarea class="form-control" v-model="replyContent" :placeholder="textPlaceholder" :disabled="isNoneMember"
                                         v-on:input="replyContent = $event.target.value"></textarea>
                                    </div>
                                    <div class="col-md-1 text-center d-grid">
                                        <button class="btn1" style="font-size: 0.8em;" :disabled="isNoneMember" @click="addReply">{{buttonText}}</button>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        

                    </tbody>
                </table>
            </div>
        </div>
    </div>

 <!--vue js도 lazy loading을 사용한다-->
 <script src="https://unpkg.com/vue@next"></script>
 <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script>
    const app = Vue.createApp({
        data(){
            return {
                memberNo:${no},
                memberKind:"${auth}",
                togetherNo:${togetherDto.togetherNo},
                replyWriter:"${nick}",
                replyContent:"",
                replyList:[],
                replyCount:0,
            };
        },
        
        computed:{
            isNoneMember(){
                return this.memberNo == "" || this.memberKind == "";
            },
            isMember(){
                return this.memberNo != "" || this.memberKind != "";
            },
            isAdmin(){
                return this.isMember && this.memberKind == "관리자";
            },
            textPlaceholder(){
                return this.isNoneMember ? "로그인 후 댓글을 작성할 수 있습니다" : "댓글 내용 입력";
            },
            buttonText(){
                return this.isNoneMember ? "작성 불가" : "댓글 등록";
            },
            replyContentIsEmpty(){
                return this.replyContent.length == 0;
            }
        },

            methods:{
            addReply(){
                if(this.replyContentIsEmpty) return;

                axios({
                    url:"${pageContext.request.contextPath}/rest/reply/",
                    method:"post",
                    data:{
                        replyTarget:this.togetherNo,
                        replyContent:this.replyContent,
                        memberNo:this.memberNo,
                        replyWriter:this.replyWriter,
                    },
                })
                .then(resp=>{
                    this.replyContent="";
                    this.loadReply();
                    this.loadReplyCount();
                });
            },

            loadReply(){
                axios({
                    url:"${pageContext.request.contextPath}/rest/reply/"+this.togetherNo,
                    method:"get",

                })
                .then(resp=>{
                    this.replyList = resp.data;
                });
            },
            
            loadReplyCount(){
                axios({
                    url:"${pageContext.request.contextPath}/rest/together/"+this.togetherNo,
                    method:"get",
                })
                .then(resp=>{
                    this.replyCount = resp.data;
                });
            },

            isEditAndDelete(memberNo){
                if(this.isAdmin) return true;

                if(this.memberNo == memberNo) return true;

                return false;
            },

            editMode(index){
                this.replyList[index].edit = true;
            },
            notEditMode(index){
                this.replyList[index].edit = false;
            },
            
            editReply(index){
                const reply = this.replyList[index];
                if(reply.replyContent.length == 0) return; 

                axios({
                    url:"${pageContext.request.contextPath}/rest/reply/",
                    method:"put",
                    data:{
                        replyNo:reply.replyNo,
                        replyContent:reply.replyContent,
                    },
                })
                .then(resp=>{
                    this.loadReply();
                });
            },

            deleteReply(index){
                const choice = window.confirm("정말 삭제하시겠습니까?");
                if(!choice) return;

                const reply = this.replyList[index];

                axios({
                    url:"${pageContext.request.contextPath}/rest/reply/"+reply.replyNo,
                    method:"delete"
                })
                .then(resp=>{
                    this.loadReply();
                });
            },
            changeTime(index){
            	return moment(index).format('YYYY-MM-DD hh:mm');
            },
        },
            //watch : 특정 data를 감시하여 연계 코드를 실행하기 위해 작성한다
            watch:{
            
        },
        created(){
            this.loadReply();
            this.loadReplyCount();
        }
    });
    app.mount("#app");
</script>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>