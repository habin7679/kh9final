<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include> 
    


<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>VueJS</title>

    <!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous"> -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/5.1.3/cosmo/bootstrap.min.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"/>
    <style>
      
    </style>
</head>
<body>

    <div id="app" class="container-fluid">
        <div class="row mt-4">
            <div class="col-md-8 offset-md-2">
                <div class="p-4 text-light bg-dark rounded">
                    <h1>가게수정</h1>
                </div>
            </div>
        </div>
        
       
            	<div class="float-left" style="width:70%">
			<table class="table table-border">
				<thead>
					<tr>
						<th>카테고리</th>
						<th>가게전화번호</th>
						<th>가게POST</th>
						<th>가게주소</th>
						<th>가게상세주소</th>
						<th>사장님이름</th>
						<th>점심시간</th>
						<th>저녁시간</th>
						<th>가게시작시간</th>
						<th>가게문닫는시간</th>				
					</tr>
				</thead>
				<tbody>
					<tr v-for="(store, index) in dataList" v-bind:key="index">
						<td>{{store.category}}</td>
						<td>{{store.storeName}}</td>
						<td>{{store.storePost}}</td>
						<td>{{store.storeAddress}}</td>
						<td>{{store.storeDetailAddress}}</td>					
						<td>{{store.storeBossName}}</td>					
						<td>{{store.storeLikecount}}</td>
						<td>{{store.storeLunchTime}}</td>
						<td>{{store.storeDinnerTime}}</td>
						<td>{{store.storeStart}}</td>
						<td>{{store.storeEnd}}</td>
						<td>{{store.storeReservationPrice}}</td>
						
						<td>
							<!-- .prevent 를 붙이면 기본 이벤트가 자동 제거(e.preventDefault() 효과) -->
							<a href="#" v-on:click.prevent="selectItem(index);">선택</a>
							<a href="#" v-on:click.prevent="deleteItem(index);">삭제</a>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
        </div>

        
 <script src="https://unpkg.com/vue@next"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    
<script>
	const app = Vue.createApp({
		data(){
			return{
				dataList:[],
				currentData:{
					storeNo:"",
					category:"",
					dong:"",
					gu:"",
					sellerNo:"",
					storeName:"",
					storeCall:"",
					storePost:"",
					storeAddress:"",
					storeDetailAddress:"",
					storeBossName:"",
					storeRegistDate:"",
					storeLikecount:"",
					storeLunchTime:"",
					storeDinnerime:"",
					storeStart:"",
					storeEnd:"",
					storeReservationPrice:"",
				},
				index:-1,
			};
		},
		computed:{
			mode(){
				return this.index < 0 ? "등록" : "수정";
			},
			isInsertMode(){
				return this.mode == "등록";
			},
			isEditMode(){
				return this.mode == "수정";
			},
		},
		methods:{
			deleteItem(index){
				var choice = window.confirm("데이터를 정말 지우시겠습니까?");
				if(choice == false) return;
				
				const storeNo = this.dataList[index].storeNo;
				axios({
					url:"${pageContext.request.contextPath}/rest/store/"+storeNo,
					method:"delete"
				})
				.then(()=>{
					this.dataList.splice(index, 1);
				});
			},
			
			selectItem(index){
				this.currentData = this.dataList[index];
				this.index = index;
			},
			
			clearItem(){
				this.currentData = {
						storeNo:"",
						category:"",
						dong:"",
						gu:"",
						sellerNo:"",
						storeName:"",
						storeCall:"",
						storePost:"",
						storeAddress:"",
						storeDetailAddress:"",
						storeBossName:"",
						storeRegistDate:"",
						storeLikecount:"",
						storeLunchTime:"",
						storeDinnerime:"",
						storeStart:"",
						storeEnd:"",
						storeReservationPrice:"",
				}
				this.index = -1;
			},
			
			addItem(){
				let type;
				if(this.isInsertMode){//등록이라면
					type = "post";
				}
				else if(this.isEditMode){//수정이라면
					type = "put";	
				}
				
				if(!type) return;
				
			axios({
					url:"${pageContext.request.contextPath}/rest/store/",
					method:type,//계산된 method(POST/PUT)
					data: this.currentData
				})
				.then((resp)=>{
					if(this.isInsertMode){
						this.dataList.push(resp.data);
						this.clearItem();
						window.alert("등록 완료");
					}
					else if(this.isEditMode){
						this.dataList[this.index] = resp.data;
						window.alert("수정 완료");
					}
				});
			},
		},
		created(){
				
			//axios({옵션}).then(성공롤백).catch(에러콜백);
			axios({
					url:"${pageContext.request.contextPath}/rest/store/",
					method:"get"
				})
				.then((resp)=>{
					this.dataList.push(...resp.data);
				})
		},
		
	});
		
	 
app.mount("#app")
</script>






<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>

