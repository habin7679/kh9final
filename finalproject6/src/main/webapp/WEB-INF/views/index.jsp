<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="root" value="${pageContext.request.contextPath}"></c:set>
    
    <jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>


   <!-- ======= Hero Section ======= -->
  <section id="hero" class="hero d-flex align-items-center section-bg">
    <div class="container">
    <div class="row">
    <div class="col-lg-6">
        <div class="order-1 order-lg-2 text-center text-lg-start">
          <img src="${pageContext.request.contextPath}/img/mainPic.jpg" class="img-fluid rounded-circle" alt="" data-aos="zoom-out" data-aos-delay="300">
        </div>
        <div class="col-lg-10 offset-md-2 order-1 order-lg-2  text-lg-start">
        	<h1 class="fw-bold">Y E A Y A K O O</h1>
        </div>
      </div>  
      <div class="col-lg-6" style="margin-top:160px;">
      <div class="section-header">
          <h3 class="fw-bold" style="color:#636e72;">서울 오마카세의 모든 것!</h3>
          <p style="font-size: 3em;" class="fw-bold">안녕하세요 
          <span> 예야쿠</span>입니다.</p>
        </div>
      </div>
      </div>
    </div>
  </section><!-- End Hero Section -->

    <!-- ======= 좋아요 순 가게 구역 ======= -->

    <section id="menu" class="menu">
      <div class="container" data-aos="fade-up">

        <div class="section-header">
          <h2>Popular Store</h2>
          <p>예야쿠 <span> TOP 6</span></p>
        </div>

        <ul class="nav nav-tabs d-flex justify-content-center" data-aos="fade-up" data-aos-delay="200">

          <li class="nav-item">
            <a class="nav-link active show" data-bs-toggle="tab" data-bs-target="#menu-starters">
              <h4>스시</h4>
            </a>
          </li><!-- End tab nav item -->

          <li class="nav-item">
            <a class="nav-link" data-bs-toggle="tab" data-bs-target="#menu-breakfast">
              <h4>한우</h4>
            </a><!-- End tab nav item -->

          <li class="nav-item">
            <a class="nav-link" data-bs-toggle="tab" data-bs-target="#menu-lunch">
              <h4>디저트</h4>
            </a>
          </li><!-- End tab nav item -->

          <li class="nav-item">
            <a class="nav-link" data-bs-toggle="tab" data-bs-target="#menu-dinner">
              <h4>꼬치</h4>
            </a>
          </li><!-- End tab nav item -->

        </ul>

        <div class="tab-content" data-aos="fade-up" data-aos-delay="300">

          <div class="tab-pane fade active show" id="menu-starters">

            <div class="tab-header text-center">
              <p>Menu</p>
              <h3>Sushi</h3>
            </div>
            
            <div class="row gy-5">
<!-- 			여기서부터 시작 -->
			<c:forEach var="storeDto" items="${sList}" varStatus="status">
              <div class="col-lg-4 menu-item">
             <c:choose>
              <c:when test="${sAttachList[status.index] != 0 }">
              <a href="${pageContext.request.contextPath}/store/detail?storeNo=${storeDto.storeNo}">
              <img src="${pageContext.request.contextPath}/attachment/download?attachmentNo=${sAttachList[status.index]}" class="menu-img img-fluid">
              </a>
              </c:when>
              <c:otherwise>
              <a href="${pageContext.request.contextPath}/store/detail?storeNo=${storeDto.storeNo}">
              <img src="${pageContext.request.contextPath}/img/mainMap.png" class="menu-img img-fluid">
              </a>
            </c:otherwise>
             </c:choose>
             <a href="${pageContext.request.contextPath}/store/detail?storeNo=${storeDto.storeNo}">
                <h4 class="fw-bold">${storeDto.storeName}</h4>
                </a>
                <p class="ingredients">
                  ${storeDto.storeAddress}
                </p>
<!--                 <p class="price"> -->
<%--                   ${storeDto.storeLikeCount} --%>
<!--                 </p> -->
              </div><!-- Menu Item -->
				</c:forEach>
				

            </div>
          </div><!-- End Starter Menu Content -->

          <div class="tab-pane fade" id="menu-breakfast">

            <div class="tab-header text-center">
              <p>Menu</p>
              <h3>Korean beef</h3>
            </div>

            <div class="row gy-5">
				<!-- 여기부터 시작 -->
				<c:forEach var="storeDto" items="${cList}" varStatus="status">
              <div class="col-lg-4 menu-item">
               <c:choose>
	              <c:when test="${cAttachList[status.index] != 0 }">
	              <a href="${pageContext.request.contextPath}/store/detail?storeNo=${storeDto.storeNo}">
	              <img src="${pageContext.request.contextPath}/attachment/download?attachmentNo=${cAttachList[status.index]}" class="menu-img img-fluid">
	              </a>
	              </c:when>
	              <c:otherwise>
	              <a href="${pageContext.request.contextPath}/store/detail?storeNo=${storeDto.storeNo}">
	              <img src="${pageContext.request.contextPath}/img/mainMap.png" class="menu-img img-fluid">
	              </a>
	            </c:otherwise>
             </c:choose>
             <a href="${pageContext.request.contextPath}/store/detail?storeNo=${storeDto.storeNo}">
                <h4>${storeDto.storeName}</h4>
                </a>
                <p class="ingredients">
                  ${storeDto.storeAddress}
                </p>
<!--                 <p class="price"> -->
<!--                   $5.95 -->
<!--                 </p> -->
              </div><!-- Menu Item -->
				</c:forEach>
            </div>
          </div><!-- End Breakfast Menu Content -->

          <div class="tab-pane fade" id="menu-lunch">

            <div class="tab-header text-center">
              <p>Menu</p>
              <h3>Dessert</h3>
            </div>

            <div class="row gy-5">

			<c:forEach var="storeDto" items="${dList}" varStatus="status">
              <div class="col-lg-4 menu-item">
               <c:choose>
	              <c:when test="${dAttachList[status.index] != 0 }">
	              <a href="${pageContext.request.contextPath}/store/detail?storeNo=${storeDto.storeNo}">
	              <img src="${pageContext.request.contextPath}/attachment/download?attachmentNo=${dAttachList[status.index]}" class="menu-img img-fluid">
	              </a>
	              </c:when>
	              <c:otherwise>
	              <a href="${pageContext.request.contextPath}/store/detail?storeNo=${storeDto.storeNo}">
	              <img src="${pageContext.request.contextPath}/img/mainMap.png" class="menu-img img-fluid">
	              </a>
	            </c:otherwise>
             </c:choose>
             <a href="${pageContext.request.contextPath}/store/detail?storeNo=${storeDto.storeNo}">
                <h4>${storeDto.storeName}</h4>
                </a>
                <p class="ingredients">
                  ${storeDto.storeAddress}
                </p>
<!--                 <p class="price"> -->
<!--                   $5.95 -->
<!--                 </p> -->
              </div><!-- Menu Item -->
             </c:forEach>

            </div>
          </div><!-- End Lunch Menu Content -->

          <div class="tab-pane fade" id="menu-dinner">

            <div class="tab-header text-center">
              <p>Menu</p>
              <h3>Kkochi</h3>
            </div>

            <div class="row gy-5">
			<c:forEach var="storeDto" items="${kList}" varStatus="status">
              <div class="col-lg-4 menu-item">
              <c:choose>
	              <c:when test="${kAttachList[status.index] != 0 }">
	              <a href="${pageContext.request.contextPath}/store/detail?storeNo=${storeDto.storeNo}">
	              <img src="${pageContext.request.contextPath}/attachment/download?attachmentNo=${kAttachList[status.index]}" class="menu-img img-fluid">
	              </a>
	              </c:when>
	              <c:otherwise>
	              <a href="${pageContext.request.contextPath}/store/detail?storeNo=${storeDto.storeNo}">
	              <img src="${pageContext.request.contextPath}/img/mainMap.png" class="menu-img img-fluid">
	              </a>
	            </c:otherwise>
             </c:choose>
             <a href="${pageContext.request.contextPath}/store/detail?storeNo=${storeDto.storeNo}">
                <h4>${storeDto.storeName}</h4>
                </a>
                <p class="ingredients">
                  ${storeDto.storeAddress}
                </p>
<!--                 <p class="price"> -->
<!--                   $5.95 -->
<!--                 </p> -->
              </div><!-- Menu Item -->
            </c:forEach>

            </div>
          </div><!-- End Dinner Menu Content -->

        </div>

      </div>
    </section><!-- End Menu Section -->
    
     <!-- ======= 서울 오마카세 구역 ======= -->
    <section id="gallery" class="gallery section-bg">
      <div class="container" data-aos="fade-up">

        <div class="section-header">
          <h2>area</h2>
          <p><span>SEOUL OMAKASE</span></p>
        </div>

        <div class="gallery-slider swiper">
          <div class="swiper-wrapper align-items-center">
            <div class="swiper-slide text-center"><a class="" data-gallery="images-gallery" href="${pageContext.request.contextPath}/store/search?type=store_address&keyword=청담"><img src="${pageContext.request.contextPath}/img/cheongdam.png" class="img-fluid" ><span class="fw-bold">청담</span></a></div>
            <div class="swiper-slide text-center"><a class="" data-gallery="images-gallery" href="${pageContext.request.contextPath}/store/search?type=store_address&keyword=압구정"><img src="${pageContext.request.contextPath}/img/apgujeong.png" class="img-fluid" ><span class="fw-bold">압구정</span></a></div>
            <div class="swiper-slide text-center"><a class="" data-gallery="images-gallery" href="${pageContext.request.contextPath}/store/search?type=store_address&keyword=성수"><img src="${pageContext.request.contextPath}/img/seongsu.png" class="img-fluid"><span class="fw-bold">성수</span></a></div>
            <div class="swiper-slide text-center"><a class="" data-gallery="images-gallery" href="${pageContext.request.contextPath}/store/search?type=store_address&keyword=한남"><img src="${pageContext.request.contextPath}/img/hannam.png" class="img-fluid"><span class="fw-bold">한남</span></a></div>
            <div class="swiper-slide text-center"><a class="" data-gallery="images-gallery" href="${pageContext.request.contextPath}/store/search?type=store_address&keyword=광화문"><img src="${pageContext.request.contextPath}/img/gwanghwamun.png" class="img-fluid"><span class="fw-bold">광화문</span></a></div>
            <div class="swiper-slide text-center"><a class="" data-gallery="images-gallery" href="${pageContext.request.contextPath}/store/search?type=store_address&keyword=역삼"><img src="${pageContext.request.contextPath}/img/yeoksam.png" class="img-fluid"><span class="fw-bold">역삼</span></a></div>
            <div class="swiper-slide text-center"><a class="" data-gallery="images-gallery" href="${pageContext.request.contextPath}/store/search?type=store_address&keyword=영등포"><img src="${pageContext.request.contextPath}/img/itaewon.png" class="img-fluid"><span class="fw-bold">영등포</span></a></div>
          </div>
          <div class="swiper-pagination"></div>
        </div>

      </div>
    </section><!-- End Gallery Section -->
    

    <!-- ======= 가게 리뷰 구역 ======= -->
    <section id="testimonials" class="testimonials section-bg">
      <div class="container" data-aos="fade-up">

        <div class="section-header">
          <h2>REVIEW</h2>
          <p>What Are They <span>Saying About Us</span></p>
        </div>

        <div class="slides-1 swiper" data-aos="fade-up" data-aos-delay="100">
          <div class="swiper-wrapper">
			
			<c:forEach var="reviewDto" items="${review}" varStatus="status">
            <div class="swiper-slide">
              <div class="testimonial-item">
                <div class="row gy-4 justify-content-center">
                  <div class="col-lg-6">
                    <div class="testimonial-content">
                      <p>
                        <i class="bi bi-quote quote-icon-left"></i>
                        	${reviewDto.reviewContent}
                        <i class="bi bi-quote quote-icon-right"></i>
                      </p>
                      <h3>${store[status.index]}</h3>
                      <h4>${reviewDto.reviewWriter}</h4>
<!--                       <div class="stars"> -->
<!--                         <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i> -->
<!--                       </div> -->
                    </div>
                  </div>
                  <c:choose>
                  	<c:when test="${reviewAttach[status.index]!=0}">
	                 	<div class="col-lg-2 text-center">
		                  <a href="${pageContext.request.contextPath}/store/detail?storeNo=${reviewDto.storeNo}">
			              <img src="${pageContext.request.contextPath}/attachment/download?attachmentNo=${reviewAttach[status.index]}" class="img-fluid testimonial-img">
			              </a>
		                  </div>
                  	</c:when>
                  	<c:otherwise>
                  		<div class="col-lg-2 text-center">
		                  <a href="${pageContext.request.contextPath}/store/detail?storeNo=${reviewDto.storeNo}">
			              <img src="${pageContext.request.contextPath}/img/log.PNG" class="img-fluid testimonial-img">
			              </a>
		                 </div>
                  	</c:otherwise>
                  </c:choose>
                </div>
              </div>
            </div><!-- End testimonial item -->
			</c:forEach>

<!--             <div class="swiper-slide"> -->
<!--               <div class="testimonial-item"> -->
<!--                 <div class="row gy-4 justify-content-center"> -->
<!--                   <div class="col-lg-6"> -->
<!--                     <div class="testimonial-content"> -->
<!--                       <p> -->
<!--                         <i class="bi bi-quote quote-icon-left"></i> -->
<!--                         Export tempor illum tamen malis malis eram quae irure esse labore quem cillum quid cillum eram malis quorum velit fore eram velit sunt aliqua noster fugiat irure amet legam anim culpa. -->
<!--                         <i class="bi bi-quote quote-icon-right"></i> -->
<!--                       </p> -->
<!--                       <h3>Sara Wilsson</h3> -->
<!--                       <h4>Designer</h4> -->
<!--                       <div class="stars"> -->
<!--                         <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i> -->
<!--                       </div> -->
<!--                     </div> -->
<!--                   </div> -->
<!--                   <div class="col-lg-2 text-center"> -->
<%--                     <img src="${pageContext.request.contextPath}/img/testimonials/testimonials-2.jpg" class="img-fluid testimonial-img" alt=""> --%>
<!--                   </div> -->
<!--                 </div> -->
<!--               </div> -->
<!--             </div>End testimonial item -->

<!--             <div class="swiper-slide"> -->
<!--               <div class="testimonial-item"> -->
<!--                 <div class="row gy-4 justify-content-center"> -->
<!--                   <div class="col-lg-6"> -->
<!--                     <div class="testimonial-content"> -->
<!--                       <p> -->
<!--                         <i class="bi bi-quote quote-icon-left"></i> -->
<!--                         Enim nisi quem export duis labore cillum quae magna enim sint quorum nulla quem veniam duis minim tempor labore quem eram duis noster aute amet eram fore quis sint minim. -->
<!--                         <i class="bi bi-quote quote-icon-right"></i> -->
<!--                       </p> -->
<!--                       <h3>Jena Karlis</h3> -->
<!--                       <h4>Store Owner</h4> -->
<!--                       <div class="stars"> -->
<!--                         <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i> -->
<!--                       </div> -->
<!--                     </div> -->
<!--                   </div> -->
<!--                   <div class="col-lg-2 text-center"> -->
<%--                     <img src="${pageContext.request.contextPath}/img/testimonials/testimonials-3.jpg" class="img-fluid testimonial-img" alt=""> --%>
<!--                   </div> -->
<!--                 </div> -->
<!--               </div> -->
<!--             </div>End testimonial item -->

<!--             <div class="swiper-slide"> -->
<!--               <div class="testimonial-item"> -->
<!--                 <div class="row gy-4 justify-content-center"> -->
<!--                   <div class="col-lg-6"> -->
<!--                     <div class="testimonial-content"> -->
<!--                       <p> -->
<!--                         <i class="bi bi-quote quote-icon-left"></i> -->
<!--                         Quis quorum aliqua sint quem legam fore sunt eram irure aliqua veniam tempor noster veniam enim culpa labore duis sunt culpa nulla illum cillum fugiat legam esse veniam culpa fore nisi cillum quid. -->
<!--                         <i class="bi bi-quote quote-icon-right"></i> -->
<!--                       </p> -->
<!--                       <h3>John Larson</h3> -->
<!--                       <h4>Entrepreneur</h4> -->
<!--                       <div class="stars"> -->
<!--                         <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i> -->
<!--                       </div> -->
<!--                     </div> -->
<!--                   </div> -->
<!--                   <div class="col-lg-2 text-center"> -->
<%--                     <img src="${pageContext.request.contextPath}/img/testimonials/testimonials-4.jpg" class="img-fluid testimonial-img" alt=""> --%>
<!--                   </div> -->
<!--                 </div> -->
<!--               </div> -->
<!--             </div>End testimonial item -->

          </div>
          <div class="swiper-pagination"></div>
        </div>

      </div>
    </section><!-- End Testimonials Section -->

      

    <jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>