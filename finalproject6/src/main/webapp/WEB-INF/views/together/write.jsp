<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
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
        
 <script type="text/javascript">
 $(function(){
     $("textarea[name=togetherContent]").summernote({
         placeholder:"내용 입력",
         height: 350
         });
     $("textarea[name=togetherContent]").summernote("pasteHTML","<ul><li>아래 양식에 맞게 작성하여 주세요.</li></ul>");
     $("textarea[name=togetherContent]").summernote("pasteHTML","<h6>날짜 : </h6>");
     $("textarea[name=togetherContent]").summernote("pasteHTML","<h6>시간 : </h6>");
     $("textarea[name=togetherContent]").summernote("pasteHTML","<h6>장소 : </h6>");
     $("textarea[name=togetherContent]").summernote("pasteHTML","<h6>본인 성별 : </h6>");
     $("textarea[name=togetherContent]").summernote("pasteHTML","<h6>동행인 성별 : </h6>");
     $("textarea[name=togetherContent]").summernote("pasteHTML","<h6>필요 인원 : </h6>");
     $("textarea[name=togetherContent]").summernote("pasteHTML","<h6>기타 메모 : </h6>");
 });
</script>
     
 <div id="app" class="container ma-t-100">
 	
 	<div class="section-header mt-4 col-md-8 offset-md-2" >
            <h2>Together</h2>
            <p><span>같이가요</span> 게시판</p>
            <h2>함께 식사할 동행을 구해보세요.</h2>
       	</div>
 
 	<form action="write" method="post">
 	<div class="mt-4">
 		<div class="col-md-8 offset-md-2 tb-color rounded">
 		<div class="row mt-2">
	 		<div class="col-md-10 offset-md-1">
	 			<input type="text" name="togetherTitle" class="form-control" autocomplete="off" placeholder="제목"
	 			style="height:50px;">
	 		</div>	
 		</div>		
 	<div class="row mt-2">
	<div class="col-md-10 offset-md-1">
		<textarea name="togetherContent"></textarea>
	</div>
 	</div>
	 	
 		<div class="row mt-2">
 			<div class="col-md-8 offset-md-2 text-center">
	 			<input type="submit" value="등록" class="btn1">
	 			<a href="${pageContext.request.contextPath}/together/list" class="btn0">취소</a>
 			</div>
 		</div>
 		</div>
 	</div>
    </form>    
    </div>
    

    