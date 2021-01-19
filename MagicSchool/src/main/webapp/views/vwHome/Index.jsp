
<%@page contentType="text/html; charset=utf-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:main>
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
    <jsp:body>
        <div class="container">
            <div class="box">
                <div class="box-head mb-2 border-bottom border-danger">
                    <h5 class="d-inline-block bg-danger m-0 p-2 text-white">Khóa học nổi bật</h5>
                </div>
                <div class="box-body">
                    <div class="owl-carousel owl-theme">
                        <div class="item">
                            <div class="card">
                                <img class="card-img-top" src="bai-tap-dau-cham-hoi-lop-2-2-removebg-preview.png"
                                     alt="">
                                <div class="card-body">
                                    <h4 class="card-title">Title</h4>
                                    <p class="card-text m-0">Lĩnh vực</p>
                                    <p class="card-text text-muted m-0">Giảng viên</p>
                                    <p class="card-text m-0">Đánh giá</p>
                                    <p class="card-text text-danger">$ Giá</p>
                                    <div class="detail-buy d-flex justify-content-between">
                                        <a name="" id="" class="btn btn-primary" href="#" role="button"><i
                                                class="fa fa-eye"
                                                aria-hidden="true"></i>&nbsp Chi tiết</a>
                                        <a name="" id="" class="btn btn-danger" href="#" role="button"><i
                                                class="fa fa-shopping-cart" aria-hidden="true"></i>&nbsp Mua ngay</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </jsp:body>

</t:main>

