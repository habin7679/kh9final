<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
    
<form action="write" method="post" enctype="multipart/form-data">
  <div class="row">
                <label>말머리</label>
                <select name="noticeHead" class="form-input fill input-round">
                    <option value="">선택</option>
                    <option>공지</option>
                    <option>이벤트</option>
                </select>
 </div>

제목 : <input type="text" name="noticeTitle" placeholder="제목">
내용 : <textarea name="noticeContent" placeholder="내용"></textarea>
파일 : <input type="file" name="noticeImg" accept=".jpg, .png, .gif, .pdf, .ppt, .txt, .hwp">
<input type="submit" value="등록">
</form>