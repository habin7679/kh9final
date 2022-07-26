<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <style>
    </style>
 <div id="app">
        <div class="container ma-t-100" style="width:900px;">
            <div class="row">

                <div class="col-md-8 offset-md-2">
                    <div class="section-header mt-4 text-center">
              
                        <p><span>회원</span> 정보</p>
                    </div>

                    <!-- 프로필 이미지 -->

                    <div class="row mt-2 text-center mb-2">
                        <img src="${pageContext.request.contextPath}${profileUrl}" class="img img-circle img-shadow "
                            style="width:300px; margin-left:150px; height:150px;">
                    </div>


                    <div class="row text-center">
                        <table class="table mt-4">
                            <tr>
                                <th width="30%">이메일</th>
                                <td>${memberDto.memberId}</td>
                            </tr>
                            <tr>
                                <th>이름</th>
                                <td>${memberDto.memberName}</td>
                            </tr>
                            <tr>
                                <th>닉네임</th>
                                <td>${memberDto.memberNick}</td>
                            </tr>
                            <tr>
                                <th>생년월일</th>
                                <td>${memberDto.memberBirth}</td>
                            </tr>
                            <tr>
                                <th>전화번호</th>
                                <td>${memberDto.memberPhone}</td>
                            </tr>
                            <tr>
                                <th>성별</th>
                                <td>${memberDto.memberGender}</td>
                            </tr>
                            <tr>
                                <th>등급</th>
                                <td>${memberDto.memberKind}</td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>

    
            <div class="row mb-1 ">
        <div class="row ">
        <div class="col-md-10 offset-md-3">
                    <a href="${pageContext.request.contextPath}/member/password" class="btn btn-secondary" style="margin-right:70px;">비밀번호 변경</a>
                 <a href="${pageContext.request.contextPath}/member/information" class="btn btn-secondary"  >개인정보 변경</a>
                <a href="${pageContext.request.contextPath}/member/exit" class="btn btn-secondary"style="margin-left:70px;">탈퇴하기</a>
           		</div>
         </div>
        </div>
        
         		<div class="row mb-1 ">
      			  <div class="row ">
                 <div class="col-md-10 offset-md-3">
                    <a href="<%=request.getContextPath()%>/seller/join" class="btn btn-secondary" style="margin-right:70px;">판매자 신청</a>
                    <a href="<%=request.getContextPath()%>/seller/info" class="btn btn-secondary" style="margin-left:20px;">판매자 정보</a>
                </div>
            </div>
	</div>

</div>	
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>

