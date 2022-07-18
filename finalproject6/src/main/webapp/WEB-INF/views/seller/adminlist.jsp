<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <style>
	.b-input{
		width:100%;
		padding: 5px;
	}
</style>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <div class="container ma-t-100">
    
    <div class="section-header mt-4 col-md-8 offset-md-2" >
            <h2>SELLER</h2>
            <p><span>판매자</span> 관리</p>
       	</div>
       <div class="row mt-2 text-left">
            <div class="col-md-8 offset-md-2">
      	<%--복합 검색 미구현임 --%>
             <a href="${pageContext.request.contextPath}/seller/adminlist" class="btn btn-secondary" >목록</a>
            </div>
        </div>

        <div class="row mt-2">
            <div class="col-md-8 offset-md-2">
            
                <table class="table">
                    <thead class="text-center">
                        <tr>
                            <th>NO</th>
                            <th>이름</th>
                            <th>아이디</th>
                            <th>등록일</th>
                            <th>은행명</th>
                            <th>계좌번호</th>
                            <th>사업자번호</th>
                            <th>포인트금액</th>
                            <th>상태</th>
                        </tr>
                    </thead>
                    <tbody class="text-center">
                    	<c:forEach var="sellerMemberVO" items="${adminlist}">
	                        <tr>
	                            <td>
	                             <a href="detail?sellerNo=${sellerMemberVO.sellerNo}">
	                             ${sellerMemberVO.sellerNo}
	                             </a></td>
	                            <td>${sellerMemberVO.memberName}</td>
	                            <td>${sellerMemberVO.memberId}</td>
	                            <td>${sellerMemberVO.sellerRegistDate}</td>
	                            <td>${sellerMemberVO.sellerBank}</td>
	                            <td>${sellerMemberVO.sellerAccount}</td>
	                            <td>${sellerMemberVO.sellerBusinessNum}</td>
	                            <td>${sellerMemberVO.sellerPoint}</td>
	                            <td>${sellerMemberVO.sellerType}</td>
	                    
	                        </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <c:if test="${adminlist.isEmpty()}">
		            	<div class="row mt-2 text-center">
		            		<h4>결과가 없습니다.</h4>
		            	</div>
		            </c:if>
            </div>
        </div>
        <!-- 페이지네이션 -->
	<div class="row mt-2">
			<ul class="pagination justify-content-center">
				<c:if test="${p > 1}">
					<c:choose>
						<c:when test="${search}">
							<li class="page-item"><a class="page-link"
								href="adminlist?p=1&s=${s}&type=${type}&keyword=${keyword}">&lt;</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link"
								href="adminlist?p=1&s=${s}">&lt;</a></li>
						</c:otherwise>
					</c:choose>
				</c:if>
				<c:if test="${startBlock > 1}">
					<c:choose>
						<c:when test="${search}">
							<li class="page-item"><a class="page-link"
								href="adminlist?p=${startBlock-1}&s=${s}&type=${type}&keyword=${keyword}">&laquo;</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link"
								href="adminlist?p=${startBlock-1}&s=${s}">&laquo;</a></li>
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
										href="adminlist?p=${i}&s=${s}&type=${type}&keyword=${keyword}">${i}</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link"
										href="adminlist?p=${i}&s=${s}&type=${type}&keyword=${keyword}">${i}</a></li>
								</c:otherwise>
							</c:choose>
						</c:when>
						<c:otherwise>
							<c:choose>
								<c:when test="${i == p}">
									<li class="page-item active"><a class="page-link"
										href="adminlist?p=${i}&s=${s}">${i}</a></li>
								</c:when>
								
								<c:otherwise>
									<li class="page-item"><a class="page-link"
										href="adminlist?p=${i}&s=${s}">${i}</a></li>
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
								href="adminlist?p=${endBlock+1}&s=${s}&type=${type}&keyword=${keyword}">&gt;</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link"
								href="adminlist?p=${endBlock+1}&s=${s}">&gt;</a></li>
						</c:otherwise>
					</c:choose>
				</c:if>
				
				<c:if test="${p < lastPage}">
					<c:choose>
						<c:when test="${search}">
							<li class="page-item"><a class="page-link"
								href="adminlist?p=${lastPage}&s=${s}&type=${type}&keyword=${keyword}">&raquo;</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link"
								href="adminlist?p=${lastPage}&s=${s}">&raquo;</a></li>
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
               <form action="adminlist" method="get">
               <div class="d-flex justify-content-center" >
                    <select name="type" class="form-select me-1" style="width:17%;">
                        <option value="member_name">이름</option>
                        <option value="member_id">아이디</option>
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