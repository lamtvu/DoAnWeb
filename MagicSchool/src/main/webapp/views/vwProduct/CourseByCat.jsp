<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<jsp:useBean id="categories" type="java.util.List<java.util.Map<java.lang.String,java.lang.Object>>" scope="request"/>

<t:main>
    <jsp:body>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/public/slider/styleIndex.css">
        <div class="container">
            <h1>Category by cat</h1>
            <div class="card-body">
                <div class="row">
                    <c:forEach items="${categories}" var="c">
                        <div class="col-sm-3 mb-3">
                            <div class="" style="border: 1px dashed red">
                                <div class="box-head">
                                    <img src="">
                                </div>
                                <div class="detail-box">
                                    <div class="type">
                                        <h5 class="name-course">${c.get("coursename")}</h5>
                                        <p>${c.get("catname")}</p>
                                        <p>${c.get("username")}</p>
                                        <div class=d-flex">
                                            <span class="badge bg-success" style="margin: 0;">${c.get("point")}/10</span>
                                            <span style="margin-left: 20px;"
                                                  class="badge bg-danger">${c.get("num")} review</span>
                                        </div>
                                        <span class="price">$ ${c.get("price")}</span>
                                        <span class="seller">Bestseller</span>
                                        <div class="d-flex justify-content-center">
                                            <a name="" id="" class="btn btn-outline-info" href="${pageContext.request.contextPath}/Course/Detail?id=${c.get("id")}" role="button">
                                                <i class="fa fa-eye" aria-hidden="true"></i> Detail</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>

                </div>
            </div>

        </div>
    </jsp:body>
</t:main>
