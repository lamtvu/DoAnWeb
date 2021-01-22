<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<jsp:useBean id="course" scope="request" type="beans.Course"/>

<t:main>
    <jsp:body>

        <div class="container">
            <h1>Chi tiết sản phẩm</h1>
                <p>${course.coursename}</p>
                <p>Tên khóa học</p>
                <p>Tên khóa học</p>
                <p>Tên khóa học</p>
                <p>Tên khóa học</p>
                <p>Tên khóa học</p>
                <p>Tên khóa học</p>
            <div class="d-flex">
                <a name="" id="" class="btn btn-outline-danger" href="${pageContext.request.contextPath}/User/AddWatchList?id=${course.id}" role="button">Add To Watch List</a>
                <a name="" id="" class="btn btn-outline-success" href="${pageContext.request.contextPath}/User/AddToMyCourse?id=${course.id}" role="button">Buy Course</a>
            </div>

        </div>
    </jsp:body>
</t:main>



