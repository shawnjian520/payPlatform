<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="jd" uri="/WEB-INF/TLD/custom.tld" %>
<%
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + request.getContextPath();
%>
<%@include file="../../common/input-header.jsp" %>
<%@include file="../../common/plugins/css/select2.jsp" %>
<style>
    #accordion .panel-title {
        cursor: pointer;
    }

    #accordion .panel-heading {
        min-height: 20px;
        padding: 5px;
        background-color: #fff !important;
    }

    #accordion .panel-title {
        font-size: 13px;
    }

    #accordion .panel-body {
        border: 0 !important;
        padding: 5px 15px;
    }

    #accordion .panel {
        box-shadow: none !important;
    }

    #accordion ul {
        padding-left: 20px;
        margin: 0;
    }

    #accordion ul li {
        cursor: pointer;
    }

    .panel-body {
        padding: 5px 10px 10px 10px;
    }

    .panel-tabs > .panel-heading {
        min-height: 35px;
        background-color: #f2f2f2;
    }

    #code-mirror-html, #code-mirror-js {
        padding: 5px !important;
    }

    .panel-title {
        height: 17px;
    }

    .label-info {
        margin-right: 5px;
    }

    .label-info .red {
        cursor: pointer;
    }

    .layout-active {
        display: block !important;
        padding: 20px !important;
        cursor: pointer !important;
        box-shadow: inset 0 0 10px #0CC !important;
    }

    .layout-active * { /*display: none;*/

    }

    .CodeMirror {
        height: 350px !important;
    }

    .tabbable.edit-element .nav-tabs {
        border: medium none;
        float: none;
        margin-top: 0;
    }

    .tabbable.edit-element {
        padding: 1px;
        margin-bottom: 15px;
    }

    .modal-container {
        display: block;
    }

    .mask {
        box-sizing: border-box;
        border: 2px dashed #ff0033;
        box-shadow: inset;
        cursor: pointer;
        opacity: 0.5;
        position: absolute;
        color: #ff0033;
        font-weight: bold;
        background-color: #eee;
    }
</style>
<div class="layout col-xs-12" data-wid="yJX9454"
     data-assembly-id="5">
    <div class="panel input-panel">
        <div class="panel-heading"><h4 class="panel-title" data-localize="">条件筛选<font
                style="color:red;font-size:12px;font-weight:bold;"></font></h4></div>
        <div class="panel-body">
            <div class="col-xxxl-3 col-md-4 col-sm-6 col-xs-12 nopadding ">
                <div class="form-group">
                    <label style="margin-top: 7px;" title="业务名称"
                           class="col-sm-3 control-label ell nopadding" data-localize="">业务名称：</label>
                    <div class="col-sm-9">
                        <input type="text" id="ywmc" name="ywmc" class="form-control   " placeholder="业务名称"/>
                    </div>
                </div>
            </div>
            <div class="col-xxxl-3 col-md-4 col-sm-6 col-xs-12 nopadding edit-element">
                <div class="form-group">
                    <label title="页面名称" style="margin-top: 7px;" class="col-sm-3 control-label ell nopadding"
                           data-localize="">页面名称：</label>
                    <div class="col-sm-9">
                        <input type="text" id="pagename" name="pagename" class="form-control" placeholder="页面名称"/>
                    </div>
                </div>
            </div>
            <div class="col-xxxl-3 col-md-4 col-sm-6 col-xs-12 nopadding edit-element">
                <div class="form-group">
                    <label title="页面类型" style="margin-top: 7px;" class="col-sm-3 control-label ell nopadding"
                           data-localize="">页面类型：</label>
                    <div class="col-sm-9">
                        <select id="pagetype" name="pagetype" class="select2-auto">
                            <option value=""></option>
                            <option value="list" data-localize="">列表页面</option>
                            <option value="input" data-localize="">表单页面</option>
                            <option value="tab" data-localize="">tab页面</option>
                        </select>
                    </div>
                </div>
            </div>

            <div style="margin-top: 7px; text-align: right; float: right;" class="col-xs-2">
                <a class="btn btn-sm btn-primary" onclick="searchbyywmc()">
                    <font data-localize="">查询</font> <i class="fa fa-search"></i>
                </a>
                <a class="btn btn-sm btn-primary btn-reset" onclick="tool.resetForm(this)">
                    <font data-localize="">重置</font> <i class="fa fa-mail-reply-all"></i>
                </a>
            </div>
        </div>
    </div>
</div>
<form role="form" class="form-horizontal">

    <div class="col-md-3">
        <jd:panel className="input-panel" title="业务管理">
            <div class="panel-group" style="position:relative;height:320px; overflow:auto" id="accordion"
                 role="tablist"
                 aria-multiselectable="true">
                <c:forEach items="${resultData}" var="obj" varStatus="status">
                    <div class="panel panel-default">
                        <div class="panel-heading" role="tab"
                             id="heading${status.index }" role="button"
                             data-toggle="collapse" data-parent="#accordion"
                             href="#collapse${status.index }" aria-expanded="true"
                             aria-controls="collapse${status.index }">
                            <h4 class="panel-title" onclick="pageinfo('','${obj.ywmc}','','')">
                                <i class="fa fa-plus"></i> ${obj.ywmc}
                            </h4>
                        </div>

                        <div id="collapse${status.index }"
                             class="panel-collapse collapse <c:if test="${status.index==0}">in</c:if>"
                             role="tabpanel" aria-labelledby="headingOne">
                            <div class="panel-body">
                                <ul>
                                    <c:forEach items="${obj.tlist}" var="obj2">
                                        <li data-temple-index="${obj2.wid}"
                                            onclick="pageinfo('${obj2.wid}','','','')">${obj2.pagename}</li>
                                    </c:forEach>
                                </ul>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </jd:panel>
    </div>
    <div class="col-md-9">
        <div class="row data-group" data-order="100">
            <div id="" data-group-name="详情列表" data-order="100"
                 class="layout col-xs-12" data-wid="iFH6157" data-assembly-id="6">
                <div class="panel">
                    <div class="panel-heading" style="background-color: #f2f2f2;">
                        <h4 class="panel-title" data-localize="">详情列表</h4>
                    </div>
                    <div class="panel-body">
                        <div class="col-md-12">
                            <a class="btn btn-sm btn-success" data-startFrom="top"
                               onclick="tool.addData(this)"><font data-localize="">新增</font> <i
                                    class="fa fa-plus"></i>
                            </a> <a class="btn btn-sm btn-success" onclick="tool.doRemove(this)"><font
                                data-localize="">删除</font>
                            <i class="fa fa-times"></i>
                        </a> <a class="btn btn-sm btn-success" data-startFrom="top"
                                onclick="tool.editData(this)"><font data-localize="">修改 </font><i
                                class="fa fa-edit"></i>
                        </a>


                            <div
                                    class="dataTables_wrapper form-inline edit-element table-align-center"
                                    data-assembly-id="7" data-order="100" data-wid="mDG6157" id="">
                                <table
                                        class="table table-striped table-hover dataTable table-bordered">
                                    <thead>
                                    <tr>
                                        <th class="center w20" rowspan="2">
                                            <label> <input type="checkbox" class="mgc selectall"> </label>
                                        </th>
                                        <th data-order-name="ywmc" data-localize="">业务名称</th>
                                        <th data-order-name="pagename" data-localize="">页面名称</th>
                                        <th data-order-name="pagetype" data-localize="">页面类型</th>
                                        <th data-order-name="nodename" data-localize="">节点名称</th>
                                        <th data-order-name="path" data-localize="">页面路径</th>
                                        <th data-localize="">操作</th>

                                    </tr>
                                    <tr>
                                    </tr>
                                    </thead>
                                    <tbody id='pageinfo'>

                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>
<%@include file="../../common/plugins/js/select2.jsp" %>
<%@include file="../../common/plugins/js/blockUI.jsp" %>
<%@include file="../../common/input-bottom.jsp" %>
<script>
    function pageinfo(item, ywmc, pagename, pagetype) {
        var url = '<%=basePath%>/s/biz/sysJsp/listone';
        $.ajax({
            type: "POST",
            url: tool.initParams(url),
            data: {wid: item, ywmc: ywmc, pagename: pagename, pagetype: pagetype},
            dataType: "json",
            success: function (data) {
                $("#pageinfo").empty();
                var typef;
                jQuery.each(data, function (i, item) {

                    if (item.pagetype == "list") {
                        typef = "列表页面";
                    }
                    if (item.pagetype == "input") {
                        typef = "表单页面";
                    }
                    if (item.pagetype == "tab") {
                        typef = "tab页面";
                    }
                    var urled = "<%=basePath%>/s\/biz/sysJsp/configTemple/" + item.wid;
                    var html = " <tr id='tr_" + item.wid + "'>"
                        + "<td class='center w20'>"
                        + "   <label>"
                        + "       <input type='checkbox' name='selectNode' class='mgc' id='" + item.wid + "' value='" + item.wid + "'>"
                        + "      </label>" + " </td>"
                        + "  <td>"
                        + "      <a onclick=\"tool.editDataById(this,'"
                        + item.wid
                        + "')\" href='javascript:void(0)'>"
                        + item.ywmc
                        + "</a>"
                        + "  </td>"
                        + "  <td>"
                        + "    "
                        + item.pagename
                        + ""
                        + "  </td>"
                        + "   <td>"
                        + typef
                        + "  </td>"
                        + "  <td>"
                        + item.nodename
                        + "</td>"
                        + "  <td>"
                        + item.path
                        + "</td>"
                        + "  <td>"
                        + "     <a class='btn btn-xs btn-primary tooltips' data-tab-name='" + item.ywmc + ">"
                        + item.pagename
                        + "' data-placement='top' data-original-title='编辑页面' onclick=\"tool.openSubviewByForm(this,'"
                        + urled
                        + "')\" href='javascript:void(0)'><i class='fa fa-edit'></i></a>"
                        + "  </td>" + " </tr>";
                    $("#pageinfo").append(html);

                })
            }
        });
    }

    function searchbyywmc() {
        var url = '<%=basePath%>/s/biz/sysJsp/listfz';
        var ywmc = $("#ywmc").val();
        var pagename = $("#pagename").val();
        var pagetype = $("#pagetype").val();
        $.ajax({
            type: "POST",
            url: tool.initParams(url),
            data: {ywmc: ywmc, pagename: pagename, pagetype: pagetype},
            dataType: "json",
            success: function (data) {
                $("#accordion").empty();
                var html = "";
                jQuery.each(data, function (i, item) {
                    html += "<div class='panel panel-default'>" +
                        "<div class='panel-heading' role='tab'" +
                        "id='heading" + i + "' role='button'" +
                        "data-toggle='collapse' data-parent='#accordion'" +
                        "	href='#collapse" + i + "' aria-expanded='true'" +
                        "	aria-controls='collapse" + i + "'>" +
                        "<h4 class='panel-title' onclick=\"pageinfo('','" + item.ywmc + "','','')\">" +
                        "		<i class='fa fa-plus'></i> " + item.ywmc + "" +
                        "	</h4>" +
                        "	</div>" +
                        "	<div id='collapse" + i + "'" +
                        "	class='panel-collapse collapse '" +
                        "	role='tabpanel' aria-labelledby='heading" + i + "'>" +
                        "	<div class='panel-body'>" +
                        "		<ul>";
                    jQuery.each(item.tlist, function (j, obj) {
                        html += "<li data-temple-index='" + obj.wid + "' onclick=\"pageinfo('" + obj.wid + "','')\">" + obj.pagename + "</li>";
                    });
                    html += "		</ul>" +
                        "	</div>" +
                        "	</div>" +
                        "</div>";
                });
                $("#accordion").append(html);
                pageinfo('', ywmc, pagename, pagetype);
            }
        })
    }
</script>