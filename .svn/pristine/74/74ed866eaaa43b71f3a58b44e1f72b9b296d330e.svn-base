<%@ page language="java" pageEncoding="UTF-8" %>
<%@include file="../../common/input-header.jsp" %>
<div class="col-md-8 col-md-offset-2">
    <div class="panel panel-white">
        <div class="panel-heading">
            <h4 class="panel-title" data-localize="frame_xtgl.xtsz_xtcssz_xtcswh">系统参数维护</h4>
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
                <input type="hidden" id="is_change" value="0">
                <input type="hidden" name="wid" id="wid" value="${object.wid}">
                <div class="form-group">
                    <label class="col-sm-3 control-label" for="csfl">
                        <font data-localize="frame_xtgl.xtsz_xtcssz_csmc">参数名称</font>：
                    </label>

                    <div class="col-sm-8">
                        <input type="text" id="csfl" name="csfl" class="validate[required,maxSize[50]] form-control"
                               value="${object.csfl }">
                        <span class="symbol required"></span>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label" for="cslx">
                        <font data-localize="frame_xtgl.xtsz_xtcssz_cslx"> 参数类型</font>：
                    </label>

                    <div class="col-sm-8">
                        <input type="text" id="cslx" name="cslx" class="validate[required,maxSize[50]] form-control"
                               value="${object.cslx }">
                        <span class="symbol required"></span>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label" for="csmc">
                        <font data-localize="frame_xtgl.xtsz_xtcssz_cs"> 参数</font>：
                    </label>

                    <div class="col-sm-8">
                        <input type="text" id="csmc" name="csmc" class="validate[required,maxSize[50]] form-control"
                               value="${object.csmc }">

                        <span class="symbol required"></span>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label" for="cs">
                        <font data-localize="frame_xtgl.xtsz_xtcssz_csz"> 参数值</font>：
                    </label>

                    <div class="col-sm-8">
                        <input type="text" id="cs" name="cs" class="validate[required,maxSize[50]] form-control"
                               value="${object.cs }">
                        <span class="symbol required"></span>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label" for="cssm">
                        <font data-localize="frame_xtgl.xtsz_xtcssz_cssm"> 参数说明</font>：
                    </label>

                    <div class="col-sm-8">
                        <input type="text" id="cssm" name="cssm" class="form-control" value="${object.cssm }">
                    </div>
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