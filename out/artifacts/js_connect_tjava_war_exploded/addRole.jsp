<%--
  Created by IntelliJ IDEA.
  User: LEGION
  Date: 2022/8/25
  Time: 22:49
  To change this template use File | Settings | File Templates.
--%>
<% String path = request.getContextPath(); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加角色</title>
</head>
<body>
<form id="form" method="post" action="<%=path%>/_roleservlet">
    <input type="hidden" value="1" name="type" />
    <input type="hidden" value="${flag}" name="flag" id="flag" />
    <input type="hidden" value="${role.roleId}" name="roleId" />
    角色名称：<input type="text" id="roleName" name="roleName" value="${role.roleName}" /> <br>
    <button type="button" onclick="add();" >保 存</button>
    <button type="button" onclick="cancel();" >取 消</button>
</form>
</body>
</html>

<script>
    function add() {
        var roleName = document.getElementById("roleName").value;

        if (roleName == null || roleName == '') {
            alert("请输入一个角色名称！");
            return;
        }

        // submit
        document.getElementById("form").submit();
    }

    function cancel() {
        window.location.href = "<%=path%>/_roleservlet?type=0";
    }
</script>