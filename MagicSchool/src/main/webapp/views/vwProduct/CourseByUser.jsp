
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<jsp:useBean id="course" scope="request" type="java.util.List<beans.Course>"/>
<t:main>
    <jsp:body>
        <div class="container">
            <h1>Khóa học của tôi</h1>
            <div class="card-body">
                <div class="row">
                    <c:forEach items="${course}" var="c">
                        <div class="col-sm-3">
                            <div class="card mb-3">
                                <img class="card-img-top" src="" alt="">
                                <div class="card-body">
                                    <h5 class="card-title">${c.coursename}</h5>
                                    <p class="card-text">${c.id}</p>
                                    <p class="card-text">${c.tinyDes}</p>
                                    <p class="card-text">${c.fullDes}</p>
                                    <div class="d-flex">
                                        <a name="#" id="" class="btn btn-warning" href="" role="button">Learn</a>
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
