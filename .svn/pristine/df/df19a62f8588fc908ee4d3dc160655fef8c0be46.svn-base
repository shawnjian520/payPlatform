﻿
<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../../common/list-header.jsp" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";

%>
<div class="row">
    <div class="col-sm-12 col-xl-10">
        <div class="form-group">
            <label class="control-label col-xs-1">
                <font data-localize="frame_yhgl.dlm">用户账户：</font>：
            </label>

            <div class="col-xs-3">
                <input type="text" id="userloginid" name="userloginid" class="form-control   "
                       value="${object.userloginid }"/>
            </div>
            <label class="control-label col-xs-1">
                <font data-localize="frame_yhgl.dlm">用户名：</font>：
            </label>

            <div class="col-xs-3">
                <input type="text" id="username" name="username" class="form-control   "
                       value="${object.username }"/>
            </div>

            <div class="col-xs-3">
                <a class="btn btn-sm btn-primary" onclick="tool.doSearch(this)">
                    <font data-localize="frame_button.search">查询</font> <i class="fa fa-search"></i>
                </a>
                <a class="btn btn-sm btn-primary btn-reset" onclick="tool.resetForm(this)">
                    <font data-localize="frame_button.reset"> 重置</font> <i class="fa fa-mail-reply-all"></i>
                </a>
            </div>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-md-12">
        
         <a class="btn btn-sm btn-success" data-startFrom="top" onclick="pageuser.resetData(this)"><font data-localize="frame_button.resetpassword">重置密码</font> <i class="fa fa-refresh"></i></a><span class="label label-danger">将密码重置为111111</span>
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
                <div class="checkbox-table">
                    <label>
                        <input type="checkbox" class="mgc selectall">
                    </label>
                </div>
            </th>
            <th data-localize="frame_yhgl.dlm">用户账户</th>
            <th data-localize="frame_yhgl.yhm">用户名</th>
            <th data-localize="frame_xtgl.bmgl_zzjggl_bmmc">部门</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${resultData}" var="obj">
            <tr id="tr_${obj.userid}">
                <td class="center">
                    <div class="checkbox-table">
                        <label>
                            <input type="checkbox" class="mgc foocheck" name="selectNode" value="${obj.userid}">
                        </label>
                    </div>
                </td>
                <td>
<!--                 <a onclick="tool.editDataById(this,'${obj.userid}')"href="javascript:void(0)"></a> -->
                       ${obj.userloginid}</td>
                <td>${obj.username}</td>
                <td>${obj.departname}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<%@include file="../../common/list-bottom.jsp" %>
<script>
	var nochoosetip='';
	function getCookie(name)//取cookies函数     
{  
	var arr = document.cookie.match(new RegExp("(^| )"+name+"=([^;]*)(;|$)"));  
	if(arr != null) return unescape(arr[2]); return null;  
}  
 var cookielang=getCookie("jdLanguage");
	if(cookielang == "en"){
	nochoosetip='Please tick the user to reset the password!';
	}else{
		nochoosetip='请勾选要重置密码的用户!';
	}
	var pageuser={
		resetData:function(el){
			var ids = tool.getChoseData($(el).parents('.form-horizontal'));
			if (ids!=null && ids!='') {
				$.post(tool.initParams('<%=basePath%>s/system/user/resetpwd'), {
					'wid' : ids
				}, function(data) {
					data = eval('('+data+')');
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
<style>
    tr, th, td {
        text-align: center
    }
</style>
