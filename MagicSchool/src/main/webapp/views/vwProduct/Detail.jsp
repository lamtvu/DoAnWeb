<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<jsp:useBean id="chapters" type="java.util.List<beans.Chapter>" scope="request"/>
<jsp:useBean id="courses" type="java.util.List<java.util.Map<java.lang.String,java.lang.Object>>" scope="request"/>

<t:main>
    <jsp:attribute name="css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/main.css">
    </jsp:attribute>
    <jsp:attribute name="js">
        <script src="${pageContext.request.contextPath}/public/js/script-detail-product.js"></script>
        <script>
            var video = $('video').get(0);
            $('.table-chapter button').on('click',function (e){
                video.pause();
                $('source').attr('src','${pageContext.request.contextPath}/public/clips/'+$(this).attr('chapterID')+'.mp4')
                video.load();
                video.play();
            })
        </script>
    </jsp:attribute>
    <jsp:body>

<%--        <div class="container">--%>

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

            <div class="product d-flex bg-white mt-5 mb-5 mx-auto position-relative")>
<%--                ${courses.get(0)}--%>
                <img src="${pageContext.request.contextPath}/public/image/${courses.get(0).get("id")}.jpg" style="width: 400px">
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
                        <div style="height: 200px">
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
<%--                            <p class="paragraph ">${c.get("fulldes")}</p>--%>
<%--                            <p class="paragraph " style="display: none; ">${c.get("username")}</p>--%>
                                <p class="paragraph" style="display: none;">${courses.get(0).get("fulldes")}</p>
                                <p class="paragraph" >${courses.get(0).get("username")}</p>
                            </div>
                        </div>
                        <c:if test="${isOwnlist == false}">

                            <div class="buy mt-2 py-3">
                                <a class="btn btn-outline-success mr-5"
                                   href="${pageContext.request.contextPath}/User/AddToMyCourse?id=${c.get("id")}"
                                   role="button ">Buy Course</a>
                                <a class="btn btn-outline-danger ml-5"
                                   href="${pageContext.request.contextPath}/User/AddWatchList?id=${c.get("id")} "
                                   role="button ">Add To Watch
                                    List</a>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>

            </div>
            <div class="d-flex">
                <div class="w-50">
                    <h2 style="color: white">Chapter</h2>
                    <table class="table table-chapter">
                        <c:choose>
                            <c:when test="${isOwnlist == true}">
                                <c:forEach items="${chapters}" var="t">
                                    <tr>
                                        <td>
                                            <button chapterID="${t.id}" class="btn">${t.name}</button>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <c:forEach items="${chapters}" var="t">
                                    <tr>
                                        <td>
                                            <c:choose>
                                                <c:when test="${t.publiOrPrivate == 'public'}">
                                                    <button chapterID="${t.id}" class="btn">${t.name} (free)</button>
                                                </c:when>
                                                <c:otherwise>
                                                    <p class="ml-3">${t.name}</p>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>

                    </table>
                </div>
                <div class="w-50">
                    <video style="width: 100%;height: auto" controls>
                        <source src="${pageContext.request.contextPath}/public/clips/" type="video/mp4">
                    </video>
<%--                    <video width="320" height="240" controls>--%>
<%--                        <source src="${pageContext.request.contextPath}/public/clips/3.mp4" type="video/mp4">--%>
<%--                    </video>--%>
                </div>
            </div>
        </div>
    </jsp:body>
</t:main>



