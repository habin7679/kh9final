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

<form action="edit" method="post">
<input type="hidden" name="qnaNo" value="${qnaDto.qnaNo}">

        <div class="container-fluid">
            <div class="row center">
                <h1>게시글 수정</h1>
            </div>

            <div class="row">
                <label>말머리</label>
                <select name="qnaHead" class="form-control">
                    <option value="" <c:if test="${qnaDto.qnaHead==''}">selected</c:if>>선택</option>
                    <option <c:if test="${qnaDto.qnaHead=='정보'}">selected</c:if>>정보</option>
                    <option <c:if test="${qnaDto.qnaHead=='예약'}">selected</c:if>>예약</option>
                    <option <c:if test="${qnaDto.qnaHead=='취소'}">selected</c:if>>취소</option>
                    <option <c:if test="${qnaDto.qnaHead=='신고'}">selected</c:if>>신고</option>
                    <option <c:if test="${qnaDto.qnaHead=='입점'}">selected</c:if>>입점</option>
                </select>
            </div>

            <div class="row">
                <label>제목</label>
                <input type="text" name="qnaTitle" value="${qnaDto.qnaTitle }" required size="30" 
                class="form-control">
            </div>

            <div class="row">
                <label>내용</label>
                <textarea name="qnaContent" required 
                class="textarea form-input fill" rows="12">${qnaDto.qnaContent }</textarea>
            </div>

            <div class="row right">
                <input type="submit" value="수정" class="btn btn-success">
                <a href="list" class="btn btn-secondary">목록</a>
            </div>
        </div>
    </form>
    <!--lazy loading 배치 - 기능은 다소 늦게 돌아가지만 화면을 먼저 띄울 수 있다 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script>

    </script>
</body>
</html>