<%@ page language="java" pageEncoding="UTF-8" %>
<%@include file="../../common/input-header.jsp" %>
<%@include file="../../common/plugins/css/select2.jsp" %>
<%@include file="../../common/plugins/css/iCheck.jsp" %>
<%@include file="../../common/plugins/css/jquery.ztree.jsp" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="col-md-8 col-md-offset-2">
    <div class="panel panel-white">
        <div class="panel-heading">
            <h4 class="panel-title">角色维护</h4>
            <div class="panel-tools">
                <div class="dropdown">
                    <a data-toggle="dropdown" class="btn btn-xs dropdown-toggle btn-transparent-grey">
                        <i class="fa fa-cog"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-light pull-right" role="menu">
                        <li>
                            <a class="panel-collapse collapses" href="#"><i class="fa fa-angle-up"></i> <span>收起</span>
                            </a>
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

                <input type="hidden" id="id" name="id" value="${object.roleid }">
                <input type="hidden" id="roleid" name="roleid" value="${object.roleid }">
                <input type="hidden" id="menuids" name="menuids" value="${object.menuids}">
                <input type="hidden" id="is_change" name="is_change" value="0">

                <div class="form-group">
                    <label class="col-sm-2 control-label" for="rolename">
                        <font data-localize="frame_xipz.jswh_jsmc">角色名称</font>：
                    </label>

                    <div class="col-sm-9">
                        <input type="text" placeholder="" class="form-control validate[required,maxSize[15]]"
                               id="rolename" name="rolename" value="${object.rolename}">
                        <span class="symbol required"></span>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="rolename">
                        <font data-localize="frame_xipz.jswh_zt">状态</font>：
                    </label>

                    <div class="col-sm-9">
                        <label class="radio-inline">
                            <input name="state" value="1" type="radio" class="mgr mgc-lg"    <c:if
                                    test="${object.state==1||object.state==null||object.state==''}">
                                   checked="checked"</c:if>>
                            <font data-localize="frame_xtgl.bmgl_zzjggl_ky">启用</font>
                        </label>
                        <label class="radio-inline">
                            <input name="state" value="0" type="radio" class="mgr mgc-lg" <c:if
                                    test="${object.state==0}">
                                   checked="checked" </c:if>>
                            <font data-localize="frame_xtgl.bmgl_zzjggl_jy">禁用</font>
                        </label>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label">
                        <font data-localize="frame_xtgl.sjzd_zdwh_zdlb">所属分组</font>：
                    </label>

                    <div class="col-sm-9">

                        <select name="roletype" id="roletype" data-show-searchbox="true"
                                class="form-control select2-auto parameter">
                            <c:forEach items="${syscodelist}" var="c" varStatus="s">
                                <option
                                        <c:if test="${object.roletype==c.id }">selected="selected"</c:if>
                                        value="${c.id }">${c.caption}</option>
                            </c:forEach>
                        </select>
                        <span class="symbol required"></span>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label" for="memo">
                        <font data-localize="frame_xtgl.rzgl_ms">描述</font>：
                    </label>
                    <div class="col-sm-9">
                        <textarea class="form-control" id="memo" name="memo">${object.memo}
                        </textarea>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="memo">
                        <font data-localize="frame_xipz.jswh_qx">权限</font>：
                    </label>

                    <div class="col-sm-9">
                        <div id="menuTree" class="ztree">loading...</div>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-12 frame-btn-group">
                        <button class="btn btn-sm btn-success" type="button" onclick="subPage.saveRole(this)">
                            <font data-localize="frame_button.save">保存</font> <i class="fa fa-check"></i>
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<%@include file="../../common/plugins/js/jquery.ztree.jsp" %>
<%@include file="../../common/plugins/js/select2.jsp" %>
<%@include file="../../common/input-bottom.jsp" %>
<script>
    subPage = {
        treeObj: null,
        save_callback: function (data, $form_element) {
            //如果表单中有 wid 元素 并且 data 对象中有wid属性
            if (!isBlank(data.data)) {
                $form_element("#id").val(data.data.roleid);
            }
        },
        /**
         * 节点被折叠的事件回调函数
         * @param event
         * @param treeId
         * @param treeNode
         */
        zTreeOnCollapse: function (event, treeId, treeNode) {
            var node_icon = $("#" + treeNode.tId + "_span > i").attr("class");
            if (node_icon == "fa fa-folder-open") {
                $("#" + treeNode.tId + "_span > i").removeClass("fa-folder-open").addClass("fa-folder");
            }
        },
        /**
         * 节点被展开的事件回调函数
         * @param event
         * @param treeId
         * @param treeNode
         */
        zTreeOnExpand: function (event, treeId, treeNode) {
            var node_icon = $("#" + treeNode.tId + "_span > i").attr("class");
            if (node_icon == "fa fa-folder") {
                $("#" + treeNode.tId + "_span > i").removeClass("fa-folder").addClass("fa-folder-open");
            }
        },
        saveRole: function (el) {
            var menuids = "";
            var nodes = subPage.treeObj.getCheckedNodes(true);
            for (var i = 0; i < nodes.length; i++) {
                menuids += nodes[i].id + ",";
            }
            $("#menuids").val(menuids);
            tool.saveData(el);
        }
    }


    $(document).ready(function () {
        var setting = {
            check: {
                enable: true
            },
            view: {
                showIcon: false,
                nameIsHTML: true
            },
            data: {
                simpleData: {
                    enable: true
                },
                key: {
                    url: ""
                }
            },
            callback: {
                onCollapse: subPage.zTreeOnCollapse,
                onExpand: subPage.zTreeOnExpand
            }
        };
        var roleid = $("#id").val();
        if (isBlank(roleid)) {
            roleid = "new";
        }
        $.post(basePath + "/s/ajax/getMenuByUpid?upmenuid=000&roleid=" + roleid + "&isContainUpMenuId=true", function (data) {
            subPage.treeObj = $.fn.zTree.init($("#menuTree"), setting, eval("(" + data + ")"));
        });
    })
</script>
