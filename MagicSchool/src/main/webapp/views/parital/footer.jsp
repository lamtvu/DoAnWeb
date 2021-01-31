<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 1/22/2021
  Time: 10:58 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="categoriesMenu" type="java.util.List<beans.Category>" scope="request"/>

<footer>
    <div class="border-top border-secondary m-0 position-relative">
        <div class="container mt-3">
            <div class="row justify-content-start">
                <div class="col-4 d-flex flex-column ">
                    <c:forEach var="c" items="${categoriesMenu}">
                    <c:choose>
                        <c:when test="${c.parentCat>0}">
                            <a class="text-success" href="#">    ${c.name} </a>
                        </c:when>
                    </c:choose>
                    </c:forEach>
                </div>
                <div class="col-4 d-flex flex-column">
                    <a class="text-success" href="#">Careers</a>
                    <a class="text-success" href="#">Help and Support</a>
                    <a class="text-success" href="#">Affiliate</a>
                </div>
                <div class="col-4 d-flex flex-column">
                    <a class="text-success" href="#">Terms</a>
                    <a class="text-success" href="#">Privacy policy</a>
                    <a class="text-success" href="#">Sitemap</a>
                    <a class="text-success" href="#">Features Courses</a>
                </div>

            </div>
        </div>

            <div class="col-4 d-flex-column">
            </div>
    </div>
<a href="#">
    <img src="${pageContext.request.contextPath}/public/imgs/logo.PNG"/>
</a>


</footer>
