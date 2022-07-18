<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <!-- include libraries(jQuery, bootstrap) -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- include summernote css/js -->
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

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
        padding: 0.5em;
        font-size: 14px;
       }
       .title-size{
        font-size: 22px;
       }
     </style>
        
 <script type="text/javascript">
 $(function(){
     $("textarea[name=noticeContent]").summernote({
         height: 350
         });
     
     console.log($("#ckb").val());
    
     $("input[type=checkbox]").on("input",function(){
 		if($(this).is(":checked") ==true){
 			$(this).val(1);
 			console.log($(this).val());
 		}
 		else{
 			$(this).val(0);
 			console.log($(this).val());
 		}
 	});
   
 });
</script>
     
 <div id="app" class="container ma-t-100">
 	
 	<div class="section-header mt-4 col-md-6 offset-md-3" >
            <h2>notice</h2>
            <p><span>공지</span> 게시판</p>
            <h2>공지 및 이벤트를 확인하세요.</h2>
       	</div>
 
 	<form action="edit" method="post" enctype="multipart/form-data">
 	<input type="hidden" name="noticeNo" value="${noticeDto.noticeNo}">
 	<div class="mt-5">
 		<div class="col-md-6 offset-md-3 tb-color rounded">
 		
 		<div class="row mt-2">
 		<div class="col-md-1 offset-md-1 text-center"><label class="mt-1">말머리</label></div>
 		<div class="col-md-3">
                <select name="noticeHead" class="form-select">
                    <option value="" <c:if test="${noticeDto.noticeHead==''}">selected</c:if>>선택</option>
                    <option <c:if test="${noticeDto.noticeHead=='공지'}">selected</c:if>>공지</option>
                    <option <c:if test="${noticeDto.noticeHead=='이벤트'}">selected</c:if>>이벤트</option>
                </select>
            </div>
            
            <div class="col-md-3 mt-2 form-check form-switch">
            	<label class="form-check-label">
            	<c:choose>
	            	<c:when test="${noticeDto.pin == 1 }">
	            		<input type="checkbox" name="pin" value="${noticeDto.pin}" id="ckb" checked> 상단고정
	            	</c:when>
	            	<c:otherwise>
	            		<input type="checkbox" name="pin" value="${noticeDto.pin}" id="ckb"> 상단고정
	            	</c:otherwise>
            	</c:choose>
            	</label>
            </div>
            
            <div class="col-md-4"></div>
 		</div>
 		
 		
 		
 		<div class="row mt-2">
 			<div class="col-md-1 offset-md-1 text-center"><label class="mt-2">제목</label></div>
	 		<div class="col-md-6">
	 			<input type="text" name="noticeTitle" class="form-control" autocomplete="off" placeholder="제목" value="${noticeDto.noticeTitle}"
	 			style="height:50px;">
	 		</div>	
 		</div>		
 	<div class="row mt-2">
	<div class="col-md-10 offset-md-1">
		<textarea name="noticeContent">${noticeDto.noticeContent}</textarea>
	</div>
 	</div>
 	
 	<c:if test="${attachmentDto != null }">
 		<div class="row mt-2" v-if="!isNoneAttach" >
 			<div class="col-md-4 offset-md-1">
 				<span>{{attachmentName}}</span>
 				<button type="button" class="btn0" @click="deleteAttach">삭제</button>
 			</div>
 		</div>
 	</c:if>	
 	
 	<div class="row mt-2">
 			<div class="col-md-4 offset-md-1">
 				<input type="file" name="noticeImg" accept=".jpg, .png, .gif, .pdf, .ppt, .txt, .hwp">
 			</div>
 		</div>
	 	
 		<div class="row mt-2">
 			<div class="col-md-6 offset-md-3 text-center">
	 			<input type="submit" value="수정" class="btn1">
	 			<a href="${pageContext.request.contextPath}/notice/detail?noticeNo=${noticeDto.noticeNo}" class="btn0">취소</a>
 			</div>
 		</div>
 		
 		</div>
 	</div>
    </form>    
    </div>
 
 <script src="https://unpkg.com/vue@next"></script>
 <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
 <c:if test="${attachmentDto != null }">
 <script>
        //div[id=app]을 제어할 수 있는 Vue instance를 생성
        const app = Vue.createApp({
            //data : 화면을 구현하는데 필요한 데이터를 작성해둔다
            data(){
                return {
                   attachmentNo:${attachmentDto.attachmentNo},
                   attachmentName:"",
                };
            },
            
            computed:{
				isNoneAttach(){
					return this.attachmentNo == 0 || this.attachmentNo == null;
				},
				
				
            },
            
             methods:{
               deleteAttach(){
            	   if(this.attachmentNo == null) return;
            	   
            	   let choice = window.confirm("정말 삭제하시겠습니까?");
            	   if(!choice) return;
            	   
            	   axios({
            		   url:"${pageContext.request.contextPath}/rest/noticeAttach/"+this.attachmentNo,
            		   method:"delete",
            	   })
            	   .then(resp=>{
            		   this.loadAttach();
            	   });
               },
               
               loadAttach(){
            	   if(this.attachmentNo == null) return;
            	   
            	   axios({
            		 url:"${pageContext.request.contextPath}/rest/noticeAttach/"+this.attachmentNo,
            		 method:"get",
            		 
            	   })
            	   .then(resp=>{
            		   console.log(resp);
            		   this.attachmentName = resp.data.attachmentUploadname;
            	   });
               },
               
            },
            
            created(){
            	this.loadAttach();
            },
            
             watch:{
               
            },
        });
        app.mount("#app");
    </script>
</c:if> 

    
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
