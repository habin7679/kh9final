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
			<c:forEach var="storeDto" items="${list}">
              <div class="col-lg-4 menu-item">
              <c:choose>
              <c:when test="${!noAttach }">
              <img src="${pageContext.request.contextPath}/attachment/download?attachmentNo=${sAttach}" class="menu-img img-fluid" >
              </c:when>
              <c:otherwise>
              <img src="${pageContext.request.contextPath}/resources/img/logog.PNG" width="50%" height="750">
            </c:otherwise>
             </c:choose>
              <h4>${storeDto.storeName}</h4>
                <p class="ingredients">
                  ${storeDto.storeAddress}
                  </p>
                <p class="price">
                ￦ ${storeDto.storeLunchTime}
                </p>
              </div>
              </c:forEach>
              </div>
              </div>
              </div>
              </div>
              </section>
 <jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include> 