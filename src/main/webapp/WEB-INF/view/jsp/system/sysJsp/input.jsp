<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="jd" uri="/WEB-INF/TLD/custom.tld" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@include file="../../common/input-header.jsp" %>
<%@include file="../../common/plugins/css/iCheck.jsp" %>
<%@include file="../../common/plugins/css/select2.jsp" %>
<div class="col-md-10 col-md-offset-1">
    <div class="panel panel-white">
        <div class="panel-heading">
            <h4 class="panel-title">详细信息</h4>
            <div class="panel-tools">
                <div class="dropdown">
                    <a data-toggle="dropdown" class="btn btn-xs dropdown-toggle btn-transparent-grey">
                        <i class="fa fa-cog"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-light pull-right" role="menu">
                        <li>
                            <a class="panel-collapse collapses" href="#"><i class="fa fa-angle-up"></i> <span>收起</span>
                            </a>
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
                <input type="hidden" name="wid" id="wid" value="${object.wid}">
                <jd:lable id="ywmc" col="1" lable="业务名称">
                    <input type="text" id="ywmc" name="ywmc" class="validate[required] form-control"
                           value="${object.ywmc}"/>
                </jd:lable>
                <jd:lable id="pagename" col="1" lable="页面类型">
                    <label class="radio-inline">
                        <input name="pagetype" value="list" type="radio" class="mgr"
                        <c:if test="${object.pagetype=='list' }"> checked="checked" </c:if>>
                        列表页面
                    </label>
                    <label class="radio-inline">
                        <input name="pagetype" value="input" type="radio" class="mgr"
                        <c:if test="${object.pagetype=='input' }"> checked="checked" </c:if>>
                        表单页面
                    </label>
                    <label class="radio-inline">
                        <input name="pagetype" value="tab" type="radio" class="mgr"
                        <c:if test="${object.pagetype=='tab' }"> checked="checked" </c:if>>
                        tab页面
                    </label>
                </jd:lable>
                <jd:lable id="pagename" col="1" lable="是否引入头尾文件">
                    <label class="radio-inline">
                        <input name="isimportotherjsp" value="1" type="radio" class="mgr"
                        <c:if test="${object.isimportotherjsp=='1' }"> checked="checked" </c:if>>
                        是
                    </label>
                    <label class="radio-inline">
                        <input name="isimportotherjsp" value="0" type="radio" class="mgr"
                        <c:if test="${object.isimportotherjsp=='0' }"> checked="checked" </c:if>>
                        否
                    </label>
                </jd:lable>
                <jd:lable id="pagename" col="1" lable="页面名称">
                    <input type="text" id="pagename" name="pagename" class="validate[required] form-control"
                           value="${object.pagename}"/>
                </jd:lable>
                <jd:lable id="node" col="1" lable="节点">
                    <select id="node" name="node" class="form-control select2-auto validate[required]"
                            data-val="${object.node}"
                            data-table-name="T_SYS_PRO_URL" data-field-id="wid" data-field-name="name"></select>
                </jd:lable>
                <jd:lable id="path" col="1" lable="路径">
                    <input type="text" id="path" name="path" class="validate[required] form-control"
                           value="${object.path}" placeholder="/test/页面.jsp"/>
                </jd:lable>
                <div class="col-xs-12 ">
                    <div class="form-group"><label title="引入插件" class="col-sm-2 control-label ell nopadding"
                                                   data-localize="">引入插件：</label>
                        <div class="col-sm-10">
                            <label class="checkbox-inline">
                                <input name="plugins" type="checkbox" class="mgc" value="iCheck" <c:if
                                        test="${fn:contains(object.plugins, 'iCheck')}"> checked="checked"</c:if>>
                                iCheck
                            </label>
                            <label class="checkbox-inline">
                                <input name="plugins" type="checkbox" class="mgc" value="moment" <c:if
                                        test="${fn:contains(object.plugins, 'moment')}"> checked="checked"</c:if>>
                                <a target="_blank" href="http://momentjs.cn">Moment.js</a>
                            </label>
                            <label class="checkbox-inline">
                                <input name="plugins" type="checkbox" class="mgc" value="jQuery-Validation-Engine" <c:if
                                        test="${fn:contains(object.plugins, 'jQuery-Validation-Engine')}"> checked="checked"</c:if>>
                                <a target="_blank" href="https://github.com/posabsolute/jQuery-Validation-Engine/">表单验证</a>
                            </label>
                            <label class="checkbox-inline">
                                <input name="plugins" type="checkbox" class="mgc" value="bootstrap-datetimepicker" <c:if
                                        test="${fn:contains(object.plugins, 'bootstrap-datetimepicker')}"> checked="checked"</c:if>>
                                <a target="_blank" href="http://eonasdan.github.io/bootstrap-datetimepicker/">日期插件</a>
                            </label>
                            <label class="checkbox-inline">
                                <input name="plugins" type="checkbox" class="mgc" value="select2" <c:if
                                        test="${fn:contains(object.plugins, 'select2')}"> checked="checked"</c:if>>
                                <a target="_blank" href="http://select2.github.io">下拉插件</a>
                            </label>
                            <label class="checkbox-inline hide">
                                <input name="plugins" type="checkbox" class="mgc" value="sweetalert" <c:if
                                        test="${fn:contains(object.plugins, 'sweetalert')}"> checked="checked"</c:if>>
                                <a target="_blank" href="http://t4t5.github.io/sweetalert/">弹出框</a>
                            </label>
                            <label class="checkbox-inline">
                                <input name="plugins" type="checkbox" class="mgc" value="cropper" <c:if
                                        test="${fn:contains(object.plugins, 'cropper')}"> checked="checked"</c:if>> <a
                                    target="_blank" href="https://github.com/fengyuanchen/cropper/">图片裁剪</a>
                            </label>
                            <label class="checkbox-inline">
                                <input name="plugins" type="checkbox" class="mgc" value="uploadify" <c:if
                                        test="${fn:contains(object.plugins, 'uploadify')}"> checked="checked"</c:if>> <a
                                    target="_blank" href="http://www.uploadify.com/demos/">文件上传</a>
                            </label>
                            <label class="checkbox-inline">
                                <input name="plugins" type="checkbox" class="mgc" value="jquery.ztree" <c:if
                                        test="${fn:contains(object.plugins, 'jquery.ztree')}"> checked="checked"</c:if>>
                                <a target="_blank" href="http://www.treejs.cn/v3/main.php#_zTreeInfo">zTree -- 树插件</a>
                            </label>
                            <label class="checkbox-inline">
                                <input name="plugins" type="checkbox" class="mgc" value="bootbox" <c:if
                                        test="${fn:contains(object.plugins, 'bootbox')}"> checked="checked"</c:if>> <a
                                    target="_blank" href="http://bootboxjs.com">弹出层</a>
                            </label>
                            <label class="checkbox-inline">
                                <input name="plugins" type="checkbox" class="mgc" value="perfect-scrollbar" <c:if
                                        test="${fn:contains(object.plugins, 'perfect-scrollbar')}">
                                       checked="checked"</c:if>> <a target="_blank"
                                                                    href="http://noraesae.github.io/perfect-scrollbar/">滚动条</a>
                            </label>
                            <label class="checkbox-inline hide">
                                <input name="plugins" type="checkbox" class="mgc" value="autosize" <c:if
                                        test="${fn:contains(object.plugins, 'autosize')}"> checked="checked"</c:if>> <a
                                    target="_blank" href="http://www.jacklmoore.com/autosize/">自动高度</a>
                            </label>
                            <label class="checkbox-inline hide">
                                <input name="plugins" type="checkbox" class="mgc" value="jquery.truncate" <c:if
                                        test="${fn:contains(object.plugins, 'jquery.truncate')}">
                                       checked="checked"</c:if>> <a target="_blank"
                                                                    href="https://github.com/tbasse/jquery-truncate">文字截取</a>
                            </label>
                            <label class="checkbox-inline">
                                <input name="plugins" type="checkbox" class="mgc" value="jquery.smart.wizard" <c:if
                                        test="${fn:contains(object.plugins, 'jquery.smart.wizard')}">
                                       checked="checked"</c:if>> <a target="_blank"
                                                                    href="https://github.com/mstratman/jQuery-Smart-Wizard">向导式表单</a>
                            </label>
                            <label class="checkbox-inline">
                                <input name="plugins" type="checkbox" class="mgc" value="jquery.raty" <c:if
                                        test="${fn:contains(object.plugins, 'jquery.raty')}"> checked="checked"</c:if>>
                                <a target="_blank" href="https://github.com/wbotelhos/raty/">评星</a>
                            </label>
                            <label class="checkbox-inline">
                                <input name="plugins" type="checkbox" class="mgc" value="ueditor" <c:if
                                        test="${fn:contains(object.plugins, 'ueditor')}"> checked="checked"</c:if>> <a
                                    target="_blank" href="http://ueditor.baidu.com/website/">富文本编辑器</a>
                            </label>
                            <label class="checkbox-inline">
                                <input name="plugins" type="checkbox" class="mgc" value="highcharts" <c:if
                                        test="${fn:contains(object.plugins, 'highcharts')}"> checked="checked"</c:if>>
                                <a target="_blank" href="http://www.hcharts.cn">图表</a>
                            </label>
                            <label class="checkbox-inline">
                                <input name="plugins" type="checkbox" class="mgc" value="viewer" <c:if
                                        test="${fn:contains(object.plugins, 'viewer')}"> checked="checked"</c:if>> <a
                                    target="_blank" href="https://github.com/fengyuanchen/viewerjs">图片预览</a>
                            </label>
                            <label class="checkbox-inline">
                                <input name="plugins" type="checkbox" class="mgc" value="custom" <c:if
                                        test="${fn:contains(object.plugins, 'custom')}"> checked="checked"</c:if>>
                                子项目自定义CSS/JS
                            </label>
                            <label class="checkbox-inline">
                                <input name="plugins" type="checkbox" class="mgc" value="bootstrap-select" <c:if
                                        test="${fn:contains(object.plugins, 'bootstrap-select')}">
                                       checked="checked"</c:if>> <a target="_blank"
                                                                    href="http://silviomoreto.github.io/bootstrap-select/examples/#multiple-select-boxes">bootstrap-select</a>
                            </label>
                        </div>
                    </div>
                </div>
                <jd:lable id="path" col="1" lable="实体">
                    <textarea type="text" id="entity" name="entity" class="validate[required] form-control"
                              placeholder="com.apexedu.biz.entity.Test;com.apexedu.biz.entity.Test">${object.entity}</textarea>
                </jd:lable>
                <div class="col-sm-12 frame-btn-group">
                    <button class="btn btn-sm btn-success" type="button" onclick="tool.saveData(this)">
                        <font data-localize="">保存</font> <i class="fa fa-check"></i>
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>
<%@include file="../../common/plugins/js/select2.jsp" %>
<%@include file="../../common/input-bottom.jsp" %>
