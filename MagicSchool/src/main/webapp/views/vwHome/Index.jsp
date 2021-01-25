<%@page contentType="text/html; charset=utf-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:useBean id="courses" type="java.util.List<java.util.Map<java.lang.String,java.lang.Object>>" scope="request"/>
<jsp:useBean id="coursesFeature" type="java.util.List<java.util.Map<java.lang.String,java.lang.Object>>" scope="request"/>
<t:main>
    <jsp:attribute name="css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/public/slider/styleIndex.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/public/slider/Lightsliderfiles/lightslider.css">
    </jsp:attribute>
    <jsp:attribute name="js">
        <script src="${pageContext.request.contextPath}/public/slider/script_slider.js"></script>
        <script src="${pageContext.request.contextPath}/public/slider/Lightsliderfiles/lightslider.js"></script>
    </jsp:attribute>
    <jsp:body>
        <jsp:include page="../parital/billboard.jsp"/>
        <div class="container mt-5 mb-5">
            <div class="box1">
                <div class="box2">
                    <p>New Course</p>
                </div>
            </div>
            <div class="slider mb-5">
                <ul id="autoWidth1" class="cs-hidden">
                    <c:forEach var="c" items="${courses}">
                        <li class="item-a">
                            <div class="box">
                                <div class="slide-img">
                                    <img alt="" src="${pageContext.request.contextPath}/public/image/${c.id}.jpg">
                                    <div class="overlay">
                                        <a href="${pageContext.request.contextPath}/Course/Detail?id=${c.get("id")}" class="buy-btn">Detail</a>
                                    </div>
                                </div>
                                <div class="detail-box">
                                    <div class="type">
                                        <p class="name-course">${c.get("coursename")}</p>
                                        <p>${c.get("catname")}</p>
                                        <span class="teacher">${c.get("username")}</span>
                                        <div class="rating d-flex">
                                            <span class="badge bg-success" style="margin: 0;">
                                                ${c.get("point")}/10
                                            </span>
                                            <span style="margin-left: 20px;" class="badge bg-danger">${c.get("num")} review</span>
                                        </div>
                                        <span class="price">$ ${c.get("price")}</span>
                                        <span class="seller">Bestseller</span>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </c:forEach>
                </ul>
            </div>


            <div class="box1">
                <div class="box2">
                    <p>Feature Course</p>
                </div>
            </div>
            <div class="slider mb-5">
                <ul id="autoWidth" class="cs-hidden">
                    <c:forEach var="c" items="${coursesFeature}">
                        <li class="item-a">
                            <div class="box">
                                <div class="slide-img">
                                    <img alt="" src="${pageContext.request.contextPath}/public/image/${c.id}.jpg">
                                    <div class="overlay">
                                        <a href="${pageContext.request.contextPath}/Course/Detail?id=${c.get("id")}" class="buy-btn">Detail</a>
                                    </div>
                                </div>
                                <div class="detail-box">
                                    <div class="type">
                                        <p class="name-course">${c.get("coursename")}</p>
                                        <p>${c.get("catname")}</p>
                                        <span class="teacher">${c.get("username")}</span>
                                        <div class="rating d-flex">
                                            <span class="badge bg-success" style="margin: 0;">
                                                ${c.get("point")}/10
                                            </span>
                                            <span style="margin-left: 20px;" class="badge bg-danger">${c.get("num")} review</span>
                                        </div>
                                        <span class="price">$ ${c.get("price")}</span>
                                        <span class="seller">Bestseller</span>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </c:forEach>
                </ul>
            </div>

        </div>
    </jsp:body>
</t:main>






