<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<jsp:useBean id="chapters" type="java.util.List<beans.Chapter>" scope="request"/>
<jsp:useBean id="courses" type="java.util.List<java.util.Map<java.lang.String,java.lang.Object>>" scope="request"/>
<jsp:useBean id="evaluates" type="java.util.List<java.util.Map<java.lang.String,java.lang.Object>>" scope="request"/>
<jsp:useBean id="myEvaluate" type="java.util.List<java.util.Map<java.lang.String,java.lang.Object>>" scope="request"/>
<t:main>
    <jsp:attribute name="css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/main.css">
        <link href="//cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">
        <link href="//cdn.quilljs.com/1.3.6/quill.bubble.css" rel="stylesheet">
    </jsp:attribute>
    <jsp:attribute name="js">
        <script src="//cdn.quilljs.com/1.3.6/quill.js"></script>
        <script src="//cdn.quilljs.com/1.3.6/quill.min.js"></script>
        <script>
            var toolbarOptions = [
                ['bold', 'italic', 'underline'],
                [{ 'list': 'ordered' }, { 'list': 'bullet' }],
                [{ 'size': ['small', false, 'large'] }],
                [{ 'header': 1 }, { 'header': 2 }],
                [{ 'color': [] }],
                [{ 'align': [] }],
            ];
            // var quill2 = new Quill('#editor2', {
            //     modules: {
            //         toolbar: toolbarOptions
            //     },
            //     theme: 'snow'
            // });
            var quill = new Quill('.editor', {
                modules: {
                    toolbar: toolbarOptions
                },
                theme: 'snow'
            });
            quill.on('text-change',function (data,source){
                $('.feedback').val(quill.root.innerHTML);
                console.log($('.feedback').val());
            })
            window.addEventListener("scroll", (event) => {
                let scroll = this.scrollY;
                if(scroll>70)
                {
                    $('.table-fixed-magic-school').css('display','block');
                    $('#course-box-magic-school').css('position','fixed');
                }
                else{
                    $('.table-fixed-magic-school').css('display','none');
                    $('#course-box-magic-school').css('position','absolute');
                }
            })
            let video = $('video').get(0);
            $('.open-video-magic-school').on('click',function(e){
                $('video source').attr('src','${pageContext.request.contextPath}/public/clips/'+$(this).attr('chapterID')+'.mp4')
                video.load();
                $('.background-opacity').css('display','block');
                $('.box-video-magic-school').css('display','block');
            })
            $('.background-opacity button').on('click',function (e){
                video.pause();
                $('.box-video-magic-school').css('display','none');
                $('.background-opacity').css('display','none');
            })
            $('.edit-review-magic-school').on('click',function (e){
                $('.edit-review-box-magic-school').css('display','block');
                $('.my-review-box-magic-school').css('display','none');
            })
            $('.cancel-edit-review-magic-school').on('click',function (e){
                $('.edit-review-box-magic-school').css('display','none');
                $('.my-review-box-magic-school').css('display','block');
            })
        </script>
    </jsp:attribute>
    <jsp:body>
        <c:if test="${auth == false}">
            <div class="d-none">
                <div class="editor"></div>
            </div>
        </c:if>
        <div class="position-fixed box-video-magic-school" style="display: none;left:50%;top:20%;transform: translate(-50%);z-index: 10;background-color: lightslategrey">
            <video controls muted width="480" height="360" poster="${pageContext.request.contextPath}/public/image/${courses.get(0).get("id")}.jpg">
                <source src="" type="video/mp4">
            </video>
        </div>

        <div class="container-fluid position-fixed table-fixed-magic-school" style="box-shadow: 1px 1px 10px #192a56;color:white;display: none;background-color: #182C61; top:0;z-index: 5;height: 50px">
            <p style="font-weight: bold; color: white; margin: 0">${courses.get(0).get("coursename")}<p>
            <span class="badge bg-warning">${courses.get(0).get("point")}/10</span>
            <span class="mx-3">(${courses.get(0).get("num")}) review</span>
        </div>
        <div class="container-fluid position-relative" style="background-color: #182C61;">
            <i class="icon-float-magic-school fas fa-code" style="left: 5%;"></i>
            <i class="icon-float-magic-school fas fa-pen" style="left: 40%;animation-delay: 3s"></i>
            <i class="icon-float-magic-school fas fa-laptop-code"style="left:55%;animation-delay: 10s"></i>
            <i class="icon-float-magic-school fas fa-magic" style="left: 90%;animation-delay: 6s"></i>
            <div  style="color: white;position: relative" class="py-3 container-lg-magic-school">
                <div class="w-50 pl-5 ml-5">
                    <p>>${courses.get(0).get("catname")}</p>
                    <p style="font-weight: bold; font-size: 30px">${courses.get(0).get("coursename")}</p>
                    <p style="">${courses.get(0).get("tinydes")}</p>
                    <p>
                        <span class="badge bg-warning">${courses.get(0).get("point")}/10</span>
                        <span class="mx-3">(${courses.get(0).get("num")}) review</span>
                    </p>
                    <p>
                        Create by <span style="font-weight: 600;color: #60a3bc;">${courses.get(0).get("username")}</span>
                    </p>
                    <p>
                        <i class="fas fa-exclamation"></i>
                        <span>last update </span><span style="color:#fad390">${courses.get(0).get("updatedate")}</span>
                    </p>
                    <c:choose>
                        <c:when test="${courses.get(0).get('complete') == 'yes'}">
                            <span class="badge bg-secondary">complete</span>
                        </c:when>
                        <c:otherwise>
                            <span class="badge bg-secondary">uncomplete</span>
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${isWatchList == false}">
                            <a class="btn btn-outline-light" href="${pageContext.request.contextPath}/User/AddWatchList?id=${courses.get(0).get("id")}" role="button" >
                                WishList
                                <i class="fas fa-heart"></i>
                            </a>
                        </c:when>
                        <c:otherwise>
                            <a class="btn btn-outline-light" href="${pageContext.request.contextPath}/User/DeleteWatchList?id=${courses.get(0).get("id")}" role="button" >
                                WishList
                                <i class="fas fa-heart text-danger"></i>
                            </a>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
            <div id="course-box-magic-school" style="width:20%; background-color:white;position: absolute;left:60%;top:5%;z-index: 5;box-shadow:1px 1px 10px #8d8c86">
                <div class="d-flex align-items-center" style="flex-direction: column">
                    <img style="width: 100%;padding:5px" src="${pageContext.request.contextPath}/public/image/${courses.get(0).get("id")}.jpg">
                    <c:if test="${isOwnlist == false}">
                        <p style="align-self: start;font-weight: bold;font-size: 30px;margin-left: 20px">
                            $${courses.get(0).get("price")}
                            <span style="color: #8d8c86;font-size: 15px;font-weight: 400"> for the course</span>
                        </p>
                        <a class="btn btn-outline-info w-75" href="${pageContext.request.contextPath}/User/AddToMyCourse?id=${courses.get(0).get("id")} ">Buy now</a>
                    </c:if>
                    <hr style="color:black;width: 100%">
                    <p style="margin:10px">
                        <span style="font-weight: bold;font-size: 20px;">Training 5 or more people?</span><br>
                        <span>Get your team access to 5,000+ top Udemy courses anytime, anywhere.</span>
                    </p>
                </div>
            </div>
        </div>
        <div class="container-lg-magic-school pb-5">
            <div class="w-50 pl-5 ml-5">
                    <div class="card-header card my-3">
                        <p style="font-weight: bold;font-size: 25px;">Why you'll learn</p>
                        <ul>
                            <li>Quality lessons </li>
                            <li>Licensed teachers</li>
                            <li>can study anywhere</li>
                            <li>There are more than 50000 people trusted </li>
                        </ul>
                    </div>
                <p style="font-weight: bold; font-size: 25px;">Course content</p>
                <c:choose>
                    <c:when test="${isOwnlist == true}">
                        <c:forEach items="${chapters}" var="t">
                            <div class="card card-header">
                                <button chapterID="${t.id}" class="btn open-video-magic-school"style="text-align: left" >${t.name}</button>
                            </div>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <c:forEach items="${chapters}" var="t">
                            <c:choose>
                                <c:when test="${t.publiOrPrivate == 'public'}">
                                    <div class="card-header card">
                                        <button chapterID="${t.id}" class="btn open-video-magic-school" style="text-align: left">${t.name} (preview)</button>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <div class="card-header card">
                                        <p  style="text-align: left">${t.name}</p>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
                <div>
                    <p style="font-weight:bold;font-size: 25px">Teacher</p>
                    <p>${courses.get(0).get("information")}</p>
                </div>
                <div>
                    <p style="font-weight:bold;font-size: 25px">Description</p>
                    <p>${courses.get(0).get("fulldes")}</p>
                </div>
                <div>
                    <p style="font-weight: bold;font-size: 25px">Reviews</p>
                    <c:if test="${auth==true && isOwnlist == true}">
                        <c:choose>
                            <c:when test="${myEvaluate.size()==0}">
                                <div>
                                    <p style="font-size: 15px;font-weight: bold;margin: 0">
                                        Your review
                                    </p>
                                    <form action="${pageContext.request.contextPath}/Course/AddEvaluate" method="post">
                                        <div class="editor" style="min-height: 200px"></div>
                                        <input type="hidden" name="feedback" class="feedback">
                                        <input type="hidden" name="courseID" value="${courses.get(0).get("id")}">
                                        <div class="d-flex justify-content-between">
                                            <button class="btn btn-outline-primary m-2">review</button>
                                            <select name="point" class="m-3">
                                                <option value="0">zero points</option>
                                                <option value="1">one points</option>
                                                <option value="2">two points</option>
                                                <option value="3">three points</option>
                                                <option value="4">four points</option>
                                                <option value="5">five points</option>
                                                <option value="6">six points</option>
                                                <option value="7">seven points</option>
                                                <option value="8">eight points</option>
                                                <option value="9">nine points</option>
                                                <option value="10">ten points</option>
                                            </select>
                                        </div>
                                    </form>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div>
                                    <div class="position-relative my-review-box-magic-school">
                                        <div class="d-flex justify-content-center">
                                            <div class="mr-3">
                                                <div style="color:white;text-align: center;line-height: 50px; width: 50px;height: 50px;border-radius: 50%; background-color: #182C61">
                                                    <i class="fas fa-user text-light"></i>
                                                </div>
                                            </div>
                                            <div style="width: 90%">
                                                <p style="font-size: 15px;font-weight: bold;margin: 0">
                                                    Your review
                                                </p>
                                                <span class="badge bg-warning">${myEvaluate.get(0).get("point")}/10</span>
                                                <p>
                                                        ${myEvaluate.get(0).get("feedback")}
                                                </p>
                                            </div>
                                        </div>
                                        <button class="btn btn-outline-info position-absolute edit-review-magic-school" style="top:0;right:0">Edit</button>
                                    </div>
                                    <div style="display: none" class="edit-review-box-magic-school">
                                        <p style="font-size: 15px;font-weight: bold;margin: 0">
                                            Your review
                                        </p>
                                        <form action="${pageContext.request.contextPath}/Course/UpdateEvaluate" method="post">
                                            <input type="hidden" name="feedback" class="feedback">
                                            <input type="hidden" name="courseID" value="${courses.get(0).get("id")}">
                                            <div class="editor" style="min-height: 200px"></div>
                                            <div class="d-flex justify-content-between">
                                                <div>
                                                    <button class="btn btn-outline-primary m-2">Apply</button>
                                                    <button class="btn btn-outline-primary m-2 cancel-edit-review-magic-school" type="button">Cancel</button>
                                                </div>
                                                <select name="point" class="m-3">
                                                    <option value="0">zero points</option>
                                                    <option value="1">one points</option>
                                                    <option value="2">two points</option>
                                                    <option value="3">three points</option>
                                                    <option value="4">four points</option>
                                                    <option value="5">five points</option>
                                                    <option value="6">six points</option>
                                                    <option value="7">seven points</option>
                                                    <option value="8">eight points</option>
                                                    <option value="9">nine points</option>
                                                    <option value="10">ten points</option>
                                                </select>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </c:if>


                    <hr>
                    <c:forEach var="e" items="${evaluates}">
                        <div class="d-flex justify-content-center">
                            <div class="mr-3">
                                <div style="color:white;text-align: center;line-height: 50px; width: 50px;height: 50px;border-radius: 50%; background-color: #182C61">${e.get("username").toString().charAt(0)}</div>
                            </div>
                            <div style="width: 90%">
                                <p style="font-size: 15px;font-weight: bold;margin: 0">
                                    ${e.get("username")}
                                </p>
                                <span class="badge bg-warning">${e.get("point")}/10</span>
                                <p>
                                    ${e.get("feedback")}
                                </p>
                            </div>
                        </div>
                        <hr>
                    </c:forEach>
                    <ul class="pagination">
                        <li class="page-item"><a class="page-link" href="?id=${courses.get(0).get("id")}&page=1" style="color:#192a56"><i class="fas fa-angle-double-left"></i></a></li>
                        <c:forEach items="${Pages}" var="p">
                            <c:choose>
                                <c:when test="${p == currentPage}">
                                    <li class="page-item"><a style="color:#192a56;background-color:#869791" class="page-link" href="?id=${courses.get(0).get("id")}&page=${p}">${p}</a></li>
                                </c:when>
                                <c:otherwise>
                                    <li class="page-item"><a  style="color:#192a56" class="page-link" href="?id=${courses.get(0).get("id")}&page=${p}">${p}</a></li>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                        <li class="page-item"><a  style="color:#192a56" class="page-link" href="?id=${courses.get(0).get("id")}&page=${nPages}"><i class="fas fa-angle-double-right"></i></a></li>
                    </ul>
                </div>
            </div>
        </div>
    </jsp:body>
</t:main>



