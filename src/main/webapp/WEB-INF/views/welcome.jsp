<!DOCTYPE html>
<%@page import="com.baseMVC.web.controllers.UserController" %>
<%@include file="taglib.jsp" %>
<html>
<head>
    <title>Welcome</title>

    <link href="${rootURL}resources/bootstrap/css/bootstrap.css" media="screen" rel="stylesheet"
          type="text/css"/>
    <script type="text/javascript" src="${rootURL}resources/jquery/jquery-1.10.2.js"></script>
    <script type="text/javascript" src="${rootURL}resources/bootstrap/js/bootstrap.js"></script>
    <script type="text/javascript" src="${rootURL}resources/js/app.js"></script>

</head>
<body>

<h2>Welcome <%=UserController.getCurrentUser().getName() %>
</h2>

<h3>Email: <sec:authentication property="name"/></h3>

<h3>
    <sec:authorize access="hasRole('ROLE_ADMIN')">
        <a href="${rootUrl}admin">Administration</a>
    </sec:authorize>
</h3>

<h3>
    <sec:authorize access="isRememberMe()">
        <h2># This user is login by "Remember Me Cookies".</h2>
    </sec:authorize>

    <sec:authorize access="isFullyAuthenticated()">
        <h2># This user is login by username / password.</h2>
    </sec:authorize>
</h3>
<p><a href="javascript:formSubmit()">Logout</a></p>

<c:url value="${rootUrl}logout" var="logoutUrl">LoGoUt</c:url>
<form action="${logoutUrl}" method="post" id="logoutForm">
    <input type="hidden" name="${_csrf.parameterName}"
           value="${_csrf.token}"/>
</form>
<script>
    function formSubmit() {
        document.getElementById("logoutForm").submit();
    }
</script>


<ul>
    <li><a href="${rootUrl}hello">Hello</a></li>
    <li><a href="${rootUrl}accounts">Accounts</a></li>
    <li><a href="${rootUrl}admin">Admin page</a></li>
</ul>
</body>
</html>
