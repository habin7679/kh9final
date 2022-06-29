<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="memberId" value="${login}"></c:set>
<c:set var="isLogin" value="${memberId != null}"></c:set>
<c:set var="isAdmin" value="${auth == '관리자'}"></c:set>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Yummy Bootstrap Template - Index</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="img/favicon.png" rel="icon">
  <link href="img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"/>
   <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
  <!-- Vendor CSS Files -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="vendor/aos/aos.css" rel="stylesheet">
  <link href="vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="css/main.css" rel="stylesheet">

  <!-- =======================================================
  * Template Name: Yummy - v1.0.0
  * Template URL: https://bootstrapmade.com/yummy-bootstrap-restaurant-website-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>
<style>
    .me{
        margin-left: 500px;
    }
    .ru{
      width: 300px;
    }
    .oi{
      margin-right: 1000px;
    }
</style>

<body>

  <!-- ======= Header ======= -->
  <header id="header" class="header fixed-top d-flex align-items-stretch">
    <div class="container d-flex align-items-stretch ">
      
      <nav id="navbar" class="navbar">
        
          <a href="index.html">
            <img src="img/log.PNG" width="170px" height="120px">
          </a>
        
        <ul>
          <li class="dropdown me"><i class="fa-solid fa-magnifying-glass fa-1x"></i>
            <ul>
              <li>
                <form class="d-flex">
                  <input class="form-control me-sm-1 ru " type="text" placeholder="Search">
                  <button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
                </form>
              </li>
            </ul>
          </li>
          <li class="dropdown"><a href="#"><span>카테고리</span> <i class="bi bi-chevron-down dropdown-indicator"></i></a>
            <ul>
              <li><a href="#">스시</a></li>
              <li><a href="#">디저트</a></li>
              <li><a href="#">소</a></li>
              <li><a href="#">꼬치</a></li>
            </ul>
          </li>  
          <li><a href="#">같이가요</a></li>
          <li class="dropdown"><a href="#"><span>게시판</span> <i class="bi bi-chevron-down dropdown-indicator"></i></a>
            <ul>
              <li><a href="#">문의게시판</a></li>
              <li><a href="#">공지게시판</a></li>
            </ul>
          </li>
        </ul>
      
      
    
      <a href="${pageContext.request.contextPath}/member/login" class="btn-book-a-table me">로그인</a>
      <i class="mobile-nav-toggle mobile-nav-show bi bi-list"></i>
      <i class="mobile-nav-toggle mobile-nav-hide d-none bi bi-x"></i>

      <ul>
        <li class="dropdown"><span>닉네임  </span><i class="fa-solid fa-square-envelope fa-1x"></i>
          <ul>
            <li><a href="#">mypage</a></li>
            <li><a href="#">쪽지함</a></li>
            <li><a href="#">로그아웃</a></li>
          </ul>
        </li>
      </ul>
      </nav>
    </div>

  </header><!-- End Header -->
 