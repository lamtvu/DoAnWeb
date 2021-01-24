<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>



<t:main>
    <jsp:body>
        <div class="card">
        <div class="card-header">

        </div>
        <c:choose>
            <c:when test="${course.size() == 0}">
                <div class="card-body">
                    <p class="card-text">Không có dữ liệu.</p>
                </div>
            </c:when>
            <c:otherwise>
                <div class="card-body">
                <div class="row">
                <c:forEach var="c" items="${course}">
                    <div class="col-sm-4 mb-3">
                        <div class="card h-100">
                            <div class="card-body">
                                <h6 class="card-title">${c.course_name}</h6>
                                <h5 class="card-title text-danger">
                                    <fmt:formatNumber value="${c.price}" type="number"/>
                                </h5>
                                <p class="card-text">${c.name}</p>
                                <p class="card-text">${c.rating} &nbsp; ${c.num_cmt}</p>
                                <p class="card-text">${c.cat_name}</p>
                                <p class="card-text">${c.price}</p>
                            </div>
                            <div class="card-footer">
                                <a class="btn btn-sm btn-outline-primary" href="${pageContext.request.contextPath}/Course/Detail?id=${c.course_id}" role="button">
                                    <i class="fa fa-eye" aria-hidden="true"></i>
                                    Details
                                </a>
                                <a class="btn btn-sm btn-outline-success" href="#" role="button">
                                    <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                                    Add to cart
                                </a>
                            </div>
                        </div>
                    </div>
                </c:forEach>

            </c:otherwise>
        </c:choose>
        </div>
    </jsp:body>
</t:main>