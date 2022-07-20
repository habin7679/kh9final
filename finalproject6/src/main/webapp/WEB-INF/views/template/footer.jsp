<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

</section>
</main>

    <!-- ======= Footer ======= -->
  <footer id="footer" class="footer">

    <div class="container">
      <div class="row gy-3">
        <div class="col-lg-3 col-md-6 d-flex">
          <i class="bi bi-geo-alt icon"></i>
          <div>
            <h4>이용약관</h4>
          </div>

        </div>

        <div class="col-lg-3 col-md-6 footer-links d-flex">
          <i class="bi bi-telephone icon"></i>
          <div>
            <h4>환불규정</h4>
          </div>
        </div>

        <div class="col-lg-3 col-md-6 footer-links d-flex">
          <i class="bi bi-clock icon"></i>
          <div>
            <h4>개인정보처리</h4>
          </div>
        </div>

        <div class="col-lg-3 col-md-6 footer-links">
          <h4>SNS</h4>
          <div class="social-links d-flex">
            <a href="https://www.facebook.com/biz.catchtable/" class="facebook"><i class="bi bi-facebook"></i></a>
            <a href="https://www.instagram.com/biz_catchtable/" class="instagram"><i class="bi bi-instagram"></i></a>
          </div>
        </div>

      </div>
    </div>



    <div class="container">
      <div class="copyright">
        &copy; 서울특별시 영등포구 선유동2로 57 이레빌딩(구관) 19F, 20F  대표이사 : 하빙구  사업자번호 : 100-11-00000 통신판매번호 : 제2022-서울당산-0011호<strong>
       
      </div>
      <div class="credits">
        <!-- All the links in the footer should remain intact. -->
        <!-- You can delete the links only if you purchased the pro version. -->
        <!-- Licensing information: https://bootstrapmade.com/license/ -->
        <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/yummy-bootstrap-restaurant-website-template/ -->
        
      </div>
    </div>

  </footer><!-- End Footer -->
  <!-- End Footer -->
<!--  <span class="chatMsg">Hello!</span>	 -->
<h6 class="chatMsg text-center">Hello!</h6>
  <a href="#" class="chat-bot d-flex align-items-center justify-content-center"><i class="bi bi-robot"></i></a>
  <a href="#" class="scroll-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <div id="preloader"></div>



  <!-- Template Main JS File -->
  <script src="${pageContext.request.contextPath}/js/main.js"></script>

  <script>
  	$(function(){
  		$(".chat-bot").click(function(){
  			window.open("${pageContext.request.contextPath}/chatbot/","ChatBot","width=500,height=600,scrollbars=no,left=1000,top=400")
  		});
  	});
  </script>
</body>

</html>