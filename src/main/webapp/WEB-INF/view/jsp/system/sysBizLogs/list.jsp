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
    <div class="col-xxl-11 col-xl-11 col-sm-12">
        <div class="row">
            <div class="col-xxl-4 col-xl-4 col-sm-6">
                <div class="form-group">
                    <label class="control-label col-sm-3">
                        <font data-localize="frame_xtgl.rzgl_czdx"> 操作对象：</font>
                    </label>
                    <div class="col-sm-9">
                        <select name="czdx" id="czdx" class="form-control select2-auto">
                        	<option value="">请选择</option>
                        	<c:forEach items="${czdxlist}" var="c" varStatus="s">
                        		<option value="${c.id}">${c.caption}</option>
                        	</c:forEach>
                        </select>          
                    </div>
                </div>
            </div>
            <div class="col-xxl-4 col-xl-4 col-sm-6">
                <div class="form-group">
                    <label class="control-label col-sm-3">
                        <font data-localize="frame_xtgl.rzgl_czrzh">操作人账号：</font>
                    </label>

                    <div class="col-sm-9">
                        <input type="text" name="czr" id="czr" class="form-control">
                    </div>
                </div>
            </div>
            <div class="col-xxl-4 col-xl-4 col-sm-6">
                <div class="form-group">
                    <label class="control-label col-sm-3">
                        <font data-localize="frame_xtgl.rzgl_czlx"> 操作类型：</font>
                    </label>
                    <div class="col-sm-9">
                          <select name="czlx" id="czlx" class="form-control select2-auto">
                          <option value="">请选择</option>
                        	<c:forEach items="${czlxlist}" var="c" varStatus="s">
                        		<option value="${c.id}">${c.caption}</option>
                        	</c:forEach>
                        </select>               
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-xxl-1 col-xl-1 col-sm-12">
        <div class="btn-group pull-right mb10">
            <a class="btn btn-sm btn-primary " data-startFrom="top" onclick="tool.doSearch(this)">
                <font data-localize="frame_button.search">查询</font>
                <i class="fa fa-search"></i>
            </a>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-md-12">
        <div class="btn-group pull-right">
            <%@include file="../../common/other/page-size.jsp" %>
        </div>
    </div>
</div>
<div class="dataTables_wrapper form-inline">
    <table class="table table-striped table-hover dataTable table-bordered">
        <thead>
        <tr>
            <th class="center w20">
                <div class="checkbox-table">
                    <label>
                        <input type="checkbox" class="mgc selectall">
                    </label>
                </div>
            </th>
            <th data-localize="frame_xtgl.rzgl_czdx">操作对象</th>
            <th data-localize="frame_xtgl.rzgl_czr">操作人</th>
            <th data-localize="frame_xtgl.rzgl_czlx">操作类型</th>
            <th data-localize="frame_xtgl.rzgl_czsj">操作时间</th>
            <%--			<th>操作IP</th>--%>
            <th data-localize="frame_xtgl.rzgl_ms">描述</th>
        </tr>
        </thead>
        <tbody>
        	<c:forEach items="${resultData}" var="o" varStatus="s">
        		<tr id="tr_${o.wid}">
                <td class="center">
                    <div class="checkbox-table">
                   
                        <label>
                            <input type="checkbox" name="selectNode" class="mgc foocheck" data-values="roleid" id="${o.wid }" value="${o.wid }">
                        </label>
                    </div>
                </td>
                <td>
                	<c:if test="${o.czdx!=null}">${o.czdx}</c:if>
                	<c:if test="${o.czdx==null}">${o.field1}(该操作对象未在字典表中定义)</c:if>
                </td>
                <td>&nbsp;${o.czr }</td>
                <td>
                    ${o.czlx }
                </td>
                <td>&nbsp;${o.czsj }</td>
                <td>&nbsp;${o.czms}</td>
            </tr>
        	</c:forEach>
        </tbody>
    </table>
</div>
<%@include file="../../common/plugins/js/select2.jsp" %>
<%@include file="../../common/plugins/js/blockUI.jsp" %>
<%@include file="../../common/list-bottom.jsp" %>
<script type="text/javascript">
    $(function () {
        index_labels = ['4', '2'];
        view_rules = '{1}：（{2}）';
    })
    function removeAll() {
        document.getElementById("inp").style.display = "";
        if (document.getElementById('mydate').value == '') {
            document.getElementById('mydate').focus();
        } else {
            removet();
        }
    }
    function removet() {
        var mydate = document.getElementById('mydate').value;
        var conf = window.confirm("您确定要删除" + mydate + "前的记录吗？");
        if (conf == true) {
            var url_bak = document.forms[0].action;
            var url = "sysBizLog" + "-remove.action";
            jQuery.post(url,
                    {czsj: mydate, reqtime: (new Date()).getTime()},
                    function (data) {
                        document.forms[0].action = url_bak;//还原URL，防止点查询按钮却执行删除！
                        document.forms[0].submit();
                    }
            );
        } else {
            document.getElementById('mydate').value = '';
            document.getElementById("inp").style.display = "none";
        }
    }
</script>
