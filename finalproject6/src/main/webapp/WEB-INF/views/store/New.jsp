<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
    <!-- 특정 영역을 생성하여 이 부분만 vue로 제어한다 -->
    <div id="app" class="container-fluid">
          <!-- ======= Menu Section ======= -->

    <section id="menu" class="menu">
      <div class="container" data-aos="fade-up">

        <div class="section-header">
          <h2>내 가게수정</h2>
          <p>Edit my <span>Store</span></p>
        </div>

        <ul class="nav nav-tabs d-flex justify-content-center" data-aos="fade-up" data-aos-delay="200">

          <li class="nav-item">
            <a class="nav-link active show" data-bs-toggle="tab" data-bs-target="#menu-starters">
              <h4>가게정보</h4>
            </a>
          </li><!-- End tab nav item -->

          <li class="nav-item">
            <a class="nav-link" data-bs-toggle="tab" data-bs-target="#menu-breakfast">
              <h4>Room and Bar</h4>
            </a><!-- End tab nav item -->

          <li class="nav-item">
            <a class="nav-link" data-bs-toggle="tab" data-bs-target="#menu-lunch">
              <h4>가게 사진 변경</h4>
            </a>
          </li><!-- End tab nav item -->

        </ul>

        <div class="tab-content" data-aos="fade-up" data-aos-delay="300">
          <div class="tab-pane fade active show" id="menu-starters">
            <div class="row gy-5">
              <div class="col-lg-12 menu-item">
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
						<th>가게예약금</th>		
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
              </div><!-- Menu Item -->
            </div>
            
            
          </div><!-- End Starter Menu Content -->

          <div class="tab-pane fade" id="menu-breakfast">

            <div class="tab-header text-center">
              <p>Menu</p>
              <h3>Breakfast</h3>
            </div>

            <div class="row gy-5">

              <div class="col-lg-4 menu-item">
                <a href="${pageContext.request.contextPath}/img/menu/menu-item-1.png" class="glightbox"><img src="${pageContext.request.contextPath}/img/menu/menu-item-1.png" class="menu-img img-fluid" alt=""></a>
                <h4>Magnam Tiste</h4>
                <p class="ingredients">
                  Lorem, deren, trataro, filede, nerada
                </p>
                <p class="price">
                  $5.95
                </p>
              </div><!-- Menu Item -->

              <div class="col-lg-4 menu-item">
                <a href="${pageContext.request.contextPath}/img/menu/menu-item-2.png" class="glightbox"><img src="${pageContext.request.contextPath}/img/menu/menu-item-2.png" class="menu-img img-fluid" alt=""></a>
                <h4>Aut Luia</h4>
                <p class="ingredients">
                  Lorem, deren, trataro, filede, nerada
                </p>
                <p class="price">
                  $14.95
                </p>
              </div><!-- Menu Item -->

              <div class="col-lg-4 menu-item">
                <a href="${pageContext.request.contextPath}/img/menu/menu-item-3.png" class="glightbox"><img src="${pageContext.request.contextPath}/img/menu/menu-item-3.png" class="menu-img img-fluid" alt=""></a>
                <h4>Est Eligendi</h4>
                <p class="ingredients">
                  Lorem, deren, trataro, filede, nerada
                </p>
                <p class="price">
                  $8.95
                </p>
              </div><!-- Menu Item -->

              <div class="col-lg-4 menu-item">
                <a href="${pageContext.request.contextPath}/img/menu/menu-item-4.png" class="glightbox"><img src="${pageContext.request.contextPath}/img/menu/menu-item-4.png" class="menu-img img-fluid" alt=""></a>
                <h4>Eos Luibusdam</h4>
                <p class="ingredients">
                  Lorem, deren, trataro, filede, nerada
                </p>
                <p class="price">
                  $12.95
                </p>
              </div><!-- Menu Item -->

              <div class="col-lg-4 menu-item">
                <a href="${pageContext.request.contextPath}/img/menu/menu-item-5.png" class="glightbox"><img src="${pageContext.request.contextPath}/img/menu/menu-item-5.png" class="menu-img img-fluid" alt=""></a>
                <h4>Eos Luibusdam</h4>
                <p class="ingredients">
                  Lorem, deren, trataro, filede, nerada
                </p>
                <p class="price">
                  $12.95
                </p>
              </div><!-- Menu Item -->

              <div class="col-lg-4 menu-item">
                <a href="${pageContext.request.contextPath}/img/menu/menu-item-6.png" class="glightbox"><img src="${pageContext.request.contextPath}/img/menu/menu-item-6.png" class="menu-img img-fluid" alt=""></a>
                <h4>Laboriosam Direva</h4>
                <p class="ingredients">
                  Lorem, deren, trataro, filede, nerada
                </p>
                <p class="price">
                  $9.95
                </p>
              </div><!-- Menu Item -->

            </div>
          </div><!-- End Breakfast Menu Content -->

          <div class="tab-pane fade" id="menu-lunch">

            <div class="tab-header text-center">
              <p>Menu</p>
              <h3>Lunch</h3>
            </div>

            <div class="row gy-5">

              <div class="col-lg-4 menu-item">
                <a href="${pageContext.request.contextPath}/img/menu/menu-item-1.png" class="glightbox"><img src="${pageContext.request.contextPath}/img/menu/menu-item-1.png" class="menu-img img-fluid" alt=""></a>
                <h4>Magnam Tiste</h4>
                <p class="ingredients">
                  Lorem, deren, trataro, filede, nerada
                </p>
                <p class="price">
                  $5.95
                </p>
              </div><!-- Menu Item -->

              <div class="col-lg-4 menu-item">
                <a href="${pageContext.request.contextPath}/img/menu/menu-item-2.png" class="glightbox"><img src="${pageContext.request.contextPath}/img/menu/menu-item-2.png" class="menu-img img-fluid" alt=""></a>
                <h4>Aut Luia</h4>
                <p class="ingredients">
                  Lorem, deren, trataro, filede, nerada
                </p>
                <p class="price">
                  $14.95
                </p>
              </div><!-- Menu Item -->

              <div class="col-lg-4 menu-item">
                <a href="${pageContext.request.contextPath}/img/menu/menu-item-3.png" class="glightbox"><img src="${pageContext.request.contextPath}/img/menu/menu-item-3.png" class="menu-img img-fluid" alt=""></a>
                <h4>Est Eligendi</h4>
                <p class="ingredients">
                  Lorem, deren, trataro, filede, nerada
                </p>
                <p class="price">
                  $8.95
                </p>
              </div><!-- Menu Item -->

              <div class="col-lg-4 menu-item">
                <a href="${pageContext.request.contextPath}/img/menu/menu-item-4.png" class="glightbox"><img src="${pageContext.request.contextPath}/img/menu/menu-item-4.png" class="menu-img img-fluid" alt=""></a>
                <h4>Eos Luibusdam</h4>
                <p class="ingredients">
                  Lorem, deren, trataro, filede, nerada
                </p>
                <p class="price">
                  $12.95
                </p>
              </div><!-- Menu Item -->

              <div class="col-lg-4 menu-item">
                <a href="${pageContext.request.contextPath}/img/menu/menu-item-5.png" class="glightbox"><img src="${pageContext.request.contextPath}/img/menu/menu-item-5.png" class="menu-img img-fluid" alt=""></a>
                <h4>Eos Luibusdam</h4>
                <p class="ingredients">
                  Lorem, deren, trataro, filede, nerada
                </p>
                <p class="price">
                  $12.95
                </p>
              </div><!-- Menu Item -->

              <div class="col-lg-4 menu-item">
                <a href="${pageContext.request.contextPath}/img/menu/menu-item-6.png" class="glightbox"><img src="${pageContext.request.contextPath}/img/menu/menu-item-6.png" class="menu-img img-fluid" alt=""></a>
                <h4>Laboriosam Direva</h4>
                <p class="ingredients">
                  Lorem, deren, trataro, filede, nerada
                </p>
                <p class="price">
                  $9.95
                </p>
              </div><!-- Menu Item -->

            </div>
          </div><!-- End Lunch Menu Content -->

          <div class="tab-pane fade" id="menu-dinner">

            <div class="tab-header text-center">
              <p>Menu</p>
              <h3>Dinner</h3>
            </div>

            <div class="row gy-5">

              <div class="col-lg-4 menu-item">
                <a href="${pageContext.request.contextPath}/img/menu/menu-item-1.png" class="glightbox"><img src="${pageContext.request.contextPath}/img/menu/menu-item-1.png" class="menu-img img-fluid" alt=""></a>
                <h4>Magnam Tiste</h4>
                <p class="ingredients">
                  Lorem, deren, trataro, filede, nerada
                </p>
                <p class="price">
                  $5.95
                </p>
              </div><!-- Menu Item -->

              <div class="col-lg-4 menu-item">
                <a href="${pageContext.request.contextPath}/img/menu/menu-item-2.png" class="glightbox"><img src="${pageContext.request.contextPath}/img/menu/menu-item-2.png" class="menu-img img-fluid" alt=""></a>
                <h4>Aut Luia</h4>
                <p class="ingredients">
                  Lorem, deren, trataro, filede, nerada
                </p>
                <p class="price">
                  $14.95
                </p>
              </div><!-- Menu Item -->

              <div class="col-lg-4 menu-item">
                <a href="${pageContext.request.contextPath}/img/menu/menu-item-3.png" class="glightbox"><img src="${pageContext.request.contextPath}/img/menu/menu-item-3.png" class="menu-img img-fluid" alt=""></a>
                <h4>Est Eligendi</h4>
                <p class="ingredients">
                  Lorem, deren, trataro, filede, nerada
                </p>
                <p class="price">
                  $8.95
                </p>
              </div><!-- Menu Item -->

              <div class="col-lg-4 menu-item">
                <a href="${pageContext.request.contextPath}/img/menu/menu-item-4.png" class="glightbox"><img src="${pageContext.request.contextPath}/img/menu/menu-item-4.png" class="menu-img img-fluid" alt=""></a>
                <h4>Eos Luibusdam</h4>
                <p class="ingredients">
                  Lorem, deren, trataro, filede, nerada
                </p>
                <p class="price">
                  $12.95
                </p>
              </div><!-- Menu Item -->

              <div class="col-lg-4 menu-item">
                <a href="${pageContext.request.contextPath}/img/menu/menu-item-5.png" class="glightbox"><img src="${pageContext.request.contextPath}/img/menu/menu-item-5.png" class="menu-img img-fluid" alt=""></a>
                <h4>Eos Luibusdam</h4>
                <p class="ingredients">
                  Lorem, deren, trataro, filede, nerada
                </p>
                <p class="price">
                  $12.95
                </p>
              </div><!-- Menu Item -->

              <div class="col-lg-4 menu-item">
                <a href="${pageContext.request.contextPath}/img/menu/menu-item-6.png" class="glightbox"><img src="${pageContext.request.contextPath}/img/menu/menu-item-6.png" class="menu-img img-fluid" alt=""></a>
                <h4>Laboriosam Direva</h4>
                <p class="ingredients">
                  Lorem, deren, trataro, filede, nerada
                </p>
                <p class="price">
                  $9.95
                </p>
              </div><!-- Menu Item -->

            </div>
          </div><!-- End Dinner Menu Content -->

        </div>

      </div>
    </section><!-- End Menu Section -->
        

    </div>

    <!-- vue js도 lazy loading을 사용한다 -->
    <script src="https://unpkg.com/vue@next"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
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
</body>
</html>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>