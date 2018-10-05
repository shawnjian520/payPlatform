<%@ page language="java" pageEncoding="UTF-8" %>
<%@include file="../../common/input-header.jsp" %>
<%@include file="../../common/plugins/css/select2.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="col-md-8 col-md-offset-2">
    <div class="panel panel-white">
        <div class="panel-heading">
            <h4 class="panel-title">数据导入模板维护</h4>
            <div class="panel-tools">
                <div class="dropdown">
                    <a data-toggle="dropdown" class="btn btn-xs dropdown-toggle btn-transparent-grey">
                        <i class="fa fa-cog"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-light pull-right" role="menu">
                        <li>
                            <a class="panel-collapse collapses" href="#"><i class="fa fa-angle-up"></i> <span>收起</span> </a>
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
                <input type="hidden" id="is_change" value="0">
                <input type="hidden" name="wid" id="wid" value="${object.wid }">
                <div class="form-group">
                    <label class="col-sm-3 control-label" for="tempname">
                        <font data-localize="frame_xtgl.pzgl_sjdr_mc">名称</font>：
                    </label>

                    <div class="col-sm-9">
                        <input type="text" name="tempname" value="${object.tempname}" id="tempname"
                               class="validate[required,maxSize[15]] form-control">
                        <span class="symbol required"></span>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label" for="mappingtable">
                        <font data-localize="frame_xtgl.pzgl_sjdr_mbbm">映射表</font>：
                    </label>

                    <div class="col-sm-9">
                        <select id="mappingtable" name="mappingtable" data-show-searchbox="true"
                                class="validate[required,maxSize[50]] form-control select2-auto">
                            <c:forEach items="${DBTables}" var="t" varStatus="s">
                                <option
                                        <c:if test="${t==object.mappingtable }">selected="selected"</c:if>
                                        value="${t}">${t}</option>
                            </c:forEach>
                        </select>
                        <span class="symbol required"></span>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label" for="modelfile">
                        <font data-localize="frame_xtgl.pzgl_sjdr_mbmv"> 模板名称</font>：
                    </label>

                    <div class="col-sm-9">
                        <input type="text" id="modelfile" name="modelfile" class="validate[maxSize[15]] form-control"
                               value="${object.modelfile}">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label" for="mappingtable">
                        <font data-localize="frame_xtgl.pzgl_sjdr_cljd">处理节点</font>：
                    </label>

                    <div class="col-sm-9">
                        <select id="nodeid" name="nodeid" data-show-searchbox="true"
                                class="validate[maxSize[50]] form-control select2-auto">
                            <c:forEach items="${nodes}" var="t" varStatus="s">
                                <option
                                        <c:if test="${t.id==object.nodeid }">selected="selected"</c:if>
                                        value="${t.id}">${t.caption}</option>
                            </c:forEach>
                        </select>

                        <span class="symbol required"></span>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label" for="modelfile">
                        <font data-localize="frame_xtgl.pzgl_sjdr_clurl">处理url</font>：
                    </label>

                    <div class="col-sm-9">
                        <input type="text" id="url" name="url" class="validate[required,maxSize[35]] form-control"
                               value="${object.url}">
                        <span class="symbol required"></span>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label" for="modelfile">
                        <font data-localize="frame_xtgl.pzgl_sjdr_lx">类型</font>：
                    </label>

                    <div class="col-sm-9">
                        <select class="form-control select2-auto" class="validate[required] form-control select2-auto"
                                name="type" id="importTemp_type">
                            <option value="1"  <c:if test="${object.type=='1' }"> selected="selected" </c:if>
                                    data-localize="frame_xtgl.pzgl_sjdr_drsj">导入数据
                            </option>
                            <option value="2" <c:if test="${object.type=='2' }">selected="selected"
                                    </c:if>data-localize="frame_xtgl.pzgl_sjdr_gxsj">更新数据
                            </option>
                        </select>
                        <span class="symbol required"></span>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-12 frame-btn-group">
                        <button class="btn btn-sm btn-success" type="button" onclick="tool.saveData(this)">
                            <font data-localize="frame_button.save">保存</font> <i class="fa fa-check"></i>
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<%@include file="../../common/plugins/js/select2.jsp" %>
<%@include file="../../common/input-bottom.jsp" %>