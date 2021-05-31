<%--
  Created by IntelliJ IDEA.
  User: MSI-PC
  Date: 2021/5/28
  Time: 16:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<%
    pageContext.setAttribute("app_path",request.getContextPath());
%>
<head>
    <script type="text/javascript" src="${app_path}/static/js/jquery-1.12.4.min.js"></script>
    <link href="${app_path}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${app_path}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js "></script>
    <title>员工列表</title>
</head>
<body>
<div class="container">
<%--    标题--%>
    <div class="row">
        <div class="col-md-12">
            <h1>SSM-CRUD</h1>
        </div>
    </div>
<%--    按钮--%>
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <a href=${app_path}/add><button class="btn btn-primary">新增</button></a>
            <button class="btn btn-danger" href="${app_path}/delete">删除</button>
        </div>
    </div>
<%--    显式表格数据--%>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover">
                <tr>
                    <th>#</th>
                    <th>姓名</th>
                    <th>性别</th>
                    <th>邮箱</th>
                    <th>部门</th>
                    <th>操作</th>
                </tr>
                <c:forEach items="${PageInfo.list}" var="emp">
                    <tr>
                        <th>${emp.empId}</th>
                        <th>${emp.empName}</th>
                        <th>${emp.gender=="M"?"男":"女"}</th>
                        <th>${emp.email}</th>
                        <th>${emp.department.deptName}</th>
                        <th>
                            <button class="btn btn-primary btn-sm">
                                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                编辑
                            </button>
                            <button class="btn btn-danger btn-sm">
                                <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                删除
                            </button>
                        </th>
                    </tr>
                </c:forEach>

            </table>
        </div>
    </div>
<%--    显式分页信息--%>
    <div class="row">
<%--        分页信息--%>
        <div class="col-md-6">
        当前第${PageInfo.pageNum}页,总共${PageInfo.pages}页,总共${PageInfo.total}记录
        </div>
<%--        分页条--%>
        <div class="col-md-6">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <li><a href="${app_path}/emps?pn=1">首页</a></li>
                    <c:if test="${PageInfo.hasPreviousPage}">
                    <li>
                        <a href="${app_path}/emps?pn${PageInfo.pageNum-1}" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    </c:if>
                    <c:forEach items="${PageInfo.navigatepageNums}" var="pagenum">
                        <c:if test="${pagenum==PageInfo.pageNum}">
                            <li class="active"><a href="#">${pagenum}</a></li>
                        </c:if>
                        <c:if test="${pagenum!=PageInfo.pageNum}">
                            <li><a href="${app_path}/emps?pn=${pagenum}">${pagenum}</a></li>
                        </c:if>
                    </c:forEach>
                    <c:if test="${PageInfo.hasNextPage}">
                        <li>
                            <a href="${app_path}/emps?pn=${PageInfo.pageNum+1}" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </c:if>

                    <li><a href="${app_path}/emps?pn=${PageInfo.pages}">末页</a></li>
                </ul>
            </nav>
        </div>
    </div>
</div>
</body>
</html>
