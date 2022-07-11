<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상세페이지</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>

    </style>
</head>
<body>

<form action="edit" method="post" enctype="multipart/form-data">
 			<input type="hidden" name="reviewNo" value="${reviewDto.reviewNo}"> 
	        <input type="hidden" name="memberNo" value="${memberDto.memberNo}"> 
	        <input type="hidden" name="storeNo" value="${storeDto.storeNo}"> 
	        <input type="hidden" name="reviewWriter" value="${reviewDto.reviewWriter}"> 

        <div class="container-fluid">
            <div class="row center">
                <h1>리뷰 수정</h1>
            </div>
          

           

            <div class="row">
                <label>내용</label>
                <textarea name="reviewContent" required 
                class="textarea form-input fill" rows="12">${reviewDto.reviewContent}</textarea>
               
               <label>리뷰번호</label>
                <textarea name="reviewContent" required 
                class="textarea form-input fill" rows="12">${reviewDto.reviewNo}</textarea>
               
                  <label>멤버번호</label>
                <textarea name="reviewContent" required 
                class="textarea form-input fill" rows="12">${memberDto.memberNo}</textarea>
               
                <label>가게번호</label>
                <textarea name="reviewContent" required 
                class="textarea form-input fill" rows="12">${storeDto.storeNo}</textarea>
               <label>글쓴이</label>
                <textarea name="reviewContent" required 
                class="textarea form-input fill" rows="12">${reviewDto.reviewWriter}</textarea>
               
               
               
               
                <div class="row mt-2">
 			<div class="col-md-4 offset-md-1">
 				<input type="file" name="reviewImg" accept=".jpg, .png, .gif, .pdf, .ppt, .txt, .hwp">
 			</div>
 		</div>
                
                
                
            </div>
              <div class="row">
	        <label>평점</label> <br>
	        <input type="radio" name="reviewScore" value="1" checked required class="form-input fill input-round">1점
			<input type="radio" name="reviewScore" value="2" required class="form-input fill input-round">2점
			<input type="radio" name="reviewScore" value="3" required class="form-input fill input-round">3점
			<input type="radio" name="reviewScore" value="4"required class="form-input fill input-round">4점
			<input type="radio" name="reviewScore" value="5"required class="form-input fill input-round">5점   
	   
    </div>

            <div class="row right">
                <input type="submit" value="수정" class="btn btn-success">
                <a href="#" class="btn btn-secondary">취소하기</a>
            </div>
        </div>
    </form>
    <!--lazy loading 배치 - 기능은 다소 늦게 돌아가지만 화면을 먼저 띄울 수 있다 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script>

    </script>
</body>
</html>