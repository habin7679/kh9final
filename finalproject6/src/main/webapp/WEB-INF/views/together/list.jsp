<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
/*        table tr:first-child th:first-child {border-top-left-radius: 1em} */
/*        table tr:first-child th:last-child {border-top-right-radius: 1em} */
/*        table tr:last-child td:first-child {border-bottom-left-radius: 1em} */
/*        table tr:last-child td:last-child {border-bottom-right-radius: 1em} */
/*        table tr:last-child td {border:none} */
</style>
<script type="text/javascript">
	$(function(){
		let memberRecvNo = $("#msgNick").val();
		$(".msgNick").click(function(){
			window.open("${pageContext.request.contextPath}/msg/send?memberRecvNo="+memberRecvNo,"Message","width=500,height=600,scrollbars=no,left=1000,top=400")
		});
	});
</script>
    <div class="container ma-t-100">

        <div class="section-header mt-4 col-md-8 offset-md-2" >
            <h2>Together</h2>
            <p><span>같이가요</span> 게시판</p>
            <h2>함께 식사할 동행을 구해보세요.</h2>
       	</div>
        
        <div class="row mt-2 text-left">
            <div class="col-md-6 offset-md-3">
                    <a href="${pageContext.request.contextPath}/together/list?column=together_readcount&order=desc&p=${p}&s=${s}" class="btn0" >조회수 순</a>
                    <a href="${pageContext.request.contextPath}/together/list?column=together_no&order=desc&p=${p}&s=${s}" class="btn0" >최신 순</a>
                    <a href="${pageContext.request.contextPath}/together/list?column=together_no&order=asc&p=${p}&s=${s}" class="btn0" >오래된 순</a>
            </div>
        </div>
        
        <!-- 글쓰기 버튼 -->
         <div class="row mt-2"> 
            <div class="col-md-6 offset-md-3">
               <a href="write" class="btn1 col-md-1 offset-md-11">글쓰기</a>
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
                    	<c:forEach var="togetherDto" items="${list}">
	                        <tr class="normal-font" style="background-color:white;">
	                        
                    	
	                            <td>${togetherDto.togetherNo}</td>
	                            <td style="text-align: left !important">
	                            <a href="detail?togetherNo=${togetherDto.togetherNo}">
	                            	${togetherDto.togetherTitle}
	                            <!-- 댓글 수 출력 -->
	                            <c:if test="${togetherDto.togetherReplycount != 0}">
	                            	<span class="fw-bold" style="color:gray;">[${togetherDto.togetherReplycount}]</span>
	                            </c:if>
	                            </a>
	                            </td>
	                            <td> <a class="msgNick" href="#">
	                            <input type="hidden" value="${togetherDto.memberNo}" id="msgNick">
	                            ${togetherDto.togetherWriter}</a></td><!-- 작성자 닉네임 클릭 시 쪽지 -->
	                            <td>${togetherDto.togetherTime}</td>
	                            <td >${togetherDto.togetherReadcount }</td>
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
								href="${pageContext.request.contextPath}/together/list?p=1&s=${s}&type=${type}&keyword=${keyword}">&lt;</a></li>
						</c:when>
						<c:when test="${search && readcountSearch}">
							<li class="page-item"><a class="page-link"
								href="${pageContext.request.contextPath}/together/list?p=1&s=${s}&type=${type}&keyword=${keyword}&column=together_readcount&order=desc">&lt;</a></li>
						</c:when>
						<c:when test="${search && noDescSearch}">
							<li class="page-item"><a class="page-link"
								href="${pageContext.request.contextPath}/together/list?p=1&s=${s}&type=${type}&keyword=${keyword}&column=together_no&order=desc">&lt;</a></li>
						</c:when>
						<c:when test="${search && noAscSearch}">
							<li class="page-item"><a class="page-link"
								href="${pageContext.request.contextPath}/together/list?p=1&s=${s}&type=${type}&keyword=${keyword}&column=together_no&order=asc">&lt;</a></li>
						</c:when>
						<c:when test="${readcountSearch}">
							<li class="page-item"><a class="page-link"
								href="${pageContext.request.contextPath}/together/list?p=1&s=${s}&column=together_readcount&order=desc">&lt;</a></li>
						</c:when>
						<c:when test="${noDescSearch}">
							<li class="page-item"><a class="page-link"
								href="${pageContext.request.contextPath}/together/list?p=1&s=${s}&column=together_no&order=desc">&lt;</a></li>
						</c:when>
						<c:when test="${noAscSearch}">
							<li class="page-item"><a class="page-link"
								href="${pageContext.request.contextPath}/together/list?p=1&s=${s}&column=together_no&order=asc">&lt;</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link"
								href="${pageContext.request.contextPath}/together/list?p=1&s=${s}">&lt;</a></li>
						</c:otherwise>
					</c:choose>
				</c:if>

				<c:if test="${startBlock > 1}">
					<c:choose>
						<c:when test="${search}">
							<li class="page-item"><a class="page-link"
								href="${pageContext.request.contextPath}/together/list?p=${startBlock-1}&s=${s}&type=${type}&keyword=${keyword}">&laquo;</a></li>
						</c:when>
						<c:when test="${search && readcountSearch}">
							<li class="page-item"><a class="page-link"
								href="${pageContext.request.contextPath}/together/list?p=${startBlock-1}&s=${s}&type=${type}&keyword=${keyword}&column=together_readcount&order=desc">&laquo;</a></li>
						</c:when>
						<c:when test="${search && noDescSearch}">
							<li class="page-item"><a class="page-link"
								href="${pageContext.request.contextPath}/together/list?p=${startBlock-1}&s=${s}&type=${type}&keyword=${keyword}&column=together_no&order=desc">&laquo;</a></li>
						</c:when>
						<c:when test="${search && noAscSearch}">
							<li class="page-item"><a class="page-link"
								href="${pageContext.request.contextPath}/together/list?p=${startBlock-1}&s=${s}&type=${type}&keyword=${keyword}&column=together_no&order=asc">&laquo;</a></li>
						</c:when>
						<c:when test="${readcountSearch}">
							<li class="page-item"><a class="page-link"
								href="${pageContext.request.contextPath}/together/list?p=${startBlock-1}&s=${s}&column=together_readcount&order=desc">&laquo;</a></li>
						</c:when>
						<c:when test="${noDescSearch}">
							<li class="page-item"><a class="page-link"
								href="${pageContext.request.contextPath}/together/list?p=${startBlock-1}&s=${s}&column=together_no&order=desc">&laquo;</a></li>
						</c:when>
						<c:when test="${noAscSearch}">
							<li class="page-item"><a class="page-link"
								href="${pageContext.request.contextPath}/together/list?p=${startBlock-1}&s=${s}&column=together_no&order=asc">&laquo;</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link"
								href="${pageContext.request.contextPath}/together/list?p=${startBlock-1}&s=${s}">&laquo;</a></li>
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
										href="${pageContext.request.contextPath}/together/list?p=${i}&s=${s}&type=${type}&keyword=${keyword}">${i}</a></li>
								</c:when>
								<c:when test="${i == p && readcountSearch}">
									<li class="page-item active"><a class="page-link"
										href="${pageContext.request.contextPath}/together/list?p=${i}&s=${s}&type=${type}&keyword=${keyword}&column=together_readcount&order=desc">${i}</a></li>
								</c:when>
								<c:when test="${i == p && noDescSearch}">
									<li class="page-item active"><a class="page-link"
										href="${pageContext.request.contextPath}/together/list?p=${i}&s=${s}&type=${type}&keyword=${keyword}&column=together_no&order=desc">${i}</a></li>
								</c:when>
								<c:when test="${i == p && noAscSearch}">
									<li class="page-item active"><a class="page-link"
										href="${pageContext.request.contextPath}/together/list?p=${i}&s=${s}&type=${type}&keyword=${keyword}&column=together_no&order=asc">${i}</a></li>
								</c:when>
								<c:when test="${i != p && readcountSearch}">
									<li class="page-item"><a class="page-link"
										href="${pageContext.request.contextPath}/together/list?p=${i}&s=${s}&type=${type}&keyword=${keyword}&column=together_readcount&order=desc">${i}</a></li>
								</c:when>
								<c:when test="${i != p && noDescSearch}">
									<li class="page-item"><a class="page-link"
										href="${pageContext.request.contextPath}/together/list?p=${i}&s=${s}&type=${type}&keyword=${keyword}&column=together_no&order=desc">${i}</a></li>
								</c:when>
								<c:when test="${i != p && noAscSearch}">
									<li class="page-item"><a class="page-link"
										href="${pageContext.request.contextPath}/together/list?p=${i}&s=${s}&type=${type}&keyword=${keyword}&column=together_no&order=asc">${i}</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link"
										href="${pageContext.request.contextPath}/together/list?p=${i}&s=${s}&type=${type}&keyword=${keyword}">${i}</a></li>
								</c:otherwise>
							</c:choose>
						</c:when>
						<c:otherwise>
							<c:choose>
								<c:when test="${i == p}">
									<li class="page-item active"><a class="page-link"
										href="${pageContext.request.contextPath}/together/list?p=${i}&s=${s}">${i}</a></li>
								</c:when>
								<c:when test="${i == p && readcountSearch}">
									<li class="page-item active"><a class="page-link"
										href="${pageContext.request.contextPath}/together/list?p=${i}&s=${s}&column=together_readcount&order=desc">${i}</a></li>
								</c:when>
								<c:when test="${i == p && noDescSearch}">
									<li class="page-item active"><a class="page-link"
										href="${pageContext.request.contextPath}/together/list?p=${i}&s=${s}&column=together_no&order=desc">${i}</a></li>
								</c:when>
								<c:when test="${i == p && noAscSearch}">
									<li class="page-item active"><a class="page-link"
										href="${pageContext.request.contextPath}/together/list?p=${i}&s=${s}&column=together_no&order=asc">${i}</a></li>
								</c:when>
								<c:when test="${i != p && noDescSearch}">
									<li class="page-item"><a class="page-link"
										href="${pageContext.request.contextPath}/together/list?p=${i}&s=${s}&column=together_no&order=desc">${i}</a></li>
								</c:when>
								<c:when test="${i != p && noAscSearch}">
									<li class="page-item"><a class="page-link"
										href="${pageContext.request.contextPath}/together/list?p=${i}&s=${s}&column=together_no&order=asc">${i}</a></li>
								</c:when>
								<c:when test="${i != p && readcountSearch}">
									<li class="page-item"><a class="page-link"
										href="${pageContext.request.contextPath}/together/list?p=${i}&s=${s}&column=together_readcount&order=desc">${i}</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link"
										href="${pageContext.request.contextPath}/together/list?p=${i}&s=${s}">${i}</a></li>
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
								href="${pageContext.request.contextPath}/together/list?p=${endBlock+1}&s=${s}&type=${type}&keyword=${keyword}">&gt;</a></li>
						</c:when>
						<c:when test="${search && readcountSeasrch}">
							<li class="page-item"><a class="page-link"
								href="${pageContext.request.contextPath}/together/list?p=${endBlock+1}&s=${s}&type=${type}&keyword=${keyword}&column=together_readcount&order=desc">&gt;</a></li>
						</c:when>
						<c:when test="${search && noDescSearch}">
							<li class="page-item"><a class="page-link"
								href="${pageContext.request.contextPath}/together/list?p=${endBlock+1}&s=${s}&type=${type}&keyword=${keyword}&column=together_no&order=desc">&gt;</a></li>
						</c:when>
						<c:when test="${search && noAscSearch}">
							<li class="page-item"><a class="page-link"
								href="${pageContext.request.contextPath}/together/list?p=${endBlock+1}&s=${s}&type=${type}&keyword=${keyword}&column=together_no&order=asc">&gt;</a></li>
						</c:when>
						<c:when test="${readcountSearch}">
							<li class="page-item"><a class="page-link"
								href="${pageContext.request.contextPath}/together/list?p=${endBlock+1}&s=${s}&column=together_readcount&order=desc">&gt;</a></li>
						</c:when>
						<c:when test="${noDescSearch}">
							<li class="page-item"><a class="page-link"
								href="${pageContext.request.contextPath}/together/list?p=${endBlock+1}&s=${s}&column=together_no&order=desc">&gt;</a></li>
						</c:when>
						<c:when test="${noAscSearch}">
							<li class="page-item"><a class="page-link"
								href="${pageContext.request.contextPath}/together/list?p=${endBlock+1}&s=${s}&column=together_no&order=asc">&gt;</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link"
								href="${pageContext.request.contextPath}/together/list?p=${endBlock+1}&s=${s}">&gt;</a></li>
						</c:otherwise>
					</c:choose>
				</c:if>

				<c:if test="${p < lastPage}">
					<c:choose>
						<c:when test="${search}">
							<li class="page-item"><a class="page-link"
								href="${pageContext.request.contextPath}/together/list?p=${lastPage}&s=${s}&type=${type}&keyword=${keyword}">&raquo;</a></li>
						</c:when>
						<c:when test="${search && readcountSearch}">
							<li class="page-item"><a class="page-link"
								href="${pageContext.request.contextPath}/together/list?p=${lastPage}&s=${s}&type=${type}&keyword=${keyword}&column=together_readcount&order=desc">&raquo;</a></li>
						</c:when>
						<c:when test="${search && noDescSearch}">
							<li class="page-item"><a class="page-link"
								href="${pageContext.request.contextPath}/together/list?p=${lastPage}&s=${s}&type=${type}&keyword=${keyword}&column=together_no&order=desc">&raquo;</a></li>
						</c:when>
						<c:when test="${search && noAscSearch}">
							<li class="page-item"><a class="page-link"
								href="${pageContext.request.contextPath}/together/list?p=${lastPage}&s=${s}&type=${type}&keyword=${keyword}&column=together_no&order=asc">&raquo;</a></li>
						</c:when>
						<c:when test="${readcountSearch}">
							<li class="page-item"><a class="page-link"
								href="${pageContext.request.contextPath}/together/list?p=${lastPage}&s=${s}&column=together_readcount&order=desc">&raquo;</a></li>
						</c:when>
						<c:when test="${noDescSearch}">
							<li class="page-item"><a class="page-link"
								href="${pageContext.request.contextPath}/together/list?p=${lastPage}&s=${s}&column=together_no&order=desc">&raquo;</a></li>
						</c:when>
						<c:when test="${noAscSearch}">
							<li class="page-item"><a class="page-link"
								href="${pageContext.request.contextPath}/together/list?p=${lastPage}&s=${s}&column=together_no&order=asc">&raquo;</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link"
								href="${pageContext.request.contextPath}/together/list?p=${lastPage}&s=${s}">&raquo;</a></li>
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
               <form action="${pageContext.request.contextPath}/together/list" method="get">
               <div class="d-flex justify-content-center" >
                    <select name="type" class="form-select me-1" style="width:17%;">
                        <option value="together_title" <c:if test="${type == 'together_title'}">selected</c:if>>제목</option>
						<option value="together_content" <c:if test="${type == 'together_content'}">selected</c:if>>내용</option>
						<option value="together_writer" <c:if test="${type == 'together_writer'}">selected</c:if>>작성자</option>
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