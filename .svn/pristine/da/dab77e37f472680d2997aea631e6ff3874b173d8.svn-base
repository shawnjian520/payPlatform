<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../../common/list-header.jsp" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";

%>
<script>
    page = {
        resetpwd: function (el) {
            var form_element = $(el).parents('.form-horizontal');
            var ids = tool.getChoseData(form_element);
            var type = '${type}';
            if (!isBlank(ids)) {
                if (ids.split(",").length == 1) {
                    $.post(tool.initParams('<%=basePath%>s/system/student/resetpwd'), {
                        'id': ids,
                        'type': type
                    }, function (data) {
                        data = eval("(" + data + ")");
                        tool.alertSuccess(data.msg);
                    });
                } else {
                    tool.alertWarning('不支持批量修改,请勾选1条数据!', '请在下方列表中勾选一条要修改的数据');
                }
            } else {
                tool.alertWarning("请选择要重置密码的学生!");
            }
        }
    }
</script>
<div class="row">
    <div class="col-sm-12 col-xl-10">
        <div class="form-group">
            <label class="control-label col-xs-2">
                身份证号：
            </label>

            <div class="col-xs-3">
                <input type="text" id="sfzh" name="sfzh" class="form-control   " value="${object.sfzh }"/>
            </div>

            <div class="col-xs-3">
                <a class="btn btn-sm btn-primary" onclick="tool.doSearch(this)">
                    查询 <i class="fa fa-search"></i>
                </a>
                <a class="btn btn-sm btn-primary btn-reset" onclick="tool.resetForm(this)">
                    重置 <i class="fa fa-mail-reply-all"></i>
                </a>
            </div>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-md-12">
        <a class="btn btn-sm btn-success" onclick="page.resetpwd(this)">
            重置密码 <i class="fa fa-plus"></i>
        </a><span class="label label-danger">将密码重置为111111</span>
        <div class="btn-group pull-right">
            <%@include file="../../common/other/page-size.jsp" %>
        </div>
    </div>
</div>
<div class="dataTables_wrapper form-inline">
    <table class="table table-striped table-hover dataTable table-bordered table-order">
        <thead>
        <tr>
            <th class="center w20">
                <label>
                    <input type="checkbox" class="mgc selectall">
                </label>
            </th>
            <th>身份证号</th>
            <th>学校</th>
            <c:if test="${type=='gx' }">
                <th>院系</th>
                <th>辅导员</th>
                <th>班级</th>
            </c:if>
            <c:if test="${type=='gz' }">
                <th>省</th>
                <th>市</th>
                <th>县</th>
            </c:if>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${resultData}" var="obj">
            <tr id="tr_${obj.id}">
                <td class="center">
                    <label>
                        <input type="checkbox" class="mgc foocheck" name="selectNode" value="${obj.id}">
                    </label>
                </td>
                <td>${obj.sfzh}</td>
                <td>${obj.xxbm}</td>
                <c:if test="${type=='gx' }">
                    <td>${obj.yxbm}</td>
                    <td>${obj.fdybm}</td>
                    <td>${obj.bjbm}</td>
                </c:if>
                <c:if test="${type=='gz' }">
                    <td>${obj.sheng}</td>
                    <td>${obj.shi}</td>
                    <td>${obj.xian}</td>
                </c:if>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<style>
    tr, th, td {
        text-align: center
    }
</style>
<%@include file="../../common/list-bottom.jsp" %>