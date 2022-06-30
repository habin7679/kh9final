<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>notice List</title>
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"/>
     <style>
 		 .left{ text-align: left !important; }
     </style>
</head>
<body>
    <div class="container-fluid">

        <div class="row mt-2">
            <div class="col-md-8 offset-md-2">
                <div class="p-4 text-light text-center bg-dark rounded">
                    <h1>공지게시판</h1>
                </div>
            </div>
        </div>
        
        <!-- 글쓰기 버튼 -->
         <div class="row mt-2"> 
            <div class="col-md-8 offset-md-2">
               <a href="write" class="btn btn-primary col-md-1 offset-md-11">글쓰기</a>
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
                    	<c:forEach var="noticeDto" items="${list}">
	                        <tr>
	                            <td>${noticeDto.noticeNo}</td>
	                            <td class="left">
	                            <a href="detail?noticeNo=${noticeDto.noticeNo}">
	                           	<!-- 말머리 -->
		                            <c:if test="${noticeDto.noticeHead != null}">
		                            	[${noticeDto.noticeHead}]
		                            </c:if>
	                            	${noticeDto.noticeTitle}
	                            </a>
	                            </td>
	                            <td>${noticeDto.noticeWriter}</td><!-- 작성자 닉네임 클릭 시 쪽지 -->
	                            <td>${noticeDto.noticeTime}</td>
	                            <td>${noticeDto.noticeReadcount }</td>
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
                        <option>제목</option>
                        <option>내용</option>
                        <option>작성자</option>
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
</body>
</html>