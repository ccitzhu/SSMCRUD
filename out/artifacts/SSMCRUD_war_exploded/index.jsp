<%--
  Created by IntelliJ IDEA.
  User: MSI-PC
  Date: 2021/5/29
  Time: 14:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
            <button class="btn btn-primary">新增</button>
            <button class="btn btn-danger">删除</button>
        </div>
    </div>
    <%--    显式表格数据--%>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover" id="emps_tables">
                <thead>
                <tr>
                    <th>#</th>
                    <th>姓名</th>
                    <th>性别</th>
                    <th>邮箱</th>
                    <th>部门</th>
                    <th>操作</th>
                </tr>
                </thead>
<tbody>

</tbody>
            </table>
        </div>
    </div>
    <%--    显式分页信息--%>
    <div class="row">
        <%--        分页信息--%>
        <div class="col-md-6">
            当前第页,总共页,总共记录
        </div>
        <%--        分页条--%>
        <div class="col-md-6">

        </div>
    </div>
</div>
<script type="text/javascript">
    //1.页面加载完成以后，直接发送ajax请求要到分页数据
$(function () {
     $.ajax({url:"${app_path}/emps",
     data:"pn=1",
     type:"GET",
         success:function (result) {
              console.log(result);
         }
     });
});
function  build_emps_table(result) {
    var emps=result.extend.pageinfo.list;
        $.each(emps,function (index,item) {
            var empIdTd=$("<td></td>").append(item.empId);
            var empNameTd=$("<td></td>").append(item.empName);
            var genderTd=$("<td></td>").append(item.gender=='M'?"男":"女");
            var emailTd=$("<td></td>").append(item.email);
            var deptNameTd=$("<td></td>").append(item.department.deptName);
      $("<tr></tr>").append(empIdTd).append(empNameTd).append(genderTd)
          .append(emailTd).append(deptNameTd).appendTo("emps_tables");
});
}
function build_page_nav(result) {

}
</script>
</body>
</html>
