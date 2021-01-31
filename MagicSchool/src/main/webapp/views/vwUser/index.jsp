<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<t:main>
    <jsp:attribute name="css">
    </jsp:attribute>
    <jsp:attribute name="js">

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="${pageContext.request.contextPath}/public/js/main.js"></script>
        <script src="${pageContext.request.contextPath}/public/js/Admin.js"></script>
        <script>
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

        <!-- update Full Name -->
        <div class="edit-window-magic-school edit-name-window-magic-school "
             style="position: fixed; left:50%; top:100px; transform: translate(-50%);display: none;z-index: 10;">
            <p style="font-weight:bold; color:white; font-size:120%;text-align: center;">Update Full Name</p>
            <form method="post" action="${pageContext.request.contextPath}/Student/UpdateName">
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
            <form method="post" action="${pageContext.request.contextPath}/Student/UpdateEmail">
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
                  action="${pageContext.request.contextPath}/Student/UpdatePassword" style="flex-direction: column;">
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
    </jsp:body>
</t:main>
