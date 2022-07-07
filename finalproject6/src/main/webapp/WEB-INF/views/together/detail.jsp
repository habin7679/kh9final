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
        padding: 0.4em;
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
<%-- 	                            <c:if test="${togetherDto.togetherHead != null }"> --%>
<%-- 	                                <span class="circle-head">${togetherDto.togetherHead}</span> --%>
<%-- 	                            </c:if>     --%>
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
                            <td class="p-3 d" style="border-bottom: none;">
                                <pre>${togetherDto.togetherContent}</pre>
                            </td>
                        </tr>
                        <tr style="text-align: right;">
                           <td style="border-bottom: none;">
                           <c:if test="${isAdmin || isOwner }">
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
                                <span style="color:red;" class="fw-bold">0</span>
                            </td>
                        </tr>

						<!-- 댓글 목록 -->
                        <tr>
                            <td>
                                <div class="row">
                                    <div class="col-md-1 text-left mt-1 mb-1 passSpace">
                                       <span>작성자</span>
                                    </div>
                                    <div class="col-md-7 text-left mt-1 mb-1 passSpace">
                                        <span>댓글 내용</span>
                                    </div>
                                    <div class="col-md-2 text-center mt-1 mb-1 passSpace">
                                        <span>작성일</span>
                                    </div>
                                    <div class="col-md-2 text-center mt-1">
                                        <i class="fa-solid fa-pencil fa-cursor me-3"></i>
                                        <i class="fa-solid fa-circle-xmark fa-cursor"></i>                                   
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
                                        <textarea class="form-control" v-model="reContent" :placeholder="textPlaceholder" :disabled="isNoneMember"></textarea>
                                    </div>
                                    <div class="col-md-1 text-center d-grid">
                                        <button class="btn1" style="font-size: 0.8em;" :disabled="isNoneMember">등록</button>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        
                        <!-- 댓글 수정 -->
                        <tr>
                            <td style="border-bottom: none;">
                                <div class="row">
                                    <div class="col-md-1 text-center mt-3">
                                        <span>댓글 입력</span>
                                    </div>
                                    <div class="col-md-10 mt-2">
                                        <textarea class="form-control" ></textarea>
                                    </div>
                                    <div class="col-md-1 d-grid gap-1">
                                        <button class="btn1">수정</button>
                                        <button class="btn0">취소</button>
                                    </div>
                                </div>
                            </td>
                        </tr>

                    </tbody>
                </table>
            </div>
        </div>
    </div>

 <script src="https://unpkg.com/vue@next"></script>
<!-- <script src="https://unpkg.com/vue@next/dist/vue.global.prod.js"></script> -->
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <script>
        const app = Vue.createApp({
            data(){
                return {
                	memberNo:"${no}",
                	memberKind:"${auth}",
                   reContent:"",
                   replyList:[],
                };
            },
            
            computed:{
				isNoneMember(){
					return this.memberNo == "" || this.memberKind == "";
				}
				isMember(){
					return this.memberNo != "" || this.memberKind != "";
				}
				isAdmin(){
					return this.isMember && this.memberKind == "관리자";
				}
				textPlaceholder(){
					return this.isNoneMember ? "로그인 후 댓글을 작성할 수 있습니다" : "댓글 내용 입력";
				}
            },

             methods:{
               
            },
             //watch : 특정 data를 감시하여 연계 코드를 실행하기 위해 작성한다
             watch:{
               
            },
        });
        app.mount("#app");
    </script>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>