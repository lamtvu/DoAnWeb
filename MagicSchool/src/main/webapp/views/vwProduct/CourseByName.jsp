<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<jsp:useBean id="coursename" type="java.util.List<java.util.Map<java.lang.String,java.lang.Object>>" scope="request"/>
<t:main>
    <jsp:body>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/public/slider/styleIndex.css">
        <div class="container mt-5">
            <h3 class="text-center" style="font-weight: 700;color: #c38bff">Your Result</h3>
            <div class="card-body">
                <div class="row">
                    <c:forEach items="${coursename}" var="c">
                        <div class="col-sm-3 mb-3">
                            <div class="" style="border: 1px dashed #7a3030">

                                <img style="height: 150px;width: 100%;" src="${pageContext.request.contextPath}/public/image/${c.get("id")}.jpg">

                                <div class="detail-box">
                                    <div class="type">
                                        <h5 class="name-course">${c.get("coursename")}</h5>
                                        <p>${c.get("catname")}</p>
                                        <p class="text-muted" style="font-size: 10px">${c.get("username")}</p>
                                        <div class=d-flex">
                                            <span class="badge bg-success"
                                                  style="margin: 0;">${c.get("point")}/10</span>
                                            <span style="margin-left: 20px;"
                                                  class="badge bg-danger">${c.get("num")} review</span>
                                        </div>
                                        <span class="price">$ ${c.get("price")}</span>
                                        <span class="seller">Bestseller</span>
                                        <div class="mt-2">
                                            <a name="" id="" class="btn btn-outline-info"
                                               href="${pageContext.request.contextPath}/Course/Detail?id=${c.get("id")}"
                                               role="button">
                                                <i class="fa fa-eye" aria-hidden="true"></i> Detail</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
<%--            <div class="card-footer d-flex justify-content-center">--%>
<%--                <nav>--%>
<%--                    <ul class="pagination">--%>
<%--                        <li class="page-item">--%>
<%--                            <a class="page-link" href="#" tabindex="-1">--%>
<%--                                <i class="fa fa-fast-backward" aria-hidden="true"></i>--%>
<%--                            </a>--%>
<%--                        </li>--%>
<%--                        <c:forEach var="p" items="${pages}">--%>
<%--                            <c:choose>--%>
<%--                                <c:when test="${p == currentPage}">--%>
<%--                                    <li class="page-item active">--%>
<%--                                        <a class="page-link" href="">${p}</a>--%>
<%--                                    </li>--%>
<%--                                </c:when>--%>
<%--                                <c:otherwise>--%>
<%--                                    <li class="page-item">--%>
<%--                                        <a class="page-link" href="?id=${CatIDd}&page=${p}">${p}</a>--%>
<%--                                    </li>--%>
<%--                                </c:otherwise>--%>
<%--                            </c:choose>--%>
<%--                        </c:forEach>--%>
<%--                        <li class="page-item">--%>
<%--                            <a class="page-link" href="#">--%>
<%--                                <i class="fa fa-fast-forward" aria-hidden="true"></i>--%>
<%--                            </a>--%>
<%--                        </li>--%>
<%--                    </ul>--%>
<%--                </nav>--%>
<%--            </div>--%>
            <div class="card-footer d-flex justify-content-center">
                <nav>
                    <ul class="pagination">
                        <li class="page-item">
                            <a class="page-link" href="#" tabindex="-1">
                                <i class="fa fa-fast-backward" aria-hidden="true"></i>
                            </a>
                        </li>
                        <c:forEach var="p" items="${pages}">
                            <c:choose>
                                <c:when test="${p == currentPage}">
                                    <li class="page-item active">
                                        <a class="page-link" href="">${p}</a>
                                    </li>
                                </c:when>
                                <c:otherwise>
                                    <li class="page-item">
                                        <a class="page-link" href="?search=${CatIDd}&page=${p}">${p}</a>
                                    </li>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                        <li class="page-item">
                            <a class="page-link" href="#">
                                <i class="fa fa-fast-forward" aria-hidden="true"></i>
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
    </jsp:body>
</t:main>
