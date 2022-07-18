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
                        <h2>mypage</h2>
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

            <div class="row mt-2 text-center">
                <div class="col-md-8 offset-md-2">
                    <h2><a href="password" class="btn btn-secondary">비밀번호 변경</a></h2>
                    <h2><a href="information" class="btn btn-secondary">개인정보 변경</a></h2>
                    <h2><a href="exit" class="btn btn-secondary">탈퇴하기</a></h2>
                </div>
            </div>
	</div>
</div>	
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>