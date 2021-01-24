<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<jsp:useBean id="categories" type="java.util.List<java.util.Map<java.lang.String,java.lang.Object>>" scope="request"/>
<%--<jsp:useBean id="product" scope="request" type="java.util.List<beans.Course>"/>--%>
<t:main>
    <jsp:body>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/public/slider/styleIndex.css">
        <div class="container">
            <h1>Category by cat</h1>
            <div class="card-body">
                <div class="row">

                    <c:forEach items="${categories}" var="c">
                            <div class="col-sm-3 mb-3">
                                <div class="" style="border: 1px dashed #7a3030">
                                    <div class="box-head">
                                        <img src="">
                                    </div>
                                    <div class="detail-box">
                                        <div class="type">
                                            <h5 class="name-course">${c.get("coursename")}</h5>
                                            <p>${c.get("catname")}</p>
                                            <p>${c.get("username")}</p>
                                            <div class=d-flex">
                                            <span class="badge bg-success"
                                                  style="margin: 0;">${c.get("point")}/10</span>
                                                <span style="margin-left: 20px;"
                                                      class="badge bg-danger">${c.get("num")} review</span>
                                            </div>
                                            <span class="price">$ ${c.get("price")}</span>
                                            <span class="seller">Bestseller</span>
                                            <div class="d-flex justify-content-center">
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
                                        <a class="page-link" href="?id=${CatIDd}&page=${p}">${p}</a>
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
