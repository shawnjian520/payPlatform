<%@ page language="java" pageEncoding="UTF-8" %>
<%@include file="../../common/input-header.jsp" %>
<div class="col-md-8 col-md-offset-2">
    <div class="panel panel-white">
        <div class="panel-heading">
            <h4 class="panel-title">字典维护</h4>
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
            <form class="form-horizontal">
                <input type="hidden" id="is_change" name="is_change"value="${is_change}">
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="zdlb">
                        字典类别编码：
                    </label>

                    <div class="col-sm-9">
                        <input type="text" id="zdlb" name="zdlb" class="validate[required,maxSize[50]] form-control" value="${object.zdlb}">
                        <input type="hidden" id="oldzdlb" name="oldzdlb"value="${object.zdlb}">
                        <span class="symbol required"></span>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="lbmc">
                        字典类别名称：
                    </label>

                    <div class="col-sm-9">
                        <input type="text" id="lbmc" name="lbmc" class="validate[required,maxSize[50]] form-control" value="${object.lbmc}">
                        <span class="symbol required"></span>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-12 frame-btn-group">
                        <button class="btn btn-sm btn-success" type="button" onclick="tool.saveData(this)">
                            保存 <i class="fa fa-check"></i>
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<%@include file="../../common/input-bottom.jsp" %>