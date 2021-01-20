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
        </div>
    </jsp:body>
</t:main>



