<%@ page import="com.softserve.itacademy.model.Task" %>
<%@ page import="com.softserve.itacademy.model.Priority" %><%--
  Created by IntelliJ IDEA.
  User: roman
  Date: 06.01.21
  Time: 17:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit existing Task</title>
</head>
<body>
<% Task task = (Task) request.getAttribute("task"); %>
<% Priority[] priorities = Priority.values(); %>
<jsp:include page="toolbar.jsp" />
<form action="${pageContext.request.contextPath}/edit-task" method="post"><table>
    <% if (request.getAttribute("message") != null) { %>
    <tr><%= request.getAttribute("message") %></tr>
    <% } %>
    <tr>
        <td><label for="id">Id: </label></td>
        <td><input type="text" id="id" name="id" readonly value="<%= task.getId() %>"></td>
    </tr>
    <tr>
        <td><label for="name">Name: </label></td>
        <td><input type="text" id="name" name="name" value="<%= task.getTitle() %>"></td>
    </tr>
    <tr>
        <td><label for="prio">Priority: </label></td>
        <td><select name="priority" id="prio">
            <% for (Priority pr : priorities) { %>
            <% String name1 = pr.name(); String name = Character.toUpperCase(name1.charAt(0)) + name1.substring(1).toLowerCase(); %>
            <option <%= pr == task.getPriority() ? "selected" : "" %>><%= name %></option>
            <% } %>
        </select></td>
    </tr>
    <tr>
        <td></td> <%-- empty td for alignment --%>
        <td><button type="submit">Update</button></td>
    </tr>
</table></form>
</body>
</html>
