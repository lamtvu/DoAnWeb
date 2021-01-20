<%@page contentType="text/html; charset=utf-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:useBean id="course" scope="request" type="java.util.List<beans.Course>"/>
<jsp:useBean id="users" scope="request" type="java.util.List<beans.User>"/>
<jsp:useBean id="evaluate" scope="request" type="java.util.List<beans.Evaluate>"/>


<t:main>
<<<<<<< HEAD
=======
    <jsp:attribute name="css">
         <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
            <link rel="stylesheet"
                  href="${pageContext.request.contextPath}/public/owlcarousel/assets/owl.carousel.min.css">
            <link rel="stylesheet"
                  href="${pageContext.request.contextPath}/public/owlcarousel/assets/owl.theme.default.min.css">
            <script src="https://code.jquery.com/jquery-3.5.1.js"
                    integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
            <script src="${pageContext.request.contextPath}/public/owlcarousel/owl.carousel.min.js"></script>
    </jsp:attribute>
    <jsp:attribute name="js">
        <script>
            $('.owl-carousel').owlCarousel({
                loop: true,
                margin: 10,
                nav: true,
                responsive: {
                    0: {
                        items: 1
                    },
                    600: {
                        items: 2
                    },
                    1000: {
                        items: 4
                    }
                }
            })
        </script>
    </jsp:attribute>
>>>>>>> 847944f977e4d844438998145eb95648cb2cee72
    <jsp:body>
        <div class="container">
            <div class="box">
                <div class="box-head mb-2 border-bottom border-danger">
                    <h5 class="d-inline-block bg-danger m-0 p-2 text-white">Khóa học nổi bật</h5>
                </div>
                <div class="box-body">
                    <div class="owl-carousel owl-theme">
                        <c:forEach var="c" items="${course}">
                            <div class="item">
                                <div class="card">
                                    <img class="card-img-top" src="" alt="">
                                    <div class="card-body">
                                        <h4 class="card-title">${c.coursename}</h4>
                                        <p class="card-text m-0">Lĩnh vực</p>
                                        <c:forEach var="n" items="${users}">
                                            <c:if test="${c.teacherID == n.id}">
                                                <p class="card-text text-muted m-0">Giảng viên: ${n.name}</p>
                                            </c:if>
                                        </c:forEach>
                                        <c:forEach var="p" items="${evaluate}">
                                            <c:if test="${c.id == p.courseID}">
                                                <p class="card-text m-0">Điểm: ${p.point} + SL đánh giá: ${c.evaluateID}</p>
                                            </c:if>
                                        </c:forEach>

                                        <p class="card-text text-danger"> $<fmt:formatNumber  value="${c.price}" type="number"/> </p>
                                        <div class="detail-buy d-flex justify-content-between">
                                            <a name="" id="" class="btn btn-primary" href="${pageContext.request.contextPath}/Course/Detail?id=${c.id}" role="button"><i class="fa fa-eye"
                                                                                                               aria-hidden="true"></i>&nbsp Chi tiết</a>
                                            <a name="" id="" class="btn btn-danger" href="#" role="button"><i
                                                    class="fa fa-shopping-cart" aria-hidden="true"></i>&nbsp Đăng kí</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>

                            <script src="https://code.jquery.com/jquery-3.5.1.js"
                                    integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
                                    crossorigin="anonymous">

                            </script>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </jsp:body>
<<<<<<< HEAD
=======

>>>>>>> 847944f977e4d844438998145eb95648cb2cee72
</t:main>






