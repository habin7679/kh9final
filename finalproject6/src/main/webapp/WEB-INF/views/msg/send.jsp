<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <link href="${pageContext.request.contextPath}/img/favicon.png" rel="icon">
  <link href="${pageContext.request.contextPath}/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"/>
  <!-- Vendor CSS Files -->
  <link href="${pageContext.request.contextPath}/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/vendor/aos/aos.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="${pageContext.request.contextPath}/css/main.css" rel="stylesheet">
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <!-- include libraries(jQuery, bootstrap) -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,900" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/@mdi/font@6.x/css/materialdesignicons.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/vuetify@2.x/dist/vuetify.min.css" rel="stylesheet">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, minimal-ui">
  
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.3/moment.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
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
    <!-- 프로필 이미지를 추가하기 위해 enctype을 multipart/form-data로 변경 -->
 <section> 

     
<form action="send" method="post" >
	<div class="container ma-t-100" >
	<div class="row">
    <div class="section-header mt-4 col-md-8 offset-md-2 "  >
    
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
