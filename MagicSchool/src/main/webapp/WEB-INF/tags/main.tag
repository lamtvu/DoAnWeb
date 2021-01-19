<%@tag pageEncoding="utf-8" %>
<%@attribute name="css" fragment="true" required="false" %>
<%@attribute name="js" fragment="true" required="false" %>
<!DOCTYPE>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/bootstrap/5.0.0-beta1/css/bootstrap.min.css"/>
    <jsp:invoke fragment="css"/>
</head>
<body>
    <jsp:doBody/>
    <script src="${pageContext.request.contextPath}/webjars/jquery/3.5.1/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/webjars/bootstrap/5.0.0-beta1/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/webjars/font-awesome/5.15.1/js/all.js"></script>
    <jsp:invoke fragment="js"/>
</body>
</html>
