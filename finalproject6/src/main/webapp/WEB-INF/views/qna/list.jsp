<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <div class="container-fluid">

        <div class="row mt-2">
            <div class="col-md-8 offset-md-2">
                <div class="p-4 text-light text-center bg-dark rounded">
                    <h1>문의게시판</h1>
                </div>
            </div>
        </div>
        
        <div class="row mt-2 text-left">
            <div class="col-md-8 offset-md-2">
      	<%--복합 검색 미구현임 --%>
               <form action="list" method="get">
                    <select name="type">
                        <option value="qna_title" <c:if test="${type == 'qna_title'}">selected</c:if>>조회수</option>
						<option value="qna_content" <c:if test="${type == 'qna_content'}">selected</c:if>>최신순</option>
						<option value="qna_writer" <c:if test="${type == 'qna_writer'}">selected</c:if>>오래된순</option>
                    </select>
                <input type="submit" value="보기">
               </form>
            </div>
        </div>
        
        <!-- 글쓰기 버튼 -->
         <div class="row mt-2"> 
            <div class="col-md-8 offset-md-2">
               <a href="write" class="btn1 col-md-1 offset-md-11">글쓰기</a>
            </div>
        </div>

        <div class="row mt-2">
            <div class="col-md-8 offset-md-2">
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
                    	<c:forEach var="qnaDto" items="${list}">
	                        <tr>
	                            <td>${qnaDto.qnaNo}</td>
	                            <td style="text-align: left !important">
	                           	<!-- 말머리 -->
		                            <c:if test="${qnaDto.qnaHead != null}">
		                            	[${qnaDto.qnaHead}]
		                            </c:if>
	                            	${qnaDto.qnaTitle}
	                            </a>
	                            </td>
	                            <td>${qnaDto.qnaWriter}</td><!-- 작성자 닉네임 클릭 시 쪽지 -->
	                            <td>${qnaDto.qnaTime}</td>
	                            <td>${qnaDto.qnaReadcount }</td>
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
		<div class="col">
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
	</div>


	<div class="row mt-2 text-center">
            <div class="col-md-8 offset-md-2">
               <!--검색창-->
               <form action="list" method="get">
                    <select name="type">
                        <option value="qna_head" <c:if test="${type == 'qna_head'}">selected</c:if>>말머리</option>
                        <option value="qna_title" <c:if test="${type == 'qna_title'}">selected</c:if>>제목</option>
						<option value="qna_content" <c:if test="${type == 'qna_content'}">selected</c:if>>내용</option>
						<option value="qna_writer" <c:if test="${type == 'qna_writer'}">selected</c:if>>작성자</option>
                    </select>
                <input type="search" name="keyword" placeholder="검색어 입력" value="${keyword}">
                <input type="submit" value="검색">
               </form>
            </div>
        </div>

    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        
    </script>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>