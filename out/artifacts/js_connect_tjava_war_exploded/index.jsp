<%--
  Created by IntelliJ IDEA.
  User: LEGION
  Date: 2022/8/11
  Time: 14:26
  To change this template use File | Settings | File Templates.
--%>
<% String path = request.getContextPath(); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="css/admin.css" type="text/css">

    <title>$Title$</title>
</head>
<body>
<div id="Accframe" class="Cn" style="border:2px solid #6dc3bb; border-radius: 20px;width: 230px;
        height: 40px; padding: 0 10px; display: flex; flex-direction: row; justify-content: space-between;line-height: 40px;">

    <div id="Accountsvalue" style="font-size: 13px;">${Accountsvalue}</div>
    <button id="Accountsbutton" onclick="connect()" style="margin-top: 3px; height: 34px; width: 80px; border-radius: 10px; font-size: 14px;
    background: linear-gradient(to right,#ead6ee,#a0f1ea);border: 0px; color: rgb(0, 0, 0)">${Accountsbutton}</button>

</div>
<div id="network" class="net">${network}</div>
    <h1>Welcome</h1>
<a href="<%=path%>/_logoutservlet">退出系统</a>
<br><br>
<c:forEach items="${menus}" var="m">
  <c:if test="${m.checkId != null}">
    <a href="<%=path%>${m.menuPath}">${m.menuName}</a> &nbsp;
  </c:if>
</c:forEach>
<hr  />
<br/>
</body>
</html>

