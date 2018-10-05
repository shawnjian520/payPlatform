<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../../common/input-header.jsp" %>
<%@include file="../../common/plugins/css/iCheck.jsp" %>
<div id="page-content" class="row">
    <div class="col-md-10 col-md-offset-1">
        <div class="panel panel-white">
            <div class="panel-heading">
                <h4 class="panel-title" data-localize="frame_xtgl.xtsz_xtxxsz_xtxx">系统信息</h4>
                <div class="panel-tools">
                    <div class="dropdown">
                        <a data-toggle="dropdown" class="btn btn-xs dropdown-toggle btn-transparent-grey">
                            <i class="fa fa-cog"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-light pull-right" role="menu">
                            <li>
                                <a class="panel-collapse collapses" href="#"><i class="fa fa-angle-up"></i>
                                    <span>收起</span> </a>
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
                    <input type="hidden" id="wid" name="wid" value="${sysInit.wid }"/>
                    <div class="form-group hide">
                        <label class="col-sm-3 control-label"> <font
                                data-localize="frame_xtgl.xtsz_xtxxsz_xtbm">系统编码</font>： </label>

                        <div class="col-sm-8">
                            <input type="text" name="sfbm" id="sfbm" class="validate[required,maxSize[10]] form-control"
                                   value="${sysInit.sfbm}"/> <span class="symbol required"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-3 control-label"> <font
                                data-localize="frame_xtgl.xtsz_xtxxsz_xtmc">系统名称</font>： </label>

                        <div class="col-sm-8">
                            <input type="text" name="sfmc" id="sfmc"
                                   class="validate[required ] form-control" value="${sysInit.sfmc}"/>
                            <span class="symbol required"></span>
                        </div>
                    </div>

                    <div class="form-group hide">
                        <label class="col-sm-3 control-label"> <font
                                data-localize="frame_xtgl.xtsz_xtxxsz_xtdly">登陆页</font>： </label>

                        <div class="col-sm-8">
                            <input type="text" name="loginurl" id="loginurl"
                                   class="validate[required] form-control"
                                   value="${sysInit.loginurl}"/> <span class="symbol required"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label"> <font
                                data-localize="frame_xtgl.xtsz_xtxxsz_dbdz">待办加载地址</font>： </label>

                        <div class="col-sm-8">
                            <input type="text" name="dburl" id="dburl"
                                   class="form-control" value="${sysInit.dburl}"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label"> <font data-localize="frame_xtgl.xtsz_xtxxsz_sfxsdbdz">首页是否显示待办</font>：
                        </label>

                        <div class="col-sm-8">
                            <label class="radio-inline">
                                <input name="showdb" value="1" type="radio" class="mgr" <c:if
                                        test="${sysInit.showdb=='1' }"> checked="checked" </c:if>>
                                <font data-localize="frame_xtgl.xtsz_xtxxsz_s"> 是</font>
                            </label>
                            <label class="radio-inline">
                                <input name="showdb" value="0" type="radio" class="mgr" <c:if
                                        test="${sysInit.showdb=='0' }"> checked="checked" </c:if>>
                                <font data-localize="frame_xtgl.xtsz_xtxxsz_f"> 否</font>
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label"> <font data-localize="frame_xtgl.xtsz_xtxxsz_sfxsfjcd">是否分阶段菜单</font>：
                        </label>

                        <div class="col-sm-8">
                            <label class="radio-inline">
                                <input name="stagemenu" value="1" type="radio" class="mgr" <c:if
                                        test="${sysInit.stagemenu=='1' }"> checked="checked" </c:if>>
                                <font data-localize="frame_xtgl.xtsz_xtxxsz_s"> 是</font>
                            </label>
                            <label class="radio-inline">
                                <input name="stagemenu" value="0" type="radio" class="mgr" <c:if
                                        test="${sysInit.stagemenu=='0' }"> checked="checked" </c:if>>
                                <font data-localize="frame_xtgl.xtsz_xtxxsz_f"> 否</font>
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label"> <font data-localize="frame_xtgl.xtsz_xtxxsz_zxsycddlx">只显示有菜单的类型</font>：
                        </label>

                        <div class="col-sm-8">
                            <label class="radio-inline">
                                <input name="showallstagemenu" value="0" type="radio" class="mgr" <c:if
                                        test="${sysInit.showallstagemenu=='0' }"> checked="checked" </c:if>>
                                <font data-localize="frame_xtgl.xtsz_xtxxsz_s"> 是</font>
                            </label>
                            <label class="radio-inline">
                                <input name="showallstagemenu" value="1" type="radio" class="mgr" <c:if
                                        test="${sysInit.showallstagemenu=='1' }"> checked="checked" </c:if>>
                                <font data-localize="frame_xtgl.xtsz_xtxxsz_f"> 否</font>
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label"> <font data-localize="frame_xtgl.xtsz_xtxxsz_zxsycddxd">只显示有菜单的学段</font>：
                        </label>

                        <div class="col-sm-8">
                            <label class="radio-inline">
                                <input name="showallleftstagemenu" value="1" type="radio" class="mgr" <c:if
                                        test="${sysInit.showallleftstagemenu=='1' }"> checked="checked" </c:if>>
                                <font data-localize="frame_xtgl.xtsz_xtxxsz_s"> 是</font>
                            </label>
                            <label class="radio-inline">
                                <input name="showallleftstagemenu" value="0" type="radio" class="mgr" <c:if
                                        test="${sysInit.showallleftstagemenu=='0' }"> checked="checked" </c:if>>
                                <font data-localize="frame_xtgl.xtsz_xtxxsz_f"> 否</font>
                            </label>
                        </div>
                    </div>
                    <div class="form-group hide">
                        <label class="col-sm-3 control-label"> <font data-localize="frame_xtgl.xtsz_xtxxsz_sfqyTab">是否启用Tab</font>：
                        </label>

                        <div class="col-sm-8">
                            <label class="radio-inline">
                                <input name="tabModels" value="1" type="radio" class="mgr" <c:if
                                        test="${sysInit.tabModels=='1' }"> checked="checked" </c:if>>
                                <font data-localize="frame_xtgl.xtsz_xtxxsz_s"> 是</font>
                            </label>
                            <label class="radio-inline">
                                <input name="tabModels" value="0" type="radio" class="mgr" <c:if
                                        test="${sysInit.tabModels=='0' }"> checked="checked" </c:if>>
                                <font data-localize="frame_xtgl.xtsz_xtxxsz_f"> 否</font>
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label"> <font data-localize="frame_xtgl.xtsz_xtxxsz_sytp">首页Logo-PC</font>：
                        </label>
                        <div class="col-sm-8">
                            <input type="text" name="header" id="header" class="validate[required] form-control"
                                   value="${sysInit.header}"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label"> <font data-localize="frame_xtgl.xtsz_xtxxsz_sytp">首页Logo-移动端</font>：
                        </label>
                        <div class="col-sm-8">
                            <input type="text" name="headermb" id="headermb" class="validate[required] form-control"
                                   value="${sysInit.headermb}"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-12 frame-btn-group">
                            <button class="btn btn-sm btn-success" type="button"
                                    onclick="tool.saveData(this)">
                                <font data-localize="frame_button.save">保存</font> <i class="fa fa-check"></i>
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<%@include file="../../common/input-bottom.jsp" %>