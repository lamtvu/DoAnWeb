<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<jsp:useBean id="course" scope="request" type="java.util.List<beans.Course>"/>
<t:main>
    <jsp:body>
        <div class="container mt-5">
            <h3 class="text-center" style="font-weight: 700;color: #c38bff">My Course</h3>
            <div class="card-body">
                <div class="row">
                    <c:forEach items="${course}" var="c">
                        <div class="col-sm-3">
                            <div class="card mb-3">
                                <img style="height: 150px" class="card-img-top" src="${pageContext.request.contextPath}/public/image/${c.id}.jpg" alt="">
                                <div class="card-body">
                                    <h5 class="card-title d-inline-block">${c.coursename}</h5>
                                    <c:choose>
                                        <c:when test="${c.complete=='yes'}">
                                            <span class="badge bg-secondary" style="font-size: 15px">complete</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="badge bg-secondary" style="font-size: 15px">uncomplete</span>
                                        </c:otherwise>
                                    </c:choose>
                                    <p>${c.tinyDes}</p>
                                    <div class="d-flex justify-content-center">
                                        <a name="#" id="" class="btn btn-outline-success" href="${pageContext.request.contextPath}/Course/Detail?id=${c.id}" role="button">
                                            <i class="fa fa-arrow-circle-right" aria-hidden="true"></i> Learn</a>
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
