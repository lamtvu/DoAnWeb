<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="e" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="categoriesMenu" scope="request" type="java.util.List<beans.Category>"/>

<nav class="top-bar-magic-school d-flex align-items-center justify-content-between shadow-magic-school ">
    <button type="button" class="btn-magic-school ml-3 enable-900px-magic-school" style="font-size: 30px;">
        <i class="fa fa-bars" aria-hidden="true"></i>
    </button>
    <div class="logo-magic-school ml-3" style="width:50px;height:40px;color:transparent">magicSchool</div>
    <a href="${pageContext.request.contextPath}/Home" class="logo-text-magic-school">MagicSchool</a>
    <div class="dropdown-magic-school h-100">
        <p class="menu-text-magic-school dropdown-title-magic-school">Categories</p>
        <ul class="dropdown-content-magic-school list-unstyled" style="width:250px;height:600px;top:70px">
            <c:forEach var="cp" items="${categoriesMenu}">
                <c:choose>
                    <c:when test="${cp.parentCat == 0}">
                        <li class="dropdown-magic-school">
                            <a href="#" class="dropdown-title-magic-school menu-text-magic-school">${cp.name}</a>
                            <i class="fa fa-angle-right" aria-hidden="true"></i>
                            <ul class="dropdown-content-left-magic-school list-unstyled" style="width:250px;height:600px;">
                                <c:forEach var="cc" items="${categoriesMenu}">
                                <c:choose>
                                    <c:when test="${cc.parentCat == cp.id}">
                                            <li><a class="menu-text-magic-school" href="${pageContext.request.contextPath}/Course/ByCat?id=${cc.id}">${cc.name}</a></li>
                                    </c:when>
                                </c:choose>
                            </c:forEach>
                            </ul>
                        </li>
                    </c:when>
                </c:choose>
            </c:forEach>
        </ul>
    </div>
    <div class=" border-normal-magic-school h-75 ml-3 mr-3 bg-lightgray-magic-school"
         style="border-radius:50px; width: 40%;">
        <form action="" class="w-100 d-flex align-items-center h-100">
            <button class="btn-magic-school bg-lightgray-magic-school ml-3 mr-3" style="width:30px" type="submit">
                <i class="fa fa-search color-lightgray-magic-school font-size-20 font-weight-lighter"
                   aria-hidden="true"></i>
            </button>
            <input type="text" placeholder="Search for anything" autocomplete="off"
                   class="bg-lightgray-magic-school color-lightgray-magic-school mr-1" style="border:0;width:90%;"
                   name="search">
        </form>
    </div>
    <div class="dropdown-magic-school h-100 hidden-1024px-magic-school">
        <p class="menu-text-magic-school dropdown-title-magic-school" style="width:100px">Teach on MagicSchool
        </p>
        <div class="dropdown-content-magic-school" style="width:270px;top:70px">
            <p class="w-100 p-2 m-0" style="font-weight: 800; font-size:18px;text-align: center; color:#192a56;">
                Turn what you know into an<br> opportunity and reach <br> millions around the world.
            </p>
            <a href="#" class="btn-blue-magic-school position-relative mb-2"
               style="left:50%;transform: translateX(-50%);width:250px; height:50px;font-weight: 700; line-height: 50px;">
                learn more
            </a>
        </div>
    </div>
<%--    <a class="menu-text-magic-school ml-3 mr-3" style="font-size: 28px;">--%>
<%--        <i class="fa fa-shopping-cart" aria-hidden="true"></i>--%>
<%--    </a>--%>
    <div style="margin-right: 10px;" class="d-flex justify-content-center">
        <c:choose>
            <c:when test="${auth}">
                <div class="d-flex pt-3 me-3">
                    <a class="mx-3" href="${pageContext.request.contextPath}/User/MyCourse">
                        <i class="fas fa-book" style="font-size: 30px;color: #3742ff;"></i>
                    </a>
                    <a class="mx-4"href="${pageContext.request.contextPath}/User/MyWatchList">
                        <i class="fas fa-heart" style="font-size: 30px;color: hotpink;"></i>
                    </a>
                    <p class="fw-bolder">
                        Hi! ${authUser.name}
                    </p>
                </div>
                <a class="btn-magic-school p-2 m-1" style="border-radius: 10px;background-color: #badc58;font-weight: 700;" href="#">Sign Out</a>
            </c:when>
            <c:otherwise>
                <a class="btn-blue-magic-school p-2 m-1" style="width:80px; font-weight: 700;" href="${pageContext.request.contextPath}/Account/Register">Sign Up</a>
                <a class="btn-blue-magic-school p-2 m-1" style="width:70px; font-weight: 700;" href="${pageContext.request.contextPath}/Account/Login">Sign In</a>
            </c:otherwise>
        </c:choose>
    </div>
</nav>
<div class="container-lg-magic-school background-magic-school d-flex flex-wrap position-relative" style="height: 400px;">
    <div class="circle-1" style="width:300px;height:300px; background-color:yellow"></div>
    <div class="circle-1" style="top:40%;left:25%;width:250px;height: 250px; background-color:#48dbfb"></div>
    <div class="circle-1" style="top:50%;width:500px;height: 500px; background-color:pink"></div>
    <div class="circle-1" style="top:5%;left:15%;width:300px;height: 300px; background-color:#1dd1a1"></div>
    <i class="fas fa-file-code icon-float-magic-school"style="left:55%" aria-hidden="true"></i>
    <i class="fas fa-laptop-code icon-float-magic-school" style="animation-delay:2s;animation-duration:10s;left:70%"aria-hidden="true"></i>
    <i class="fas fa-camera-retro icon-float-magic-school" style="animation-delay: 2s;left: 90%;"></i>
    <i class="fas fa-code icon-float-magic-school" style="animation-delay:1s;left:80%"aria-hidden="true"></i>
    <i class="fas fa-camera icon-float-magic-school" style="animation-delay:3s; left: 75%"aria-hidden="true"></i>
    <i class="fas fa-terminal icon-float-magic-school" style="animation-delay:5s;animation-duration:10s;left:60%"aria-hidden="true"></i>
    <div class="billboard-magic-school d-flex justify-content-center flex-wrap"
         style="width:450px;height:280px;top:10%;left:5%; align-content: center;">
        <p style="width:400px;font-size:40px;font-weight:700;line-height: 50px;margin:0">Get early access,<br> now
        </p>
        <p style="width:400px;font-size:18px;">Be first for our <b>free learning course</b>, and get courses from
            $19.99.</p>
        <div class="bg-lightgray-magic-school border-normal-magic-school d-flex justify-content-center align-items-center"
             style="width:400px;height: 50px; border-radius:5px">
            <form action="">
                <input class="bg-lightgray-magic-school color-lightgray-magic-school" autocomplete="off"
                       placeholder="what do you want to learn?" type="text" name="search"
                       style="width:300px;height:30px;border:0;">
                <button type="submit" class="btn-magic-school bg-lightgray-magic-school" style="font-size: 20px;">
                    <i class="fa fa-search color-lightgray-magic-school"></i>
                </button>
            </form>
        </div>
    </div>
</div>