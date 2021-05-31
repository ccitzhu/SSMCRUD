<%--
  Created by IntelliJ IDEA.
  User: MSI-PC
  Date: 2021/5/31
  Time: 11:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加员工</title>
</head>
<% pageContext.setAttribute("path",request.getContextPath());%>
<body>
    <div>
        <div class="col-md-4 col-md-offset-4">
            <h2>成功添加${nums}记录</h2>
        </div>
    </div>
<form action="${path}/addemps" method="post">
    <div class="form-group">
        <label>姓名</label>
        <div class="col-sm-10">
        <input type="text" class="form-control" name="empName" placeholder="姓名 ">
        </div>
    </div>
    <div class="form-group">
        <label >性别</label>
        <div class="col-sm-10">
    <select class="form-control" name="gender">
        <option value="M">男</option>
        <option value="F">女</option>
    </select>
        </div>
    </div>
    <div class="form-group">
        <label>邮箱</label>
        <div class="col-sm-10">
        <input type="text" class="form-control" name="email" placeholder="邮箱">
        </div>
    </div>
    <div class="form-group">
        <label>部门编号</label>
        <div class="col-sm-10">
        <input type="text" class="form-control" name="dId" placeholder="部门编号">
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
            <button type="submit" class="btn btn-default">提交</button>
        </div>
    </div>
</form>
</body>
</html>
