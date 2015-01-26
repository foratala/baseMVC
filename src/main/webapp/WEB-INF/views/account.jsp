<!doctype html>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<html>
<head>
    <meta charset="utf-8">
    <title>Spring MVC Application</title>

    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css"
          rel="stylesheet">

    <style>
        .error {
            color: red; font-weight: bold;
        }
    </style>
</head>

<body>

<div class="container">
    <div class="row">
        <div class="span8 offset2">
            <h1>accounts</h1>
            <form:form method="post" action="accounts/add" commandName="account" class="form-horizontal">
            <div class="control-group">
                <form:label cssClass="control-label" path="firstName">First Name:</form:label>
                <div class="controls">
                    <form:input path="firstName"/>
                    <form:errors path="firstName" cssClass="error"/>
                </div>
            </div>
            <div class="control-group">
                <form:label cssClass="control-label" path="lastName">Last Name:</form:label>
                <div class="controls">
                    <form:input path="lastName"/>
                    <form:errors path="lastName" cssClass="error"/>
                </div>
            </div>
            <div class="control-group">
                <form:label cssClass="control-label" path="email">Email:</form:label>
                <div class="controls">
                    <form:input path="email"/>
                    <form:errors path="email" cssClass="error"/>
                </div>
            </div>
            <div class="control-group">
                <div class="controls">
                    <input type="submit" value="Add account" class="btn"/>
                    </form:form>
                </div>
            </div>

            <c:if test="${!empty accounts}">
                <h3>accounts</h3>
                <table class="table table-bordered table-striped">
                    <thead>
                    <tr>
                        <th>Name</th>
                        <th>Email</th>
                        <th>&nbsp;</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${accounts}" var="account">
                        <tr>
                            <td>${account.lastName}, ${account.firstName}</td>
                            <td>${account.email}</td>
                            <td>
                                <form action="accounts/delete/${account.id}" method="post"><input
                                        type="submit"
                                        class="btn btn-danger btn-mini"
                                        value="Delete"/>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </c:if>
        </div>
    </div>
</div>

</body>
</html>
