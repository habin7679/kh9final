<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
 <style>
 .d{
 	margin-left:150px;
 }
 .imge{
 	width:20px;
 	height:20px;
 }
 .maxi{
	text-overflow: ellipsis;
	white-sapce:nowrap;
	max-width: 100px;
	}
 </style>
 <script type="text/javascript">
   $(function(){
      let memberRecvNo = $("#msgNick").val();
      $(".msgNick").click(function(){
         window.open("${pageContext.request.contextPath}/msg/send?memberRecvNo="+memberRecvNo,"Message","width=500,height=500,scrollbars=no")
      });
   });
   </script>
  <div class="container ma-t-100" >
        <div class="section-header mt-4 col-md-8 offset-md-2" >
            <h2>Msg</h2>
            <p><span>보낸</span> 쪽지함</p>
       	</div>
       	<div class="row mt-2 text-left">
            <div class="col-md-8 offset-md-2">
      	<%--복합 검색 미구현임 --%>
             <a href="${pageContext.request.contextPath}/msg/sendBox" class="btn btn-secondary  text-left d"  >목록</a>
            </div>
        </div>
       	
       	<div class="row mt-2">
            <div class="col-md-6 offset-md-3">
                <table class="table" style="table-layout:fixed" width="300">
                    <thead class="text-center">
                        <tr>
                            <th style="width:300px;">내용</th>
                            <th >받는사람</th>
                            <th style="width:100px;">보낸날짜</th>
                            <th>상태</th>
                            <th>삭제</th>
                        </tr>
                    </thead>
                     <tbody class="text-center">
                    	<c:forEach var="SendMsgVO" items="${sendBox}">
                    	<input type="hidden" id="msgNick" value="${SendMsgVO.rmemberNo}">
	                        <tr>
	                            <td style="text-overflow:ellipsis; overflow:hidden; white-space:nowrap;"><a href="${pageContext.request.contextPath}/msg/senddetail?msgNo=${SendMsgVO.msgNo}">${SendMsgVO.msgNote}</a></td>
	                            <td><a href="#" class="msgNick">${SendMsgVO.memberNick}</a></td>
	                            <td >${SendMsgVO.sendDate}</td>
	                            <td>${SendMsgVO.read}</td>
	                            <td style="width:200px;"><a href="${pageContext.request.contextPath}/msg/delete?msgNo=${SendMsgVO.msgNo}"> 
	                            <img src = "${pageContext.request.contextPath}/img/delete.png" class="imge"></a>
                         </td>
	                        </tr>
	                        </c:forEach>
                    </tbody>
                </table>
                <c:if test="${sendBox.isEmpty()}">
		            	<div class="row mt-2 text-center">
		            		<h4>결과가 없습니다.</h4>
		            	</div>
		            </c:if>
                </div>
                </div>
          <div class="row mt-2">
			<ul class="pagination justify-content-center">
				<c:if test="${p > 1}">
					<c:choose>
						<c:when test="${search}">
							<li class="page-item"><a class="page-link"
								href="sendBox?p=1&s=${s}&type=${type}&keyword=${keyword}">&lt;</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link"
								href="sendBox?p=1&s=${s}">&lt;</a></li>
						</c:otherwise>
					</c:choose>
				</c:if>
				<c:if test="${startBlock > 1}">
					<c:choose>
						<c:when test="${search}">
							<li class="page-item"><a class="page-link"
								href="sendBox?p=${startBlock-1}&s=${s}&type=${type}&keyword=${keyword}">&laquo;</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link"
								href="sendBox?p=${startBlock-1}&s=${s}">&laquo;</a></li>
						</c:otherwise>
					</c:choose>
				</c:if>

				<!-- 숫자 링크 영역 -->
				<c:forEach var="i" begin="${startBlock}" end="${endBlock}" step="1">
					<c:choose>
						<c:when test="${search}">
							<c:choose>
								<c:when test="${i == p}">
									<li class="page-item active"><a class="page-link"
										href="sendBox?p=${i}&s=${s}&type=${type}&keyword=${keyword}">${i}</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link"
										href="sendBox?p=${i}&s=${s}&type=${type}&keyword=${keyword}">${i}</a></li>
								</c:otherwise>
							</c:choose>
						</c:when>
						<c:otherwise>
							<c:choose>
								<c:when test="${i == p}">
									<li class="page-item active"><a class="page-link"
										href="sendBox?p=${i}&s=${s}">${i}</a></li>
								</c:when>
								
								<c:otherwise>
									<li class="page-item"><a class="page-link"
										href="sendBox?p=${i}&s=${s}">${i}</a></li>
								</c:otherwise>
							</c:choose>
						</c:otherwise>
					</c:choose>
				</c:forEach>

				<!-- 다음 버튼 영역 -->
				<c:if test="${endBlock < lastPage}">
					<c:choose>
						<c:when test="${search}">
							<li class="page-item"><a class="page-link"
								href="sendBox?p=${endBlock+1}&s=${s}&type=${type}&keyword=${keyword}">&gt;</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link"
								href="sendBox?p=${endBlock+1}&s=${s}">&gt;</a></li>
						</c:otherwise>
					</c:choose>
				</c:if>
				
				<c:if test="${p < lastPage}">
					<c:choose>
						<c:when test="${search}">
							<li class="page-item"><a class="page-link"
								href="sendBox?p=${lastPage}&s=${s}&type=${type}&keyword=${keyword}">&raquo;</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link"
								href="sendBox?p=${lastPage}&s=${s}">&raquo;</a></li>
						</c:otherwise>
					</c:choose>
				</c:if>
			</ul>
	</div>
        

<div class="row mt-2 text-center">
            <div class="col-md-8 offset-md-2">
               <!--검색창-->
               <div class="row">
               <div class="col-md-3"></div>
               <div class="col-md-6">
               <form action="sendBox" method="get">
               <div class="d-flex justify-content-center" >
                    <select name="type" class="form-select me-1" style="width:20%;">
                        <option value="member_nick">보낸사람</option>
                        <option value="msg_note">내용</option>
                    </select>
                <input type="search" name="keyword" placeholder="검색어 입력" value="${keyword}" class="form-control me-1" style="width:50%;" autocomplete="off">
                <input type="submit" value="검색" class="btn btn-outline-danger" style="width:10%;">
               </div>
                </form>
               </div><br>
               <div class="col-md-3">
             </div>
           </div>     
        </div>
</div>
</div>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        
    </script>
    

    
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include> 