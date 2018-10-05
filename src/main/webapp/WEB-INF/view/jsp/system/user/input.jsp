<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% String basePath = request.getContextPath(); %>
<%@include file="../../common/input-header.jsp" %>
<%@include file="../../common/plugins/css/select2.jsp" %>
<%@include file="../../common/plugins/css/iCheck.jsp" %>
<div class="col-md-8 col-md-offset-2">
    <div class="panel panel-white">
        <div class="panel-heading">
            <h4 class="panel-title">绑定新部门</h4>
            <div class="panel-tools">
                <div class="dropdown">
                    <a data-toggle="dropdown" class="btn btn-xs dropdown-toggle btn-transparent-grey">
                        <i class="fa fa-cog"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-light pull-right" role="menu">
                        <li>
                            <a class="panel-collapse collapses" href="#"><i class="fa fa-angle-up"></i> <span>收起</span> </a>
                        </li>
                        <li>
                            <a class="panel-expand" href="#">
                                <i class="fa fa-expand"></i> <span>全屏</span>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="panel-body">
            <form role="form" class="form-horizontal">
                <input type="hidden" id="wid" name="wid" value="${wid }"/>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="username">
                        <font data-localize="frame_yhgl.yhm"> 用户名称</font>：
                    </label>

                    <div class="col-sm-10">
                        <input type="text" name="username" id="username" class="validate[required] form-control"/>
                        <span class="symbol required"></span>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label" for="departtype">
                        <font data-localize="frame_xtgl.bmgl_zzjglxgl_lx">部门类型</font>：
                    </label>

                    <div class="col-sm-10">
                        <select name="departtype" id="departtype" onchange="loaddepart()"
                                class="validate[required] form-control select2-auto">
                            <option value=""></option>
                            <c:forEach items="${list }" var="obj">
                                <option value="${obj.id }">${obj.caption }</option>
                            </c:forEach>
                        </select>
                        <span class="symbol required"></span>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="departid">
                        <font data-localize="frame_xtgl.bmgl_zzjggl_bmmc">部门</font>：
                    </label>

                    <div class="col-sm-10">
                        <select name="departid" id="departid" class="validate[required] form-control select2-auto"></select>
                        <span class="symbol required"></span>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">
                        <font data-localize="frame_yhgl.yhz">用户组</font>：
                    </label>
                    <div class="col-sm-10" id="groupdiv">
                        <c:forEach items="${groups }" var="obj">
                            <label class="checkbox-inline">
                                <input type="checkbox" name="groupid" value="${obj.id }"/>${obj.caption }
                            </label>
                        </c:forEach>
                        <span class="symbol required"></span>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-12 frame-btn-group">
                        <button class="btn btn-sm btn-success" type="button" onclick="tool.saveData(this)">
                            <font data-localize="frame_button.save">保存</font> <i class="fa fa-check"></i>
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<%@include file="../../common/plugins/js/select2.jsp" %>
<%@include file="../../common/input-bottom.jsp" %>
<script>
    function loaddepart() {
        var departtype = $('#departtype').val();
        if (departtype == '') {
            $('#departid').html('').trigger("change");
            $('#groupdiv').html('').trigger("change");
        } else {
            $.post(tool.initParams('<%=basePath%>/s/biz/user/getdepart'), {'departtype': departtype}, function (data) {
                var htm = '';
                $(data).each(function (i) {
                    htm += '<option value="' + data[i].id + '">' + data[i].caption + '</option>';
                });
                $('#departid').html(htm).trigger("change");
            });
            $.post(tool.initParams('<%=basePath%>/s/biz/user/getgroup'), {'departtype': departtype}, function (data) {
                var htm = '';
                $(data).each(function (i) {
                    htm += '<label class="checkbox-inline"><input type="checkbox" class="mgc" name="groupid" value="' + data[i].id + '"  />' + data[i].caption + '</label>';
                });
                $('#groupdiv').html(htm).trigger("change");
            });
        }
    }
</script>