<%--
  Created by IntelliJ IDEA.
  User: roman
  Date: 04.01.21
  Time: 09:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.softserve.itacademy.model.Priority" %>
<html>
<head>
    <title>Create new Task</title>
</head>
<body>
<% Priority[] priorities = Priority.values(); %>
<jsp:include page="toolbar.jsp" />
<h1>Create new Task</h1>
<form action="${pageContext.request.contextPath}/create-task" method="post"><table>
    <% if (request.getAttribute("message") != null) { %>
    <tr><%= request.getAttribute("message") %></tr>
    <% } %>
    <tr>
        <td><label for="name">Name: </label></td>
        <td><input type="text" id="name" name="name"></td>
    </tr>
    <tr>
        <td><label for="prio">Priority: </label></td>
        <td><select name="priority" id="prio">
            <% for (Priority pr : priorities) { %>
            <% String name = pr.name(); %>
                <option><%= Character.toUpperCase(name.charAt(0)) + name.substring(1).toLowerCase() %></option>
            <% } %>
        </select></td>
    </tr>
    <tr>
        <td></td> <%-- empty td for alignment --%>
        <td><button type="submit">Submit</button></td>
    </tr>
</table></form>
</body>
</html>
