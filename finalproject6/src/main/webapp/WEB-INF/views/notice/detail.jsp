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
 	
 	<div class="section-header mt-4 col-md-8 offset-md-2" >
            <h2>notice</h2>
            <p><span>공지</span> 게시판</p>
            <h2>공지 및 이벤트를 확인하세요.</h2>
       	</div>
 
        <div class="row mt-10">
            <div class="col-md-8 offset-md-2">
                <table class="table mt-2 ">
                    <thead>
                        <tr class="justify-text-center tb-color">
                            <td class="ps-3 pe-3 pt-3 tb-color e " style="border-bottom: none;">
	                            <c:if test="${noticeDto.noticeHead != null }">
	                                <span class="circle-head">${noticeDto.noticeHead}</span>
	                            </c:if>    
                                <span class="title-size fw-bold">${noticeDto.noticeTitle}</span>
                            </td>
                        </tr>
                        <tr style="text-align: right;" class="tb-color">
                            <td class="p-2">
                            <c:choose>
                            	<c:when test="${noticeDto.noticeWriter == null }">
                            		(탈퇴한 사용자)
                            	</c:when>
                            	<c:otherwise>
	                                <span class="me-3">${noticeDto.noticeWriter}</span>
                            	</c:otherwise>
                            </c:choose>
                                <span class="me-3">${noticeDto.noticeTime}</span>
                            </td>                            
                        </tr>
                    </thead>
                    <tbody>
                        <tr height="400" class="tb-color" >
                            <td class="p-3 d" style="border-bottom: none;">
	                            <c:choose>
		    						<c:when test="${noAttach == false || passImg}">
		    							<img src="${pageContext.request.contextPath}${noticeImgUrl}" width="50%">
		    							<pre>${noticeDto.noticeContent }</pre>
		    						</c:when>
		    						<c:otherwise>
		    							<pre>${noticeDto.noticeContent }</pre>
		    						</c:otherwise>
	    						</c:choose>
                            </td>
                        </tr>
                        <c:if test="${noAttach == false}">
		    				<tr>
		    					<td>
		    						다운로드 : <a class="cursor:pointer; fw-bold" href="${pageContext.request.contextPath}${noticeImgUrl}">${attachName}</a>
		    					</td>
		    				</tr>
	    				</c:if>
                        <tr style="text-align: right;">
                           <td style="border-bottom: none;">
                          <c:if test="${isAdmin}">
                            <a href="${pageContext.request.contextPath}/notice/edit?noticeNo=${noticeDto.noticeNo}" class="btn0 ms-1">수정</a>
                            <a href="${pageContext.request.contextPath}/notice/delete?noticeNo=${noticeDto.noticeNo}" class="btn0 ms-1">삭제</a>
                           </c:if>
                            <a href="${pageContext.request.contextPath}/notice/list" class="btn0 ms-1">목록</a>
                           </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
