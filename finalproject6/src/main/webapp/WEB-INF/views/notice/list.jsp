<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="isAdmin" value="${auth == '관리자'}"></c:set>
<style>
</style>
    <div class="container ma-t-100">

	<div class="section-header mt-4 col-md-6 offset-md-3" >
            <h2>Notice</h2>
            <p><span>공지</span> 게시판</p>
            <h2>공지 및 이벤트를 확인하세요.</h2>
       	</div>
        
        <div class="row mt-2 text-left">
            <div class="col-md-6 offset-md-3">
                    <a href="${pageContext.request.contextPath}/notice/list?column=notice_readcount&order=desc&p=${p}&s=${s}" class="btn0" >조회수 순</a>
                    <a href="${pageContext.request.contextPath}/notice/list?column=notice_no&order=desc&p=${p}&s=${s}" class="btn0" >최신 순</a>
                    <a href="${pageContext.request.contextPath}/notice/list?column=notice_no&order=asc&p=${p}&s=${s}" class="btn0" >오래된 순</a>
            </div>
        </div>
        
        <!-- 글쓰기 버튼 -->
         <div class="row mt-2"> 
            <div class="col-md-6 offset-md-3">
            <c:if test="${isAdmin}">
               <a href="${pageContext.request.contextPath}/notice/write" class="btn1 col-md-1 offset-md-11">글쓰기</a>
            </c:if>
            </div>
        </div>

        <div class="row mt-2">
            <div class="col-md-6 offset-md-3">
                <table class="table">
                    <thead class="text-center">
                        <tr>
                            <th>NO</th>
                            <th class="w-50">제목</th>
                            <th>작성자</th>
                            <th>작성일</th>
                            <th>조회수</th>
                        </tr>
                    </thead>
                    <tbody class="text-center">
                    <!-- 상단 고정 게시글 보기 -->
                    	<c:forEach var="noticeDto" items="${noticeList}">
	                        <tr style="background-color: #fef4f2;" class="fix-font">
	                            <td>${noticeDto.noticeNo}</td>
	                            <td style="text-align: left !important">
	                            <c:if test="${noticeDto.pin==1}">
		                    	<span class="circle-head">중요</span>
		                    	</c:if> 
	                            <a href="detail?noticeNo=${noticeDto.noticeNo}">
	                           	<!-- 말머리 -->
		                            <c:if test="${noticeDto.noticeHead != null}">
		                            	[${noticeDto.noticeHead}]
		                            </c:if>
	                            	${noticeDto.noticeTitle}
	                            </a>
	                            </td>
	                            <td>${noticeDto.noticeWriter}</td><!-- 작성자 닉네임 클릭 시 쪽지 -->
	                            <td>${noticeDto.noticeTime}</td>
	                            <td>${noticeDto.noticeReadcount }</td>
	                        </tr>
                        </c:forEach>
                    
                    <!-- 일반 게시글 목록 -->
                    	<c:forEach var="noticeDto" items="${list}">
	                        <tr class="normal-font">
	                            <td>${noticeDto.noticeNo}</td>
	                            <td style="text-align: left !important">
<%-- 	                            <c:if test="${noticeDto.pin==1}"> --%>
<!-- 		                    	<span class="circle-head">중요</span> -->
<%-- 		                    	</c:if>  --%>
	                            <a href="detail?noticeNo=${noticeDto.noticeNo}">
	                           	<!-- 말머리 -->
		                            <c:if test="${noticeDto.noticeHead != null}">
		                            	[${noticeDto.noticeHead}]
		                            </c:if>
	                            	${noticeDto.noticeTitle}
	                            </a>
	                            </td>
	                            <td>${noticeDto.noticeWriter}</td><!-- 작성자 닉네임 클릭 시 쪽지 -->
	                            <td>${noticeDto.noticeTime}</td>
	                            <td>${noticeDto.noticeReadcount }</td>
	                        </tr>
                        </c:forEach>
                    </tbody>
                </table>
		            <c:if test="${list.isEmpty()}">
		            	<div class="row mt-2 text-center">
		            		<h4>검색 결과가 없습니다.</h4>
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
								href="${pageContext.request.contextPath}/notice/list?p=1&s=${s}&type=${type}&keyword=${keyword}">&laquo;</a></li>
						</c:when>
						<c:when test="${search && readcountSearch}">
							<li class="page-item"><a class="page-link"
								href="${pageContext.request.contextPath}/notice/list?p=1&s=${s}&type=${type}&keyword=${keyword}&column=notice_readcount&order=desc">&laquo;</a></li>
						</c:when>
						<c:when test="${search && noDescSearch}">
							<li class="page-item"><a class="page-link"
								href="${pageContext.request.contextPath}/notice/list?p=1&s=${s}&type=${type}&keyword=${keyword}&column=notice_no&order=desc">&laquo;</a></li>
						</c:when>
						<c:when test="${search && noAscSearch}">
							<li class="page-item"><a class="page-link"
								href="${pageContext.request.contextPath}/notice/list?p=1&s=${s}&type=${type}&keyword=${keyword}&column=notice_no&order=asc">&laquo;</a></li>
						</c:when>
						<c:when test="${readcountSearch}">
							<li class="page-item"><a class="page-link"
								href="${pageContext.request.contextPath}/notice/list?p=1&s=${s}&column=notice_readcount&order=desc">&laquo;</a></li>
						</c:when>
						<c:when test="${noDescSearch}">
							<li class="page-item"><a class="page-link"
								href="${pageContext.request.contextPath}/notice/list?p=1&s=${s}&column=notice_no&order=desc">&laquo;</a></li>
						</c:when>
						<c:when test="${noAscSearch}">
							<li class="page-item"><a class="page-link"
								href="${pageContext.request.contextPath}/notice/list?p=1&s=${s}&column=notice_no&order=asc">&laquo;</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link"
								href="${pageContext.request.contextPath}/notice/list?p=1&s=${s}">&laquo;</a></li>
						</c:otherwise>
					</c:choose>
				</c:if>

				<c:if test="${startBlock > 1}">
					<c:choose>
						<c:when test="${search}">
							<li class="page-item"><a class="page-link"
								href="${pageContext.request.contextPath}/notice/list?p=${startBlock-1}&s=${s}&type=${type}&keyword=${keyword}">&laquo;</a></li>
						</c:when>
						<c:when test="${search && readcountSearch}">
							<li class="page-item"><a class="page-link"
								href="${pageContext.request.contextPath}/notice/list?p=${startBlock-1}&s=${s}&type=${type}&keyword=${keyword}&column=notice_readcount&order=desc">&laquo;</a></li>
						</c:when>
						<c:when test="${search && noDescSearch}">
							<li class="page-item"><a class="page-link"
								href="${pageContext.request.contextPath}/notice/list?p=${startBlock-1}&s=${s}&type=${type}&keyword=${keyword}&column=notice_no&order=desc">&laquo;</a></li>
						</c:when>
						<c:when test="${search && noAscSearch}">
							<li class="page-item"><a class="page-link"
								href="${pageContext.request.contextPath}/notice/list?p=${startBlock-1}&s=${s}&type=${type}&keyword=${keyword}&column=notice_no&order=asc">&laquo;</a></li>
						</c:when>
						<c:when test="${readcountSearch}">
							<li class="page-item"><a class="page-link"
								href="${pageContext.request.contextPath}/notice/list?p=${startBlock-1}&s=${s}&column=notice_readcount&order=desc">&laquo;</a></li>
						</c:when>
						<c:when test="${noDescSearch}">
							<li class="page-item"><a class="page-link"
								href="${pageContext.request.contextPath}/notice/list?p=${startBlock-1}&s=${s}&column=notice_no&order=desc">&laquo;</a></li>
						</c:when>
						<c:when test="${noAscSearch}">
							<li class="page-item"><a class="page-link"
								href="${pageContext.request.contextPath}/notice/list?p=${startBlock-1}&s=${s}&column=notice_no&order=asc">&laquo;</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link"
								href="${pageContext.request.contextPath}/notice/list?p=${startBlock-1}&s=${s}">&laquo;</a></li>
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
										href="${pageContext.request.contextPath}/notice/list?p=${i}&s=${s}&type=${type}&keyword=${keyword}">${i}</a></li>
								</c:when>
								<c:when test="${i == p && readcountSearch}">
									<li class="page-item active"><a class="page-link"
										href="${pageContext.request.contextPath}/notice/list?p=${i}&s=${s}&type=${type}&keyword=${keyword}&column=notice_readcount&order=desc">${i}</a></li>
								</c:when>
								<c:when test="${i == p && noDescSearch}">
									<li class="page-item active"><a class="page-link"
										href="${pageContext.request.contextPath}/notice/list?p=${i}&s=${s}&type=${type}&keyword=${keyword}&column=notice_no&order=desc">${i}</a></li>
								</c:when>
								<c:when test="${i == p && noAscSearch}">
									<li class="page-item active"><a class="page-link"
										href="${pageContext.request.contextPath}/notice/list?p=${i}&s=${s}&type=${type}&keyword=${keyword}&column=notice_no&order=asc">${i}</a></li>
								</c:when>
								<c:when test="${i != p && readcountSearch}">
									<li class="page-item"><a class="page-link"
										href="${pageContext.request.contextPath}/notice/list?p=${i}&s=${s}&type=${type}&keyword=${keyword}&column=notice_readcount&order=desc">${i}</a></li>
								</c:when>
								<c:when test="${i != p && noDescSearch}">
									<li class="page-item"><a class="page-link"
										href="${pageContext.request.contextPath}/notice/list?p=${i}&s=${s}&type=${type}&keyword=${keyword}&column=notice_no&order=desc">${i}</a></li>
								</c:when>
								<c:when test="${i != p && noAscSearch}">
									<li class="page-item"><a class="page-link"
										href="${pageContext.request.contextPath}/notice/list?p=${i}&s=${s}&type=${type}&keyword=${keyword}&column=notice_no&order=asc">${i}</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link"
										href="${pageContext.request.contextPath}/notice/list?p=${i}&s=${s}&type=${type}&keyword=${keyword}">${i}</a></li>
								</c:otherwise>
							</c:choose>
						</c:when>
						<c:otherwise>
							<c:choose>
								<c:when test="${i == p}">
									<li class="page-item active"><a class="page-link"
										href="${pageContext.request.contextPath}/notice/list?p=${i}&s=${s}">${i}</a></li>
								</c:when>
								<c:when test="${i == p && readcountSearch}">
									<li class="page-item active"><a class="page-link"
										href="${pageContext.request.contextPath}/notice/list?p=${i}&s=${s}&column=notice_readcount&order=desc">${i}</a></li>
								</c:when>
								<c:when test="${i == p && noDescSearch}">
									<li class="page-item active"><a class="page-link"
										href="${pageContext.request.contextPath}/notice/list?p=${i}&s=${s}&column=notice_no&order=desc">${i}</a></li>
								</c:when>
								<c:when test="${i == p && noAscSearch}">
									<li class="page-item active"><a class="page-link"
										href="${pageContext.request.contextPath}/notice/list?p=${i}&s=${s}&column=notice_no&order=asc">${i}</a></li>
								</c:when>
								<c:when test="${i != p && noDescSearch}">
									<li class="page-item"><a class="page-link"
										href="${pageContext.request.contextPath}/notice/list?p=${i}&s=${s}&column=notice_no&order=desc">${i}</a></li>
								</c:when>
								<c:when test="${i != p && noAscSearch}">
									<li class="page-item"><a class="page-link"
										href="${pageContext.request.contextPath}/notice/list?p=${i}&s=${s}&column=notice_no&order=asc">${i}</a></li>
								</c:when>
								<c:when test="${i != p && readcountSearch}">
									<li class="page-item"><a class="page-link"
										href="${pageContext.request.contextPath}/notice/list?p=${i}&s=${s}&column=notice_readcount&order=desc">${i}</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link"
										href="${pageContext.request.contextPath}/notice/list?p=${i}&s=${s}">${i}</a></li>
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
								href="${pageContext.request.contextPath}/notice/list?p=${endBlock+1}&s=${s}&type=${type}&keyword=${keyword}">&gt;</a></li>
						</c:when>
						<c:when test="${search && readcountSeasrch}">
							<li class="page-item"><a class="page-link"
								href="${pageContext.request.contextPath}/notice/list?p=${endBlock+1}&s=${s}&type=${type}&keyword=${keyword}&column=notice_readcount&order=desc">&gt;</a></li>
						</c:when>
						<c:when test="${search && noDescSearch}">
							<li class="page-item"><a class="page-link"
								href="${pageContext.request.contextPath}/notice/list?p=${endBlock+1}&s=${s}&type=${type}&keyword=${keyword}&column=notice_no&order=desc">&gt;</a></li>
						</c:when>
						<c:when test="${search && noAscSearch}">
							<li class="page-item"><a class="page-link"
								href="${pageContext.request.contextPath}/notice/list?p=${endBlock+1}&s=${s}&type=${type}&keyword=${keyword}&column=notice_no&order=asc">&gt;</a></li>
						</c:when>
						<c:when test="${readcountSearch}">
							<li class="page-item"><a class="page-link"
								href="${pageContext.request.contextPath}/notice/list?p=${endBlock+1}&s=${s}&column=notice_readcount&order=desc">&gt;</a></li>
						</c:when>
						<c:when test="${noDescSearch}">
							<li class="page-item"><a class="page-link"
								href="${pageContext.request.contextPath}/notice/list?p=${endBlock+1}&s=${s}&column=notice_no&order=desc">&gt;</a></li>
						</c:when>
						<c:when test="${noAscSearch}">
							<li class="page-item"><a class="page-link"
								href="${pageContext.request.contextPath}/notice/list?p=${endBlock+1}&s=${s}&column=notice_no&order=asc">&gt;</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link"
								href="${pageContext.request.contextPath}/notice/list?p=${endBlock+1}&s=${s}">&gt;</a></li>
						</c:otherwise>
					</c:choose>
				</c:if>

				<c:if test="${p < lastPage}">
					<c:choose>
						<c:when test="${search}">
							<li class="page-item"><a class="page-link"
								href="${pageContext.request.contextPath}/notice/list?p=${lastPage}&s=${s}&type=${type}&keyword=${keyword}">&raquo;</a></li>
						</c:when>
						<c:when test="${search && readcountSearch}">
							<li class="page-item"><a class="page-link"
								href="${pageContext.request.contextPath}/notice/list?p=${lastPage}&s=${s}&type=${type}&keyword=${keyword}&column=notice_readcount&order=desc">&raquo;</a></li>
						</c:when>
						<c:when test="${search && noDescSearch}">
							<li class="page-item"><a class="page-link"
								href="${pageContext.request.contextPath}/notice/list?p=${lastPage}&s=${s}&type=${type}&keyword=${keyword}&column=notice_no&order=desc">&raquo;</a></li>
						</c:when>
						<c:when test="${search && noAscSearch}">
							<li class="page-item"><a class="page-link"
								href="${pageContext.request.contextPath}/notice/list?p=${lastPage}&s=${s}&type=${type}&keyword=${keyword}&column=notice_no&order=asc">&raquo;</a></li>
						</c:when>
						<c:when test="${readcountSearch}">
							<li class="page-item"><a class="page-link"
								href="${pageContext.request.contextPath}/notice/list?p=${lastPage}&s=${s}&column=notice_readcount&order=desc">&raquo;</a></li>
						</c:when>
						<c:when test="${noDescSearch}">
							<li class="page-item"><a class="page-link"
								href="${pageContext.request.contextPath}/notice/list?p=${lastPage}&s=${s}&column=notice_no&order=desc">&raquo;</a></li>
						</c:when>
						<c:when test="${noAscSearch}">
							<li class="page-item"><a class="page-link"
								href="${pageContext.request.contextPath}/notice/list?p=${lastPage}&s=${s}&column=notice_no&order=asc">&raquo;</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link"
								href="${pageContext.request.contextPath}/notice/list?p=${lastPage}&s=${s}">&raquo;</a></li>
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
               <form action="${pageContext.request.contextPath}/notice/list" method="get">
               <div class="d-flex justify-content-center" >
                    <select name="type" class="form-select me-1" style="width:17%;">
                        <option value="notice_head" <c:if test="${type == 'notice_head'}">selected</c:if>>말머리</option>
                        <option value="notice_title" <c:if test="${type == 'notice_title'}">selected</c:if>>제목</option>
						<option value="notice_content" <c:if test="${type == 'notice_content'}">selected</c:if>>내용</option>
						<option value="notice_writer" <c:if test="${type == 'notice_writer'}">selected</c:if>>작성자</option>
                    </select>
                <input type="search" name="keyword" placeholder="검색어 입력" value="${keyword}" class="form-control me-1" style="width:50%;" autocomplete="off">
                <input type="submit" value="검색" class="btn-s" style="width:15%;">
               </div>
               </form>
               </div>
               <div class="col-md-3"></div>
           </div>     
        </div>
</div>
</div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        
    </script>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>