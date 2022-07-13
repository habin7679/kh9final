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
        padding: 0.4em;
        font-size: 14px;
       }
       .title-size{
        font-size: 22px;
       }
     </style>
        
 <script type="text/javascript">
 $(function(){
     $("textarea[name=qnaContent]").summernote({
         placeholder:"문의하실 내용을 작성해주세요.",
         height: 350
         });
 });
</script>
     
 <div id="app" class="container ma-t-100">
 	
 	<div class="section-header mt-4 col-md-6 offset-md-3" >
            <h2>QnA</h2>
            <p><span>문의</span> 게시판</p>
            <h2>관리자의 답변이 필요하시면 문의글을 남겨주세요.</h2>
       	</div>
 
 	<form action="write" method="post">
 	<c:if test="${superNo != null }">
		<input type="hidden" name="superNo" value="${superNo}">
	</c:if>
 	<div class="mt-4">
 		<div class="col-md-6 offset-md-3 tb-color rounded">
 		
 		<div class="row mt-2">
 		<div class="col-md-1 offset-md-1 text-center"><label class="mt-1">말머리</label></div>
 		<div class="col-md-3">
                <select name="qnaHead" class="form-select">
                    <option value="">선택</option>
                    <option>정보</option>
                    <option>예약</option>
                    <option>취소</option>
                    <option>신고</option>
                    <option>입점</option>
                </select>
            </div>
            <div class="col-md-7"></div>
 		</div>
 		
 		<div class="row mt-2">
 			<div class="col-md-1 offset-md-1 text-center"><label class="mt-2">제목</label></div>
	 		<div class="col-md-6">
	 			<input type="text" name="qnaTitle" class="form-control" autocomplete="off" placeholder="제목" style="height:50px;">
	 		</div>	
 		</div>	
 	<div class="row mt-2">
	<div class="col-md-10 offset-md-1">
		<textarea name="qnaContent"></textarea>
	</div>
 	</div>
	 	
 		<div class="row mt-2">
 			<div class="col-md-6 offset-md-3 text-center">
	 			<input type="submit" value="등록" class="btn1">
	 			<a href="${pageContext.request.contextPath}/qna/list" class="btn0">취소</a>
 			</div>
 		</div>
 		</div>
 	</div>
    </form>    
    </div>
    
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
    
