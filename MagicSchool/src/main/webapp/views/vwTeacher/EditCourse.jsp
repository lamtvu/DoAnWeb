<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<jsp:useBean id="chapters" type="java.util.List<beans.Chapter>" scope="request"/>
<jsp:useBean id="courses" type="java.util.List<java.util.Map<java.lang.String,java.lang.Object>>" scope="request"/>
<jsp:useBean id="evaluates" type="java.util.List<java.util.Map<java.lang.String,java.lang.Object>>" scope="request"/>
<t:main>
    <jsp:attribute name="css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/main.css">
        <link href="//cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">
        <link href="//cdn.quilljs.com/1.3.6/quill.bubble.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/5.1.3/css/fileinput.min.css" media="all" rel="stylesheet" type="text/css" />
    </jsp:attribute>
    <jsp:attribute name="js">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="//cdn.quilljs.com/1.3.6/quill.js"></script>
        <script src="//cdn.quilljs.com/1.3.6/quill.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/5.1.3/js/fileinput.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/5.1.3/js/locales/vi.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/5.1.3/themes/fa/theme.min.js"></script>
        <script>
            $('.fuMain').fileinput({
                language: 'vi',
                theme: 'fa',
                // showCaption: false,
                dropZoneEnabled: false,
                allowedFileExtensions: ['jpg', 'png', 'gif']
            });
            // $('.fuMain2').fileinput({
            //     language: 'vi',
            //     theme: 'fa',
            //     // showCaption: false,
            //     dropZoneEnabled: false,
            //     allowedFileExtensions: ['mp4']
            // });
            var toolbarOptions = [
                ['bold', 'italic', 'underline'],
                [{ 'list': 'ordered' }, { 'list': 'bullet' }],
                [{ 'size': ['small', false, 'large'] }],
                [{ 'header': 1 }, { 'header': 2 }],
                [{ 'color': [] }],
                [{ 'align': [] }],
            ];
            var quill2 = new Quill('#editor2', {
                modules: {
                    toolbar: toolbarOptions
                },
                theme: 'snow'
            });
            quill2.on('text-change',function (data,source){
                $('#newFullDes').val(quill2.root.innerHTML);
                console.log($('#newFullDes').val());
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
            function OpenBackground() {
                $('.background-opacity').css('display', 'block');
            }
            function closeAllWindows() {
                $('.edit-window-magic-school').css('display', 'none');
                $('.background-opacity').css('display', 'none');
            }

            $('.background-opacity button').on('click',function (e){
                video.pause();
                $('.box-video-magic-school').css('display','none');
                closeAllWindows();
            })
            $(".btn-edit-coursename-magic-school").on('click',function(e){
                OpenBackground();
                $(".edit-coursename-window-magic-school").css('display', 'block');
            })
            $(".btn-edit-tinydesc-magic-school").on('click',function(e){
                OpenBackground();
                $(".edit-tinydes-window-magic-school").css('display', 'block');
            })
            $(".btn-edit-fulldesc-magic-school").on('click',function(e){
                OpenBackground();
                $(".edit-fulldes-window-magic-school").css('display', 'block');
            })
            $(".btn-edit-categoryc-magic-school").on('click',function(e){
                OpenBackground();
                $(".edit-categoryc-window-magic-school").css('display', 'block');
            })
            $(".btn-edit-pricec-magic-school").on('click',function(e){
                OpenBackground();
                $(".edit-pricec-window-magic-school").css('display', 'block');
            })
            $(".btn-edit-completec-magic-school").on('click',function(e){
                console.log($('.edit-completec-window-magic-school input[type=hidden]').val());
                OpenBackground();
                $(".edit-completec-window-magic-school").css('display', 'block');
            })
            $(".btn-edit-image-magic-school").on('click',function(e){
                OpenBackground();
                $(".edit-image-window-magic-school").css('display', 'block');

            })
            $('button').on('click',function (){
                console.log($('input[type=hidden]').val());
            })
        </script>
    </jsp:attribute>
    <jsp:body>
        <div class="d-none">
            <div class="editor"></div>
        </div>
        <div class="w-100 h-100 position-fixed background-opacity"
             style="z-index: 9;background-color:#341f97;opacity: 0.6;top:0; display:none;">
            <div class="circle-0"
                 style="left:80%;background-color:white;z-index: 0;width: 10px;height: 10px;animation-duration: 15s;">
            </div>
            <div class="circle-0"
                 style="left:90%;background-color:white;z-index: 0;width: 30px;height: 30px;animation-duration: 70s;">
            </div>
            <div class="circle-0"
                 style="left:10%;background-color:white;z-index: 0;width: 10px;height: 10px;animation-duration: 55s;">
            </div>
            <div class="circle-0"
                 style="left:20%;background-color:white;z-index: 0;width: 70px;height: 70px;animation-duration: 40s;">
            </div>
            <div class="circle-0"
                 style="left:30%;background-color:white;z-index: 0;width: 10px;height: 10px;animation-duration: 25s;">
            </div>
            <div class="circle-0"
                 style="left:40%;background-color:white;z-index: 0;width: 30px;height: 30px;animation-duration: 20s;">
            </div>
            <div class="circle-0"
                 style="left:40%;background-color:white;z-index: 0;width: 10px;height: 10px;animation-duration: 15s;">
            </div>
            <div class="circle-0"
                 style="left:45%;background-color:white;z-index: 0;width: 30px;height: 30px;animation-duration: 70s;">
            </div>
            <div class="circle-0"
                 style="left:60%;background-color:white;z-index: 0;width: 10px;height: 10px;animation-duration: 55s;">
            </div>
            <div class="circle-0"
                 style="left:65%;background-color:white;z-index: 0;width: 70px;height: 70px;animation-duration: 40s;">
            </div>
            <div class="circle-0"
                 style="left:75%;background-color:white;z-index: 0;width: 10px;height: 10px;animation-duration: 25s;">
            </div>
            <div class="circle-0"
                 style="left:90%;background-color:white;z-index: 0;width: 30px;height: 30px;animation-duration: 20s;">
            </div>
            <button class="btn text-light" style="font-size:50px"> <i class="fas fa-times-circle"></i></button>
        </div>
        <div class="position-fixed box-video-magic-school" style="display: none;left:50%;top:20%;transform: translate(-50%);z-index: 10">
            <video controls muted width="480" height="360" poster="${pageContext.request.contextPath}/public/image/${courses.get(0).get("id")}.jpg">
                <source src="" type="video/mp4">
            </video>
        </div>

        <div class="container-fluid position-fixed table-fixed-magic-school" style="box-shadow: 1px 1px 10px #192a56;color:white;display: none;background-color: #182C61; top:0;z-index: 5;height: 50px">
            <p style="font-weight: bold; color: white; margin: 0;display: inline-block">${courses.get(0).get("coursename")}<p>
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
                    <div>
                        <p class="d-inline-block">${courses.get(0).get("catname")}</p>
                        <button class="btn d-inline-block btn-outline-warning btn-edit-categoryc-magic-school">Edit</button>
                    </div>
                    <div>
                        <p class="d-inline-block" style="font-weight: bold; font-size: 30px">${courses.get(0).get("coursename")}</p>
                        <button class="btn d-inline-block btn-outline-warning btn-edit-coursename-magic-school">Edit</button>
                    </div>
                    <div>
                        <p class="d-inline-block">${courses.get(0).get("tinydes")}</p>
                        <button class="btn d-inline-block btn-outline-warning btn-edit-tinydesc-magic-school">Edit</button>
                    </div>
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
                    <div>
                        <c:choose>
                            <c:when test="${courses.get(0).get('complete')=='yes'}">
                                <span class="badge bg-secondary">complete</span>
                            </c:when>
                            <c:otherwise>
                                <span class="badge bg-secondary">uncomplete</span>
                            </c:otherwise>
                        </c:choose>
                        <button class="btn d-inline-block btn-outline-warning btn-edit-completec-magic-school">Edit</button>
                    </div>
                    <button class="btn btn-outline-light mt-2" type="button">
                        WishList
                        <i class="fas fa-heart"></i>
                    </button>
                </div>
            </div>
            <div id="course-box-magic-school" style="width:20%; background-color:white;position: absolute;left:60%;top:5%;z-index: 5;box-shadow:1px 1px 10px #8d8c86">
                <div class="d-flex align-items-center" style="flex-direction: column">
                    <img style="width: 100%;padding:5px" src="${pageContext.request.contextPath}/public/image/${courses.get(0).get("id")}.jpg">
                    <button class="btn d-inline-block btn-outline-warning btn-edit-image-magic-school">Edit</button>
                    <p style="align-self: start;font-weight: bold;font-size: 30px;margin-left: 20px">
                        $${courses.get(0).get("price")}
                        <button class="btn d-inline-block btn-outline-warning btn-edit-pricec-magic-school">Edit</button>
                        <span style="color: #8d8c86;font-size: 15px;font-weight: 400"> for the course</span>
                    </p>
                    <button class="btn btn-outline-info w-75" type="button">Buy now</button>
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
                <c:forEach items="${chapters}" var="t">
                    <div class="card card-header">
                        <button chapterID="${t.id}" class="btn open-video-magic-school"style="text-align: left" >${t.name}</button>
                    </div>
                </c:forEach>
                <div>
                    <p style="font-weight:bold;font-size: 25px">Teacher</p>
                    <p>${courses.get(0).get("information")}</p>
                </div>
                <div>
                    <p style="font-weight:bold;font-size: 25px">Description</p>
                    <p>${courses.get(0).get("fulldes")}</p>
                    <button class="btn d-inline-block btn-outline-warning btn-edit-fulldesc-magic-school">Edit</button>
                </div>
                <div>
                    <p style="font-weight: bold;font-size: 25px">Reviews</p>
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
                        <li class="page-item"><a class="page-link" href="?courseID=${courses.get(0).get("id")}&page=1" style="color:#192a56"><i class="fas fa-angle-double-left"></i></a></li>
                        <c:forEach items="${Pages}" var="p">
                            <c:choose>
                                <c:when test="${p == currentPage}">
                                    <li class="page-item"><a style="color:#192a56;background-color:#869791" class="page-link" href="?courseID=${courses.get(0).get("id")}&page=${p}">${p}</a></li>
                                </c:when>
                                <c:otherwise>
                                    <li class="page-item"><a  style="color:#192a56" class="page-link" href="?courseID=${courses.get(0).get("id")}&page=${p}">${p}</a></li>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                        <li class="page-item"><a  style="color:#192a56" class="page-link" href="?courseID=${courses.get(0).get("id")}&page=${nPages}"><i class="fas fa-angle-double-right"></i></a></li>
                    </ul>
                </div>
            </div>
        </div>

        <%--edit coursename--%>
        <div class="edit-window-magic-school edit-coursename-window-magic-school " style="position: fixed; left:50%; top:50px; transform: translate(-50%);
            z-index:10;display:none;border-radius:50px">
            <form action="${pageContext.request.contextPath}/Teacher/UpdateCoursename" method="post">
                <input type="hidden" name="courseID" value="${courses.get(0).get("id")}">
                <input type="text" name="newCourseName" id="newCourseName" placeholder="new Course Name" autocomplete="off"
                       class="color-lightgray-magic-school border-0 p-3" style="border-radius: 50px"
                        value="${courses.get(0).get("coursename")}">
                <button class="btn-magic-school p-3 bg-light text-info" type="submit"
                        style="border-radius: 50px; font-weight: bold;">Apply</button>
            </form>
        </div>
        <%--            edit tinydes--%>
        <div class="edit-window-magic-school edit-tinydes-window-magic-school " style="position: fixed; left:50%; top:50px; transform: translate(-50%);
            z-index:10;display:none;border-radius:50px">
            <form action="${pageContext.request.contextPath}/Teacher/UpdateTinyDes" method="post">
                <input type="hidden" name="courseID" value="${courses.get(0).get("id")}">
                <input type="text" name="newTinyDes" id="newTinyDes" placeholder="new Tiny Description" autocomplete="off"
                          class="color-lightgray-magic-school border-0 p-3" style="border-radius: 50px;">
                <button class="btn-magic-school p-3 bg-light text-info" type="submit"
                        style="border-radius: 50px; font-weight: bold;">Apply</button>
            </form>
        </div>
        <%--                edit fulldes--%>
        <div class="edit-window-magic-school edit-fulldes-window-magic-school " style="position: fixed; left:50%; top:50px; transform: translate(-50%);
            z-index:10;display:none;border-radius:50px">
            <form action="${pageContext.request.contextPath}/Teacher/UpdateFullDes" method="post">
                <p style="font-weight: bold; color: white">Edit Full Descriptions</p>
                <input type="hidden" name="courseID" value="${courses.get(0).get("id")}">
                <input type="hidden" name="newFullDes" id="newFullDes">
                <div class="d-flex justify-content-between" style="flex-direction: column">
                    <div style="background-color: white">
                        <div id="editor2" class="color-lightgray-magic-school m-1"
                             style="background-color:white;height:230px; "></div>
                    </div>
                    <button class="btn-magic-school p-3 bg-light text-info m-3" type="submit"
                            style="border-radius: 50px; font-weight: bold;">Apply</button>
                </div>
            </form>
        </div>
        <%--            edit categoryc--%>

        <div class="edit-window-magic-school edit-categoryc-window-magic-school " style="position: fixed; left:50%; top:50px; transform: translate(-50%);
            z-index:10;display:none;border-radius:50px">
            <form action="${pageContext.request.contextPath}/Teacher/UpdateCourseCategory" method="post">
                <p style="font-weight:bold;color:white">Edit category</p>
                <input type="hidden" name="courseID" value="${courses.get(0).get("id")}">
                <select class="p-3 m-2 border-0 w-100" name="newCatID" id="newCatID"
                        style="border-radius:50px;width:50%" size="1">
                    <c:forEach items="${categoriesMenu}" var="c">
                        <c:if test="${c.parentCat>0}">
                            <option value="${c.id}">${c.name}</option>
                        </c:if>
                    </c:forEach>
                </select>
                <button class="btn-magic-school p-3 bg-light text-info m-3" type="submit"
                        style="border-radius: 50px; font-weight: bold;">Apply</button>
            </form>
        </div>
        <%--        edit pricec--%>

        <div class="edit-window-magic-school edit-pricec-window-magic-school " style="position: fixed; left:50%; top:50px; transform: translate(-50%);
            z-index:10;display:none;border-radius:50px">
            <form method="post" action="${pageContext.request.contextPath}/Teacher/UpdateCoursePrice">
                <input type="hidden" name="courseID" value="${courses.get(0).get("id")}">
                <input type="text" name="newPrice" id="newPrice" placeholder="New Price" autocomplete="off" pattern="[0-9]{1,10}"
                       class="color-lightgray-magic-school border-0 p-3" style="border-radius: 50px" value="${courses.get(0).get("price")}">
                <button class="btn-magic-school p-3 m-3 bg-light text-info" type="submit"
                        style="border-radius: 50px; font-weight: bold;">Apply</button>
            </form>
        </div>
        <%--edit complete--%>
        <div class="edit-window-magic-school edit-completec-window-magic-school " style="position: fixed; left:50%; top:50px; transform: translate(-50%);
            z-index:10;display:none;border-radius:50px">
            <form action="${pageContext.request.contextPath}/Teacher/UpdateComplete" method="post">
                <input type="hidden" name="courseID" value="${courses.get(0).get("id")}">
                <select name="newComplete" id="newComplete" class="p-3 my-2 w-100 border-0"
                        style="border-radius: 50px;width:50%">
                    <option value="yes">Completed</option>
                    <option value="no">uncompleted</option>
                </select>
                <button class="btn-magic-school p-3 w-100 bg-light text-info" type="submit"
                        style="border-radius: 50px; font-weight: bold;">Apply</button>
            </form>
        </div>
        <%--edit image--%>
        <div class="edit-window-magic-school edit-image-window-magic-school " style="position: fixed; left:50%; top:50px; transform: translate(-50%);
            z-index:10;display:none;border-radius:50px">
            <form method="post" action="${pageContext.request.contextPath}/Teacher/UpdateImage" enctype="multipart/form-data">
                <input type="hidden" name="courseID" value="${courses.get(0).get("id")}">
                <div>
                    <p class="mx-4 mb-0 text-light border-radius: 50px">Image</p>
                    <div style="background-color:white;width: 100%; overflow:auto;height: 300px;margin: 0">
                        <input type="file" class="fuMain" name="fuMain" style="width: 100%" />
                    </div>
                </div>
                <button class="btn-magic-school my-3 p-3 w-100 bg-light text-info" type="submit"
                        style="border-radius: 50px; font-weight: bold;">Apply</button>
            </form>
        </div>

    </jsp:body>
</t:main>
