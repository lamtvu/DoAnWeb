<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<jsp:useBean id="course" scope="request" type="java.util.List<beans.Course>"/>


<t:main>
    <jsp:body>
        <div class="container">
            <h1>Danh sách yêu thích của tôi</h1>
            <div class="card-body">
                <div class="row">
                    <c:forEach items="${course}" var="c">
                        <div class="col-sm-3">
                            <div class="card mb-3">
                                <img class="card-img-top" src="" alt="">
                                <div class="card-body">
                                    <h5 class="card-title text-center">${c.coursename}</h5>
                                        <%--                                    <p class="card-text">${c.coursename}</p>--%>
                                        <%--                                    <p class="card-text">${c.coursename}</p>--%>
                                        <%--                                    <p class="card-text">${c.id}</p>--%>
                                    <div class="d-flex justify-content-center">
                                        <a name="#" id="" class="btn btn-outline-danger mt-1" href="${pageContext.request.contextPath}/User/DeleteWatchList?id=${c.id}" role="button">
                                            <i class="fa fa-trash" aria-hidden="true"></i> Delete
                                        </a>
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
