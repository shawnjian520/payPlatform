<%@ page language="java" pageEncoding="utf-8" %>
<%@include file="../../common/other/tab-model-header.jsp" %>
<%@include file="../../common/plugins/css/jquery.ztree.jsp" %>
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
                                                          data-localize="frame_xtgl.bmgl_qtlxlb_qtlxlb">其他类型列表</span>
                            </h4>
                        </div>
                        <div class="panel-body">
                            <div id="menuTree" class="ztree">loading...</div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-9">
                    <div class="panel panel-white">
                        <div class="panel-heading">
                            <h4 class="panel-title"><span class="" data-localize="frame_xtgl.bmgl_qtlxlb_qtlx">其他类型</span>
                            </h4>
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
<%@include file="../../common/other/tab-model-bottom.jsp" %>
<!-- end: PAGE CONTENT-->
<script type="text/javascript">
    var deltitle = '';
    var deltips = '';
    var errtip = '';
    var errtipczsb = '';
    var nochoosetitle = '';
    var nochoosetip = '';
    function getCookie(name)//取cookies函数
    {
        var arr = document.cookie.match(new RegExp("(^| )" + name + "=([^;]*)(;|$)"));
        if (arr != null) return unescape(arr[2]);
        return null;
    }
    var cookielang = getCookie("jdLanguage");
    if (cookielang == "en") {
        deltitle = 'Are you sure you want to delete this type as well as its child type?';
        deltips = 'Delete will not be able to recover, please be careful to operate!';
        errtip = 'Operation failed, please try again!';
        errtipczsb = 'Operation failed !';
        nochoosetitle = 'Please select the data you want to delete!';
        nochoosetip = 'Check the data you want to delete in the list below';
    } else {
        deltitle = '确定要删除此类型以及其子类型吗?';
        deltips = '删除后将无法恢复，请谨慎操作！';
        errtip = '操作失败,请重试!';
        errtipczsb = '操作失败!';
        nochoosetitle = '请选择要删除的数据!';
        nochoosetip = '请在下方列表中勾选要删除的数据';
    }
    page2 = {
        treeObj: null,
        /**
         * 点击节点事件
         * @param event
         * @param treeId
         * @param treeNode
         */
        zTreeOnClick: function (event, treeId, treeNode) {
            Main.ajaxLoaderUrl(tool.initParams(basePath + "/s/system/studentType/load?wid=" + treeNode.wid), $("#input-page-content"));
        },
        /**
         * 新增下级
         */
        addtype: function (uptype, wid) {
            Main.ajaxLoaderUrl(tool.initParams(basePath + "/s/system/studentType/addNext?uptype=" + uptype + "&upwid=" + wid), $("#input-page-content"));
            $(".form-horizontal").validationEngine();
        },
        /**
         * 修改/保存方法
         */
        savetype: function () {
            if ($(".form-horizontal").validationEngine('validate')) {
                $.ajax({
                    url: tool.initParams(basePath + '/s/system/studentType/save'),
                    type: "POST",
                    data: $(".form-horizontal").serialize(),
                    timeout: 1000 * 5,
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        tool.alertWarning(errtip);
                    },
                    success: function (data) {
                        if (data != null) {
                            data = eval("(" + data + ")");
                            if (data.res) {
                                tool.alertSuccess(data.msg);
                                var wid = $("#wid").val();
                                if (wid != null && wid != "") {
                                    var node = page2.treeObj.getNodeByParam("id", $('#type').val(), null);
                                    node.name = "<i class='fa fa-file'></i> " + $("#name").val();
                                    page2.treeObj.updateNode(node);
                                    page2.highlightNode(node, "#6699FF");
                                } else {
                                    var pId = $("#uptype").val();
                                    var node = page2.treeObj.getNodeByParam("id", pId, null);
                                    var newNodes = [{
                                        name: "<i class='fa fa-file'></i> " + $("#name").val(),
                                        id: data.data.type,
                                        wid: data.data.wid
                                    }];
                                    $("#wid").val(data.data.wid);
                                    newNodes = page2.treeObj.addNodes(node, newNodes);
                                    page2.highlightNode(page2.treeObj.getNodeByTId(newNodes[0].tId), "#00CC66");
                                }
                            } else {
                                tool.alertSuccess(data.msg);
                            }
                        }
                    }
                });
            }
        },
        submitRemoveMenu: function () {
            tool.alertConfirm(deltitle, deltips, function () {
                $.post(tool.initParams(basePath + '/s/system/studentType/remove'), {'wid': $("#wid").val()}, function (data) {
                    if (data) {
                        var node = page2.treeObj.getNodeByParam("id", $("#type").val(), null);
                        $("#" + node.tId + ",#" + node.tId + " > a,#" + node.tId + "_span,#" + node.tId + " span,#" + node.tId + " i").css({
                            "background-color": "#FF3300",
                            "color": "#fff"
                        }).fadeOut(1000);
                        if (node != null) {
                            setTimeout('page2.deleteNode()', 800);
                        }
                    } else {
                        tool.alertError("删除失败");
                    }
                });
            })
        },
        deleteNode: function () {
            page2.treeObj.removeNode(page2.treeObj.getNodeByParam("id", $("#type").val(), null));
            //默认选中第一个父节点
            var pNode = page2.treeObj.getNodeByParam("id", $('#uptype').val(), null);
            page2.treeObj.selectNode(pNode);
            page2.zTreeOnClick(null, null, pNode);
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
                onClick: page2.zTreeOnClick
            }
        };
        $.post(basePath + "/s/ajax/getstudenttype", function (data) {
            page2.treeObj = $.fn.zTree.init($("#menuTree"), setting, eval(data));
            //默认选中第一个父节点
            var pNode = page2.treeObj.getNodeByParam("id", '01', null);
            page2.treeObj.selectNode(pNode);
            page2.zTreeOnClick(null, null, pNode);
        });

    });
</script>