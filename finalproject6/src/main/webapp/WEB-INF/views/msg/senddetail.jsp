<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	
	.c{
	width:500px;
	}
	.d{
	border: 1px solid black;
	
	}
	.e{
	width:180px;
	text-align:center;
	margin-left:500px;
	}

</style>
<div class="container ma-t-100" style="width:900px;" >
 <div class="section-header mt-4 col-md-8 offset-md-2" >
            <h2>msg</h2>
            <p><span>쪽지</span> 상세정보</p>
       	</div>
       	<div class="row mt-2">
	 <div class="col-md-8 offset-md-2 text-center">
	 <div class="row">
	 		<label class="mt-2 ">받는사람 : ${sendMsgVO.memberNick} </label>
 			</div>
 			<div class="row">
 			<label class="mt-2 ">시간 : ${sendMsgVO.sendDate} </label>
 			</div>
 		</div>	
 		<div class="row mt-2">
	<div class="col-md-8 offset-md-2 text-center" >
		<textarea rows="10" cols="60" class="d" disabled>${sendMsgVO.msgNote}</textarea>
	</div>
 	</div>	
 	<div class="row mt-2 text-center">
	<div class="row ">
		<div class="col-md-8 offset-md-2">
		<a href="${pageContext.request.contextPath}/msg/sendBox"  class="btn btn-secondary" >목록으로</a>
	</div>
	</div>
	
	</div>
	</div>
	</div>
	    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        
    </script>
    

    
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include> 
	
	