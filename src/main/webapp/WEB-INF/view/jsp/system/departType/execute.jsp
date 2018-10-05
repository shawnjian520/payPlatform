<%@ page language="java" pageEncoding="utf-8" %>
<!-- start: PAGE CONTENT -->
<%@include file="../../common/other/tab-model-header.jsp" %>
<%@include file="../../common/plugins/css/iCheck.jsp" %>
<%@include file="../../common/plugins/css/jquery.ztree.jsp" %>
<%@include file="../../common/plugins/css/jQuery-Validation-Engine.jsp" %>
<div class="tabModel-content animated hide">
    <div id="page-content" class="row">
        <div class="col-md-12">
            <div class="row">
                <div class="col-sm-3">
                    <div class="panel panel-white">
                        <div class="panel-heading">
                            <h4 class="panel-title"><span class="" data-localize="frame_xtgl.bmgl_zzjglxgl_zzjglxlb">组织机构类型列表</span></h4>
                        </div>
                        <div class="panel-body">
                            <div id="menuTree" class="ztree">loading...</div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-9 padding-left-0">
                    <div class="panel panel-white">
                        <div class="panel-heading">
                            <h4 class="panel-title"><span class="" data-localize="frame_xtgl.bmgl_zzjglxgl_zzjglx">组织机构类型</span></h4>
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
</div>
<%@include file="../../common/plugins/js/jQuery-Validation-Engine.jsp" %>
<%@include file="../../common/plugins/js/jquery.ztree.jsp" %>
<%@include file="../../common/plugins/js/blockUI.jsp" %>
<%@include file="../../common/other/tab-model-bottom.jsp" %>
<!-- end: PAGE CONTENT-->
<script type="text/javascript">
    var page1 = {
        treeObj: null,
        /**
         * 点击节点事件
         * @param event
         * @param treeId
         * @param treeNode
         */
        zTreeOnClick: function (event, treeId, treeNode) {
            Main.ajaxLoaderUrl(tool.initParams(basePath + "/s/system/departType/load?wid=" + treeNode.wid), $("#input-page-content"));
        },
        /**
         * 新增下级
         */
        addtype: function (updeparttype) {
            Main.ajaxLoaderUrl(tool.initParams(basePath + "/s/system/departType/load?updeparttype=" + updeparttype), $("#input-page-content"));
            $(".form-horizontal").validationEngine();
        },
        /**
         * 修改/保存方法
         */
        savetype: function (el) {
            if ($(".form-horizontal").validationEngine('validate')) {
                $.ajax({
                    url: tool.initParams(basePath + '/s/system/departType/save'),
                    type: "POST",
                    data: $(".form-horizontal").serialize(),
                    timeout: 1000 * 5,
                    dataType:'json',
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        tool.alertWarning('操作失败,请重试!');
                    },
                    success: function (data) {
                        if (data != null) {
                            if (data.res) {
                                tool.alertSuccess(data.msg);
                                var wid = $("#wid").val();
                                if (wid != null && wid != "") {
                                    var node = page1.treeObj.getNodeByParam("id", $('#departtype').val(), null);
                                    node.name = "<i class='fa fa-file'></i> " + $("#name").val();
                                    page1.treeObj.updateNode(node);
                                    page1.highlightNode(node, "#6699FF");
                                } else {
                                    var pId = $("#updeparttype").val();
                                    var node = page1.treeObj.getNodeByParam("id", pId, null);
                                    var newNodes = [{
                                        name: "<i class='fa fa-file'></i> " + $("#name").val(),
                                        id: data.data.departtype,
                                        wid: data.data.wid
                                    }];
                                    $("#wid").val(data.data.wid);
                                    newNodes = page1.treeObj.addNodes(node, newNodes);
                                    page1.highlightNode(page1.treeObj.getNodeByTId(newNodes[0].tId), "#00CC66");
                                }
                            }else{
                                tool.alertWarning('操作失败!',data.msg);
                            }
                        }
                    }
                });
            }
        },
        submitRemoveMenu: function () {
            tool.alertConfirm("确定要删除此类型以及其子类型吗?", '删除后将无法恢复，请谨慎操作！', function () {
                $.post(tool.initParams(basePath + '/s/system/departType/remove'), {'wid': $("#wid").val()}, function (data) {
                 if (data) {
                        var node = page1.treeObj.getNodeByParam("id", $("#departtype").val(), null);
                        $("#" + node.tId + ",#" + node.tId + " > a,#" + node.tId + "_span,#" + node.tId + " span,#" + node.tId + " i").css({
                            "background-color": "#FF3300",
                            "color": "#fff"
                        }).fadeOut(1000);
                        if (node != null) {
                            setTimeout('page1.deleteNode()', 800);
                        }
                    } else {
                    	 tool.alertError("删除失败！");
                    }
                });
            })
        },
        deleteNode: function () {
        	page1.treeObj.removeNode(page1.treeObj.getNodeByParam("id", $("#departtype").val(), null));
            //默认选中第一个父节点
            var pNode = page1.treeObj.getNodeByParam("id", $('#updeparttype').val(), null);
            page1.treeObj.selectNode(pNode);
            page1.zTreeOnClick(null, null, pNode);
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
    };

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
                onClick: page1.zTreeOnClick
            }
        };
        $.post(basePath + "/s/ajax/getdeparttype", function (data) {
        	page1.treeObj = $.fn.zTree.init($("#menuTree"), setting, eval(data));
            //默认选中第一个父节点
           var pNode = page1.treeObj.getNodeByParam("id", '<%=LoginUtil.getloginuser(request).getDepart().getDeparttype()%>', null);
            page1.treeObj.selectNode(pNode);
            page1.zTreeOnClick(null, null, pNode);
        });

    });
</script>