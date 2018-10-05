<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + request.getContextPath();
%>
<%@include file="../../common/list-header.jsp" %>
<div class="row">
    <div class="col-sm-12 col-xl-10 nopadding">
        <div id="" class="layout col-xs-9">
            <div class="col-xxxl-3 col-md-4 col-sm-6 col-xs-12 nopadding edit-element">
                <div class="form-group">
                    <label title="方法名称" class="col-sm-3 control-label ell nopadding">方法名称：</label>
                    <div class="col-sm-9">
                        <input type="text" id="name" name="name" class="form-control   " placeholder="方法名称"
                               value="${object.name }"/>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xs-2">
            <a class="btn btn-sm btn-primary" onclick="tool.doSearch(this)">
                查询 <i class="fa fa-search"></i>
            </a>
            <a class="btn btn-sm btn-primary btn-reset" onclick="tool.resetForm(this)">
                重置 <i class="fa fa-mail-reply-all"></i>
            </a>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-md-12">
        <a class="btn btn-sm btn-success" data-startFrom="top"
           onclick="tool.openSubviewByForm(this,'<%=basePath%>/s/system/sysJavaFile/openMe?lwid=${lwid}')">新增 <i
                class="fa fa-plus"></i></a>
        <!--  <a class="btn btn-sm btn-success" onclick="tool.doRemove(this)">删除 <i class="fa fa-times"></i></a> -->
        <a class="btn btn-sm btn-success" data-startFrom="top" onclick="tool.editData(this)">修改 <i class="fa fa-edit"></i></a>
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
            <th data-order-name="name">方法名称</th>
            <th data-order-name="qqurl">请求url</th>
            <th data-order-name="jscs">接收参数</th>
            <th data-order-name="servicereturn">返回页面</th>
            <th data-order-name="controllerreturn">Controller返回值</th>
            <th data-order-name="servicereturn">Service返回值</th>
            <th data-order-name="bz">备注</th>
            <th data-order-name="bz">编辑页面</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${resultData}" var="object">
            <tr id="tr_${object.wid}">
                <td class="center w20">
                    <label>
                        <input type="checkbox" name="selectNode" class="mgc foocheck" id="${object.wid}"
                               value="${object.wid}">
                    </label>
                </td>
                <td>
                        ${object.name}
                </td>
                <td>
                        ${object.qqurl}
                </td>
                <td>${object.jscs}</td>
                <td>${object.returnjsp}</td>
                <td>${object.controllerreturn}</td>
                <td>${object.servicereturn}</td>
                <td>${object.bz}</td>
                <td><a class="btn btn-xs btn-success tooltips" data-placement="top" data-original-title="编辑页面"
                       onclick="tool.openSubviewByForm(this,'<%=basePath%>/s/system/sysJavaFile/configTemple/${object.wid}')"
                       href="javascript:void(0)"><i class="fa fa-edit"></i></a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<%@include file="../../common/list-bottom.jsp" %>
<script>
    function isSubmitForm() {
        return true;
    }


</script>