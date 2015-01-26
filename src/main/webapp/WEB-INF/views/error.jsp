<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 12/29/14
  Time: 15:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<h1>Error Page</h1>

<p>Application has encountered an error. Please contact support on ...</p>

<%--<!----%>
    Failed URL: ${url}
    Exception:  ${ex.message}
    <c:forEach items="${ex.stackTrace}" var="ste">    ${ste}
    </c:forEach>
    <%---->--%>
</body>
</html>
