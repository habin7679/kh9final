<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<div class="container ma-t-100">
	<div class="row mt-10">
		<div class="col-md-6 offset-md-3 text-center">
			<button class="btn-connect btn btn-secondary">연결</button>
			<button class="btn-disconnect btn btn-secondary">종료</button>
		</div>
	</div>
	<div class="row mt-10">
		<div class="col-md-6 offset-md-3 text-center">
			<div class="message-place"></div>
			<button class="btn-prev btn0">뒤로가기</button>
		</div>
	</div>
</div>
<style>
	.btn-message{
		display : block;
		margin : 10px 0px;
	}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
	$(function(){
		chatDisconnect();
		
		let memory = [];
		
		$(".btn-connect").click(function(){
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
			
		});
		
		$(".btn-disconnect").click(function(){
			socket.close();
			console.log("종료");
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
		
		function chatConnect(){ //연결 시
			$(".btn-connect").prop("disabled",true);
			$(".btn-disconnect").prop("disabled",false);
			$(".btn-prev").prop("disabled",false);
			$(".btn-prev").show();
		};
		function chatDisconnect(){//종료 시 
			$(".btn-connect").prop("disabled",false);
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

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>