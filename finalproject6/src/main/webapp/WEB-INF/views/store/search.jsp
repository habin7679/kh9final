<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- ${list} --%>
 <section id="menu" class="menu">
      <div class="container" data-aos="fade-up">
	
        <div class="section-header">
          <h2>store</h2>
          <p>Enjoy <span>Yummy Food</span></p>
        </div>

        <div class="tab-content" data-aos="fade-up" data-aos-delay="300">
          <div class="tab-pane fade active show" id="menu-starters">

            <div class="row gy-5">
			<c:forEach var="storeDto" items="${list}" varStatus="status">
              <div class="col-lg-4 menu-item">
             <c:choose>
              <c:when test="${sAttachList[status.index] != 0 }">
              <a href="${pageContext.request.contextPath}/store/detail?storeNo=${storeDto.storeNo}">
              <img src="${pageContext.request.contextPath}/attachment/download?attachmentNo=${sAttachList[status.index]}" class="menu-img img-fluid">
              </a>
              </c:when>
              <c:otherwise>
              <a href="${pageContext.request.contextPath}/store/detail?storeNo=${storeDto.storeNo}">
              <img src="${pageContext.request.contextPath}/img/mainMap.png" class="menu-img img-fluid">
              </a>
            </c:otherwise>
             </c:choose>
              <h4>${storeDto.storeName}</h4>
                <p class="ingredients">
                  ${storeDto.storeAddress} <p class="ingredients" style="font-size:13px;">
				<i class="fa-solid fa-heart" style="color:red;"></i> ${storeDto.storeLikeCount}</p>
               
              </div>
              </c:forEach>
              </div>
              </div>
              </div>
              </div>
              </section>
 <jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include> 