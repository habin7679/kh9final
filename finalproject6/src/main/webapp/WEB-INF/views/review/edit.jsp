<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet">
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
	rel="stylesheet">
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- include libraries(jQuery, bootstrap) -->
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- include summernote css/js -->
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<style>
.passSpace {
	word-break: break-all;
}

.fa-cursor {
	cursor: pointer;
}

.a {
	border-collapse: separate;
}

.d {
	border-bottom-left-radius: 1em;
	border-bottom-right-radius: 1em;
}

.e {
	border-top-left-radius: 1em;
	border-top-right-radius: 1em;
}

.tb-color {
	background-color: #f1f2f6;
}

.circle-head {
	background-color: #57606f;
	border-radius: 1.2em;
	color: white;
	padding: 0.5em;
	font-size: 14px;
}

.title-size {
	font-size: 22px;
}
</style>

<script>
 $(function(){
     $("textarea[name=reviewContent]").summernote({
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

	<div class="section-header mt-4 col-md-6 offset-md-3">
		<h2>review</h2>
		<p>
			<span>리뷰</span> 게시판
		</p>
		<h2>리뷰확인하세요.</h2>
	</div>

	<form action="edit" method="post" enctype="multipart/form-data">
		<input type="hidden" name="storeNo" value="${reviewDto.storeNo}">
		<input type="hidden" name="reviewNo" value="${reviewDto.reviewNo}">
		<div class="mt-5">
			<div class="col-md-6 offset-md-3 tb-color rounded">

				<div class="row mt-2">
					<div class="col-md-10 offset-md-1">
						<textarea name="reviewContent">${reviewDto.reviewContent}</textarea>
					</div>
				</div>

				<div>
					<label>평점</label> <br> <input type="radio" name="reviewScore"
						value="1" checked required class="form-input fill input-round">1점
					<input type="radio" name="reviewScore" value="2" required
						class="form-input fill input-round">2점 <input type="radio"
						name="reviewScore" value="3" required
						class="form-input fill input-round">3점 <input type="radio"
						name="reviewScore" value="4" required
						class="form-input fill input-round">4점 <input type="radio"
						name="reviewScore" value="5" required
						class="form-input fill input-round">5점

				</div>
				<c:if test="${attachmentDto != null }">
					<div class="row mt-2" v-if="!isNoneAttach">
						<div class="col-md-4 offset-md-1">
							<span>{{attachmentName}}</span>
							<button type="button" class="btn0" @click="deleteAttach">삭제</button>
						</div>
					</div>
				</c:if>

				<div class="row mt-2">
					<div class="col-md-4 offset-md-1">
						<input type="file" name="reviewImg"
							accept=".jpg, .png, .gif, .pdf, .ppt, .txt, .hwp">
					</div>
				</div>

				<div class="row mt-2">
					<div class="col-md-6 offset-md-3 text-center">
						<input type="submit" value="수정" class="btn1"> <a
							href="${pageContext.request.contextPath}/review/detail?reviewNo=${reviewDto.reviewNo}"
							class="btn0">취소</a>
					</div>
				</div>

			</div>
		</div>
	</form>
</div>

<script src="https://unpkg.com/vue@next"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
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
            		   url:"${pageContext.request.contextPath}/rest/reviewAttach/"+this.attachmentNo,
            		   method:"delete",
            	   })
            	   .then(resp=>{
            		   this.loadAttach();
            	   });
               },
               
               loadAttach(){
            	   if(this.attachmentNo == null) return;
            	   
            	   axios({
            		 url:"${pageContext.request.contextPath}/rest/reviewAttach/"+this.attachmentNo,
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