<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<div class="container w400 m30">
	<div class="row center m30">
		<h1>회원 정보</h1>
	</div>
	
	<!-- 프로필 이미지 -->
	<div class="row center m30">
		<img src="${pageContext.request.contextPath}${profileUrl}"
				width="150" class="img img-circle img-shadow">
	</div>
	
	<div class="row">
		<table class="table table-border table-hover">
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
	
	<div class="row center m30">
		<h2><a href="password">비밀번호 변경</a></h2>
	</div>
	<div class="row center m30">
		<h2><a href="information">개인정보 변경</a></h2>
	</div>
	<div class="row center m30">
		<h2><a href="exit">탈퇴하기</a></h2>
	</div>
	
	</div>
	
