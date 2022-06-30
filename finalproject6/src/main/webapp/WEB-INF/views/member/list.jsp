<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <div class="container-fluid mt-10">
        <div class="row mt-10 top" >
            <div class="col-md-8 offset-md-2">
                <div class="p-4 text-light text-center bg-dark rounded">
                    <h1>회원 관리</h1>
                </div>
            </div>
        </div>
        
        <div class="row mt-2">
            <div class="col-md-8 offset-md-2">
                <table class="table">
                    <thead class="text-center">
                        <tr>
                            <th>NO</th>
                            <th>아이디</th>
                            <th>이름</th>
                            <th>닉네임</th>
                            <th>성별</th>
                            <th>등급</th>
                        </tr>
                    </thead>
                    <tbody class="text-center">
                    	<c:forEach var="memberDto" items="${list}">
	                        <tr>
	                            <td>${memberDto.memberNo}</td>
	                            <td>${memberDto.memberId}</td><!-- 작성자 닉네임 클릭 시 쪽지 -->
	                            <td>${memberDto.memberName}</td>
	                            <td>${memberDto.memberNick}</td>
	                            <td>${memberDto.memberGender}</td>
	                            <td>${memberDto.memberKind}</td>
	                        </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        
        <div class="row mt-2 text-center">
            <div class="col-md-8 offset-md-2">
               <!--검색창-->
               <form action="list" method="get">
                    <select name="type">
                        <option>이름</option>
                        <option>등급</option>
                        <option>성별</option>
                    </select>
                <input type="search" name="keyword" placeholder="검색어 입력" value=${keyword}>
                <input type="submit" value="검색">
               </form>
            </div>
        </div>

    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        
    </script>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>