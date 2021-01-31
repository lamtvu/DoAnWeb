<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="categoriesMenu" scope="request" type="java.util.List<beans.Category>"/>
<jsp:useBean id="courses" type="java.util.List<beans.Course>" scope="request"/>
<jsp:useBean id="chapters" type="java.util.List<beans.Chapter>" scope="request"/>
<jsp:useBean id="authUser" scope="session" type="beans.User"/>

<t:main>
    <jsp:attribute name="css">
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
        <script src="${pageContext.request.contextPath}/public/js/teacher.js"></script>
        <script src="${pageContext.request.contextPath}/public/js/main.js"></script>
        <script>
            // $('button').on('click',function(){
            //
            //     OpenBackground();
            //     $('.add-course-window-magic-school').css('display', 'block');
            // })
            $('.fuMain').fileinput({
                language: 'vi',
                theme: 'fa',
                // showCaption: false,
                dropZoneEnabled: false,
                allowedFileExtensions: ['jpg', 'png', 'gif']
            });
            $('.fuMain2').fileinput({
                language: 'vi',
                theme: 'fa',
                // showCaption: false,
                dropZoneEnabled: false,
                allowedFileExtensions: ['mp4']
            });
            var toolbarOptions = [
                ['bold', 'italic', 'underline'],
                [{ 'list': 'ordered' }, { 'list': 'bullet' }],
                [{ 'size': ['small', false, 'large'] }],
                [{ 'header': 1 }, { 'header': 2 }],
                [{ 'color': [] }],
                [{ 'align': [] }],
            ];
            var quill = new Quill('#editor', {
                modules: {
                    toolbar: toolbarOptions
                },
                theme: 'snow'
            });
            var quill2 = new Quill('#editor2', {
                modules: {
                    toolbar: toolbarOptions
                },
                theme: 'snow'
            });
            var quill3 = new Quill('#editor3', {
                modules: {
                    toolbar: toolbarOptions
                },
                theme: 'snow'
            });
            quill3.on('text-change',function (delta,source)
            {
                $('#information').val(quill3.root.innerHTML);
                console.log($('#information').val())
            })
            quill.on('text-change',function (delta,source)
            {
                $('#fullDes').val(quill.root.innerHTML);
            })
            quill2.on('text-change',function (delta,source)
            {
                $('#newFullDes').val(quill2.root.innerHTML);
                console.log(quill2.root.innerHTML)
            })

            $('.edit-mail-window-magic-school form').on("submit",function (e){
                e.preventDefault();
                if(!checkEmail('#newEmail'))
                {
                    alert('invalid email');
                    return;
                }
                $.getJSON('${pageContext.request.contextPath}/Account/IsExistEmail?email='+$('#newEmail').val(),function (re)
                { if(re === false) $('.edit-email-window-magic-school form').off('submit').submit();
                else{
                    alert('Email already exist');
                }
                })
            })
            $('.edit-name-window-magic-school form').on("submit",function (e){
                e.preventDefault();
                console.log($("#newName").val());
                if(checkFullName('#newName')){
                    $('.edit-name-window-magic-school form').off('submit').submit();
                }
            })
            $('.edit-password-window-magic-school form').on("submit",function (e){
                e.preventDefault();
                if(!checkPassword('#newPassword',passwordSecurityPoint('#newPassword'))){
                    return;
                }
                $.getJSON('${pageContext.request.contextPath}/Account/IsEqualAuthUserPassword?password='+$('#oldPassword').val(),function (re)
                { if(re === true ) $('.edit-password-window-magic-school form').off('submit').submit();
                else{
                    alert('not equal old password');
                }
                })
            })

        </script>
    </jsp:attribute>
    <jsp:body>
        <div style="position: relative;">
            <div class="container-lg-magic-school" style="position: relative;background-color: #ecf0f1;overflow: hidden;">
                <div class="circle-0" style="left:10%;background-color:white;z-index: 0;width: 50px;height: 50px;"></div>
                <div class="circle-0"
                     style="left:20%;background-color:white;z-index: 0;width: 70px;height: 70px;animation-duration: 40s;">
                </div>
                <div class="circle-0"
                     style="left:70%;background-color:white;z-index: 0;width: 20px;height: 20px;animation-delay: 2s;"></div>
                <div class="circle-0"
                     style="left:80%;background-color:white;z-index: 0;width: 10px;height: 10px;animation-duration: 15s;">
                </div>
                <div class="circle-0"
                     style="left:90%;background-color:white;z-index: 0;width: 30px;height: 30px;animation-duration: 20s;">
                </div>
                <div class="position-relative d-inline-block" style="left:50%; transform: translateX(-50%)">
                    <div class="circle-1" style="background-color:white;z-index: -1;">
                        <div class="circle-1"
                             style="left:10%;background-color:white;z-index: -1;width: 100px;height: 100px;">
                        </div>
                    </div>
                    <div class="circle-1" style="right:10%;background-color:white;z-index: -1;width: 100px;height: 100px;">
                    </div>
                    <div class="circle-1"
                         style="right:0%;bottom:0%;background-color:white;z-index: -1;width: 150px;height: 150px;"></div>
                    <div userID="${authUser.id}" class=" p-3 my-2"
                         style=" background-color:#ff7675;margin-left:40px;border-radius: 50px; display: inline-block;">
                        <span style="color:white;font-size:105%;font-weight: bold">Full Name</span>
                        <input class="mx-2 px-2 border-0 " value="${authUser.name}" readonly type="text"
                               style="width:200px;color:#ff7675;border-radius: 50px;font-weight: bold">
                        <button class="btn edit-name-magic-school" type="button">
                            <i class="fas fa-pen" style="color:white"></i>
                        </button>
                    </div> <br>
                    <div class="p-3 m-2" style="background-color:#fd79a8 ;border-radius: 50px; display: inline-block;">
                        <span style="color:white; font-weight: bold; font-size:105%;">Username</span>
                        <input class="mx-2 px-2 border-0" value="${authUser.username}" readonly type="text"
                               style="color:#fd79a8;border-radius: 50px;font-weight: bold">
                    </div> <br>
                    <div userID="${authUser.id}" class=" p-3 my-2"
                         style="background-color:#74b9ff;margin-left:40px;border-radius: 50px; display: inline-block;">
                        <span style="color:white;font-size:105%;font-weight: bold">Password</span>
                        <input class="mx-2 px-2 border-0" value="${authUser.password}" readonly type="password"
                               style="border-radius: 50px; color:#74b9ff;">
                        <button class="btn edit-password-magic-school">
                            <i class="fas fa-pen" style="color:white"></i>
                        </button>
                    </div><br>
                    <div userID="${authUser.id}" class="p-3 m-2"
                         style="background-color:#00cec9 ;border-radius: 50px; display: inline-block;">
                        <span style="color:white; font-weight: bold; font-size:105%;">Email</span>
                        <input class="mx-2 px-2 border-0" value="${authUser.email}" readonly type="text"
                               style="color:#00cec9;border-radius: 50px;font-weight: bold; width:300px;">
                        <button class="btn edit-email-magic-school">
                            <i class="fas fa-pen" style="color:white"></i>
                        </button>
                    </div> <br>
                    <div userID="${authUser.id}" class="p-3 m-1"
                         style="background-color:#fad390 ;border-radius: 50px; display: inline-block;">
                        <div>
                            <span style="color:white; font-weight: bold; font-size:105%;">Information</span>
                            <button class="btn edit-information-magic-school" type="button">
                                <i class="fas fa-pen" style="color:white"></i>
                            </button>
                        </div>
                        <div class="mx-2 px-2 border-0"  readonly type="text"
                                  style="color:#fad390;border-radius:5px;font-weight: bold; width:400px;height: 200px;background-color: white;overflow: auto">
                            ${authUser.information}
                        </div>
                    </div> <br>
                </div>
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
<%--            update information--%>
            <div class="edit-window-magic-school edit-information-window-magic-school"
                 style="position: fixed; left:50%; top:100px; transform: translate(-50%);display: none;z-index: 10;">
                <p style="font-weight:bold; color:white; font-size:120%;text-align: center;">Update Information</p>
                <form method="post" action="${pageContext.request.contextPath}/Teacher/UpdateInformation">
                    <input type="hidden" name="information" id="information">
                    <div style="background-color: white;width: 500px; ">
                        <div id="editor3" style="height: 200px"></div>
                    </div>
                    <button class="btn-magic-school w-100 my-3 p-3 bg-light text-info" type="submit"
                            style="border-radius: 50px; font-weight: bold;">Apply</button>
                </form>
            </div>
            <!-- update Full Name -->
            <div class="edit-window-magic-school edit-name-window-magic-school "
                 style="position: fixed; left:50%; top:100px; transform: translate(-50%);display: none;z-index: 10;">
                <p style="font-weight:bold; color:white; font-size:120%;text-align: center;">Update Full Name</p>
                <form method="post" action="${pageContext.request.contextPath}/Teacher/UpdateName">
                    <input type="text" name="newName" id="newName" placeholder="Full Name" autocomplete="off"
                           class="color-lightgray-magic-school border-0 p-3" style="border-radius: 50px">
                    <button class="btn-magic-school p-3 bg-light text-info" type="submit"
                            style="border-radius: 50px; font-weight: bold;">Apply</button>
                </form>
            </div>
            <!-- update email -->
            <div class="edit-window-magic-school edit-email-window-magic-school "
                 style="position: fixed; left:50%; top:100px; transform: translate(-50%); display: none;z-index: 10;">
                <p style="font-weight:bold; color:white; font-size:120%;text-align: center;">Update Email</p>
                <form method="post" action="${pageContext.request.contextPath}/Teacher/UpdateEmail">
                    <input type="hidden" name="editEmailUserID" id="editEmailUserID" style="display:none">
                    <input type="text" id="newEmail" name="newEmail" placeholder="New Email" autocomplete="off"
                           class="color-lightgray-magic-school border-0 p-3 " style="border-radius: 50px">
                    <button class="btn-magic-school p-3 bg-light text-info" type="submit"
                            style="border-radius: 50px; font-weight: bold;">
                        Apply
                    </button>
                </form>
            </div>
            <!-- update password -->
            <div class="edit-window-magic-school edit-password-window-magic-school"
                 style="position: fixed; left:50%; top:100px; transform: translate(-50%);display:none;z-index:10">
                <form method="post" class="d-flex justify-content-between w-100 h-100" autocomplete="off"
                      action="${pageContext.request.contextPath}/Teacher/UpdatePassword" style="flex-direction: column;">
                    <p style="font-weight:bold; color:white; font-size:120%;text-align: center;">Change Password</p>
                    <input type="text" name="editPasswordUserID" id="editPasswordUserID" style="display:none">
                    <input type="password" name="oldPassword" id="oldPassword" placeholder="Old Password"
                           autocomplete="new-password" class="color-lightgray-magic-school border-0 p-3"
                           style="border-radius: 50px"><br>
                    <input type="password" name="newPassword" id="newPassword" placeholder="New Password"
                           autocomplete="new-password" class="color-lightgray-magic-school border-0 p-3"
                           style="border-radius: 50px"><br>
                    <button class="btn p-3 bg-light text-info" type="submit"
                            style="border-radius: 50px; font-weight: bold;">Apply</button>
                </form>
            </div>
            <!-- delete course -->
            <div class="edit-window-magic-school delete-courses-window-magic-school"
                 style="position: fixed; left:50%; top:100px; transform: translate(-50%);display:none;z-index:10">
                <form method="post" class="d-flex justify-content-between w-100 h-100" autocomplete="off"
                      action="${pageContext.request.contextPath}/Teacher/DeleteCourse" style="flex-direction: column;">
                    <p style="font-weight:bold; color:white; font-size:120%;text-align: center;">Delete course</p>
                    <input type="hidden" name="courseID" id="deleteCourseID">
                    <p class="color-lightgray-magic-school border-0 p-3 p-course-name-magic-school"
                       style="border-radius: 50px;background-color: white;"></p>
                    <button class="btn p-3 bg-light text-info" type="submit"
                            style="border-radius: 50px; font-weight: bold;">Apply</button>
                </form>
            </div>
            <!-- delete chapter -->
            <div class="edit-window-magic-school delete-chapter-window-magic-school"
                 style="position: fixed; left:50%; top:100px; transform: translate(-50%);display:none;z-index:10">
                <form method="post" class="d-flex justify-content-between w-100 h-100" autocomplete="off"
                      action="${pageContext.request.contextPath}/Teacher/DeleteChapter" style="flex-direction: column;">
                    <p style="font-weight:bold; color:white; font-size:120%;text-align: center;">Delete Chapter</p>
                    <input type="hidden" name="chapterID" id="deleteChapterID">
                    <p class="color-lightgray-magic-school border-0 p-3 p-chapter-name-magic-school"
                       style="border-radius: 50px;background-color: white;"></p>
                    <button class="btn p-3 bg-light text-info" type="submit"
                            style="border-radius: 50px; font-weight: bold;">Apply</button>
                </form>
            </div>
            <!-- add course -->
            <div class="edit-window-magic-school add-course-window-magic-school " style="position: fixed; left:50%; top:50px; transform: translate(-50%);
            display:none  ;z-index:10;border-radius:50px">
                <form method="post" class="d-flex justify-content-between" autocomplete="off" enctype="multipart/form-data"
                      action="${pageContext.request.contextPath}/Teacher/AddCourse" style="flex-direction: column;">
                    <p style="font-weight:bold;font-size:120%;text-align: center;color:white">
                        Add Course</p>
                    <div class="d-flex justify-content-between">
                        <div style="width: 50%;">
                            <input type="text" name="courseName" id="courseName" placeholder="Course Name"
                                   class="m-2 w-100 color-lightgray-magic-school border-0 p-3 p-cat-name-magic-school"
                                   style="border-radius: 50px;background-color: white;">
                            <input type="text" name="tinyDes" id="tinyDes" placeholder="tinyDes"
                                   class="m-2 w-100 color-lightgray-magic-school border-0 p-3 p-cat-name-magic-school"
                                   style="border-radius: 50px;background-color: white;">
                            <input type="hidden" name="fullDes" id="fullDes">
                            <p class="mx-4 mb-0 text-light border-radius: 50px">full description</p>
                            <div style="background-color:white;width:100%;">
                                <div id="editor" class="color-lightgray-magic-school m-1"
                                     style="background-color:white;height:230px; ">
                                </div>
                            </div>
                        </div>
                        <div class="ml-5">
                            <select name="complete" id="complete" class="p-3 m-2 w-100 border-0"
                                    style="border-radius: 50px;width:50%">
                                <option value="yes">Completed</option>
                                <option value="no">uncompleted</option>
                            </select>
                            <select class="p-3 m-2 border-0 w-100" name="catID" id="catID"
                                    style="border-radius:50px;width:50%" size="1">
                                <div style="height: 50px;">
                                    <c:forEach items="${categoriesMenu}" var="c">
                                        <c:if test="${c.parentCat>0}">
                                            <option value="${c.id}">${c.name}</option>
                                        </c:if>
                                    </c:forEach>
                                </div>
                            </select>
                            <div>
                                <p class="mx-4 mb-0 text-light border-radius: 50px">Image</p>
                                <div style="background-color:white;width: 100%; overflow:auto;height: 300px;margin: 0">
                                    <input type="file" class="fuMain" name="fuMain" style="width: 100%" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <input type="text" name="price" placeholder="price" id="price"
                           class="m-2 w-100 color-lightgray-magic-school border-0 p-3 p-cat-name-magic-school"
                           style="border-radius: 50px;background-color: white;" pattern="[0-9]{1,10}">
                    <button class="btn p-3 bg-light w-100 text-info m-2 btn-add-course" type="submit"
                            style="border-radius: 50px; font-weight: bold;">Apply</button>
                    <button class="btn p-3 bg-light w-100 text-info m-2 btn-update-course" type="submit" formaction="${pageContext.request.contextPath}/Account/Update"
                            style="border-radius: 50px; font-weight: bold;display: none">Change</button>
                </form>
            </div>

<%--            add chapter--%>
            <div class="edit-window-magic-school add-Chapter-window-magic-school " style="position: fixed; left:50%; top:50px; transform: translate(-50%);
            display:none  ;z-index:10;border-radius:50px">
                <form method="post" class="d-flex justify-content-between" autocomplete="off" enctype="multipart/form-data"
                      action="${pageContext.request.contextPath}/Teacher/AddChapter" style="flex-direction: column;">
                    <p style="font-weight:bold;font-size:120%;text-align: center;color:white">
                        Add Chapter</p>
                    <input type="text" name="chapterName" id="chapterName" placeholder="Chapter Name"
                           class="m-2 w-100 color-lightgray-magic-school border-0 p-3 p-cat-name-magic-school"
                           style="border-radius: 50px;background-color: white;">
                    <input type="hidden" name="courseID" id="courseIDChapter">
                    <select name="pop" id="pop" class="p-3 m-2 w-100 border-0"
                            style="border-radius: 50px;width:50%">
                        <option value="public">public</option>
                        <option value="private">private</option>
                    </select>
                    <div>
                        <p class="mx-4 mb-0 text-light border-radius: 50px">full description</p>
                        <div style="background-color:white;width: 300px; overflow:auto;height: 300px;">
                            <input type="file" id="fuMain2" name="fuMain" />
                        </div>
                    </div>
                    <button class="btn p-3 bg-light w-100 text-info m-2" type="submit"
                            style="border-radius: 50px; font-weight: bold;">Apply</button>
                </form>
            </div>
            <%--edit coursename--%>
            <div class="edit-window-magic-school edit-coursename-window-magic-school " style="position: fixed; left:50%; top:50px; transform: translate(-50%);
            display:none  ;z-index:10;border-radius:50px">
                <form action="${pageContext.request.contextPath}/Teacher/UpdateCoursename" method="post">
                    <input type="hidden" name="courseID" id="editCourseID">
                    <input type="text" name="newCourseName" id="newCourseName" placeholder="new Course Name" autocomplete="off"
                           class="color-lightgray-magic-school border-0 p-3" style="border-radius: 50px">
                    <button class="btn-magic-school p-3 bg-light text-info" type="submit"
                            style="border-radius: 50px; font-weight: bold;">Apply</button>
                </form>
            </div>
<%--            update chaptername--%>
            <div class="edit-window-magic-school edit-chaptername-window-magic-school " style="position: fixed; left:50%; top:50px; transform: translate(-50%);
            display:none  ;z-index:10;border-radius:50px">
                <form action="${pageContext.request.contextPath}/Teacher/UpdateChapterName" method="post">
                    <input type="hidden" name="chapterID" id="editChaptername">
                    <input type="text" name="newChaptername" id="newChaptername" placeholder="new Chapter Name" autocomplete="off"
                           class="color-lightgray-magic-school border-0 p-3" style="border-radius: 50px">
                    <button class="btn-magic-school p-3 bg-light text-info" type="submit"
                            style="border-radius: 50px; font-weight: bold;">Apply</button>
                </form>
            </div>
<%--            udate chapter pop--%>
            <div class="edit-window-magic-school edit-pop-window-magic-school " style="position: fixed; left:50%; top:50px; transform: translate(-50%);
            display:none  ;z-index:10;border-radius:50px">
                <form action="${pageContext.request.contextPath}/Teacher/UpdatePublicOrPrivate" method="post">
                    <input type="hidden" name="chapterID" id="editPoP">
                    <select name="PoP" class="p-3 m-2" style="border-radius: 50px">
                        <option value="public">Public</option>
                        <option value="private">Private</option>
                    </select>
                    <button class="btn-magic-school p-3 bg-light text-info" type="submit"
                            style="border-radius: 50px; font-weight: bold;">Apply</button>
                </form>
            </div>

<%--            edit tinydes--%>
            <div class="edit-window-magic-school edit-tinydes-window-magic-school " style="position: fixed; left:50%; top:50px; transform: translate(-50%);
            display:none  ;z-index:10;border-radius:50px">
                <form action="${pageContext.request.contextPath}/Teacher/UpdateTinyDes" method="post">
                    <input type="hidden" name="courseID" id="editTinydesID">
                    <input type="text" name="newTinyDes" id="newTinyDes" placeholder="new Tiny Description" autocomplete="off"
                           class="color-lightgray-magic-school border-0 p-3" style="border-radius: 50px">
                    <button class="btn-magic-school p-3 bg-light text-info" type="submit"
                            style="border-radius: 50px; font-weight: bold;">Apply</button>
                </form>
            </div>
<%--                edit fulldes--%>
            <div class="edit-window-magic-school edit-fulldes-window-magic-school " style="position: fixed; left:50%; top:50px; transform: translate(-50%);
            display:none  ;z-index:10;border-radius:50px">
                <form action="${pageContext.request.contextPath}/Teacher/UpdateFullDes" method="post">
                    <p style="font-weight: bold; color: white">Edit Full Descriptions</p>
                    <input type="hidden" name="courseID" id="editFullDescID">
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
            display:none ;z-index:10;border-radius:50px">
            <form action="${pageContext.request.contextPath}/Teacher/UpdateCourseCategory" method="post">
            <p style="font-weight:bold;color:white">Edit category</p>
                <input type="hidden" name="courseID" id="editCategorycID">
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
            display:none  ;z-index:10;border-radius:50px">
                <form method="post" action="${pageContext.request.contextPath}/Teacher/UpdateCoursePrice">
                    <input type="hidden" name="courseID" id="editPricecID">
                    <input type="text" name="newPrice" id="newPrice" placeholder="New Price" autocomplete="off"
                           class="color-lightgray-magic-school border-0 p-3" style="border-radius: 50px">
                    <button class="btn-magic-school p-3 m-3 bg-light text-info" type="submit"
                            style="border-radius: 50px; font-weight: bold;">Apply</button>
                </form>
            </div>
<%--edit complete--%>
            <div class="edit-window-magic-school edit-completec-window-magic-school " style="position: fixed; left:50%; top:50px; transform: translate(-50%);
            display:none  ;z-index:10;border-radius:50px">
                <form action="${pageContext.request.contextPath}/Teacher/UpdateComplete" method="post">
                    <input type="hidden" name="courseID" id="editCompletecID">
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
            display:none  ;z-index:10;border-radius:50px">
                <form method="post" action="${pageContext.request.contextPath}/Teacher/UpdateImage" enctype="multipart/form-data">
                    <input type="hidden" name="courseID" id="editImageID">
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


            <div class="edit-window-magic-school edit-video-window-magic-school " style="position: fixed; left:50%; top:50px; transform: translate(-50%);
            display:none  ;z-index:10;border-radius:50px">
                <form method="post" action="${pageContext.request.contextPath}/Teacher/UpdateChapterVideo" enctype="multipart/form-data">
                    <input type="hidden" name="chapterID" id="editVideoID">
                    <div>
                        <p class="mx-4 mb-0 text-light border-radius: 50px">Video</p>
                        <div style="background-color:white;width: 100%; overflow:auto;height: 300px;margin: 0">
                            <input type="file" class="fuMain2" name="fuMain" style="width: 100%" />
                        </div>
                    </div>
                    <button class="btn-magic-school my-3 p-3 w-100 bg-light text-info" type="submit"
                            style="border-radius: 50px; font-weight: bold;">Apply</button>
                </form>
            </div>

            <hr>
            <div class="container-fluid" style="background-color:#ecf0f1;overflow: hidden;">
                <div class="circle-1" style="background-color:white;"></div>
                <div class="circle-1" style="background-color:white;width: 100px;height:100px;left: 50%;z-index:0;">
                </div>
                <div class="circle-1" style="background-color:white;width: 200px;height:200px;left: 40%;z-index:0;">
                </div>
                <div class="circle-1" style="background-color:white;width: 50px;height:50px;left: 70%;z-index:0;">
                </div>
                <div class="circle-1" style="background-color:white;width: 500px;height:500px;left: 40%;bottom: 0;z-index:0;">
                </div>
                <div class="circle-1" style="background-color:white;width: 200px;height:200px;left: 20%;bottom: 10%;z-index:0;">
                </div>
                <p style="font-weight: bold;font-size: 50px; color: #341f97;text-align:center"
                   class="color-lightgray-magic-school py-5 position-relative">
                    Manager My Courses
                </p>

                <div class="container-lg-magic-school position-relative" style="margin-bottom: 300px">
                    <button class="btn add-course-magic-school" type="button">
                        <i class="fa fa-plus-square text-info " style="font-size: 20px;"></i>
                    </button>

                    <c:forEach items="${courses}" var="c">
                        <c:if test="${c.teacherID == authUser.id}">
                            <div class="card">
                                <div class="card-header d-flex justify-content-between">
                                    <div>
                                        ${c.coursename}
                                        <div courseID="${c.id}" courseName="${c.coursename}" class="d-flex">
                                            <button class="btn text-danger delete-course-magic-school">
                                                <i class="fas fa-minus-square" aria-hidden="true" style="font-size: 20px"></i>
                                            </button>
                                            <button class="btn add-chapter-magic-school">
                                                <i class="fa fa-plus-square text-info " aria-hidden="true"
                                                   style="font-size: 20px"></i>
                                            </button>
                                            <div class="dropdown">
                                                <button class="btn dropdown-toggle text-warning"  data-toggle="dropdown">
                                                    <i class="fas fa-edit text-warning " aria-hidden="true" style="font-size: 20px"></i>
                                                </button>
                                                <div class="dropdown-menu"  courseID="${c.id}">
                                                    <button class="btn text-warning btn-edit-coursename-magic-school">Course Name</button><br>
                                                    <button class="btn text-warning btn-edit-tinydesc-magic-school">Tiny Description</button><br>
                                                    <button class="btn text-warning btn-edit-fulldesc-magic-school">Full Description</button><br>
                                                    <button class="btn text-warning btn-edit-categoryc-magic-school">Category</button><br>
                                                    <button class="btn text-warning btn-edit-pricec-magic-school">price</button><br>
                                                    <button class="btn text-warning btn-edit-completec-magic-school">Complete</button><br>
                                                    <button class="btn text-warning btn-edit-image-magic-school">Image</button><br>
                                                </div>
                                            </div>
                                            <a class="btn btn-outline-secondary" href="${pageContext.request.contextPath}/Teacher/EditCourse?courseID=${c.id}">
                                                <i class="fas fa-eye"></i>
                                            </a>
                                        </div>

                                    </div>
                                    <button class="btn text-secondary" type="button" data-toggle="collapse" data-target="#demo${c.id}">
                                        <i class="fa fa-arrows-alt-v" aria-hidden="true" style="font-size: 20px;"></i>
                                    </button>
                                </div>
                                <div class="card-body collapse" id="demo${c.id}">
                                    <table class="table">
                                      <c:forEach items="${chapters}" var="t">
                                          <c:if test="${t.courseID == c.id}">
                                              <tr>
                                                  <td class="d-flex justify-content-between">
                                                      <p>${t.name}</p>
                                                      <div chapterID="${t.id}" chapterName="${t.name}" class="d-flex">
                                                          <div class="dropdown">
                                                              <button class="btn text-warning dropdown-toggle" data-toggle="dropdown">
                                                                  <i class="fas fa-edit" aria-hidden="true" style="font-size: 20px"></i>
                                                              </button>
                                                             <div class="dropdown-menu" chapterID="${t.id}">
                                                                 <button class="btn edit-chaptername-magic-school text-warning">Name</button><br>
                                                                 <button class="btn edit-chaptervideo-magic-school text-warning">Video</button><br>
                                                                 <button class="btn edit-pop-magic-school text-warning">POP</button>
                                                             </div>
                                                          </div>
                                                          <button class="btn text-danger delete-chapter-magic-school">
                                                              <i class="fas fa-minus-square" aria-hidden="true"
                                                                 style="font-size: 20px"></i>
                                                          </button>
                                                      </div>
                                                  </td>
                                              </tr>
                                          </c:if>
                                      </c:forEach>
                                    </table>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
            </div>
        </div>
    </jsp:body>
</t:main>
