<%@ page import="com.softserve.itacademy.model.Task" %><%--
  Created by IntelliJ IDEA.
  User: roman
  Date: 05.01.21
  Time: 17:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Read existing Task</title>
</head>
<body>
<% Task task = (Task) request.getAttribute("task"); %>
<jsp:include page="toolbar.jsp" />
<h1>Read existing Task</h1>
<table>
    <tr>
        <td>Id:</td>
        <td><b><%= task.getId() %></b></td>
    </tr><tr>
        <td>Title:</td>
        <td><b><%= task.getTitle() %></b></td>
    </tr><tr>
        <td>Priority:</td>
        <td><b><%= task.getPriority() %></b></td>
    </tr>
</table>
</body>
</html>
