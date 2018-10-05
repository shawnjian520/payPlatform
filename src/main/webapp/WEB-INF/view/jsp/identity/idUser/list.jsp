<%@ page language="java" pageEncoding="utf-8" %> 
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";

%>
<%@include file="../../common/list-header.jsp" %>
<%@include file="../../common/plugins/css/select2.jsp" %>
<div class="row">
    <div class="col-sm-6">
        <div class="form-group">
            <label class="control-label col-xs-3 col-sm-4" for="userLoginId" data-localize="frame_yhgl.dlm">
                用户名：
            </label>

            <div class="col-xs-9 col-sm-8">
                <input type="text" name="userloginid" id="userloginid" class="form-control">
            </div>
        </div>
    </div>
    <div class="col-sm-6">
        <div class="form-group">
            <label class="control-label col-xs-3 col-sm-4" for="state">
                <font data-localize="frame_xtgl.bmgl_zzjggl_zt">状态：</font>
            </label>

            <div class="col-xs-9 col-sm-8">
                <select class="form-control select2-auto" name="state" id="state" onchange="tool.doSearch(this)">
                    <option value="-1" data-localize="frame_xtgl.bmgl_zzjggl_qb">全部</option>
                    <option value="1" data-localize="frame_xtgl.bmgl_zzjggl_ky">可用</option>
                    <option value="0" data-localize="frame_xtgl.bmgl_zzjggl_jy">禁用</option>
                </select>
            </div>
        </div>
    </div>
    <div class="col-sm-6">
        <div class="form-group">
            <label class="control-label col-xs-3 col-sm-4" for="userName" data-localize="frame_yhgl.yhm">
                用户名称：
            </label>

            <div class="col-xs-9 col-sm-8">
                <input type="text" name="userName" id="userName" class="form-control">
            </div>
        </div>
    </div>
    <div class="col-sm-6">
        <div class="form-group">
            <label class="control-label col-xs-3 col-sm-4" for="departname" data-localize="frame_xtgl.bmgl_zzjggl_bmmc">
                所属部门：
            </label>

            <div class="col-xs-9 col-sm-8">
                <input type="text" name="departname" id="departname" class="form-control">
            </div>
        </div>
    </div>
    <div class="col-sm-6">
        <div class="form-group">
            <label class="control-label col-xs-3 col-sm-4" for="qrole" data-localize="frame_yhgl.ssjs">
                所属角色：
            </label>

            <div class="col-xs-9 col-sm-8">

                <select class="from-control select2-auto" id="qrole" name="qrole" data-show-searchbox="true" onchange="tool.doSearch(this)">
                    <option value="">全部</option>
                    <c:forEach items="${allRoles}" var="a" varStatus="s">
                        <option value="${a.groupid}">${a.groupname}</option>
                    </c:forEach>
                </select>

            </div>
        </div>
    </div>
    <div class="col-sm-6 searchbtn-group">
        <div class="col-xs-9 col-sm-8  col-xs-offset-3 col-sm-offset-4">
            <a class="btn btn-sm btn-primary" data-startFrom="top" onclick="tool.doSearch(this)">
                <font data-localize="frame_button.search">查询</font> <i class="fa fa-search"></i>
            </a>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-md-12">
        <a class="btn btn-sm btn-success" data-startFrom="top"
           onclick="tool.openSubviewByForm(this,'<%=basePath%>/s/id/idUser/open?departid=${departid}',true,true)"><font
                data-localize="frame_button.add">新增 </font><i class="fa fa-plus"></i></a>
        <a class="btn btn-sm btn-success" onclick="tool.doRemove(this)"><font
                data-localize="frame_button.delete">删除 </font> <i class="fa fa-times"></i></a>
        <a class="btn btn-sm btn-success" data-startFrom="top" onclick="tool.editData(this)"><font
                data-localize="frame_button.update">修改</font> <i class="fa fa-edit"></i></a>
        <a class="btn btn-sm btn-success" data-startFrom="top" onclick="pageuser.resetData(this)"><font
                data-localize="frame_button.resetpassword">重置密码</font> <i class="fa fa-refresh"></i></a>
        <span class="label label-danger">将密码重置为111111</span>
        <div class="btn-group pull-right">
            <%@include file="../../common/other/page-size.jsp" %>
        </div>
    </div>
</div>
<div class="dataTables_wrapper form-inline">
    <table class="table table-striped table-hover dataTable table-bordered ">
        <thead>
        <tr>
            <th class="center w20">
                <label>
                    <input type="checkbox" class="mgc selectall">
                </label>
            </th>
            <th data-localize="frame_yhgl.dlm">登录标识</th>
            <th data-localize="frame_yhgl.yhm">用户名称</th>
            <th data-localize="frame_xtgl.bmgl_zzjggl_bmmc">所属部门</th>
            <th data-localize="frame_xtgl.bmgl_zzjggl_zt">状态</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${resultData}" var="o" varStatus="s">
            <tr id="tr_${o.userid}">
                <td class="center">
                    <label>
                        <input type="checkbox" name="selectNode" class="mgc foocheck" data-values="roleid"
                               id="${o.userid }" value="${o.userid }">
                    </label>
                </td>
                <td>
                    <a onclick="tool.editDataById(this,'${o.userid}')" href="javascript:void(0)">
                            ${o.userloginid}
                    </a>
                </td>
                <td>
                        ${o.username}
                </td>
                <td>
                        ${o.departname}
                </td>
                <td>
                    <c:if test="${o.state=='0' }"><font data-localize="frame_xtgl.bmgl_zzjggl_jy">禁用</font></c:if>
                    <c:if test="${o.state!='0' }"><font data-localize="frame_xtgl.bmgl_zzjggl_ky">可用</font></c:if>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<%@include file="../../common/plugins/js/select2.jsp" %>
<%@include file="../../common/list-bottom.jsp" %>
<script>
    var nochoosetip = '';
    function getCookie(name)//取cookies函数
    {
        var arr = document.cookie.match(new RegExp("(^| )" + name + "=([^;]*)(;|$)"));
        if (arr != null) return unescape(arr[2]);
        return null;
    }
    var cookielang = getCookie("jdLanguage");
    if (cookielang == "en") {
        nochoosetip = 'Please tick the user to reset the password!';
    } else {
        nochoosetip = '请勾选要重置密码的用户!';
    }
    var pageuser = {
        resetData: function (el) {
            var ids = tool.getChoseData($(el).parents('.form-horizontal'));
            if (ids != null && ids != '') {
                $.post(tool.initParams('<%=basePath%>/s/system/user/resetpwd'), {
                    'wid': ids
                }, function (data) {
                    data = eval('(' + data + ')');
                    if (data.res == true) {
                        tool.alertSuccess(data.msg);
                    } else {
                        tool.alertWarning(data.msg);
                    }
                });
            } else {
                tool.alertWarning(nochoosetip);
            }
        }
    }
</script>