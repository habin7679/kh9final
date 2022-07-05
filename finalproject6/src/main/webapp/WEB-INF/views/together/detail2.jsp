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
        padding: 0.4em;
        font-size: 14px;
       }
       .title-size{
        font-size: 22px;
       }
     </style>
     
 <div class="container ma-t-100">
 	
 	<div class="section-header mt-4 col-md-8 offset-md-2" >
            <h2>Together</h2>
            <p><span>같이가요</span> 게시판</p>
            <h2>함께 식사할 동행을 구해보세요.</h2>
       	</div>
 
        <div class="row mt-10">
            <div class="col-md-8 offset-md-2">
                <table class="table mt-2 ">
                    <thead>
                        <tr class="justify-text-center tb-color">
                            <td class="ps-3 pe-3 pt-3 tb-color e" style="border-bottom: none;">
<%-- 	                            <c:if test="${togetherDto.togetherHead != null }"> --%>
<%-- 	                                <span class="circle-head">${togetherDto.togetherHead}</span> --%>
<%-- 	                            </c:if>     --%>
                                <span class="title-size">${togetherDto.togetherTitle}</span>
                            </td>
                        </tr>
                        <tr style="text-align: right;" class="tb-color">
                            <td class="p-2">
                                <span class="me-3">${togetherDto.togetherWriter}</span>
                                <span class="me-3">${togetherDto.togetherTime}</span>
                            </td>                            
                        </tr>
                    </thead>
                    <tbody>
                        <tr height="400" class="tb-color" >
                            <td class="p-3 d" style="border-bottom: none;">
                                <pre>${togetherDto.togetherContent}</pre>
                            </td>
                        </tr>
                        <tr style="text-align: right;">
                           <td style="border-bottom: none;">
                            <a href="${pageContext.request.contextPath}/together/edit?togetherNo=${togetherDto.togetherNo}" class="btn0">수정</a>
                            <a href="${pageContext.request.contextPath}/together/delete?togetherNo=${togetherDto.togetherNo}" class="btn0">삭제</a>
                            <a href="${pageContext.request.contextPath}/together/list" class="btn0">목록</a>
                           </td>
                        </tr>

                        <tr>
                            <td>
                                <span>댓글</span>
                                <span style="color:red;">0</span>
                            </td>
                        </tr>


                        <tr>
                            <td>
                                <div class="row">
                                    <div class="col-md-1 text-left mt-1 mb-1 passSpace">
                                       <span>작성자</span>
                                    </div>
                                    <div class="col-md-7 text-left mt-1 mb-1 passSpace">
                                        <span>댓글 내용</span>
                                    </div>
                                    <div class="col-md-2 text-center mt-1 mb-1 passSpace">
                                        <span>작성일</span>
                                    </div>
                                    <div class="col-md-2 text-center mt-1">
                                        <i class="fa-solid fa-pencil fa-cursor me-3"></i>
                                        <i class="fa-solid fa-circle-xmark fa-cursor"></i>                                   
                                    </div>                                    
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <td style="border-top-width: 0.1em; border-bottom: none;">
                                <div class="row">
                                    <div class="col-md-1 text-center mt-2">
                                        <span>댓글 입력</span>
                                    </div>
                                    <div class="col-md-10">
                                        <textarea class="form-control" ></textarea>
                                    </div>
                                    <div class="col-md-1 text-center d-grid">
                                        <button class="btn1" style="font-size: 0.8em;">등록</button>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td style="border-bottom: none;">
                                <div class="row">
                                    <div class="col-md-1 text-center mt-3">
                                        <span>댓글 입력</span>
                                    </div>
                                    <div class="col-md-10 mt-2">
                                        <textarea class="form-control" ></textarea>
                                    </div>
                                    <div class="col-md-1 d-grid gap-1">
                                        <button class="btn1">수정</button>
                                        <button class="btn0">취소</button>
                                    </div>
                                </div>
                            </td>
                        </tr>

                    </tbody>
                </table>
            </div>
        </div>
    </div>

<!--lazy loading 배치 - 기능은 다소 늦게 돌아가지만 화면을 먼저 띄울 수 있다 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
 <script>

</script>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>