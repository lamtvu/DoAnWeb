<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<jsp:useBean id="courses" type="java.util.List<java.util.Map<java.lang.String,java.lang.Object>>" scope="request"/>

<t:main>
    <jsp:attribute name="js">
        <script src="${pageContext.request.contextPath}/public/js/script-detail-product.js"></script>
    </jsp:attribute>
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
        <div class="container d-flex justify-content-center align-content-center flex-column"
             style="background: linear-gradient(to left, #e056fd, #7ed6df);;">
            <div class="product d-flex bg-white mt-5 mb-5 mx-auto">
                <!-- <img src="bai-tap-dau-cham-hoi-lop-2-2.jpg"></img> -->
                <div class="information mx-5">
                    <c:forEach var="c" items="${courses}">
                        <h1 class="p-4 text-center">${c.get("coursename")}</h1>


                        <div class="rating d-flex">
                            <p class="badge bg-success">${c.get("point")}/10</p>
                            <p class="badge bg-warning mx-3">${c.get("num")} review</p>
                        </div>
                        <p>${c.get("tinydes")}</p>
                        <p style="font-weight: 700;">$ ${c.get("price")}</p>
                        <span class="badge bg-secondary d-inline-block">${c.get("updatedate")}</span>
                        <div id="more-infor" class="d-flex align-content-center justify-content-center ">
                            <p class="choose px-4 "
                               style="color:black ; border-bottom: 2px solid hotpink ; padding-bottom: 6px; cursor: pointer ">
                                Full Description
                            </p>
                            <p class="choose px-4 " style="cursor: pointer">
                                Teacher
                            </p>
                        </div>
                        <div id="more-info-content ">
                            <p class="paragraph ">${c.get("fulldes")}</p>
                            <p class="paragraph " style="display: none; ">${c.get("username")}</p>
                        </div>

                        <div class="buy mt-2 py-3">
                            <a name=" " id=" " class="btn btn-outline-success mr-5"
                               href="${pageContext.request.contextPath}/User/AddToMyCourse?id=${c.get("id")}"
                               role="button ">Buy Course</a>
                            <a name=" " id=" " class="btn btn-outline-danger ml-5"
                               href="${pageContext.request.contextPath}/User/AddWatchList?id=${c.get("id")} "
                               role="button ">Add To Watch
                                List</a>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </jsp:body>
</t:main>



