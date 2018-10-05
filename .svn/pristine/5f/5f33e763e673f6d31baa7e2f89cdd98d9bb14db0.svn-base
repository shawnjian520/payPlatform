<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="jd" uri="/WEB-INF/TLD/custom.tld" %>
<%
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + request.getContextPath();
%>
<%@include file="../../common/input-header.jsp" %>
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
<div class="row">
    <form role="form" class="form-horizontal">

        <div class="col-md-2">
            <jd:panel className="input-panel" title="业务管理">
                <div class="panel-group" id="accordion" role="tablist"
                     aria-multiselectable="true">
                    <c:forEach items="${resultData}" var="obj">
                        <div class="panel panel-default">
                            <div class="panel-heading" role="tab" id="headingOne"
                                 role="button" data-toggle="collapse" data-parent="#accordion"
                                 href="#collapseOne" aria-expanded="true"
                                 aria-controls="collapseOne">
                                <h4 class="panel-title">
                                    <i class="fa fa-plus"></i>${obj.ywmc}
                                </h4>
                            </div>
                            <div id="collapseOne" class="panel-collapse collapse in"
                                 role="tabpanel" aria-labelledby="headingOne">
                                <div class="panel-body">
                                    <ul>
                                        <c:forEach items="${obj.}" var="obj2">
                                            <c:if test="${obj.ywmc==obj2.ywmc}">
                                                <li data-temple-index="1">${obj.pagename}</li>
                                            </c:if>

                                        </c:forEach>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </c:forEach>

                    <!-- <div class="panel panel-default">
                        <div class="panel-heading" role="tab" id="headingtwo"
                            role="button" data-toggle="collapse" data-parent="#accordion"
                            href="#collapseTwo" aria-expanded="true"
                            aria-controls="collapseTwo">
                            <h4 class="panel-title">
                                <i class="fa fa-plus"></i> 合同管理
                            </h4>
                        </div>
                        <div id="collapseTwo" class="panel-collapse collapse"
                            role="tabpanel" aria-labelledby="headingtwo">
                            <div class="panel-body">
                                <ul>
                                    <li data-temple-index="20">新增合同</li>
                                    <li data-temple-index="21">合同记录</li>
                                </ul>
                            </div>
                        </div>
                    </div> -->
                </div>
            </jd:panel>
        </div>
        <div class="col-md-10">
            <div class="row data-group" data-order="100">
                <div id="" data-group-name="详情列表" data-order="100" class="layout col-xs-12" data-wid="iFH6157"
                     data-assembly-id="6">
                    <div class="panel">
                        <div class="panel-heading" style="background-color: #f2f2f2;"><h4 class="panel-title">详情列表</h4>
                        </div>
                        <div class="panel-body">
                            <div class="col-md-12">
                                <a class="btn btn-sm btn-success" data-startFrom="top" onclick="tool.addData(this)">新增 <i
                                        class="fa fa-plus"></i></a>
                                <a class="btn btn-sm btn-success" onclick="tool.doRemove(this)">删除 <i
                                        class="fa fa-times"></i></a>
                                <a class="btn btn-sm btn-success" data-startFrom="top" onclick="tool.editData(this)">修改 <i
                                        class="fa fa-edit"></i></a>


                                <div class="dataTables_wrapper form-inline edit-element table-align-center"
                                     data-assembly-id="7" data-order="100" data-wid="mDG6157" id="">
                                    <table class="table table-striped table-hover dataTable table-bordered">
                                        <thead>
                                        <tr>
                                            <th class="center w20" rowspan="2">
                                                <label>
                                                    <input type="checkbox" class="mgc selectall">
                                                </label>
                                            </th>
                                            <th data-order-name="wid" rowspan="2">Test1
                                            </th>
                                            <th data-order-name="name" rowspan="2">Test2
                                            </th>
                                            <th data-order-name="age" rowspan="2">Test3
                                            </th>
                                            <th rowspan="2">操作
                                            </th>
                                        </tr>
                                        <tr>
                                        </tr>
                                        </thead>
                                        <tbody items="<%-- ${listHz} --%>" var="object">
                                        <tr id="tr_<%-- ${object.wid} --%>" onclick="">
                                            <td class="center w20">
                                                <label>
                                                    <input type="checkbox" name="selectNode"
                                                           class="mgc foocheck" id="<%-- ${object.wid} --%>"
                                                           value="<%-- ${object.wid} --%>">
                                                </label>
                                            </td>
                                            <td><%-- ${object.wid} --%>
                                            </td>
                                            <td><%-- ${object.name} --%>
                                            </td>
                                            <td><%-- ${object.age} --%>
                                            </td>
                                            <td data-element-type="auto-add">
                                                <a class="btn btn-xs btn-success tooltips" data-tab-name=""
                                                   data-placement="top" data-original-title="test" onclick=""
                                                   href="javascript:void(0)">test
                                                </a>
                                            </td>
                                        </tr>
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
</div>

<%@include file="../../common/input-bottom.jsp" %>


<script>

</script>