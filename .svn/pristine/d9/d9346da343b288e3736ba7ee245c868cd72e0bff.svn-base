<%@ page language="java" pageEncoding="utf-8" %>
<%@include file="../../common/input-header.jsp" %>
<%@include file="../../common/plugins/css/iCheck.jsp" %> 
<%@include file="../../common/plugins/css/jquery.ztree.jsp" %>
<%@include file="../../common/plugins/css/select2.jsp" %>
<!-- start: PAGE CONTENT -->
<div id="page-content">
    <div class="col-md-12">
        <div class="row">
            <div class="col-sm-3">
                <div class="panel panel-white">
                    <div class="panel-heading">
                        <h4 class="panel-title"><span class="" data-localize="frame_menu.k">菜单列表</span></h4>
                    </div>
                    <div class="panel-body">
                        <div id="menuTree" class="ztree">loading...</div>
                    </div>
                </div>
            </div>
            <div class="col-sm-9 padding-left-0">
                <div class="panel panel-white">
                    <div class="panel-heading">
                        <h4 class="panel-title"><span class="" data-localize="frame_menu.l">菜单信息</span></h4>
                    </div>
                    <div class="panel-body">
                        <div class="alert dn">
                            <button data-dismiss="alert" class="close">
                                ×
                            </button>
                            <strong></strong>
                        </div>
                        <div id="input-page-content">
                            <div>loading...</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- end: PAGE CONTENT-->
<div id="icons" class="modal fade bs-example-modal-lg" tabindex="-1">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title">点击选择图标</h4>
            </div>
            <div class="row">
                <%@include file="../../common/other/icons.jsp" %>
            </div>
        </div>
    </div>
</div>
<%@include file="../../common/input-bottom.jsp" %>
<%@include file="../../common/plugins/js/select2.jsp" %>
<%@include file="../../common/plugins/js/jquery.ztree.jsp" %>
<script type="text/javascript">
    page = {
        treeObj: null,
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
        /**
         * 点击节点事件
         * @param event
         * @param treeId
         * @param treeNode
         */
        zTreeOnClick: function (event, treeId, treeNode) {
            Main.ajaxLoaderUrl(basePath + "/s/id/idMenu/load?wid=" + treeNode.id, $("#input-page-content"));
        },
        /**
         * 新增下级
         */
        addSubMenu: function () {
            Main.ajaxLoaderUrl(basePath + "/s/id/idMenu/openCreate?wid=" + $("#menuid").val(), $("#input-page-content"));
            $(".form-horizontal").validationEngine();
        },
        /**
         * 修改/保存方法
         */
        saveMenu: function () {
            if ($(".form-horizontal").validationEngine('validate')) {
                $.ajax({
                    url: tool.initParams(basePath + '/s/id/idMenu/save'),
                    type: "POST",
                    data: $(".form-horizontal").serialize(),
                    timeout: 1000 * 5,
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        tool.alertWarning('操作失败,请重试!');
                    },
                    success: function (data) {
                        if (data != null) {
                            data =eval("("+data+")");
                            if (data.res) {
                                tool.alertSuccess(data.msg);
                                var menuId = $("#menuid").val();
                                if (menuId != null && menuId != "") {
                                    var node = page.treeObj.getNodeByParam("id", menuId, null);
                                    var node_icon = $("#" + node.tId + "_span > i").attr("class");
                                    if (node_icon != "fa fa-folder-open") {
                                        node.name = "<i class='" + $("#menuicon").val() + "'></i>" + $("#menuname").val();
                                    } else {
                                        node.name = "<i class='fa fa-folder-open'></i>" + $("#menuname").val();
                                    }
                                    page.treeObj.updateNode(node);
                                    page.highlightNode(node, "#6699FF");
                                } else {
                                    $("#add-sub-menu,#del-menu").removeClass("dn");
                                    var pMenuId = $("#upmenuid").val();
                                    var node = page.treeObj.getNodeByParam("id", pMenuId, null);

                                    var newNodes = [{
                                        name: "<i class='" + $("#menuicon").val() + "'></i>" + $("#menuname").val(),
                                        id: data.data.menuid
                                    }];

                                    $("#menuid").val(data.data.menuid);
                                    newNodes = page.treeObj.addNodes(node, newNodes);
                                    page.highlightNode(page.treeObj.getNodeByTId(newNodes[0].tId), "#00CC66");
                                }
                            }else{
                                tool.alertWarning(data.msg);
                            }
                        }
                    }
                });
            }
        },
        /**
         * 删除菜单
         */
        delMenu: function () {
            tool.alertConfirm('确定要删除此菜单以及其子菜单吗?', '删除后将无法恢复，请谨慎操作！', function () {
                $.post(tool.initParams(basePath + '/s/id/idMenu/remove'), {'menuid': $("#menuid").val()}, function (data) {
                    if (data) {
                        var node = page.treeObj.getNodeByParam("id", $("#menuid").val(), null);
                        $("#" + node.tId + ",#" + node.tId + " > a,#" + node.tId + "_span,#" + node.tId + " span,#" + node.tId + " i").css({
                            "background-color": "#FF3300",
                            "color": "#fff"
                        }).fadeOut(1000);
                        if (node != null) {
                            setTimeout('page.deleteMenu()', 800);
                        }
                    }
                });
            })
        },
        deleteMenu: function () {
            page.treeObj.removeNode(page.treeObj.getNodeByParam("id", $("#menuId").val(), null));
        },
        /**
         * 高亮显示节点
         * @param node 要高亮显示的节点
         * @param color 颜色
         */
        highlightNode: function (node, color) {
            $("#" + node.tId + " > a,#" + node.tId + "_span,#" + node.tId + "_span > i").animate({
                backgroundColor: color,
                color: "#fff"
            }, 500, function () {
                $("#" + node.tId + " > a,#" + node.tId + "_span,#" + node.tId + "_span > i").removeAttr("style");
            });
        }
    }
    //不使用ztree节点图标,使用矢量字体库作为图标

    $(function () {
        var setting = {
            async: {
                enable: true,
                url: basePath + "/getChlidNodes",
                autoParam: ["id"],
                otherParam: {"type": "subMenu"}
            },
            view: {
                showIcon: false,
                nameIsHTML: true,
                showTitle: false
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
                onCollapse: page.zTreeOnCollapse,
                onExpand: page.zTreeOnExpand,
                onClick: page.zTreeOnClick
            }
        }
        $.post(tool.initParams(basePath + "/s/ajax/getMenuByUpid?upmenuid=000&isContainUpMenuId=true"), function (data) {
            page.treeObj = $.fn.zTree.init($("#menuTree"), setting, eval(data));
            //默认选中第一个父节点
            var pNode = page.treeObj.getNodeByParam("id", 000, null);
            page.treeObj.selectNode(pNode);
            page.zTreeOnClick(null, null, pNode);
        });
    });
</script>