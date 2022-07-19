<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <!-- include libraries(jQuery, bootstrap) -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- include summernote css/js -->
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script>

$(document).ready(function() {
    $('#msgNote').on('keyup', function() {
        $('#msgNote_cnt').html("("+$(this).val().length+" / 100)");
 
        if($(this).val().length > 100) {
            $(this).val($(this).val().substring(0, 100));
            $('#msgNote_cnt').html("(100 / 100)");
        }
    });
});

</script>
<style>
	
	.c{
	width:500px;
	}
	.d{
	border: 1px solid black;
	height:300px;
	width:700px;
	}
	.e{
	width:180px;
	text-align:center;
	margin-left:500px;
	}
	
	
</style>

    <!-- 프로필 이미지를 추가하기 위해 enctype을 multipart/form-data로 변경 -->
 <section> 

     
<form action="send" method="post" >
	<div class="container ma-t-100" >
	<div class="row">
    <div class="section-header mt-4 col-md-8 offset-md-2" >
    
	    <h2>message</h2>
            <p><span>쪽지</span>보내기</p>
       	</div>
       	</div>
       	
        <div class="row mt-2">
	 <div class="col-md-8 offset-md-2 text-center">
	 <div class="row">
	 		<label class="mt-2 e">받는이 :${memberRecvDto.memberNick} </label>
 			<input type="hidden" name="smemberNo" value="${memberDto.memberNo}">
 			<input type="hidden" name="rmemberNo" value="${memberRecvDto.memberNo}">
 			</div>
 		</div>	
 		<div class="row mt-2">
	<div class="col-md-8 offset-md-2 text-center" >
		<textarea name="msgNote" class="d" id="msgNote"></textarea><br>
		<span style="color:red; " id="msgNote_cnt" >(0 / 100)</span>
	</div>
 	</div>
	     	
	    <div class="row mb-2 text-center">
	    <div class="col-md-8 offset-md-2">
	        <button type="submit" class="btn1 c">쪽지 보내기</button>
	        </div>
	    </div>
	    </div>
	    </div>
	    </form>
	    </section>
	 <jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>