<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	.b-input{
		width:100%;
		padding: 5px;
	}
</style>
    <div class="container-fluid top">
        <div class="row mt-10 " >
            <div class="col-md-8 offset-md-2">
                <div class="p-4 text-light text-center bg-dark rounded">
                    <h1>회원 관리</h1>
                </div>
            </div>
        </div>
       
        <div class="row mt-2 text-left">
            <div class="col-md-8 offset-md-2">
      	<%--복합 검색 미구현임 --%>
                    <a href="${pageContext.request.contextPath}/member/list?type=member_kind&keyword=판매자" class="btn btn-secondary" >판매자</a>
                    <a href="${pageContext.request.contextPath}/member/list?type=member_kind&keyword=일반" class="btn btn-secondary" >일반</a>
             <a href="${pageContext.request.contextPath}/member/list" class="btn btn-secondary" >목록</a>
            </div>
        </div>

        <div class="row mt-2">
            <div class="col-md-8 offset-md-2">
            
                <table class="table">
                    <thead class="text-center">
                        <tr>
                            <th>NO</th>
                            <th>아이디</th>
                            <th>이름</th>
                            <th>닉네임</th>
                            <th>성별</th>
                            <th>등급</th>
                        </tr>
                    </thead>
                    <tbody class="text-center">
                    	<c:forEach var="memberDto" items="${list}">
	                        <tr>
	                            <td>${memberDto.memberNo}</td>
	                            <td>${memberDto.memberId}</td><!-- 작성자 닉네임 클릭 시 쪽지 -->
	                            <td>${memberDto.memberName}</td>
	                            <td>${memberDto.memberNick}</td>
	                            <td>${memberDto.memberGender}</td>
	                            <td>${memberDto.memberKind}</td>
	                        </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <c:if test="${list.isEmpty()}">
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
								href="list?p=1&s=${s}&type=${type}&keyword=${keyword}">&lt;</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link"
								href="list?p=1&s=${s}">&lt;</a></li>
						</c:otherwise>
					</c:choose>
				</c:if>
				<c:if test="${startBlock > 1}">
					<c:choose>
						<c:when test="${search}">
							<li class="page-item"><a class="page-link"
								href="list?p=${startBlock-1}&s=${s}&type=${type}&keyword=${keyword}">&laquo;</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link"
								href="list?p=${startBlock-1}&s=${s}">&laquo;</a></li>
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
										href="list?p=${i}&s=${s}&type=${type}&keyword=${keyword}">${i}</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link"
										href="list?p=${i}&s=${s}&type=${type}&keyword=${keyword}">${i}</a></li>
								</c:otherwise>
							</c:choose>
						</c:when>
						<c:otherwise>
							<c:choose>
								<c:when test="${i == p}">
									<li class="page-item active"><a class="page-link"
										href="list?p=${i}&s=${s}">${i}</a></li>
								</c:when>
								
								<c:otherwise>
									<li class="page-item"><a class="page-link"
										href="list?p=${i}&s=${s}">${i}</a></li>
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
								href="list?p=${endBlock+1}&s=${s}&type=${type}&keyword=${keyword}">&gt;</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link"
								href="list?p=${endBlock+1}&s=${s}">&gt;</a></li>
						</c:otherwise>
					</c:choose>
				</c:if>
				<c:if test="${p < lastPage}">
					<c:choose>
						<c:when test="${search}">
							<li class="page-item"><a class="page-link"
								href="list?p=${lastPage}&s=${s}&type=${type}&keyword=${keyword}">&raquo;</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link"
								href="list?p=${lastPage}&s=${s}">&raquo;</a></li>
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
               <form action="list" method="get">
               <div class="d-flex justify-content-center" >
                    <select name="type" class="form-select me-1" style="width:17%;">
                        <option value="member_name">이름</option>
                        <option value="member_nick">닉네임</option>
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