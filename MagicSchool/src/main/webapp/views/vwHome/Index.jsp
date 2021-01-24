<%@page contentType="text/html; charset=utf-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:useBean id="NewCourse" scope="request" type="java.util.List<beans.Course>"/>
<jsp:useBean id="teacher" scope="request" type="java.util.List<beans.User>"/>
<jsp:useBean id="point" scope="request" type="java.util.List<beans.Evaluate>"/>
<jsp:useBean id="field" scope="request" type="java.util.List<beans.Category>"/>

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
        <div class="container mt-5 mb-5">
            <div class="box1">
                <div class="box2">
                    <p>New Course</p>
                </div>
            </div>
            <div class="slider">
                <ul id="autoWidth1" class="cs-hidden">
                    <c:forEach var="c" items="${NewCourse}">
                        <li class="item-a">
                            <div class="box">
                                <div class="slide-img">
                                    <img alt="" src="">
                                    <div class="overlay">
                                        <a href="${pageContext.request.contextPath}/Course/Detail?id=${c.id}" class="buy-btn">Detail</a>
                                    </div>
                                </div>
                                <div class="detail-box">
                                    <div class="type">
                                        <p class="name-course">${c.coursename}</p>
<%--                                        <c:forEach var="f" items="${field}">--%>
<%--                                            <c:if test="${c.catID == f.id}">--%>
<%--                                                <p>${f.name}</p>--%>
<%--                                            </c:if>--%>
<%--                                        </c:forEach>--%>
                                        <p>ww</p>
                                        <c:forEach var="t" items="${teacher}">
                                            <c:if test="${c.id == t.id}">
                                                <span class="teacher">${t.name}</span>
                                            </c:if>

                                        </c:forEach>

                                        <div class="rating d-flex">
                                            <div class="star-group">
                                                <div class="stars-outer">
                                                    <div class="stars-iner">
                                                    </div>
                                                </div>
                                            </div>

                                                    <span>99</span>


                                        </div>
                                        <span class="price">$ ${c.price}</span>
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






