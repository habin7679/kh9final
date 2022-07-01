<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<form action="write" method="post">
제목 : <input type="text" name="togetherTitle" placeholder="제목">
내용 : <textarea name="togetherContent" placeholder="내용"></textarea>
<input type="submit" value="등록">
</form>