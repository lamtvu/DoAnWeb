<%@tag pageEncoding="utf-8" %>
<%@attribute name="css" fragment="true" required="false" %>
<%@attribute name="js" fragment="true" required="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/main.css"/>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/public/imgs/logo.PNG" type="image/x-icon" />
    <title>MagicSchool</title>
    <jsp:invoke fragment="css"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
</head>
<body>
    <jsp:include page="../../views/parital/menu.jsp"/>
    <jsp:doBody/>
    <jsp:include page="../../views/parital/footer.jsp"/>
    <script src="${pageContext.request.contextPath}/webjars/jquery/3.5.1/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/webjars/bootstrap/5.0.0-beta1/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/webjars/font-awesome/5.15.1/js/all.js"></script>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <jsp:invoke fragment="js"/>
</body>
</html>
