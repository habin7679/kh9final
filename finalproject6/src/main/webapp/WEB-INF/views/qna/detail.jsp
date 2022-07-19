<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
        .passSpace{
            word-break: break-all;
        }
        .fa-cursor{
            cursor: pointer;
        }
        .fa-solid:hover{
        	color:red;
        }
        .a{
            border-collapse: separate;           
        }
        
        .d{
            border-bottom-left-radius: 1em;
            border-bottom-right-radius: 1em;
        }
        .e{
            border-top-left-radius: 1em;
            border-top-right-radius: 1em;
        }

        .tb-color{
            background-color: #f1f2f6;
        }
       .circle-head{
        background-color: #57606f;
        border-radius: 1.2em;
        color: white;
        padding: 0.5em;
        font-size: 14px;
       }
       .title-size{
        font-size: 22px;
       }
     </style>
     
 <div id="app" class="container ma-t-100">
 	
 	<div class="section-header mt-4 col-md-6 offset-md-3" >
            <h2>QnA</h2>
            <p><span>문의</span> 게시판</p>
            <h2>관리자의 답변이 필요하시면 문의글을 남겨주세요.</h2>
       	</div>
 
        <div class="row mt-10">
            <div class="col-md-6 offset-md-3">
                <table class="table mt-2 ">
                    <thead>
                        <tr class="justify-text-center tb-color">
                            <td class="ps-3 pe-3 pt-3 tb-color e" style="border-bottom: none;">
	                            <c:if test="${qnaDto.qnaHead != null }">
	                                <span class="circle-head me-1">${qnaDto.qnaHead}</span>
	                            </c:if>    
                                <span class="title-size fw-bold">${qnaDto.qnaTitle}</span>
                            </td>
                        </tr>
                        <tr style="text-align: right;" class="tb-color">
                            <td class="p-2">
                            <c:choose>
                            	<c:when test="${qnaDto.qnaWriter == null }">
                            		(탈퇴한 사용자)
                            	</c:when>
                            	<c:otherwise>
	                                <span class="me-3">${qnaDto.qnaWriter}</span>
                            	</c:otherwise>
                            </c:choose>
                                <span class="me-3">${qnaDto.qnaTime}</span>
                            </td>                            
                        </tr>
                    </thead>
                    <tbody>
                        <tr height="400" class="tb-color" >
                            <td class="p-4 d" style="border-bottom: none;">
                                <pre>${qnaDto.qnaContent}</pre>
                            </td>
                        </tr>
                        
<!--                         <tr> -->
<!--                         	<td> -->
<%--                         		 <a href="detail?qnaNo=${qnaDto.qnaNo}&superNo=${qnaDto.superNo}"> --%>
<!-- 	                           	말머리 -->
<%-- 		                            <c:if test="${qnaDto.qnaHead != null}"> --%>
<%-- 		                            	[${qnaDto.qnaHead}] --%>
<%-- 		                            </c:if> --%>
<%-- 	                            	${qnaDto.qnaTitle} --%>
<!-- 	                            </a> -->
<!--                         	</td> -->
<!--                         </tr> -->
                        
                        <tr style="text-align: right;">
                           <td style="border-bottom: none;">
                          <c:if test="${isOwner}">
                            <a href="${pageContext.request.contextPath}/qna/edit?qnaNo=${qnaDto.qnaNo}" class="btn1 ms-1">수정</a>
                            <a href="${pageContext.request.contextPath}/qna/delete?qnaNo=${qnaDto.qnaNo}" class="btn0 ms-1">삭제</a>
                           </c:if>
                           <c:if test="${isAdmin}">
                           	<a href="${pageContext.request.contextPath}/qna/delete?qnaNo=${qnaDto.qnaNo}" class="btn0 ms-1">삭제</a>
                            <a href="${pageContext.request.contextPath}/qna/write?superNo=${qnaDto.qnaNo}" class="btn1 ms-1">답글</a>
                           </c:if>
                            <a href="${pageContext.request.contextPath}/qna/list" class="btn0 ms-1">목록</a>
                           </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>

