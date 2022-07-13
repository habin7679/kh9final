<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ChatBot</title>
 <!-- Favicons -->
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
  

  <!-- =======================================================
  * Template Name: Yummy - v1.0.0
  * Template URL: https://bootstrapmade.com/yummy-bootstrap-restaurant-website-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
  
  <!-- Vuetify CDN-->
  <link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,900" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/@mdi/font@6.x/css/materialdesignicons.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/vuetify@2.x/dist/vuetify.min.css" rel="stylesheet">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, minimal-ui">
  
<style>
	.btn-message {
	 position: relative;
    display: inline-block;
    margin: 1.5em 0 1.5em 15px;
    padding: 0 5px;
    min-width: 90px;
    height: 120px;
    text-align: center;
    color: #FFF;
    font-size: 0.9em;
    font-weight: bold;
    background: #ffcc75;
    border-radius: 15px;
    box-sizing: border-box;
  }
  
  .btn-message:after {
     content: "";
    position: absolute;
    top: 100%;
    left: 30px;
    margin-top: -15px;
    border: 15px solid transparent;
    border-right: 15px solid #ffcc75;
    z-index: 0;
  }
	.chat-bg{
		background:#F2F2F2;
	}
	.chat-bg-header{
		background:var(--color-primary);
	}
	.hello{
	 font-size: 18px;
	 font-weight: bold;
	}
	
</style>
</head>
<body class="chat-bg">

<div class="container-fluid ma-t-100">

<div class="row chat-bg-header">
	<div class="col-md-8 offset-md-2 text-center mt-2">
		<h3 style="color:white;" class="fw-bold">YEAH BOT</h3>
	</div>
</div>

<div class="row mt-10">
	<div class="col-md-6 offset-md-3 text-center" style="margin-top:10px;">
		<h4 class="hello">고객님, 안녕하세요!</h4>
		<h4 class="hello">YEAH BOT이 자주하는 문의를 도와드립니다.</h4>
	</div>
</div>

	<div class="row mt-10">
		<div class="col-md-6 offset-md-3 text-center">
			<div class="message-place"></div>
		</div>
	</div>
	
	<div class="row mt-1">
		<div class="col-md-7"></div>
		<div class="col-md-3">
			<button class="btn-prev btn-c">이전</button>
			<button class="btn-connect btn-cc">처음부터</button>
			<button class="btn-disconnect btn-cc">종료</button>
		</div>
	</div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
	$(function(){
		chatStart();
		chatConnect();
		
		let memory = [];
		
		$(".btn-connect").click(chatStart);
		
		$(".btn-disconnect").click(function(){
			socket.close();
			console.log("종료");
			window.close();
		});
		
		$(".btn-prev").click(function(){
			let chatbotNo = memory.pop();
			if(memory.length > 0){
				sendMessage(memory[memory.length-1]);
			}
			else{
				sendMessage(0);
			}
		});
		
		function chatStart(){ //챗봇 연결
			let uri = "ws://";
			uri += location.host;
			uri += "${pageContext.request.contextPath}";
			uri += "/ws/chatbot"
			
			socket = new WebSocket(uri);
			
			socket.onopen = function(e){
				chatConnect();
				console.log("연결");
			};
			
			socket.onclose = function(e){
				chatDisconnect();
			};
			socket.onerror = function(){
				alert("서버와의 연결 오류가 발생하였습니다.");
				chatDisconnect();
			};
			socket.onmessage = function(e){
				$(".message-place").empty();
				
				let data = JSON.parse(e.data);
				
				for(let i=0; i<data.length; i++){
					let button = $("<button>").addClass("btn-message")
					.text(data[i].chatbotContent)
					.attr("data-chatbot-no",data[i].chatbotNo);
					
					if(data[i].count>0){
						button.click(function(){
							let chatbotNo = $(this).attr("data-chatbot-no");
							sendMessage(chatbotNo);
							memory.push(chatbotNo);
						});
					}
					$(".message-place").append(button);
				}
			};
		};
		
		function chatConnect(){ //연결 시
			$(".btn-connect").prop("disabled",true);
			$(".btn-connect").hide();
			$(".btn-disconnect").prop("disabled",false);
			$(".btn-prev").prop("disabled",false);
			$(".btn-prev").show();
		};
		function chatDisconnect(){//종료 시 
			$(".btn-connect").prop("disabled",false);
			$(".btn-connect").show();
			$(".btn-disconnect").prop("disabled",true);
			$(".btn-prev").prop("disabled",true);
			$(".btn-prev").hide();
		};
		function sendMessage(text){
			if(text==="" || text===undefined || text===null) return;
			socket.send(text);
		};
		
	});
	
	
	
</script>
</body>
</html>