<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<jsp:useBean id="course" scope="request" type="beans.Course"/>

<t:main>
    <jsp:body>

        <div class="container">
<%--            <h1>Detail Course</h1>--%>
<%--                <p>${course.coursename}</p>--%>
<%--                <p>Tên khóa học</p>--%>
<%--                <p>Tên khóa học</p>--%>
<%--                <p>Tên khóa học</p>--%>
<%--                <p>Tên khóa học</p>--%>
<%--                <p>Tên khóa học</p>--%>
<%--                <p>Tên khóa học</p>--%>
<%--            <div class="d-flex">--%>
<%--                <a name="" id="" class="btn btn-outline-danger" href="${pageContext.request.contextPath}/User/AddWatchList?id=${course.id}" role="button">Add To Watch List</a>--%>
<%--                <a name="" id="" class="btn btn-outline-success" href="${pageContext.request.contextPath}/User/AddToMyCourse?id=${course.id}" role="button">Buy Course</a>--%>
<%--            </div>--%>
        <div class="card">
            <div class="card-header text-center text-danger">
                ${course.coursename}
            </div>
            <div class ="card-body">
                <img src="">
                <p>
                        ${course.tinyDes}
                </p>
                <p>
                        ${course.fullDes}
                </p>

                <p>Điểm đánh giá và số lượng</p>
                <p>
                        ${course.price}
                </p>
               <p>
                       ${course.updateDate}
               </p>

            </div>
            <div class="d-flex">
                <a name="" id="" class="btn btn-outline-danger" href="${pageContext.request.contextPath}/User/AddWatchList?id=${course.id}" role="button">Add To Watch List</a>
                <a name="" id="" class="btn btn-outline-success" href="${pageContext.request.contextPath}/User/AddToMyCourse?id=${course.id}" role="button">Buy Course</a>
            </div>
        </div>
        </div>
    </jsp:body>
</t:main>



