<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="authUser" type="beans.User" scope="session"/>
<jsp:useBean id="categoriesMenu" scope="request" type="java.util.List<beans.Category>"/>
<jsp:useBean id="courses" scope="request" type="java.util.List<beans.Course>"/>
<jsp:useBean id="teachers" scope="request" type="java.util.List<beans.User>"/>
<t:main>

<jsp:attribute name="css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/main.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
    <style>
        html{
            scroll-behavior: smooth;
        }
    </style>
</jsp:attribute>
    <jsp:attribute name="js">
        <script src="${pageContext.request.contextPath}/public/js/main.js"></script>
        <script src="${pageContext.request.contextPath}/public/js/Admin.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
        <script>
            $('.add-teacher-window-magic-school form').on("submit", function (e) {
                // e.stopImmediatePropagation();
                e.preventDefault();
                if (!checkUsername('#addUsername')) {

                    return false;
                };
                if (!checkPassword('#addPassword',passwordSecurityPoint('#addPassword'))) {
                    return false;
                }
                if (!checkFullName('#addName')) {
                    return false;
                }

                if (checkEmail('#addEmail')===false){
                    return false;
                }
                $.getJSON('${pageContext.request.contextPath}/Account/IsExistUsername?username='+$('#addUsername').val(),function (data){
                    if(data === false)
                    {
                        $.getJSON('${pageContext.request.contextPath}/Account/IsExistEmail?email='+$('#addEmail').val(),function (re)
                        { if(re === false) $('.add-teacher-window-magic-school form').off('submit').submit();
                        else{
                            alert('Email already exist');
                        }
                        })

                    }
                    else {
                        alert('Username already exist');
                    }
                })
            })
            $('.edit-email-window-magic-school form').on("submit",function (e){
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
            $('.delete-cat-window-magic-school form').on('submit',function (e){
                e.preventDefault();
                $.getJSON('${pageContext.request.contextPath}/Category/HasCourse?catID='+$('#deleteCatID').val(),function (data){
                    console.log(data);
                    if(data===true){
                        alert("this category has courses");
                    }
                    else {
                        $('.delete-cat-window-magic-school form').off('submit').submit();
                    }
                });
            })
        </script>
    </jsp:attribute>
    <jsp:body>
        <div style="position: relative">
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
                <c:choose>
                <c:when test="${auth}">
                <div class="position-relative d-inline-block" style="left:50%; transform: translateX(-50%)">
                    <div class="circle-1" style="background-color:white;z-index: -1;">
                        <div class="circle-1" style="left:10%;background-color:white;z-index: -1;width: 100px;height: 100px;">
                        </div>
                    </div>
                    <div class="circle-1" style="right:10%;background-color:white;z-index: -1;width: 100px;height: 100px;">
                    </div>
                    <div class="circle-1"
                         style="right:0%;bottom:0%;background-color:white;z-index: -1;width: 150px;height: 150px;"></div>
                    <div userID="${authUser.id}" class=" p-3 my-2"
                         style=" background-color:#ff7675;margin-left:40px;border-radius: 50px; display: inline-block;">
                        <span style="color:white;font-size:105%;font-weight: bold">Full Name</span>
                        <input class="mx-2 px-2 border-0 " value="${authUser.name}"
                               readonly type="text" style="width:200px;color:#ff7675;border-radius: 50px;font-weight: bold">
                        <button class="btn edit-name-magic-school" type="button">
                            <i class="fas fa-pen" style="color:white"></i>
                        </button>
                    </div> <br>
                    <div class="p-3 m-2" style="background-color:#fd79a8 ;border-radius: 50px; display: inline-block;">
                        <span style="color:white; font-weight: bold; font-size:105%;">Username</span>
                        <input class="mx-2 px-2 border-0" value="${authUser.username}"
                               readonly type="text" style="color:#fd79a8;border-radius: 50px;font-weight: bold">
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
                    <div userID="${authUser.id}" class="p-3 m-2" style="background-color:#00cec9 ;border-radius: 50px; display: inline-block;">
                        <span style="color:white; font-weight: bold; font-size:105%;">Email</span>
                        <input class="mx-2 px-2 border-0" value="${authUser.email}"
                               readonly type="text" style="color:#00cec9;border-radius: 50px;font-weight: bold; width:300px;">
                        <button class="btn edit-email-magic-school">
                            <i class="fas fa-pen" style="color:white"></i>
                        </button>
                    </div> <br>
                </div>
            </div>
            </c:when>
            </c:choose>

        </div>



        <div class="position-fixed" style="z-index: 5;box-shadow: 1px 1px 5px #869791">
            <table class="table table-hover table-light">
               <tbody>
                    <tr>
                        <td>
                            <a href="#category" class="link-secondary">Category</a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <a href="#course" class="link-secondary">Course</a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <a href="#teacher" class="link-secondary">Teacher</a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <a href="#student" class="link-secondary">Student</a>
                        </td>
                    </tr>
               </tbody>
            </table>
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

        <!-- update Full Name -->
        <div class="edit-window-magic-school edit-name-window-magic-school "
             style="position: fixed; left:50%; top:100px; transform: translate(-50%);display: none;z-index: 10;">
            <p style="font-weight:bold; color:white; font-size:120%;text-align: center;">Update Full Name</p>
            <form method="post" action="${pageContext.request.contextPath}/Admin/UpdateName">
                <input type="text" name="newName" id="newName" placeholder="Full Name" autocomplete="off"
                       class="color-lightgray-magic-school border-0 p-3" style="border-radius: 50px">
                <button class="btn-magic-school p-3 bg-light text-info" type="submit"
                        style="border-radius: 50px; font-weight: bold;">Apply</button>
            </form>
        </div>
        <!-- update email -->
        <div class="edit-window-magic-school edit-email-window-magic-school " style="position: fixed; left:50%; top:100px; transform: translate(-50%); display: none;z-index: 10;">
            <p style="font-weight:bold; color:white; font-size:120%;text-align: center;">Update Email</p>
            <form method="post" action="${pageContext.request.contextPath}/Admin/UpdateEmail">
                <input type="hidden" name="editEmailUserID" id="editEmailUserID" style="display:none">
                <input type="text" id="newEmail" name="newEmail" placeholder="New Email" autocomplete="off"  class="color-lightgray-magic-school border-0 p-3 " style="border-radius: 50px">
                <button class="btn-magic-school p-3 bg-light text-info" type="submit" style="border-radius: 50px; font-weight: bold;"   >
                    Apply
                </button>
            </form>
        </div>
        <!-- update password -->
        <div class="edit-window-magic-school edit-password-window-magic-school" style="position: fixed; left:50%; top:100px; transform: translate(-50%);display:none;z-index:10">
            <form method="post"  class="d-flex justify-content-between w-100 h-100" autocomplete="off" action="${pageContext.request.contextPath}/Admin/UpdatePassword"
                  style="flex-direction: column;">
                <p style="font-weight:bold; color:white; font-size:120%;text-align: center;">Change Password</p>
                <input type="text" name="editPasswordUserID" id="editPasswordUserID" style="display:none">
                <input type="password" name="oldPassword" id="oldPassword" placeholder="Old Password" autocomplete="new-password"
                       class="color-lightgray-magic-school border-0 p-3" style="border-radius: 50px"><br>
                <input type="password"  name="newPassword" id="newPassword" placeholder="New Password" autocomplete="new-password"
                       class="color-lightgray-magic-school border-0 p-3" style="border-radius: 50px"><br>
                <button class="btn p-3 bg-light text-info" type="submit"
                        style="border-radius: 50px; font-weight: bold;">Apply</button>
            </form>
        </div>
        <!-- delete cat -->
        <div class="edit-window-magic-school delete-cat-window-magic-school"
             style="position: fixed; left:50%; top:100px; transform: translate(-50%);display:none;z-index:10">
            <form method="post" action="${pageContext.request.contextPath}/Admin/DeleteCategory" class="d-flex justify-content-between w-100 h-100"
                  style="flex-direction: column;">
                <p style="font-weight:bold; color:white; font-size:120%;text-align: center;">Delete Category</p>
                <input type="text" name="deleteCatID" id="deleteCatID" style="display: none;">
                <p class="color-lightgray-magic-school border-0 p-3 p-cat-name-magic-school"
                   style="border-radius: 50px;background-color: white;"></p>
                <button class="btn p-3 bg-light text-info" type="submit"
                        style="border-radius: 50px; font-weight: bold;">
                    Delete
                </button>

            </form>
        </div>
        <!-- Edit cat -->
        <div class="edit-window-magic-school edit-cat-window-magic-school"
             style="position: fixed; left:50%; top:100px; transform: translate(-50%);display:none;z-index:10">
            <form method="post"  class="d-flex justify-content-between w-100 h-100"
                  style="flex-direction: column;">
                <p style="font-weight:bold; color:white; font-size:120%;text-align: center;">Edit Category</p>
                <input type="text" class="catOrParentID" name="catOrParentID" style="display:none;">
                <input type="text" id="catName" name="catName" placeholder="Category Name" autocomplete="off"
                       class="color-lightgray-magic-school border-0 p-3" style="border-radius: 50px"><br>
                <button class="btn p-3 bg-light text-info btn-update-cat-magic-school" type="submit"  formaction="${pageContext.request.contextPath}/Admin/UpdateNameCategory"
                        style="border-radius: 50px; font-weight: bold;">
                    Update
                </button>
                <button class="btn p-3 bg-light text-info btn-add-cat-magic-school" type="submit" formaction="${pageContext.request.contextPath}/Admin/AddCategory"
                        style="border-radius: 50px; font-weight: bold;">
                    Add
                </button>
            </form>
        </div>

        <!-- delete course -->
        <div class="edit-window-magic-school delete-course-window-magic-school"
             style="position: fixed; left:50%; top:100px; transform: translate(-50%);display:none;z-index:10">
            <form method="post" action="${pageContext.request.contextPath}/Admin/DeleteCourse" class="d-flex justify-content-between w-100 h-100"
                  style="flex-direction: column;">
                <p style="font-weight:bold; color:white; font-size:120%;text-align: center;">Delete Sourse</p>
                <input type="text" id="courseDeleteID" name="courseDeleteID" autocomplete="off"
                       class="color-lightgray-magic-school border-0 p-3" style="border-radius: 50px;display:none"><br>
                <p class="color-lightgray-magic-school border-0 p-3 p-cat-name-magic-school"
                   style="border-radius: 50px;background-color: white;"></p>
                <button class="btn p-3 bg-light text-info" type="submit"
                        style="border-radius: 50px; font-weight: bold;">
                    Delete
                </button>
            </form>
        </div>

        <!-- delete teacher -->
        <div class="edit-window-magic-school delete-teacher-window-magic-school"
             style="position: fixed; left:50%; top:100px; transform: translate(-50%);display:none;z-index:10">
            <form method="post" action="${pageContext.request.contextPath}/Admin/DeleteTeacher" class="d-flex justify-content-between w-100 h-100"
                  style="flex-direction: column;">
                <p style="font-weight:bold; color:white; font-size:120%;text-align: center;">Delete Teacher</p>
                <input type="text" id="userDeleteID" name="userDeleteID" class="color-lightgray-magic-school border-0 p-3" autocomplete="off"
                       style="border-radius: 50px;display:none"><br>
                <p class="color-lightgray-magic-school border-0 p-3 p-cat-name-magic-school"
                   style="border-radius: 50px;background-color: white;"></p>
                <button class="btn p-3 bg-light text-info" type="submit"
                        style="border-radius: 50px; font-weight: bold;">
                    Delete
                </button>
            </form>
        </div>
<%--        enable use--%>
        <div class="edit-window-magic-school enable-user-window-magic-school"
            style="position: fixed; left:50%; top:100px; transform: translate(-50%);display:none;z-index:10">
            <form method="post" action="${pageContext.request.contextPath}/Admin/UpdateEnableUser">
                <span style="font-weight:bold; color:white; font-size:120%;text-align: center;">are you sure?</span>
                <input type="hidden" name="userID" id="userEnableID">
                <button class="btn p-3 bg-light text-info" type="submit"
                        style="border-radius: 50px; font-weight: bold;margin: auto">
                    Yes
                </button>
            </form>
        </div>
        <%--        disable use--%>
        <div class="edit-window-magic-school disable-user-window-magic-school"
             style="position: fixed; left:50%; top:100px; transform: translate(-50%);display:none;z-index:10">
            <form method="post" action="${pageContext.request.contextPath}/Admin/UpdateDisableUser">
                <span style="font-weight:bold; color:white; font-size:120%;text-align: center;">are you sure?</span>
                <input type="hidden" name="userID" id="userDisableID">
                <button class="btn p-3 bg-light text-info" type="submit"
                        style="border-radius: 50px; font-weight: bold;margin: auto">
                    Yes
                </button>
            </form>
        </div>


        <%--        enable course--%>
        <div class="edit-window-magic-school enable-course-window-magic-school"
             style="position: fixed; left:50%; top:100px; transform: translate(-50%);display:none;z-index:10">
            <form method="post" action="${pageContext.request.contextPath}/Admin/UpdateEnableCourse">
                <span style="font-weight:bold; color:white; font-size:120%;text-align: center;">are you sure?</span>
                <input type="hidden" name="courseID" id="courseEnableID">
                <button class="btn p-3 bg-light text-info" type="submit"
                        style="border-radius: 50px; font-weight: bold;margin: auto">
                    Yes
                </button>
            </form>
        </div>
        <%--        disable course--%>
        <div class="edit-window-magic-school disable-course-window-magic-school"
             style="position: fixed; left:50%; top:100px; transform: translate(-50%);display:none;z-index:10">
            <form method="post" action="${pageContext.request.contextPath}/Admin/UpdateDisableCourse">
                <span style="font-weight:bold; color:white; font-size:120%;text-align: center;">are you sure?</span>
                <input type="hidden" name="courseID" id="courseDisableID">
                <button class="btn p-3 bg-light text-info" type="submit"
                        style="border-radius: 50px; font-weight: bold;margin: auto">
                    Yes
                </button>
            </form>
        </div>






        <div class="edit-window-magic-school add-teacher-window-magic-school"
             style="position: fixed; left:50%; top:100px; transform: translate(-50%);display:none;z-index:10">
            <form method="post" action="${pageContext.request.contextPath}/Admin/AddTeacher" class="d-flex justify-content-between w-100 h-100"
                  style="flex-direction: column;">
                <p style="font-weight:bold; color:white; font-size:120%;text-align: center;">Add Teacher</p>
                <input type="text" name="addUsername" id="addUsername" placeholder="username" autocomplete="new-password"
                       class="color-lightgray-magic-school border-0 p-3" style="border-radius: 50px;"><br>
                <input type="password" name="addPassword" id="addPassword" placeholder="password" autocomplete="new-password"
                       class="color-lightgray-magic-school border-0 p-3" style="border-radius: 50px;"><br>
                <input type="text" name="addName" id="addName" placeholder="Full Name" autocomplete="off"
                       class="color-lightgray-magic-school border-0 p-3" style="border-radius: 50px;"><br>
                <input type="text" name="addEmail" id="addEmail" placeholder="Email" autocomplete="off"
                       class="color-lightgray-magic-school border-0 p-3" style="border-radius: 50px;"><br>
                <button class="btn p-3 bg-light text-info" type="submit"
                        style="border-radius: 50px; font-weight: bold;">
                    Add
                </button>

            </form>
        </div>
        <%--        update teacher pass--%>
        <div class="edit-window-magic-school edit-teacher-password-window-magic-school "
             style="position: fixed; left:50%; top:100px; transform: translate(-50%);display: none;z-index: 10;">
            <p style="font-weight:bold; color:white; font-size:120%;text-align: center;">Update Password</p>
            <form method="post" action="${pageContext.request.contextPath}/Admin/UpdateTeacherPass">
                <input type="hidden" name="teacherID" id="teacherID" style="display:none">
                <input type="text" name="newPass" id="newPass" placeholder="Password" autocomplete="off"
                       class="color-lightgray-magic-school border-0 p-3" style="border-radius: 50px">
                <button class="btn-magic-school p-3 bg-light text-info" type="submit"
                        style="border-radius: 50px; font-weight: bold;">Apply</button>
            </form>
        </div>




        <hr>
        <div class="container-fluid" style="background-color:#ecf0f1;overflow: hidden;">
            <div class="circle-1" style="background-color:white;"></div>
            <div class="circle-1" style="background-color:white;width: 100px;height:100px;left: 50%;z-index:0;"></div>
            <div class="circle-1" style="background-color:white;width: 200px;height:200px;left: 40%;z-index:0;"></div>
            <div class="circle-1" style="background-color:white;width: 50px;height:50px;left: 70%;z-index:0;"></div>
            <p style="font-weight: bold;font-size: 50px; color: #341f97;text-align:center"
               class="color-lightgray-magic-school py-5 position-relative">
                Manager
            </p>
            <div class="card container-lg-magic-school">
                <div class="card-header d-flex justify-content-between">
                    <span style="font-weight: bold;color:#341f97;font-size: 20px;" id="category">Categories</span>
                    <div catID="0">
                        <button class="btn add-cat-magic-school" type="button">
                            <i class="fas fa-plus-circle" style="font-size:20px;color:#ff7675"></i>
                        </button>
                    </div>
                </div>
                <div class="card-body ">
                    <table class="table">
                        <c:forEach var="c" items="${categoriesMenu}">
                            <c:choose>
                                <c:when test="${c.parentCat==0}">
                                    <tr>
                                        <td class="d-flex justify-content-between" style="color:#576574; font-weight: bold;">
                                                ${c.name}
                                            <div catID="${c.id}" catName="${c.name}">
                                                <button type="button" class="btn text-info add-cat-magic-school">
                                                    <i class="fas fa-plus"></i>
                                                </button>
                                                <button type="button" class="btn text-danger delete-cat-magic-school">
                                                    <i class="fas fa-minus"></i>
                                                </button>
                                                <button type="button" class="btn text-warning update-cat-magic-school">
                                                    <i class="fas fa-pen"></i>
                                                </button>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <ul class="ml-5 list-unstyled">
                                                <c:forEach items="${categoriesMenu}" var="cc">
                                                    <c:choose>
                                                        <c:when test="${cc.parentCat == c.id}">
                                                            <li class="d-flex justify-content-between" style="border-bottom: 1px solid #dfe4ea">
                                                                <span>${cc.name}</span>
                                                                <div catID="${cc.id}" catName="${cc.name}">
                                                                    <button type="button" class="btn text-danger delete-cat-magic-school">
                                                                        <i class="fas fa-minus"></i>
                                                                    </button>
                                                                    <button type="button" class="btn text-warning update-cat-magic-school">
                                                                        <i class="fas fa-pen"></i>
                                                                    </button>
                                                                </div>
                                                            </li>
                                                        </c:when>
                                                    </c:choose>

                                                </c:forEach>
                                            </ul>
                                        </td>
                                    </tr>
                                </c:when>
                            </c:choose>
                        </c:forEach>
                    </table>
                </div>
            </div>


            <div class="card container-lg-magic-school mt-5">
                <div class="card-header d-flex justify-content-between">
                    <span style="font-weight: bold;color:#341f97;font-size: 20px;" id="course">Course</span>
                    <div>
                        <form method="get">
                            <label for="teacherSearch">teacher</label>
                            <input type="text" id="teacherSearch" name="teacherSearch">
                            <label for="categorySearch">category</label>
                            <select name="categorySearch" id="categorySearch">
                                <option value="0">All</option>
                                <c:forEach var="c" items="${categoriesMenu}">
                                    <option value="${c.id}">${c.name}</option>
                                </c:forEach>
                            </select>
                            <button type="submit" class="btn btn-outline-secondary">Search</button>
                        </form>
                    </div>
                </div>
                <div class="card-body ">
                    <table class="table">
                        <c:forEach items="${courses}" var="c">
                            <tr>
                                <td class="d-flex justify-content-between" style="color:#576574; font-weight: bold;">
                                        ${c.coursename}
                                    <div courseID="${c.id}" courseName="Design">
                                        <button type="button" class="btn text-danger delete-course-magic-school">
                                            <i class="fas fa-minus"></i>
                                        </button>
                                        <c:choose>
                                            <c:when test="${c.enable.equals('true')}">
                                                <button class="btn text-info edit-course-disable-magic-school">
                                                    <i class="fas fa-lock-open"></i>
                                                </button>
                                            </c:when>
                                            <c:otherwise>
                                                <button class="btn text-danger edit-course-enable-magic-school">
                                                    <i class="fas fa-lock"></i>
                                                </button>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>


<%--            teacher--%>
            <div class="card container-lg-magic-school my-5">
                <div class="card-header d-flex justify-content-between">
                    <span style="font-weight: bold;color:#341f97;font-size: 20px;" id="teacher">Teacher</span>
                </div>
                <div class="card-body ">
                    <table class="table">
                        <thead>
                        <tr style="color:#576574">
                            <th>Username</th>
                            <th>Full Name</th>
                            <th>Email</th>
                            <th style="text-align: right;">
                                <button class="btn add-teacher-magic-school" style="font-size: 20px;color:#ff7675">
                                    <i class="fa fa-plus-circle" aria-hidden="true"></i>
                                </button>
                            </th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${teachers}" var="c">
                            <tr>
                                <td>${c.username}</td>
                                <td>${c.name}</td>
                                <td>${c.email}</td>
                                <td style="text-align: right;">
                                    <div userID="${c.id}" userName="lamtvu">
                                        <button type="button" class="btn text-danger delete-teacher-magic-school">
                                            <i class="fas fa-minus"></i>
                                        </button>
                                        <div class="dropdown" style="display:inline">
                                            <button type="button" class="btn text-warning dropdown-toggle" data-toggle="dropdown">
                                                <i class="fas fa-pen"></i>
                                            </button>
                                            <div class="dropdown-menu" userID="${c.id}">
                                                <button class="btn text-info edit-teacher-email-magic-school">email</button>
                                                <button class="btn text-info edit-teacher-password-magic-school">password</button>
                                            </div>
                                        </div>
                                        <c:choose>
                                            <c:when test="${c.enable.equals('true')}">
                                                <button class="btn text-info edit-user-disable-magic-school">
                                                    <i class="fas fa-lock-open"></i>
                                                </button>
                                            </c:when>
                                            <c:otherwise>
                                                <button class="btn text-danger edit-user-enable-magic-school">
                                                    <i class="fas fa-lock"></i>
                                                </button>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>



            <div class="card container-lg-magic-school my-5">
                <div class="card-header d-flex justify-content-between">
                    <span style="font-weight: bold;color:#341f97;font-size: 20px;" id="student">Student</span>
                </div>
                <div class="card-body ">
                    <table class="table">
                        <thead>
                        <tr style="color:#576574">
                            <th>Username</th>
                            <th>Full Name</th>
                            <th>Email</th>
                            <th style="text-align: right;">
                                <button class="btn add-teacher-magic-school" style="font-size: 20px;color:#ff7675">
                                    <i class="fa fa-plus-circle" aria-hidden="true"></i>
                                </button>
                            </th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${students}" var="c">
                            <tr>
                                <td>${c.username}</td>
                                <td>${c.name}</td>
                                <td>${c.email}</td>
                                <td style="text-align: right;">
                                    <div userID="${c.id}" userName="lamtvu">
                                        <button type="button" class="btn text-danger delete-teacher-magic-school">
                                            <i class="fas fa-minus"></i>
                                        </button>
                                        <div class="dropdown" style="display:inline">
                                            <button type="button" class="btn text-warning dropdown-toggle" data-toggle="dropdown">
                                                <i class="fas fa-pen"></i>
                                            </button>
                                            <div class="dropdown-menu" userID="${c.id}">
                                                <button class="btn text-info edit-teacher-email-magic-school">email</button>
                                                <button class="btn text-info edit-teacher-password-magic-school">password</button>
                                            </div>
                                        </div>
                                        <c:choose>
                                            <c:when test="${c.enable.equals('true')}">
                                                <button class="btn text-info edit-user-disable-magic-school">
                                                    <i class="fas fa-lock-open"></i>
                                                </button>
                                            </c:when>
                                            <c:otherwise>
                                                <button class="btn text-danger edit-user-enable-magic-school">
                                                    <i class="fas fa-lock"></i>
                                                </button>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

    </jsp:body>
</t:main>
<%--</body>--%>

<%--</html>--%>