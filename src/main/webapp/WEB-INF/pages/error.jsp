<%--
  Created by IntelliJ IDEA.
  User: roman
  Date: 06.01.21
  Time: 17:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Task not found</title>
</head>
<body>
<jsp:include page="toolbar.jsp" />
<h1>Task with ID '<%= request.getAttribute("task-id") %>' not found in To-Do List!</h1>
<h2>url: <%= request.getAttribute("from-url") %></h2>
</body>
</html>
