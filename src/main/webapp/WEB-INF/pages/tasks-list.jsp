<%@ page import="com.softserve.itacademy.model.Task" %>
<%@ page import="java.util.List" %>
<%@ page import="com.softserve.itacademy.repository.TaskRepository" %><%--
  Created by IntelliJ IDEA.
  User: roman
  Date: 04.01.21
  Time: 11:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% TaskRepository repo = (TaskRepository) request.getAttribute("repository"); %>
<% List<Task> all = repo.all(); %>
<html>
<head>
    <title>Task List</title>
</head>
<body>
<jsp:include page="toolbar.jsp" />
<h1>List of Tasks</h1>
<table border="1">
<thead><tr>
    <th>No.</th>
    <th>Name</th>
    <th>Priority</th>
    <th colspan="3">Operation</th>
</tr></thead>
<tbody><% for (Task task : all) { %>
    <tr>
        <td><%= task.getId() %></td>
        <td><%= task.getTitle() %></td>
        <td><%= task.getPriority() %></td>
        <td><a href="${pageContext.request.contextPath}/read-task?id=<%= task.getId() %>">Read</a></td>
        <td><a href="${pageContext.request.contextPath}/edit-task?id=<%= task.getId() %>">Edit</a></td>
        <td><a href="${pageContext.request.contextPath}/delete-task?id=<%= task.getId() %>">Delete</a></td>
    </tr>
<% } %></tbody>
</table>
</body>
</html>
