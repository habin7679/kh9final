<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<form action="write" method="post">
<c:if test="${superNo != null }">
	<input type="hidden" name="superNo" value="${superNo }">
</c:if>
  <div class="row">
                <label>말머리</label>
                <select name="qnaHead" class="form-input fill input-round">
                    <option value="">선택</option>
                    <option>정보</option>
                    <option>예약</option>
                    <option>취소</option>
                    <option>신고</option>
                    <option>입점</option>
                </select>
 </div>

제목 : <input type="text" name="qnaTitle" placeholder="제목">
내용 : <textarea name="qnaContent" placeholder="내용"></textarea>
<input type="submit" value="등록">
</form>