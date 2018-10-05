<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../../common/input-header.jsp" %>

<div class="col-md-10 col-md-offset-1">
    <div class="panel panel-white">
        <div class="panel-heading">
            <h4 class="panel-title">子节点信息</h4>
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
                <input type="hidden" id="wid" name="wid" value="${object.wid }" />
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="name">
                        <font data-localize="frame_xipz.zjdwh_zjdmc">名称</font>：
                    </label>

                    <div class="col-sm-10">
                        <input type="text"  name="name" id="name" class="validate[required] form-control" value="${object.name}"/>
                        <span class="symbol required"></span>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="name">
                        <font data-localize="frame_xipz.zjdwh_zjdxmqc">项目路径</font>：
                    </label>

                    <div class="col-sm-6">
                        <input type="text"  name="url" id="url" class="validate[required] form-control" value="${object.url}"/>
                        <span class="symbol required"></span>
                    </div>
                    <span class="help-inline col-sm-4"> <i class="fa fa-info-circle"></i> 必须以/开头，比如/pros_nod </span>
                </div>
                <div class="form-group">
                    <div class="col-sm-12 frame-btn-group">
                        <button class="btn btn-sm btn-success" type="button" onclick="tool.saveData(this)">
                            <font data-localize="frame_button.save">保存</font>
                            <i class="fa fa-check"></i>
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<%@include file="../../common/input-bottom.jsp" %>