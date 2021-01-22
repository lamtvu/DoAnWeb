<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en" class="h-100">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/bootstrap/5.0.0-beta1/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/main.css">
</head>

<body class="h-100">
<div class="background-magic-school w-100" style="position: relative; overflow: hidden;height: 100%;">
    <div class="circle-1" style="left:50%; width: 500px; height: 500px; background-color:#ff9ff3;">
        <div class="circle-1" style="top:15%;left:-10%; width: 200px; height: 200px; background-color: #1dd1a1;">
        </div>
        <div class="circle-1" style="top:75%;left:-10%; width: 300px; height: 300px; background-color: #feca57;">
        </div>
    </div>
    <div class="circle-1" style="left:20%; width: 300px; height: 300px; background-color: #48dbfb;">
        <div class="circle-1" style="left:75%;top:100%; width: 200px; height: 200px; background-color: #ff6b6b;">
        </div>
    </div>
    <i class="fas fa-key icon-float-magic-school" style="left: 10%; animation-duration: 30s; animation-delay:6s;" aria-hidden="true"></i>
    <i class="fa fa-lock icon-float-magic-school" style="left: 00%; animation-duration: 16s;" aria-hidden="true"></i>
    <i class="fa fa-user icon-float-magic-school" style="left: 20%; animation-delay: 14s;" aria-hidden="true"></i>
    <i class="fa fa-address-book icon-float-magic-school" style="left: 15%; animation-duration: 24s;" aria-hidden="true"></i>
    <i class="fa fa-laptop-code icon-float-magic-school" style="left:95%; animation-duration:11s; animation-delay:3s;" aria-hidden="true"></i>
    <i class="fa fa-graduation-cap icon-float-magic-school" style="left:80%; animation-duration:16s; animation-delay:6s;" aria-hidden="true"></i>
    <i class="fa fa-user-shield icon-float-magic-school" style="left:90%; animation-duration:13s; animation-delay:4s;" aria-hidden="true"></i>
    <div style="width:500px;margin: auto;z-index: 2;" class="position-relative">
        <p style="font-weight: bold; font-size:50px; color:white; border-radius: 50px; text-align: center;">Login to Magic School
        </p>
        <c:if test="${hasError}">
            <div class="p-2" style="color: red;background-color: yellow; font-size: 20px;font-weight: bold; text-align: center; border-radius: 20px;">
                    ${errorMessage}
            </div>
        </c:if>
        <form id="form-login" method="post" class="mt-5 mb-5" style="position:relative;">
            <div class="position-relative w-100 color-lightgray-magic-school p-2 input-group-magic-school input-group-focusout-magic-school mb-5"
                 style="border-radius: 50px; border: 3px solid white;background-color: white;">
                <input type="text" name="username" autocomplete="off" id="username"
                       class="h-75 border-0 m-1 color-lightgray-magic-school"
                       style="width: 90%;font-weight: bold; background-color:transparent ;">
                <label for="username">
                    UserName
                </label>
                <i class="fas fa-user"></i>
            </div>
            <div class="position-relative w-100 color-lightgray-magic-school p-2 input-group-magic-school input-group-focusout-magic-school mb-5"
                 style="border-radius: 50px; border: 3px solid white;background-color: white;">
                <input type="password" name="password" autocomplete="off" id="password"
                       class="h-75 border-0 m-1 color-lightgray-magic-school"
                       style="width:90%;font-weight: bold; background-color:transparent;">
                <label for="password">
                    Password
                </label>
                <i class="fas fa-key"></i>
            </div>

            <br>
            <button type="submit" class="color-lightgray-magic-school w-50 btn-magic-school p-3"
                    style="margin-left:25%;border-radius: 50px;font-weight: bold; background-color: white;">Login</button>
        </form>
    </div>
</div>
<script src="${pageContext.request.contextPath}/webjars/jquery/3.5.1/jquery.js"></script>
<script src="${pageContext.request.contextPath}/webjars/bootstrap/5.0.0-beta1/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/webjars/font-awesome/5.15.1/js/all.js"></script>
<script src="${pageContext.request.contextPath}/public/js/main.js"></script>
<script src="${pageContext.request.contextPath}/public/js/checkInput.js"></script>
</body>

</html>
