<%@ page language="java" pageEncoding="utf-8" %>
<!-- start: PAGE CONTENT -->
<%@include file="../../common/other/tab-model-header.jsp" %>
<%@include file="../../common/plugins/css/jquery.ztree.jsp" %>
<%@include file="../../common/plugins/css/select2.jsp" %>
<%@include file="../../common/plugins/css/iCheck.jsp" %>
<%@include file="../../common/plugins/css/jQuery-Validation-Engine.jsp" %>
<div class="tabModel-content animated hide">
    <!-- start: PAGE CONTENT -->
    <div id="page-content" class="row">
        <div class="col-md-12">
            <div class="row">
                <div class="col-sm-3">
                    <div class="panel panel-white">
                        <div class="panel-heading">
                            <h4 class="panel-title"><span class=""
                                                          data-localize="frame_xtgl.bmgl_zzjglxgl_zzjglxlb">组织机构类型列表</span>
                            </h4>
                        </div>
                        <div class="panel-body" style="height:600px;;overflow: scroll;">
                            <div id="menuTree" class="ztree">loading...</div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-9 padding-left-0" id="input-page-content">
                    <div>loading...</div>
                </div>
            </div>
        </div>
    </div>
    <!-- end: PAGE CONTENT-->
</div>
<%@include file="../../common/plugins/js/jQuery-Validation-Engine.jsp" %>
<%@include file="../../common/plugins/js/jquery.ztree.jsp" %>
<%@include file="../../common/plugins/js/select2.jsp" %>
<%@include file="../../common/other/tab-model-bottom.jsp" %>
<script type="text/javascript">
    page = {
        //不使用ztree节点图标,使用矢量字体库作为图标
        treeObj: null,
        /**
         * 点击节点事件
         * @param event
         * @param treeId
         * @param treeNode
         */
        zTreeOnClick: function (event, treeId, treeNode) {
            Main.ajaxLoaderUrl(tool.initParams(basePath + "/s/system/depart/inputnew/" + treeNode.id), $("#input-page-content"), '部门信息');
        },
        addChilddepart: function () {
            Main.ajaxLoaderUrl(tool.initParams(basePath + "/s/system/depart/loadnew?updepartid=" + $("#departid1").val()), $("#input-page-content"), '部门信息');
        },
        deleteDepart: function () {
            tool.alertConfirm('确定要删除此部门吗?', '删除后将无法恢复，请谨慎操作！', function () {
                $.post(tool.initParams(basePath + '/s/system/depart/remove'), {'wid': $("#departid1").val()}, function (data) {
                    data = eval('(' + data + ')');
                    if (data.res) {
                        var node = page.treeObj.getNodeByParam("id", $("#departid1").val(), null);
                        $("#" + node.tId + ",#" + node.tId + " > a,#" + node.tId + "_span,#" + node.tId + " span,#" + node.tId + " i").css({
                            "background-color": "#FF3300",
                            "color": "#fff"
                        }).fadeOut(1000);
                        if (node != null) {
                            setTimeout('page.deletedep()', 800);
                        }
                    } else {
                        setTimeout('tool.alertError("操作失败!","' + data.msg + '")', 800);
                    }
                })
            })
        },
        /**
         * 修改/保存方法
         */
        saveDepart: function () {
            if ($(".form-horizontal").validationEngine('validate')) {
                $.ajax({
                    url: tool.initParams(basePath + '/s/system/depart/save'),
                    type: "POST",
                    data: $(".form-horizontal").serialize(),
                    timeout: 1000 * 5,
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        tool.alertWarning('操作失败,请重试!');
                    },
                    success: function (data) {
                        if (data != null) {
                            data = eval("(" + data + ")");
                            if (data.res) {
                                tool.alertSuccess(data.msg);
                                var pnode = page.treeObj.getNodeByParam("id", data.data.updepartid, null);
                                var node = [{
                                    name: "<i class=\"fa fa-file\"></i>" + $("#departname").val(),
                                    id: data.data.departid,
                                    value: data.data.departid
                                }];
                                page.treeObj.addNodes(pnode, node);
                                node = page.treeObj.getNodeByParam("id", data.data.departid, null);
                            } else {
                                tool.alertWarning(data.msg);
                            }
                        }
                    }
                });
            }
        },
        deletedep: function () {
            page.treeObj.removeNode(page.treeObj.getNodeByParam("id", $("#departid1").val(), null));
        },
        viewOfDepart: function () {
            tool.openSubview(tool.initParams(basePath + '/s/id/idUser/list?departid=' + $("#departid1").val()), null, $("#departname").val() + "用户")
        },
        highlightNode: function (node, color) {
            $("#" + node.tId + " > a,#" + node.tId + "_span,#" + node.tId + "_span > i").animate({
                backgroundColor: color,
                color: "#fff"
            }, 500, function () {
                $("#" + node.tId + " > a,#" + node.tId + "_span,#" + node.tId + "_span > i").removeAttr("style");
            });
        },
        copyDepart: function (el, nd) {
            var wid = tool.getChoseData($(el).parents('.form-horizontal'));
            $.post(tool.initParams(basePath + "/s/system/depart/copyDepart"), {'wid': wid, 'nd': nd}, function (data) {
                data = eval('(' + data + ')');
                tool.alert(data.msg);

            });
        }
    }
    $(function () {
        var setting = {
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
                onClick: page.zTreeOnClick,
                onExpand: function (event, treeId, treeNode) {
                    var nodes = treeNode.children;
                    if (nodes == null) {
                        $.post(tool.initParams(basePath + "/s/system/depart/getdepartForZtree?departid=" + treeNode.value), function (data) {
                            data = eval('(' + data + ')');
                            page.treeObj.addNodes(treeNode, data);
                        });
                    }
                }
            }
        }
        $.post(tool.initParams(basePath + "/s/system/depart/getdepartForZtree"), function (data) {
            page.treeObj = $.fn.zTree.init($("#menuTree"), setting, eval(data));
            var pNode = page.treeObj.getNodeByParam("id", '100000001', null);
            page.zTreeOnClick(null, null, pNode);
        });
    });


</script>