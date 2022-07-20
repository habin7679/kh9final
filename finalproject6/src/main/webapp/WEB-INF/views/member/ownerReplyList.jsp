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

  .fa-cursor{
            cursor: pointer;
        }
        .fa-solid:hover{
        	color:red;
        }
</style>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">
	$(function(){
		let p = 1;
		let s = 10;
		let memberNo = ${no};
		loadReply(p,s);
		let replyNo = $(".select-item").val();
		
		$(".btn-more").click(function(){
			p++;
			loadReply(p,s);
		});
		
		//전체체크를 하면 모든 체크박스 체크됨
		$(".select-all").on("input",function(){
			$(".select-item").prop("checked",$(this).prop("checked"));
		});
		
		//체크박스의 개수 체크, value 값을 알아냄
		$(".select-item").on("input",function(){
			let count = $(".select-item").filter(":checked").length;
			console.log(count);
			
			let dataList = [];
			$(".select-item").each(function(){
				if($(this).prop("checked")){
					dataList.push($(this).val());
				}
			});
			console.log(dataList);
		});
		
		//fb삭제
		$(".fb").click(function(){
			
			console.log(replyNo);
			
			$.ajax({
				url:"${pageContext.request.contextPath}/rest/reply/"+replyNo,
				type:"delete",
				success:function(resp){
					alert("삭제되었습니다.");
					location.replace("ownerReply");
				},
				error:function(){
					alert("삭제 실패하였습니다.");
				}
				
			});
		});
		
		//삭제
		$("#dbt").click(function(){
			if($(".select-item").filter(":checked").length == 0){
				alert("선택된 항목이 없습니다.");
				return;
			}
			else{
				let dataList = [];
				$(".select-item").each(function(){
					if($(this).prop("checked")){
						dataList.push($(this).val());
					}
				});
				
				$.ajax({
					url:"${pageContext.request.contextPath}/ajax/",
					type:"post",
					data:{
						dataList:dataList
					},
					success:function(resp){
						alert("삭제되었습니다.");
						location.replace("ownerReply");
					},
					error:function(){
						alert("삭제 실패하였습니다.");
					}
					
				});
				console.log(dataList);
			}
		});
		
		function loadReply(p,s){
			
			$.ajax({
				url:"${pageContext.request.contextPath}/ajax/list",
				type:"post",
				data:{
					memberNo:memberNo,
					p:p,
					s:s
				},
				success:function(resp){
					if(resp.length < s){
						$(".btn-more").remove();
					}
					
					for(let i=0; i < resp.length; i++){
						let tr = $("<tr>").addClass("normal-font");
						let td1 = $("<td>");
						let input1 = $("<input type=checkbox>").addClass("select-item").val(resp[i].replyNo).attr("name","replyNo");
						td1.append(input1);
						
						let td2 = $("<td>").text(resp[i].replyContent).css("text-align","left");
						
						let td3 = $("<td>").text(moment(resp[i].replyTime).format('YYYY-MM-DD HH:mm'));
						
						let td4 = $("<td>");
						let editcon = $("<i>").addClass("fb fa-solid fa-circle-xmark fa-cursor");
						
						td4.append(editcon);
						
						let tr1 = tr.append(td1).append(td2).append(td3).append(td4);
						$("#replyList").append(tr1);
					}
				}
			});
		}
		
	});
</script>
 <div class="container ma-t-100">

        <div class="section-header mt-4 col-md-8 offset-md-2" >
            <h2>comment</h2>
            <p><span>댓글</span> 관리</p>
            <h2>내가 쓴 댓글</h2>
       	</div>
        
        <div class="row mt-2">
            <div class="col-md-6 offset-md-3">
                <table class="table">
                    <thead class="text-center">
                        <tr>
                            <th>
                            	<input type="checkbox" class="select-all" value="">
                            </th>
                            <th class="w-50">내용</th>
                            <th>작성일</th>
                            <th>
                            	<button  class="btn0" id="dbt" >삭제</button>
                            </th>
                        </tr>
                    </thead>
                    
                    <tbody class="text-center" id="replyList">
<%--                     	<c:forEach var="replyDto" items="${replyList}"> --%>
                    	
<!-- 	                        <tr class="normal-font" style="background-color:white;"> -->
<!-- 	                            <td> -->
<%-- 	                            	<input type="checkbox" name="replyNo" value="${replyDto.replyNo}" class="select-item"> --%>
<!-- 	                            </td> -->
<!-- 	                            <td style="text-align: left !important"> -->
<%-- 	                            	${replyDto.replyContent} --%>
<!-- 	                            </td> -->
<%-- 	                            <td>${replyDto.replyTime}</td> --%>
<!-- 	                            <td> -->
<!--                                     <i class="fa-solid fa-circle-xmark fa-cursor"></i> -->
<!-- 	                            </td> -->
<!-- 	                        </tr> -->
	                        
<%--                         </c:forEach> --%>
                    </tbody>
                    
                </table>
		            <c:if test="${replyList.isEmpty()}">
		            	<div class="row mt-2 text-center">
		            		<h4>검색 결과가 없습니다.</h4>
		            	</div>
		            </c:if>
            </div>
        </div>

	<!-- 페이지네이션 -->
<!-- 	<div class="row mt-2"> -->
<!-- 			<ul class="pagination justify-content-center"> -->
<%-- 				<c:if test="${p > 1}"> --%>
<%-- 					<c:choose> --%>
<%-- 						<c:when test="${search}"> --%>
<!-- 							<li class="page-item"><a class="page-link" -->
<%-- 								href="ownerReply?p=1&s=${s}&type=${type}&keyword=${keyword}">&lt;</a></li> --%>
<%-- 						</c:when> --%>
<%-- 						<c:otherwise> --%>
<!-- 							<li class="page-item"><a class="page-link" -->
<%-- 								href="ownerReply?p=1&s=${s}">&lt;</a></li> --%>
<%-- 						</c:otherwise> --%>
<%-- 					</c:choose> --%>
<%-- 				</c:if> --%>

<%-- 				<c:if test="${startBlock > 1}"> --%>
<%-- 					<c:choose> --%>
<%-- 						<c:when test="${search}"> --%>
<!-- 							<li class="page-item"><a class="page-link" -->
<%-- 								href="ownerReply?p=${startBlock-1}&s=${s}&type=${type}&keyword=${keyword}">&laquo;</a></li> --%>
<%-- 						</c:when> --%>
<%-- 						<c:otherwise> --%>
<!-- 							<li class="page-item"><a class="page-link" -->
<%-- 								href="ownerReply?p=${startBlock-1}&s=${s}">&laquo;</a></li> --%>
<%-- 						</c:otherwise> --%>
<%-- 					</c:choose> --%>
<%-- 				</c:if> --%>

<!-- 				숫자 링크 영역 -->
<%-- 				<c:forEach var="i" begin="${startBlock}" end="${endBlock}" step="1"> --%>
<%-- 					<c:choose> --%>
<%-- 						<c:when test="${search}"> --%>
<%-- 							<c:choose> --%>
<%-- 								<c:when test="${i == p}"> --%>
<!-- 									<li class="page-item active"><a class="page-link" -->
<%-- 										href="ownerReply?p=${i}&s=${s}&type=${type}&keyword=${keyword}">${i}</a></li> --%>
<%-- 								</c:when> --%>
<%-- 								<c:otherwise> --%>
<!-- 									<li class="page-item"><a class="page-link" -->
<%-- 										href="ownerReply?p=${i}&s=${s}&type=${type}&keyword=${keyword}">${i}</a></li> --%>
<%-- 								</c:otherwise> --%>
<%-- 							</c:choose> --%>
<%-- 						</c:when> --%>
<%-- 						<c:otherwise> --%>
<%-- 							<c:choose> --%>
<%-- 								<c:when test="${i == p}"> --%>
<!-- 									<li class="page-item active"><a class="page-link" -->
<%-- 										href="ownerReply?p=${i}&s=${s}">${i}</a></li> --%>
<%-- 								</c:when> --%>
<%-- 								<c:otherwise> --%>
<!-- 									<li class="page-item"><a class="page-link" -->
<%-- 										href="ownerReply?p=${i}&s=${s}">${i}</a></li> --%>
<%-- 								</c:otherwise> --%>
<%-- 							</c:choose> --%>
<%-- 						</c:otherwise> --%>
<%-- 					</c:choose> --%>
<%-- 				</c:forEach> --%>

<!-- 				다음 버튼 영역 -->
<%-- 				<c:if test="${endBlock < lastPage}"> --%>
<%-- 					<c:choose> --%>
<%-- 						<c:when test="${search}"> --%>
<!-- 							<li class="page-item"><a class="page-link" -->
<%-- 								href="ownerReply?p=${endBlock+1}&s=${s}&type=${type}&keyword=${keyword}">&gt;</a></li> --%>
<%-- 						</c:when> --%>
<%-- 						<c:otherwise> --%>
<!-- 							<li class="page-item"><a class="page-link" -->
<%-- 								href="ownerReply?p=${endBlock+1}&s=${s}">&gt;</a></li> --%>
<%-- 						</c:otherwise> --%>
<%-- 					</c:choose> --%>
<%-- 				</c:if> --%>

<%-- 				<c:if test="${p < lastPage}"> --%>
<%-- 					<c:choose> --%>
<%-- 						<c:when test="${search}"> --%>
<!-- 							<li class="page-item"><a class="page-link" -->
<%-- 								href="ownerReply?p=${lastPage}&s=${s}&type=${type}&keyword=${keyword}">&raquo;</a></li> --%>
<%-- 						</c:when> --%>
<%-- 						<c:otherwise> --%>
<!-- 							<li class="page-item"><a class="page-link" -->
<%-- 								href="ownerReply?p=${lastPage}&s=${s}">&raquo;</a></li> --%>
<%-- 						</c:otherwise> --%>
<%-- 					</c:choose> --%>
<%-- 				</c:if> --%>
<!-- 			</ul> -->
<!-- 	</div> -->

	<div class="row mt-2 text-center">
	
		<div class="col-md-8 offset-md-2">
			<button class="btn-more btn0">더보기</button>
		</div>
	</div>

<!-- 	<div class="row mt-2 text-center"> -->
<!--             <div class="col-md-8 offset-md-2"> -->
<!--                검색창 -->
<!--                <div class="row"> -->
<!--                <div class="col-md-3"></div> -->
<!--                <div class="col-md-6"> -->
<!--                <form action="ownerReply" method="get"> -->
<!--                <div class="d-flex justify-content-center" > -->
<!--                     <select name="type" class="form-select me-1" style="width:17%;"> -->
<!-- 						<option value="reply_content">내용</option> -->
<!--                     </select> -->
<%--                 <input type="search" name="keyword" placeholder="검색어 입력" value="${keyword}" class="form-control me-1" id="rk" style="width:50%;" autocomplete="off"> --%>
<!--                 <input type="submit" value="검색" class="btn-s" style="width:15%;"> -->
<!--                </div> -->
<!--                </form> -->
<!--                </div> -->
<!--                <div class="col-md-3"></div> -->
<!--            </div>      -->
<!--         </div> -->
</div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        
    </script>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>