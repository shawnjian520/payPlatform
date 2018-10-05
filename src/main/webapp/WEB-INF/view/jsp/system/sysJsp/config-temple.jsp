<%@page import="com.jd.util.ClientUtil" %>
<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="jd" uri="/WEB-INF/TLD/custom.tld" %>
<%
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + request.getContextPath();
    String _mainProjectUrl = ClientUtil.getString("node.main.url");
%>
<%@include file="../../common/input-header.jsp" %>
<%@include file="../../common/plugins/css/uploadify.jsp" %>
<%@include file="../../common/plugins/css/select2.jsp" %>
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
<form role="form" class="form-horizontal">
    <input type="hidden" name="wid" id="wid" value="${object.wid}"/>
    <input type="hidden" name="code" id="code" value='${object.code}'/>
    <input type="hidden" name="jscode" id="jscode" value='${object.jscode}'/>
    <input type="hidden" name="jscodeform" id="jscodeform" value='${object.jscodels}'/>
    <input type="hidden" name="externaljavascript" id="externaljavascript" value='${object.externaljavascript}'/>

    <div class="col-md-3">
        <jd:panel className="input-panel" title="组件列表">
            <div class="panel-group" id="accordion" role="tablist"
                 aria-multiselectable="true">
                <div class="panel panel-default hide">
                    <div class="panel-heading" role="tab" id="headingZero"
                         role="button" data-toggle="collapse" data-parent="#accordion"
                         href="#collapseZero" aria-expanded="true"
                         aria-controls="collapseZero">
                        <h4 class="panel-title">
                            <i class="fa fa-plus"></i> 公用页面
                        </h4>
                    </div>
                    <div id="collapseZero" class="panel-collapse collapse in"
                         role="tabpanel" aria-labelledby="headingZero">
                        <div class="panel-body">
                            <ul>
                                <li data-temple-index="0">列表页头部</li>
                                <li data-temple-index="1">列表页底部</li>
                                <li data-temple-index="2">详情页头部</li>
                                <li data-temple-index="3">详情页底部</li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading" role="tab" id="headingOne"
                         role="button" data-toggle="collapse" data-parent="#accordion"
                         href="#collapseOne" aria-expanded="true"
                         aria-controls="collapseOne">
                        <h4 class="panel-title">
                            <i class="fa fa-plus"></i> <font data-localize="">分组</font>
                        </h4>
                    </div>
                    <div id="collapseOne" class="panel-collapse collapse in"
                         role="tabpanel" aria-labelledby="headingOne">
                        <div class="panel-body">
                            <ul>
                                <li data-temple-index="4">普通分组</li>
                                <li data-temple-index="5">input数据分组</li>
                                <li data-temple-index="6">panel</li>
                                <li data-temple-index="36">条件分组</li>
                                <li data-temple-index="54">input按钮分组</li>
                                <li data-temple-index="56">粘贴复制分组、表格</li>
                                <li data-temple-index="87">导入jsp页面</li>
                                <li data-temple-index="89">导入Excel页面</li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading" role="tab" id="headingTwo"
                         class="panel-title" class="collapsed" role="button"
                         data-toggle="collapse" data-parent="#accordion"
                         href="#collapseTwo" aria-expanded="false"
                         aria-controls="collapseTwo">
                        <h4 class="panel-title">
                            <i class="fa fa-plus"></i> <font data-localize="">表单元素</font>
                        </h4>
                    </div>
                    <div id="collapseTwo" class="panel-collapse collapse"
                         role="tabpanel" aria-labelledby="headingTwo">
                        <div class="panel-body">
                            <ul>
                                <li data-temple-index="7">表格</li>
                                <li data-temple-index="8">输入框</li>
                                <li data-temple-index="81">显示文本</li>
                                <li data-temple-index="76">数字范围</li>
                                <li data-temple-index="45">文本域</li>
                                <li data-temple-index="9">时间插件</li>
                                <li data-temple-index="77">日期范围</li>
                                <li data-temple-index="10">隐藏文本框</li>
                                <li data-temple-index="11">字典下拉</li>
                                <li data-temple-index="12">后台返回list下拉</li>
                                <li data-temple-index="93">后台返回list多选下拉</li>
                                <li data-temple-index="13">指定表以及字段下拉</li>
                                <li data-temple-index="14">ajax下拉</li>
                                <li data-temple-index="15">带搜索的ajax下拉</li>
                                <li data-temple-index="16">后台返回list多选框</li>
                                <li data-temple-index="17">后台返回list单选框</li>
                                <li data-temple-index="37">分页条数</li>
                                <li data-temple-index="38">分页</li>
                                <li data-temple-index="46">线条</li>
                                <li data-temple-index="43">文本</li>
                                <li data-temple-index="83">图片</li>
                                <li data-temple-index="85">星级评分</li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading" role="tab" id="heading6"
                         class="panel-title" class="collapsed" role="button"
                         data-toggle="collapse" data-parent="#accordion"
                         href="#collapse6" aria-expanded="false"
                         aria-controls="collapse6">
                        <h4 class="panel-title">
                            <i class="fa fa-plus"></i> <font data-localize="">数据比对</font>
                        </h4>
                    </div>
                    <div id="collapse6" class="panel-collapse collapse"
                         role="tabpanel" aria-labelledby="heading6">
                        <div class="panel-body">
                            <ul>
                                <li data-temple-index="61">输入框</li>
                                <li data-temple-index="62">文本域</li>
                                <li data-temple-index="63">时间插件</li>
                                <li data-temple-index="64" class="hide">隐藏文本框</li>
                                <li data-temple-index="65">字典下拉</li>
                                <li data-temple-index="66">后台返回list下拉</li>
                                <li data-temple-index="67">指定表以及字段下拉</li>
                                <li data-temple-index="68">ajax下拉</li>
                                <li data-temple-index="69">带搜索的ajax下拉</li>
                                <li data-temple-index="70">后台返回list多选框</li>
                                <li data-temple-index="71">后台返回list单选框</li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading" role="tab" id="headingSix"
                         class="panel-title" class="collapsed" role="button"
                         data-toggle="collapse" data-parent="#accordion"
                         href="#collapseSix" aria-expanded="false"
                         aria-controls="collapseSix">
                        <h4 class="panel-title">
                            <i class="fa fa-plus"></i> <font data-localize="">可编辑表格</font>
                        </h4>
                    </div>
                    <div id="collapseSix" class="panel-collapse collapse"
                         role="tabpanel" aria-labelledby="headingSix">
                        <div class="panel-body">
                            <ul>
                                <li data-temple-index="41">可编辑表格</li>
                                <li data-temple-index="47">输入框</li>
                                <li data-temple-index="48">时间插件</li>
                                <li data-temple-index="49">字典下拉</li>
                                <li data-temple-index="50">指定表以及字段下拉</li>
                                <li data-temple-index="51">ajax下拉</li>
                                <li data-temple-index="86">文本域</li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading" role="tab" id="headingThree"
                         class="collapsed" role="button" data-toggle="collapse"
                         data-parent="#accordion" href="#collapseThree"
                         aria-expanded="false" aria-controls="collapseThree">
                        <h4 class="panel-title">
                            <i class="fa fa-plus"></i> <font data-localize="">按钮</font>
                        </h4>
                    </div>
                    <div id="collapseThree" class="panel-collapse collapse"
                         role="tabpanel" aria-labelledby="headingThree">
                        <div class="panel-body">
                            <ul>
                                <li data-temple-index="18">按钮</li>
                                <li data-temple-index="19">新增</li>
                                <li data-temple-index="20">删除</li>
                                <li data-temple-index="21">修改</li>
                                <li data-temple-index="22">保存</li>
                                <li data-temple-index="34">暂存</li>
                                <li data-temple-index="23">上报</li>
                                <li data-temple-index="92">按钮下拉</li>
                                <li data-temple-index="91">存为书签</li>
                                <li data-temple-index="24">审核通过</li>
                                <li data-temple-index="25">审核退回</li>
                                <li data-temple-index="26">审核通过并上报</li>
                                <li data-temple-index="27">取消（将数据退回到草稿状态）</li>
                                <li data-temple-index="33">作废（数据不可再使用流程）</li>
                                <li data-temple-index="32">导入</li>
                                <li data-temple-index="28">导出</li>
                                <li data-temple-index="29">打印报表</li>
                                <li data-temple-index="30">查询</li>
                                <li data-temple-index="31">重置</li>
                                <li data-temple-index="78">显示更多查询条件</li>
                                <li data-temple-index="55">打开指定url模态框</li>
                                <li data-temple-index="59">打开指定id模态框</li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading" role="tab" id="headingFour"
                         class="collapsed" role="button" data-toggle="collapse"
                         data-parent="#accordion" href="#collapseFour"
                         aria-expanded="false" aria-controls="collapseFour">
                        <h4 class="panel-title">
                            <i class="fa fa-plus"></i> <font data-localize="">组件</font>
                        </h4>
                    </div>
                    <div id="collapseFour" class="panel-collapse collapse"
                         role="tabpanel" aria-labelledby="headingFour">
                        <div class="panel-body">
                            <ul>
                                <li data-temple-index="40">文件上传</li>
                                <li data-temple-index="73">多附件上传</li>
                                <li data-temple-index="42">图片上传</li>
                                <li data-temple-index="72">多图片上传</li>
                                <li data-temple-index="80">多视频上传</li>
                                <li data-temple-index="82">图片截取上传</li>
                                <li data-temple-index="44">input操作记录</li>
                                <li data-temple-index="52">指定链接Tab页</li>
                                <li data-temple-index="75">静态Tab页</li>
                                <li data-temple-index="53">List汇总信息</li>
                                <li data-temple-index="84">ztree</li>
                                <li data-temple-index="57">模态框</li>
                                <li data-temple-index="58">自定义模态框</li>
                                <li data-temple-index="60">文本编辑器</li>
                                <li data-temple-index="74">向导式表单</li>
                                <li data-temple-index="79">身份证上传</li>
                                <li data-temple-index="88">图表</li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading" role="tab" id="headingFi"
                         class="collapsed" role="button" data-toggle="collapse"
                         data-parent="#accordion" href="#collapseFi" aria-expanded="false"
                         aria-controls="collapseFi">
                        <h4 class="panel-title">
                            <i class="fa fa-plus"></i> <font data-localize="">模板</font>
                        </h4>
                    </div>
                    <div id="collapseFi" class="panel-collapse collapse"
                         role="tabpanel" aria-labelledby="collapseFi">
                        <div class="panel-body">
                            <ul>
                                <li data-temple-index="39">list模板</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </jd:panel>
    </div>
    <div class="col-md-9">
        <div class="panel panel-white panel-tabs">
            <div class="panel-heading">

                <h4 class="panel-title" id="common-jsp">
                    <button class="btn btn-sm btn-success" type="button"
                            onclick="subPage.saveData(this)" style="margin-top: -6px;">
                        <font data-localize="">保存</font> <i class="fa fa-check"></i>
                    </button>
                </h4>
            </div>
            <div class="panel-body">
                <div class="tabbable">
                    <ul class="nav nav-tabs">
                        <li class="active"><a data-toggle="tab" href="#panel_tab_example1"> <font
                                data-localize="">预览 </font></a></li>
                        <li><a data-toggle="tab" href="#code-mirror-html"> <font data-localize="">代码</font> </a></li>
                        <li><a data-toggle="tab" href="#code-mirror-js">JavaScript </a></li>
                        <li><a data-toggle="tab" href="#code-mirror-js-form">JavaScript(放入form内的) </a></li>
                        <li><a data-toggle="tab" href="#code-mirror-external-js"><font
                                data-localize="">引入外部资源 </font></a></li>
                    </ul>
                    <div class="tab-content">
                        <div id="panel_tab_example1" class="tab-pane fade in active">
                            <div class="row">
                                <div class="col-xs-12">
                                    <button class="btn btn-sm btn-success" type="button"
                                            onclick="editElement(this,'edit-element')" data-localize="">编辑元素
                                    </button>
                                    <button class="btn btn-sm btn-success" type="button"
                                            onclick="editElement(this,'layout')" data-localize="">编辑布局
                                    </button>
                                    <button class="btn btn-sm btn-success" type="button"
                                            onclick="removeElement(this)" data-localize="">显示预览
                                    </button>
                                </div>
                                <div id="preview" class="col-xs-12 mt20" style="height:400px;overflow:auto;"></div>
                            </div>
                        </div>
                        <div id="code-mirror-html" class="tab-pane fade">
                            <div class="col-xs-12 p0">
                                <button class="btn btn-sm btn-success mb5" type="button"
                                        onclick="autoFormatSelection()" data-localize="">格式化代码
                                </button>
                                <textarea></textarea>
                            </div>
                        </div>
                        <div id="code-mirror-js" class="tab-pane fade">
                            <textarea></textarea>
                        </div>
                        <div id="code-mirror-js-form" class="tab-pane fade">
                            <textarea></textarea>
                        </div>
                        <div id="code-mirror-external-js" class="tab-pane fade">
                            <textarea></textarea>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>
<div id="modal-dialog" class="hide">
    <form class="form-horizontal">
        <div class="row">
            <div class="col-xxxl-3 col-md-4 col-sm-6 col-xs-12 style">
                <div class="form-group">
                    <label title="类型" class="col-sm-3 control-label ell" for="style"><font
                            data-localize="">类型</font>：</label>
                    <div class="col-sm-9">
                        <select id="style" class="select2-delay-init"></select>
                    </div>
                </div>
            </div>
            <div class="col-xxxl-3 col-md-4 col-sm-6 col-xs-12 group-genus">
                <div class="form-group">
                    <label title="所属分组" class="col-sm-3 control-label ell"
                           for="group-genus"><font data-localize="">所属分组</font>：</label>
                    <div class="col-sm-9">
                        <select id="group-genus" class="select2-delay-init"></select>
                    </div>
                </div>
            </div>
            <div class="col-xxxl-3 col-md-4 col-sm-6 col-xs-12 group-name">
                <div class="form-group">
                    <label title="分组名称"
                           class="col-sm-3 control-label ell validate[required]"
                           for="group-name"><font data-localize="">分组名称</font>：</label>
                    <div class="col-sm-9">
                        <input type="text" id="group-name" class="form-control"> <span
                            class="symbol required"></span>
                    </div>
                </div>
            </div>
            <div class="col-xxxl-3 col-md-4 col-sm-6 col-xs-12 title">
                <div class="form-group">
                    <label title="标题" class="col-sm-3 control-label ell" for="title"><font
                            data-localize="">标题</font>：</label>
                    <div class="col-sm-9">
                        <input type="text" id="title" class="form-control"> <span
                            class="symbol required"></span>
                    </div>
                </div>
            </div>
            <div class="col-xxxl-3 col-md-4 col-sm-6 col-xs-12 order">
                <div class="form-group">
                    <label title="排序值" class="col-sm-3 control-label ell" for="order"><font data-localize="">排序值</font>：</label>
                    <div class="col-sm-9">
                        <input type="text" id="order" class="form-control"> <span
                            class="symbol required"></span>
                    </div>
                </div>
            </div>
            <div class="col-xxxl-3 col-md-4 col-sm-6 col-xs-12 class">
                <div class="form-group">
                    <label title="class" class="col-sm-3 control-label ell" for="class">class：</label>
                    <div class="col-sm-9">
                        <input type="text" id="class" class="form-control">
                    </div>
                </div>
            </div>
            <div class="col-xxxl-3 col-md-4 col-sm-6 col-xs-12 data-custom-class">
                <div class="form-group">
                    <label title="自定义class" class="col-sm-3 control-label ell" for="data-custom-class"><font
                            data-localize="">自定义class</font>：</label>
                    <div class="col-sm-9">
                        <input type="text" id="data-custom-class" class="form-control">
                    </div>
                </div>
            </div>
            <div class="col-xxxl-3 col-md-4 col-sm-6 col-xs-12 width">
                <div class="form-group">
                    <label title="宽度" class="col-sm-3 control-label ell" for="width"><font
                            data-localize="">宽度</font>：</label>
                    <div class="col-sm-9">
                        <select id="width" class="select2-delay-init">
                            <option value="col-xs-12">12</option>
                            <option value="col-xs-11">11</option>
                            <option value="col-xs-10">10</option>
                            <option value="col-xs-9">9</option>
                            <option value="col-xs-8">8</option>
                            <option value="col-xs-7">7</option>
                            <option value="col-xs-6">6</option>
                            <option value="col-xs-5">5</option>
                            <option value="col-xs-4">4</option>
                            <option value="col-xs-3">3</option>
                            <option value="col-xs-2">2</option>
                            <option value="col-xs-1">1</option>
                        </select>
                    </div>
                </div>
            </div>
            <%--            <div class="col-xxxl-3 col-md-4 col-sm-6 col-xs-12 element-id">--%>
            <%--                <div class="form-group">--%>
            <%--                    <label title="id" class="col-sm-3 control-label ell"--%>
            <%--                           for="element-id">id：</label>--%>
            <%--                    <div class="col-sm-9">--%>
            <%--                        <input type="text" id="element-id" class="form-control">--%>
            <%--                    </div>--%>
            <%--                </div>--%>
            <%--            </div>--%>
            <div class="col-xxxl-3 col-md-4 col-sm-6 col-xs-12 element-id">
                <div class="form-group">
                    <label title="id" class="col-sm-3 control-label ell"
                           for="element-id">id：</label>
                    <div class="col-sm-5">
                        <select type="text" id="element-id" data-show-searchbox="true" class="form-control">
                            <option value="" data-localize="">手动输入</option>
                            <c:forEach items="${entitypros }" var="obj">
                                <option value="${obj.id }">${obj.caption }</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="col-sm-4">
                        <input type="text" id="element-id-1" class="form-control">
                    </div>
                </div>
            </div>
            <div class="col-xxxl-3 col-md-4 col-sm-6 col-xs-12 element-name">
                <div class="form-group">
                    <label title="name" class="col-sm-3 control-label ell"
                           for="element-name">name：</label>
                    <div class="col-sm-9">
                        <input type="text" id="element-name" class="form-control">
                    </div>
                </div>
            </div>
            <div class="col-xxxl-3 col-md-4 col-sm-6 col-xs-12 zdlb">
                <div class="form-group">
                    <label title="字典类别" class="col-sm-3 control-label ell" for="zdlb"><font data-localize="">字典类别</font>：</label>
                    <div class="col-sm-9">
                        <select id="zdlb" class="select2 select2-delay-init" >
                            <c:forEach items="${zdlbs }" var="obj">
                                <option value="${obj.id }">${obj.caption }</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
            </div>
            <div class="col-xxxl-3 col-md-4 col-sm-6 col-xs-12 format">
                <div class="form-group">
                    <label title="日期格式" class="col-sm-3 control-label ell" for="format"><font
                            data-localize="">日期格式</font>：</label>
                    <div class="col-sm-9">
                        <select id="format" class="select2-delay-init">
                            <option value="YYYY-MM-DD HH:mm:ss">YYYY-MM-DD HH:mm:ss</option>
                            <option value="YYYY-MM-DD HH:mm">YYYY-MM-DD HH:mm</option>
                            <option value="YYYY-MM-DD">YYYY-MM-DD</option>
                            <option value="YYYY-MM">YYYY-MM</option>
                            <option value="YYYY">YYYY</option>
                            <option value="HH:mm:ss">HH:mm:ss</option>
                            <option value="HH:mm">HH:mm</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="col-xxxl-3 col-md-4 col-sm-6 col-xs-12 min-date">
                <div class="form-group">
                    <label title="min-date" class="col-sm-3 control-label ell"
                           for="min-date"><font data-localize="">最小日期</font>：</label>
                    <div class="col-sm-9">
                        <input type="text" id="min-date" class="form-control"
                               placeholder="示例: <%="${object.minDate}"%>">
                    </div>
                </div>
            </div>
            <div class="col-xxxl-3 col-md-4 col-sm-6 col-xs-12 max-date">
                <div class="form-group">
                    <label title="max-date" class="col-sm-3 control-label ell"
                           for="max-date"><font data-localize="">最大日期</font>：</label>
                    <div class="col-sm-9">
                        <input type="text" id="max-date" class="form-control"
                               placeholder="示例: <%="${object.maxDate}"%>">
                    </div>
                </div>
            </div>
            <div class="col-xxxl-3 col-md-4 col-sm-6 col-xs-12 method">
                <div class="form-group">
                    <label title="method" class="col-sm-3 control-label ell"
                           for="method"><font data-localize="">提交方式</font>：</label>
                    <div class="col-sm-9">
                        <select id="method" class="select2-delay-init">
                            <option value="post">post</option>
                            <option value="get">get</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="col-xxxl-3 col-md-4 col-sm-6 col-xs-12 element-value">
                <div class="form-group">
                    <label title="value" class="col-sm-3 control-label ell"
                           for="element-value">value：</label>
                    <div class="col-sm-9">
                        <input type="text" id="element-value" value="object."
                               class="form-control">
                    </div>
                </div>
            </div>
            <div class="col-xxxl-3 col-md-4 col-sm-6 col-xs-12 dataComparison">
                <div class="form-group">
                    <label title="比对信息对象" class="col-sm-3 control-label ell"
                           for="element-value"><font data-localize="">比对信息对象</font>：</label>
                    <div class="col-sm-9">
                        <input type="text" id="dataComparison" value="" class="form-control"
                               placeholder="示例：object2.name">
                    </div>
                </div>
            </div>
            <div class="col-xxxl-3 col-md-4 col-sm-6 col-xs-12 default-text">
                <div class="form-group">
                    <label title="默认显示文字" class="col-sm-3 control-label ell"
                           for="default-text"><font data-localize="">默认显示文字</font>：</label>
                    <div class="col-sm-9">
                        <input type="text" id="default-text" class="form-control">
                    </div>
                </div>
            </div>
            <div class="col-xxxl-3 col-md-4 col-sm-6 col-xs-12 element-type">
                <div class="form-group">
                    <label title="type" class="col-sm-3 control-label ell"
                           for="element-type">type：</label>
                    <div class="col-sm-9">
                        <input type="text" id="element-type" class="form-control">
                    </div>
                </div>
            </div>
            <div class="col-xxxl-3 col-md-4 col-sm-6 col-xs-12 table-name">
                <div class="form-group">
                    <label title="表名" class="col-sm-3 control-label ell"
                           for="table-name"><font data-localize="">表名</font>：</label>
                    <div class="col-sm-9">
                        <input type="text" id="table-name" class="form-control">
                    </div>
                </div>
            </div>
            <div class="col-xxxl-3 col-md-4 col-sm-6 col-xs-12 select-key">
                <div class="form-group">
                    <label title="select-value" class="col-sm-3 control-label ell"
                           for="select-key">select-value：</label>
                    <div class="col-sm-9">
                        <input type="text" id="select-key" class="form-control">
                    </div>
                </div>
            </div>
            <div class="col-xxxl-3 col-md-4 col-sm-6 col-xs-12 select-text">
                <div class="form-group">
                    <label title="select-text" class="col-sm-3 control-label ell"
                           for="select-text">select-text：</label>
                    <div class="col-sm-9">
                        <input type="text" id="select-text" class="form-control">
                    </div>
                </div>
            </div>
            <div class="col-xxxl-3 col-md-4 col-sm-6 col-xs-12 field-up-id">
                <div class="form-group">
                    <label title="上级字段名称" class="col-sm-3 control-label ell"
                           for="field-up-id"><font data-localize="">上级字段名称</font>：</label>
                    <div class="col-sm-9">
                        <input type="text" id="field-up-id" class="form-control">
                    </div>
                </div>
            </div>
            <div class="col-xxxl-3 col-md-4 col-sm-6 col-xs-12 field-up-val">
                <div class="form-group">
                    <label title="上级字段值" class="col-sm-3 control-label ell"
                           for="field-up-val"><font data-localize="">上级字段值</font>：</label>
                    <div class="col-sm-9">
                        <input type="text" id="field-up-val" class="form-control">
                    </div>
                </div>
            </div>
            <div class="col-xxxl-3 col-md-4 col-sm-6 col-xs-12 data-cur-val">
                <div class="form-group">
                    <label title="上下级关联字段名" class="col-sm-3 control-label ell"
                           for="data-cur-val"><font data-localize="">上下级关联字段名</font>：</label>
                    <div class="col-sm-9">
                        <input type="text" id="data-cur-val" class="form-control">
                    </div>
                </div>
            </div>
            <div class="col-xxxl-3 col-md-4 col-sm-6 col-xs-12 file-query">
                <div class="form-group">
                    <label title="过滤字段名" class="col-sm-3 control-label ell"
                           for="file-query"><font data-localize="">过滤字段名</font>：</label>
                    <div class="col-sm-9">
                        <input type="text" id="file-query" class="form-control">
                    </div>
                </div>
            </div>
            <div class="col-xxxl-3 col-md-4 col-sm-6 col-xs-12 query-val">
                <div class="form-group">
                    <label title="过滤字段值" class="col-sm-3 control-label ell" for="query-val"><font
                            data-localize="">过滤字段值</font>：</label>
                    <div class="col-sm-9">
                        <input type="text" id="query-val" class="form-control">
                    </div>
                </div>
            </div>
            <div class="col-xxxl-3 col-md-4 col-sm-6 col-xs-12 otherQuery">
                <div class="form-group">
                    <label title="其他条件" class="col-sm-3 control-label ell"
                           for="otherQuery"><font data-localize=""></font>其他条件：</label>
                    <div class="col-sm-9">
                        <input type="text" id="otherQuery" class="form-control">
                    </div>
                </div>
            </div>
            <div class="col-xxxl-3 col-md-4 col-sm-6 col-xs-12 data-order-field">
                <div class="form-group">
                    <label title="排序字段" class="col-sm-3 control-label ell"
                           for="data-order-field"><font data-localize="">排序字段</font>：</label>
                    <div class="col-sm-9">
                        <input type="text" id="data-order-field" class="form-control">
                    </div>
                </div>
            </div>
            <div class="col-xxxl-3 col-md-4 col-sm-6 col-xs-12 data-order-type">
                <div class="form-group">
                    <label title="排序方式" class="col-sm-3 control-label ell"
                           for="data-order-type"><font data-localize="">排序方式</font>：</label>
                    <div class="col-sm-9">
                        <input type="text" id="data-order-type" class="form-control">
                    </div>
                </div>
            </div>
            <div class="col-xxxl-3 col-md-4 col-sm-6 col-xs-12 data-childselect">
                <div class="form-group">
                    <label title="子下拉" class="col-sm-3 control-label ell"
                           for="data-childselect"><font data-localize="">子下拉</font>：</label>
                    <div class="col-sm-9">
                        <input type="text" id="data-childselect" class="form-control">
                    </div>
                </div>
            </div>
            <div class="col-xxxl-3 col-md-4 col-sm-6 col-xs-12 items">
                <div class="form-group">
                    <label title="items" class="col-sm-3 control-label ell" for="items">items：</label>
                    <div class="col-sm-9">
                        <input type="text" id="items" class="form-control">
                    </div>
                </div>
            </div>
            <div class="col-xxxl-3 col-md-4 col-sm-6 col-xs-12 maxDatalength">
                <div class="form-group">
                    <label title="最大行" class="col-sm-3 control-label ell" for="maxDatalength">最大行：</label>
                    <div class="col-sm-9">
                        <input type="text" id="maxDatalength" class="form-control">
                    </div>
                </div>
            </div>
            <div class="col-xxxl-3 col-md-4 col-sm-6 col-xs-12 list-key">
                <div class="form-group">
                    <label title="list-key" class="col-sm-3 control-label ell"
                           for="list-key">list-key：</label> <label title="list-key"
                                                                   class="col-sm-4 control-label ell" for="list-key">
                    items_object. </label>
                    <div class="col-sm-5">
                        <input type="text" id="list-key" class="form-control">
                    </div>
                </div>
            </div>
            <div class="col-xxxl-3 col-md-4 col-sm-6 col-xs-12 list-value">
                <div class="form-group">
                    <label title="list-value" class="col-sm-3 control-label ell"
                           for="list-value">list-value：</label> <label title="list-key"
                                                                       class="col-sm-4 control-label ell"
                                                                       for="list-key">
                    items_object. </label>
                    <div class="col-sm-5">
                        <input type="text" id="list-value" class="form-control">
                    </div>
                </div>
            </div>
            <div class="col-xxxl-3 col-md-8 col-sm-6 col-xs-12 url">
                <div class="form-group">
                    <label title="url" class="col-sm-1 control-label ell" for="url">url：</label>
                    <label title="url" class="col-sm-4 control-label ell" for="url">
                        <%="<%=basePath %\>/s/"%>
                    </label>
                    <div class="col-sm-7">
                        <input type="text" id="url" class="form-control">
                    </div>
                </div>
            </div>
            <div class="col-xxxl-3 col-md-4 col-sm-6 col-xs-12 iframe">
                <div class="form-group">
                    <label title="iframe" class="col-sm-3 control-label ell" for="iframe">iframe：</label>
                    <div class="col-sm-9">
                        <select id="iframe" class="form-control select2-delay-init">
                            <option value="true" data-localize="">是</option>
                            <option value="false" data-localize="">否</option>
                        </select>
                    </div>
                </div>
            </div>


            <div class="col-xxxl-3 col-md-8 col-sm-6 col-xs-12 src">
                <div class="form-group">
                    <label title="src" class="col-sm-1 control-label ell" for="src">src：</label>
                    <label title="src" class="col-sm-4 control-label ell" for="src">
                        <%="<%=basePath %\>/"%>
                    </label>
                    <div class="col-sm-7">
                        <input type="text" id="src" class="form-control">
                    </div>
                </div>
            </div>

            <div class="col-xxxl-3 col-md-4 col-sm-6 col-xs-12 checkbox-id">
                <div class="form-group">
                    <label title="checkbox-id" class="col-sm-3 control-label ell"
                           for="checkbox-id">checkbox-id：</label>
                    <div class="col-sm-9">
                        <div class="row">
                            <label title="list-key" class="col-sm-4 control-label ell"
                                   for="checkbox-id"> object. </label>
                            <div class="col-sm-8">
                                <input type="text" id="checkbox-id" class="form-control">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xxxl-3 col-md-8 col-sm-6 col-xs-12 checkbox-url">
                <div class="form-group">
                    <label title="checkbox-url" class="col-sm-2 control-label ell"
                           for="checkbox-url"><font data-localize="">tr点击url</font>：</label>
                    <div class="col-sm-10">
                        <div class="row">
                            <label title="list-key" class="col-sm-4 control-label ell"
                                   for="checkbox-id"> <\%=basePath %>/s/ </label>
                            <div class="col-sm-8">
                                <input type="text" id="checkbox-url" class="form-control">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xxxl-3 col-md-4 col-sm-6 col-xs-12 in-color">
                <div class="form-group">
                    <label title="in-color" class="col-sm-3 control-label ell"
                           for="in-color"><font data-localize="">颜色</font>：</label>
                    <div class="col-sm-9">
                        <select id="in-color" class="form-control select2-delay-init">
                            <option value="alert-success" data-localize="">绿色</option>
                            <option value="alert-info" data-localize="">蓝色</option>
                            <option value="alert-warning" data-localize="">黄色</option>
                            <option value="alert-danger" data-localize="">红色</option>
                            <option value="alert-success b" data-localize="">绿色加粗</option>
                            <option value="alert-info b" data-localize="">蓝色加粗</option>
                            <option value="alert-warning b" data-localize="">黄色加粗</option>
                            <option value="alert-danger b" data-localize="">红色加粗</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="col-xxxl-3 col-md-4 col-sm-6 col-xs-12 in-wb-color">
                <div class="form-group">
                    <label title="in-wb-color" class="col-sm-3 control-label ell"
                           for="in-wb-color"><font data-localize="">颜色</font>：</label>
                    <div class="col-sm-9">
                        <select id="in-wb-color" class="form-control select2-delay-init">
                            <option value="green;" data-localize="">绿色</option>
                            <option value="blue;" data-localize="">蓝色</option>
                            <option value="yellow;" data-localize="">黄色</option>
                            <option value="red;" data-localize="">红色</option>
                            <option value="green;font-weight:bold;" data-localize="">绿色加粗</option>
                            <option value="blue;font-weight:bold;" data-localize="">蓝色加粗</option>
                            <option value="yellow;font-weight:bold;" data-localize="">黄色加粗</option>
                            <option value="red;font-weight:bold;" data-localize="">红色加粗</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="col-xxxl-3 col-md-12 col-sm-6 col-xs-12 label-box">
                <div class="form-group">
                    <label title="文本" class="col-sm-1 control-label ell"
                           for="label-box"><font data-localize="">文本</font>：</label>
                    <div class="col-sm-11">
                        <input type="text" id="label-box" class="form-control">
                    </div>
                </div>
            </div>
            <div class="col-xxxl-3 col-md-4 col-sm-6 col-xs-12 is-his">
                <div class="form-group">
                    <label title="缩放" class="col-sm-3 control-label ell"
                           for="label-box"><font data-localize="">缩放</font>：</label>
                    <div class="col-sm-9">
                        <select id="is-his" class="form-control select2-delay-init">
                            <option value="false" data-localize="">否</option>
                            <option value="true" data-localize="">是</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="col-xxxl-3 col-md-4 col-sm-6 col-xs-12 placeholder">
                <div class="form-group">
                    <label title="提示" class="col-sm-3 control-label ell"
                           for="placeholder"><font data-localize="">提示</font>：</label>
                    <div class="col-sm-9">
                        <input type="text" id="placeholder" class="form-control">
                    </div>
                </div>
            </div>

            <div class="col-xxxl-3 col-md-4 col-sm-6 col-xs-12 jsppath">
                <div class="form-group">
                    <label title="页面地址" class="col-sm-3 control-label ell"
                           for="jsppath"><font data-localize="">页面地址</font>：</label>
                    <div class="col-sm-9">
                        <input type="text" id="jsppath" class="form-control">
                    </div>
                </div>
            </div>

            <div class="col-xxxl-3 col-md-4 col-sm-6 col-xs-12 ratyCount">
                <div class="form-group">
                    <label title="初始星星数" class="col-sm-3 control-label ell"
                           for="ratyCount"><font data-localize="">初始星星数</font>：</label>
                    <div class="col-sm-9">
                        <input type="text" placeholder="示例：只支持1-5。如 1,2,1.5,2.5等" id="ratyCount" class="form-control">
                    </div>
                </div>
            </div>


            <div class="col-xxxl-3 col-md-4 col-sm-6 col-xs-12 excel">
                <label title="选择文件" class="col-sm-3 control-label ell" for="placeholder"><font
                        data-localize="">选择文件</font></label>
                <div class="col-sm-9">
                    <textarea style="display: none;" id="excelhtml"></textarea>
                    <input type="file" data-filelength="" id="upload">
                    <script>
                        $(function () {
                            tool.initFileUpload("#upload", null, null, true, "", "", null, function (file, data, response) {
                                data = data.replace("\\", "");
                                data = data.replace("\\", "/");
                                data = eval("(" + data + ")");
                                var excelPath = data.filePath;
                                $.post(tool.initParams('<%=basePath%>/s/biz/sysJsp/formatEcel'), {excelPath: excelPath}, function (result) {
                                    if (result == "false") {
                                        console.log("excel转换失败");
                                    } else {
                                        $("#excelhtml").val(result);
                                    }
                                });
                            }, null, null, '_queue');
                        });
                    </script>
                    <div id="_queue">
                    </div>
                </div>
            </div>
            <div class="col-xxxl-3 col-md-4 col-sm-6 col-xs-12 btn-size">
                <div class="form-group">
                    <label title="按钮大小" class="col-sm-3 control-label ell"
                           for="btn-size"><font data-localize="">按钮大小</font>：</label>
                    <div class="col-sm-9">
                        <select id="btn-size" class="select2-delay-init">
                            <option value="btn btn-lg" data-localize="">宽度：自动 高度：45px</option>
                            <option value="btn" data-localize="">宽度：自动 高度：34px</option>
                            <option value="btn btn-sm" selected data-localize="">宽度：自动 高度：30px</option>
                            <option value="btn btn-xs" data-localize="">宽度：自动 高度：22px</option>
                            <option value="btn btn-lg btn-block" data-localize="">宽度：100% 高度：45px</option>
                            <option value="btn btn-block" data-localize="">宽度：100% 高度：34px</option>
                            <option value="btn btn-sm btn-block" data-localize="">宽度：100% 高度：30px</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="col-xxxl-3 col-md-4 col-sm-6 col-xs-12 btn-style">
                <div class="form-group">
                    <label title="按钮样式" class="col-sm-3 control-label ell"
                           for="btn-style"><font data-localize="">按钮样式</font>：</label>
                    <div class="col-sm-9">
                        <select id="btn-style" class="select2-delay-init">
                            <option value="btn-success" data-localize="">绿色</option>
                            <option value="btn-default" data-localize="">白色</option>
                            <option value="btn-primary" data-localize="">蓝色</option>
                            <option value="btn-warning" data-localize="">橙色</option>
                            <option value="btn-danger" data-localize="">红色</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="col-xxxl-3 col-md-4 col-sm-6 col-xs-12 icon">
                <div class="form-group">
                    <label title="图标" class="col-sm-3 control-label ell" for="icon"><font
                            data-localize="">图标</font>：</label>
                    <div class="col-sm-9">
                        <div class="input-group">
                            <input type="text" id="icon" class="form-control"> <a
                                id="icon-btn" class="input-group-addon poi chose-icon"
                                href="<%=basePath%>/s/biz/sysJsp/icon" target="_blank" data-localize="">选择</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xxxl-3 col-md-8 col-sm-6 col-xs-12 event-click">
                <div class="form-group">
                    <label title="点击事件" class="col-sm-2 control-label ell"
                           for="event-click"><font data-localize="">点击事件</font>：</label>
                    <div class="col-sm-10">
                        <input type="text" id="event-click" class="form-control" placeholder="sample()">
                    </div>
                </div>
            </div>
            <div class="col-xxxl-3 col-md-4 col-sm-6 col-xs-12 if-test">
                <div class="form-group">
                    <label title="条件" class="col-sm-3 control-label ell"
                           for="if-test"><font data-localize="">条件</font>：</label>
                    <div class="col-sm-9">
                        <div class="row">
                            <label title="list-key" class="col-sm-4 control-label ell"
                                   for="checkbox-id"> c:if test="$\{</label>
                            <div class="col-sm-8">
                                <input type="text" id="if-test" class="form-control">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xxxl-3 col-md-4 col-sm-6 col-xs-12 file-name">
                <div class="form-group">
                    <label title="文件名称" class="col-sm-3 control-label ell"
                           for="file-name"><font data-localize="">文件名称</font>：</label>
                    <div class="col-sm-9">
                        <input type="text" id="file-name" class="form-control">
                    </div>
                </div>
            </div>
            <div class="col-xxxl-3 col-md-4 col-sm-6 col-xs-12 file-value">
                <div class="form-group">
                    <label title="名称value" class="col-sm-3 control-label ell"
                           for="file-value"><font data-localize="">名称value</font>：</label>
                    <div class="col-sm-9">
                        <input type="text" value="object." id="file-value" class="form-control">
                    </div>
                </div>
            </div>

            <div class="col-xxxl-3 col-md-4 col-sm-6 col-xs-12 file-size">
                <div class="form-group">
                    <label title="上传文件数" class="col-sm-3 control-label ell"
                           for="file-size"><font data-localize="">上传文件数</font>：</label>
                    <div class="col-sm-9">
                        <input type="text" id="file-size" class="form-control">
                    </div>
                </div>
            </div>
            <div class="col-xxxl-3 col-md-4 col-sm-6 col-xs-12 file-length">
                <div class="form-group">
                    <label title="文件最大限制" class="col-sm-3 control-label ell"
                           for="file-length"><font data-localize="">文件最大限制</font>：</label>
                    <div class="col-sm-9">
                        <input type="text" id="file-length" class="form-control">
                    </div>
                </div>
            </div>
            <div class="col-xxxl-3 col-md-4 col-sm-6 col-xs-12 file-width">
                <div class="form-group">
                    <label title="图片显示宽度" class="col-sm-3 control-label ell"
                           for="file-width"><font data-localize="">图片显示宽度</font>：</label>
                    <div class="col-sm-9">
                        <input type="text" id="file-width" class="form-control">
                    </div>
                </div>
            </div>
            <div class="col-xxxl-3 col-md-4 col-sm-6 col-xs-12 file-height">
                <div class="form-group">
                    <label title="图片显示高度" class="col-sm-3 control-label ell"
                           for="file-height"><font data-localize="">图片显示高度</font>：</label>
                    <div class="col-sm-9">
                        <input type="text" id="file-height" class="form-control">
                    </div>
                </div>
            </div>
            <div class="col-xxxl-3 col-md-4 col-sm-6 col-xs-12 file-alt">
                <div class="form-group">
                    <label title="图片提示" class="col-sm-3 control-label ell"
                           for="file-alt"><font data-localize="">图片提示</font>：</label>
                    <div class="col-sm-9">
                        <input type="text" id="file-alt" class="form-control">
                    </div>
                </div>
            </div>

            <div class="col-xxxl-3 col-md-4 col-sm-6 col-xs-12 file-type">
                <div class="form-group">
                    <label title="文件类型" class="col-sm-3 control-label ell"
                           for="file-type"><font data-localize="">文件类型</font>：</label>
                    <div class="col-sm-9">
                        <!--  <input type="text" id="file-type" class="form-control"> -->
                        <label class="checkbox-inline">
                            <input name="file-type" type="checkbox" value="*.img" class="mgc file"> img
                        </label>
                        <label class="checkbox-inline">
                            <input name="file-type" type="checkbox" value="*.jpg" class="mgc file"> jpg
                        </label>
                        <label class="checkbox-inline">
                            <input name="file-type" type="checkbox" value="*.png" class="mgc file"> png
                        </label>
                        <label class="checkbox-inline">
                            <input name="file-type" type="checkbox" value="*.gif" class="mgc file"> gif
                        </label>
                        <label class="checkbox-inline">
                            <input name="file-type" type="checkbox" value="*.bmp" class="mgc file"> bmp
                        </label>
                        <label class="checkbox-inline">
                            <input name="file-type" type="checkbox" value="*.mp4" class="mgc file"> mp4
                        </label>
                        <label class="checkbox-inline">
                            <input name="file-type" type="checkbox" value="*.mp3" class="mgc file"> mp3
                        </label>
                        <label class="checkbox-inline">
                            <input name="file-type" type="checkbox" value="*.txt" class="mgc file"> txt
                        </label>
                        <label class="checkbox-inline">
                            <input name="file-type" type="checkbox" value="*.doc" class="mgc file"> doc
                        </label>
                        <label class="checkbox-inline">
                            <input name="file-type" type="checkbox" value="*.docx" class="mgc file"> docx
                        </label>
                        <label class="checkbox-inline">
                            <input name="file-type" type="checkbox" value="*.xls" class="mgc file"> xls
                        </label>
                        <label class="checkbox-inline">
                            <input name="file-type" type="checkbox" value="*.xlsx" class="mgc file"> xlsx
                        </label>
                        <label class="checkbox-inline">
                            <input name="file-type" type="checkbox" value="*.pdf" class="mgc file"> pdf
                        </label>
                        <label class="checkbox-inline">
                            <span style="color: red;">不限制文件类型就不勾选</span>
                        </label>
                    </div>
                </div>
            </div>
            <div class="col-xxxl-3 col-md-4 col-sm-6 col-xs-12 is-onlyread">
                <div class="form-group">
                    <label title="是否只读" class="col-sm-3 control-label ell"
                           for="is-onlyread"><font data-localize="">是否只读</font>：</label>
                    <div class="col-sm-9">
                        <select id="is-onlyread" class="select2-delay-init">
                            <option value="" data-localize="">否</option>
                            <option value="readonly" data-localize="">是</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="col-xxxl-3 col-md-4 col-sm-6 col-xs-12 is-checekAll">
                <div class="form-group">
                    <label title="是否显示全选" class="col-sm-3 control-label ell"
                           for="is-checekAll"><font data-localize="">是否显示全选</font>：</label>
                    <div class="col-sm-9">
                        <select id="is-checekAll" class="select2-delay-init">
                            <option value="" data-localize="">否</option>
                            <option value="checkAll" data-localize="">是</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="col-xxxl-3 col-md-4 col-sm-6 col-xs-12 is-ShowSearchBox">
                <div class="form-group">
                    <label title="is-ShowSearchBox" class="col-sm-3 control-label ell"
                           for="is-ShowSearchBox"><font data-localize="">是否显示搜索栏</font>：</label>
                    <div class="col-sm-9">
                        <select id="is-ShowSearchBox" class="form-control select2-delay-init">
                            <option value="false" data-localize="">否</option>
                            <option value="true" data-localize="">是</option>
                        </select>
                    </div>
                </div>
            </div>

            <div class="col-xxxl-3 col-md-4 col-sm-6 col-xs-12 is-Showclear">
                <div class="form-group">
                    <label title="is-Showclear" class="col-sm-3 control-label ell"
                           for="is-Showclear"><font data-localize="">是否显示清空</font>：</label>
                    <div class="col-sm-9">
                        <select id="is-Showclear" class="form-control select2-delay-init">
                            <option value="false" data-localize="">否</option>
                            <option value="true" data-localize="">是</option>
                        </select>
                    </div>
                </div>
            </div>


            <div class="col-xxxl-3 col-md-4 col-sm-6 col-xs-12 more-query-config">
                <div class="form-group">
                    <label title="仅在显示更多查询条件下显示" class="col-sm-3 control-label ell"
                           for="more-query"><font data-localize="">仅在显示更多查询条件下显示</font>：</label>
                    <div class="col-sm-9">
                        <select id="more-query" class="select2-delay-init">
                            <option value="" data-localize="">否</option>
                            <option value="more-query" data-localize="">是</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="col-xxxl-3 col-md-4 col-sm-6 col-xs-12 defaultvalue">
                <div class="form-group">
                    <label title="默认值" class="col-sm-3 control-label ell"
                           for="more-query"><font data-localize="">默认值</font>：</label>
                    <div class="col-sm-9">
                        <input type="text" id="element-defaultvalue" class="form-control">
                    </div>
                </div>
            </div>

            <div class="col-xxxl-3 col-md-4 col-sm-6 col-xs-12 inputWidth">
                <div class="form-group">
                    <label title="宽度" class="col-sm-3 control-label ell"
                           for="more-query"><font data-localize="">宽度</font>：</label>
                    <div class="col-sm-9">
                        <input type="text" placeholder="50px;" id="inputWidth" class="form-control">
                    </div>
                </div>
            </div>


            <div class="col-xxxl-3 col-md-4 col-sm-6 col-xs-12 ssyhqx">
                <div class="form-group">
                    <label title="按钮操作权限" class="col-sm-3 control-label ell"
                           for="ssyhqx"><font data-localize="">按钮操作权限</font>：</label>
                    <div class="col-sm-9">
                        <select id="ssyhqx" class="select2-delay-init">
                            <option value="">&nbsp;</option>
                            <c:forEach items="${yhqxs }" var="obj">
                                <option value="${obj.id }">${obj.caption }</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
            </div>
            <div class="col-xxxl-3 col-md-4 col-sm-6 col-xs-12 group-jurisdiction">
                <div class="form-group">
                    <label title="按钮角色权限" class="col-sm-3 control-label ell"
                           for="group-jurisdiction"><font data-localize="">按钮角色权限</font>：</label>
                    <div class="col-sm-9">
                        <select id="group-jurisdiction" class="select2-delay-init" multiple="multiple">
                            <option value="">&nbsp;</option>
                            <c:forEach items="${group }" var="obj">
                                <option value="${obj.id }">${obj.caption }</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
            </div>
            <div class="col-xxxl-3 col-md-4 col-sm-6 col-xs-12 lcbm">
                <div class="form-group">
                    <label title="流程编码" class="col-sm-3 control-label ell"
                           for="lcbm"><font data-localize="">流程编码</font>：</label>
                    <div class="col-sm-9">
                        <input type="text" id="lcbm" class="form-control">
                    </div>
                </div>
            </div>
            <div class="col-xxxl-3 col-md-4 col-sm-6 col-xs-12 tit-remind">
                <div class="form-group">
                    <label title="提醒" class="col-sm-3 control-label ell"
                           for="tit-remind"><font data-localize="">提醒</font>：</label>
                    <div class="col-sm-9">
                        <input type="text" id="tit-remind" class="form-control">
                    </div>
                </div>
            </div>
            <div class="col-xxxl-3 col-md-4 col-sm-6 col-xs-12 modalTitle">
                <div class="form-group">
                    <label title="模态框标题" class="col-sm-3 control-label ell" for="modalTitle"><font data-localize="">模态框标题</font>：</label>
                    <div class="col-sm-9">
                        <input type="text" id="modalTitle" class="form-control">
                    </div>
                </div>
            </div>
            <div class="col-xxxl-3 col-md-4 col-sm-6 col-xs-12 modal-id">
                <div class="form-group">
                    <label title="模态框id" class="col-sm-3 control-label ell" for="modal-id"><font
                            data-localize="">模态框id</font>：</label>
                    <div class="col-sm-9">
                        <select id="modal-id" class="select2-delay-init"></select>
                    </div>
                </div>
            </div>
            <div class="col-xxxl-3 col-md-4 col-sm-6 col-xs-12 aspectRatio">
                <div class="form-group">
                    <label title="截取比例" class="col-sm-3 control-label ell" for="aspectRatio"><font
                            data-localize="">截取比例</font>：</label>
                    <div class="col-sm-9">
                        <input type="text" id="aspectRatio" class="form-control">
                    </div>
                </div>
            </div>
            <div class="col-xxxl-3 col-md-4 col-sm-6 col-xs-12 setting">
                <div class="form-group">
                    <label title="setting" class="col-sm-3 control-label ell" for="callback">setting：</label>
                    <div class="col-sm-9">
                        <input type="text" id="setting" class="form-control" placeholder="实例: sample">
                    </div>
                </div>
            </div>
            <div class="col-xxxl-3 col-md-4 col-sm-6 col-xs-12 callback">
                <div class="form-group">
                    <label title="回调函数" class="col-sm-3 control-label ell" for="callback"><font
                            data-localize="">回调函数</font>：</label>
                    <div class="col-sm-9">
                        <input type="text" id="callback" class="form-control">
                    </div>
                </div>
            </div>
            <div class="col-xxxl-3 col-md-4 col-sm-6 col-xs-12 ajax-url">
                <div class="form-group">
                    <label title="ajax-url" class="col-sm-3 control-label ell" for="ajax-url">ajax-url：</label>
                    <div class="col-sm-9">
                        <input type="text" id="ajax-url" class="form-control">
                    </div>
                </div>
            </div>
            <div class="col-xxxl-3 col-md-4 col-sm-6 col-xs-12 ajax-data">
                <div class="form-group">
                    <label title="ajax-data" class="col-sm-3 control-label ell" for="ajax-data">ajax-data：</label>
                    <div class="col-sm-9">
                        <input type="text" id="ajax-data" class="form-control"
                               placeholder="实例: 'a=1&b=2' 或 {a:'1',b:'2'}">
                    </div>
                </div>
            </div>
            <div class="col-xxxl-3 col-md-4 col-sm-6 col-xs-12 finish-fun">
                <div class="form-group">
                    <label title="点击完成方法" class="col-sm-3 control-label ell" for="finish-fun"><font data-localize="">点击完成方法</font>：</label>
                    <div class="col-sm-9">
                        <input type="text" id="finish-fun" class="form-control">
                    </div>
                </div>
            </div>
            <div class="col-xs-12 modal-code">
                <div class="form-group">
                    <label title="代码" class="col-sm-1 control-label ell" for="modal-code">代码：</label>
                    <div class="col-sm-11">
                        <textarea id="modal-code" class="form-control" style="height: 200px;"></textarea>
                    </div>
                </div>
            </div>

            <div class="col-xxxl-3 col-md-4 col-sm-6 col-xs-12 idcard-posivtive">
                <div class="form-group">
                    <label title="正面name" class="col-sm-3 control-label ell" for="idcard-posivtive"><font
                            data-localize="">正面name</font>：</label>
                    <div class="col-sm-9">
                        <input type="text" id="idcard-posivtive" class="form-control">
                    </div>
                </div>
            </div>
            <div class="col-xxxl-3 col-md-4 col-sm-6 col-xs-12 idcard-other">
                <div class="form-group">
                    <label title="反面name" class="col-sm-3 control-label ell" for="idcard-other"><font data-localize="">反面name</font>：</label>
                    <div class="col-sm-9">
                        <input type="text" id="idcard-other" class="form-control">
                    </div>
                </div>
            </div>
        </div>
        <div class="row wizard-config">
            <hr/>
            <div class="col-xs-12" id="wizard-config">
                <div class="form-group">
                    <label title="第1步" class="col-sm-1 control-label ell"><font data-localize="">第1步</font>：</label>
                    <div class="col-sm-11">
                        <div class="row">
                            <div class="col-xs-1">
                                <input type="text" class="form-control wizard-order" placeholder="排序值">
                            </div>
                            <div class="col-xs-3">
                                <input type="text" class="form-control wizard-title" placeholder="标题">
                                <input type="text" class="form-control wizard-code hide">
                            </div>
                            <div class="col-xs-3">
                                <input type="text" class="form-control wizard-validateSteps-fun"
                                       placeholder="点击下一步验证函数 sample($content)">
                            </div>
                            <div class="col-xs-3">
                                <input type="text" class="form-control wizard-showStep-fun"
                                       placeholder="当前步显示后回调函数 sample($content)">
                            </div>
                            <div class="col-xs-1">
                                <a class="btn btn-sm btn-success add-wizard-config" href="javascript:void(0)">
                                    <i class="fa fa-plus fa fa-white"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row nav-tabs-config">
            <hr/>
            <div class="col-xs-12" id="nav-tabs-config">
                <div class="form-group">
                    <label title="第1页" class="col-sm-1 control-label ell"><font data-localize="">第1页</font>：</label>
                    <div class="col-sm-11">
                        <div class="row">
                            <div class="col-xs-1">
                                <input type="text" class="form-control nav-tabs-order" placeholder="排序值">
                            </div>
                            <div class="col-xs-3">
                                <input type="text" class="form-control nav-tabs-title" placeholder="标题">
                            </div>
                            <label class="col-xs-2 control-label ell"><%="<%=basePath %\>/s/"%>
                            </label>
                            <div class="col-xs-3">
                                <input type="text" class="form-control nav-tabs-url"
                                       placeholder="链接地址 示例:biz/sample/list">
                            </div>
                            <div class="col-xs-1">
                                <a class="btn btn-sm btn-success add-table-config" href="javascript:void(0)"><i
                                        class="fa fa-plus fa fa-white"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row static-nav-tabs-config">
            <hr/>
            <div class="col-xs-12" id="static-nav-tabs-config">
                <div class="form-group">
                    <label title="第1页" class="col-sm-1 control-label ell"><font data-localize="">第1页</font>：</label>
                    <div class="col-sm-11">
                        <div class="row">
                            <div class="col-xs-1">
                                <input type="text" class="form-control nav-tabs-order" placeholder="排序值">
                            </div>
                            <div class="col-xs-3">
                                <input type="text" class="form-control nav-tabs-title" placeholder="标题">
                                <input type="text" class="form-control nav-tabs-code hide">
                            </div>
                            <label class="col-xs-2 control-label ell"><%="<%=basePath %\>/s/"%>
                            </label>
                            <div class="col-xs-3">
                                <input type="text" class="form-control nav-tabs-url"
                                       placeholder="表单action 示例:biz/sample/list">
                            </div>
                            <div class="col-xs-1">
                                <a class="btn btn-sm btn-success add-table-config" href="javascript:void(0)"><i
                                        class="fa fa-plus fa fa-white"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row table-config-edit">
            <hr/>
            <div class="col-xs-12" id="table-config-edit">
                <div class="form-group">
                    <label title="第一列" class="col-sm-1 control-label ell"><font data-localize="">第1列</font>：</label>
                    <div class="col-sm-11">
                        <div class="row">
                            <div class="col-xs-1">
                                <input type="text" class="form-control table-order"
                                       placeholder="排序值">
                            </div>
                            <div class="col-xs-3">
                                <input type="text" class="form-control table-title" placeholder="标题">
                                <input type="hidden" class="form-control table-element" placeholder="内容">
                            </div>
                            <div class="col-xs-1">
                                <a class="btn btn-sm btn-success add-table-config" href="javascript:void(0)"><i
                                        class="fa fa-plus fa fa-white"></i></a>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>


        <div class="row select-btn-item">
            <hr/>
            <div class="col-xs-12" id="select-btn-item">
                <div class="form-group">
                    <label title="按钮1" class="col-sm-1 control-label ell"><font data-localize="">按钮1</font>：</label>
                    <div class="col-sm-11">
                        <div class="row">
                            <div class="col-xs-3">
                                <input type="text" class="form-control selectbtn-title" placeholder="文本">
                            </div>
                            <div class="col-xs-3">
                                <input type="text" class="form-control selectbtn-method" placeholder="方法">
                            </div>
                            <div class="col-xs-1">
                                <a class="btn btn-sm btn-success add-selectbtn-config" href="javascript:void(0)"><i
                                        class="fa fa-plus fa fa-white"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <div class="row table-config">
            <hr/>
            <div class="col-xs-12" id="table-config">
                <div class="form-group">
                    <label title="第一列" class="col-sm-1 control-label ell"><font data-localize="">第1列</font>：</label>
                    <div class="col-sm-11" style="margin-bottom: 10px;">
                        <div class="row">
                            <div class="col-xs-5">
                                <input type="text" class="form-control table-order"
                                       style="width: 15%;float: left;margin-left: 5px;" placeholder="排序值">
                                <input type="text" class="form-control table-title"
                                       style="width: 40%;float: left;margin-left: 5px;" placeholder="标题">
                                <input type="text" class="form-control table-subtitle"
                                       style="width: 37%;float: left;margin-left: 5px;" placeholder="二级标题">
                            </div>
                            <div class="col-xs-3">
                                <input type="text" class="form-control table-content"
                                       style="width: 45%;float: left;margin-left: 5px;" placeholder="内容">
                                <input type="text" class="form-control table-content-length"
                                       style="width: 45%;float: left;margin-left: 5px;" placeholder="显示长度(px)">
                            </div>

                            <div class="col-xs-2">
                                <input type="text" class="form-control table-zdlb"
                                       placeholder="字典类别">
                            </div>
                            <div class="col-xs-1">
                                <a class="btn btn-sm btn-warning show-row-config"
                                   href="javascript:void(0)"><i class="fa fa-times fa fa-angle-double-down"></i>
                                </a>
                            </div>
                            <div class="col-xs-1">
                                <a class="btn btn-sm btn-success add-table-config"
                                   href="javascript:void(0)"><i class="fa fa-plus fa fa-white"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="table-hide" style=" display: none;">
                        <label title="" class="col-sm-1 control-label ell"></label>
                        <div class="col-sm-11">
                            <div class="col-xs-2"><input type="text" class="form-control link-path"
                                                         placeholder="链接地址 示例:biz/sample/input/\${object.wid}"></div>
                            <div class="col-xs-2"><input type="text" class="form-control table-event" placeholder="事件">
                            </div>
                            <div class="col-xs-1 nopadding"><label class="radio-inline"><input type="checkbox"
                                                                                               value="true"
                                                                                               name="table-input">input</label>
                            </div>
                            <div class="col-sm-3"><input type="text"
                                                         placeholder="条件例：\${object.name}=\${object.address} }"
                                                         class="form-control table-if"></div>
                            <div class="col-xs-2"><input type="text" class="form-control table-class" placeholder="样式">
                            </div>
                            <div class="col-xs-2"><input type="text" class="form-control table-group" placeholder="分组名">
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <div class="col-xs-12">
                <hr/>
                <h5 data-localize="">操作按钮</h5>
            </div>
            <div class="col-xs-12" id="button-config">
                <div class="form-group">
                    <label title="第一列" class="col-sm-1 control-label ell"><font data-localize="">第1列</font>：</label>
                    <div class="col-sm-11">
                        <div class="col-xs-1">
                            <input type="text" class="form-control btn-order" placeholder="排序值">
                        </div>
                        <div class="col-xs-2">
                            <input type="text" class="form-control btn-content" placeholder="按钮内容">
                        </div>
                        <div class="col-xs-2">
                            <input type="text" class="form-control btn-tab-name" placeholder="Tab页名称">
                        </div>
                        <div class="col-xs-2">
                            <input type="text" class="form-control btn-title"
                                   placeholder="按钮提示">
                        </div>
                        <div class="col-xs-2">
                            <select class="table-btn-style">
                                <option value="btn-success" data-localize="">绿色</option>
                                <option value="btn-default" data-localize="">白色</option>
                                <option value="btn-primary" data-localize="">蓝色</option>
                                <option value="btn-warning" data-localize="">橙色</option>
                                <option value="btn-danger" data-localize="">红色</option>
                            </select>
                        </div>
                        <div class="col-xs-2">
                            <input type="text" class="form-control btn-event" placeholder="点击事件">
                        </div>
                        <div class="col-xs-1">
                            <a class="btn btn-sm btn-success add-table-button-config"
                               href="javascript:void(0)"><i class="fa fa-plus fa fa-white"></i>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row validate">
            <hr/>
            <div class="col-xs-12">
                <div class="form-group">
                    <label title="基本验证" class="col-xxxl-1 col-sm-2 control-label ell"><font data-localize="">基本验证</font>：</label>
                    <div class="col-xxxl-11 col-sm-10 validate_box">
                        <label class="checkbox-inline">
                            <input type="checkbox" value="required" class=" "><font data-localize="">不能为空</font>
                        </label>
                        <label class="checkbox-inline">
                            <input type="checkbox" value="shzhm" class=" "><font data-localize="">身份证号</font>
                        </label>
                        <label class="checkbox-inline">
                            <input type="checkbox" value="zzjgdm" class=" "><font data-localize="">组织机构代码</font>
                        </label>
                        <label class="checkbox-inline">
                            <input type="checkbox" value="phone" class="  custom"><font data-localize="">电话号码</font>
                        </label>
                        <label class="checkbox-inline">
                            <input type="checkbox" value="iphone" class="  custom"><font data-localize="">手机号码</font>
                        </label>
                        <label class="checkbox-inline">
                            <input type="checkbox" value="email" class="  custom"><font data-localize="">邮箱</font>
                        </label>
                        <label class="checkbox-inline">
                            <input type="checkbox" value="integer" class="  custom"><font data-localize="">整数</font>
                        </label>
                        <label class="checkbox-inline">
                            <input type="checkbox" value="number" class="  custom"><font data-localize="">数字</font>
                        </label>
                        <label class="checkbox-inline">
                            <input type="checkbox" value="positiveInteger" class="  custom"><font
                                data-localize="">正整数</font>
                        </label>
                        <label class="checkbox-inline">
                            <input type="checkbox" value="onlyLetterSp" class="  custom"><font
                                data-localize="">英文</font>
                        </label>
                        <label class="checkbox-inline">
                            <input type="checkbox" value="onlyLetterNumber" class="  custom"><font data-localize="">数字、大小写字母</font>
                        </label>
                        <label class="checkbox-inline">
                            <input type="checkbox" value="chinese" class="  custom"><font data-localize="">中文</font>
                        </label>
                        <label class="checkbox-inline">
                            <input type="checkbox" value="bankcard" class="  custom"><font data-localize="">银行卡号</font>
                        </label>
                        <label class="checkbox-inline">
                            <input type="checkbox" value="date" class="  custom"><font
                                data-localize="">日期(yyyy-mm-dd)</font>
                        </label>
                        <label class="checkbox-inline">
                            <input type="checkbox" value="ipv4" class="  custom">IP
                        </label>
                        <label class="checkbox-inline">
                            <input type="checkbox" value="url" class="  custom">url
                        </label>
                        <label class="checkbox-inline">
                            <input type="checkbox" value="bigZeroNum" class="  custom">大于0整数
                        </label>
                        <label class="checkbox-inline">
                            <input type="checkbox" value="pointTwoNumber" class="  custom">2位小数
                        </label>
                    </div>
                </div>
            </div>
            <div class="col-xxxl-3 col-md-4 col-sm-6 col-xs-12 validate">
                <div class="form-group">
                    <label title="最小长度" class="col-sm-3 control-label ell"
                           for="minSize"><font data-localize="">最小长度</font>：</label>
                    <div class="col-sm-9">
                        <input type="text" id="minSize" class="form-control">
                    </div>
                </div>
            </div>
            <div class="col-xxxl-3 col-md-4 col-sm-6 col-xs-12 validate">
                <div class="form-group">
                    <label title="最大长度" class="col-sm-3 control-label ell"
                           for="maxSize"><font data-localize="">最大长度</font>：</label>
                    <div class="col-sm-9">
                        <input type="text" id="maxSize" class="form-control">
                    </div>
                </div>
            </div>
            <div class="col-xxxl-3 col-md-4 col-sm-6 col-xs-12 validate">
                <div class="form-group">
                    <label title="最小值" class="col-sm-3 control-label ell" for="min"><font
                            data-localize="">最小值</font>：</label>
                    <div class="col-sm-9">
                        <input type="text" id="min" class="form-control">
                    </div>
                </div>
            </div>
            <div class="col-xxxl-3 col-md-4 col-sm-6 col-xs-12 validate">
                <div class="form-group">
                    <label title="最大值" class="col-sm-3 control-label ell" for="max"><font
                            data-localize="">最大值</font>：</label>
                    <div class="col-sm-9">
                        <input type="text" id="max" class="form-control">
                    </div>
                </div>
            </div>
            <div class="col-xxxl-3 col-md-4 col-sm-6 col-xs-12 validate">
                <div class="form-group">
                    <label title="方法" class="col-sm-3 control-label ell" for="v_method"><font data-localize="">方法</font>：</label>
                    <div class="col-sm-9">
                        <input type="text" id="v_method" class="form-control">
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>
<script>
    $(document).ready(function () {
        $("li[data-temple-index]").each(function () {
            $(this).attr('data-localize', $.trim($(this).html()));
        })
    })
</script>
<%@include file="../../common/input-bottom.jsp" %>
<%@include file="../../common/plugins/js/uploadify.jsp" %>
<%@include file="../../common/plugins/js/bootbox.jsp" %>
<%@include file="../../common/plugins/js/select2.jsp" %>
<link rel=stylesheet href="<%=_mainProjectUrl%>/resources/plugins/CodeMirror-master/lib/codemirror.css">
<link rel=stylesheet href="<%=_mainProjectUrl%>/resources/plugins/jQuery-Raty/demo/css/application.css">
<link rel="stylesheet" href="<%=_mainProjectUrl%>/resources/plugins/bootstrap-select-1.11.2/dist/css/bootstrap-select.css">
<script src="<%=_mainProjectUrl%>/resources/plugins/jQuery-Raty/lib/jquery.raty.min.js"></script>
<script src="<%=_mainProjectUrl%>/resources/plugins/CodeMirror-master/lib/codemirror.js"></script>
<script src="<%=_mainProjectUrl%>/resources/plugins/CodeMirror-master/mode/clike/clike.js"></script>
<script src="<%=_mainProjectUrl%>/resources/plugins/CodeMirror-master/mode/javascript/javascript.js"></script>
<script src="<%=_mainProjectUrl%>/resources/plugins/CodeMirror-master/mode/css/css.js"></script>
<script src="<%=_mainProjectUrl%>/resources/plugins/CodeMirror-master/mode/xml/xml.js"></script>
<script src="<%=_mainProjectUrl%>/resources/plugins/CodeMirror-master/mode/htmlmixed/htmlmixed.js"></script>
<script src="<%=_mainProjectUrl%>/resources/plugins/CodeMirror-master/mode/php/php.js"></script>
<script src="<%=_mainProjectUrl%>/resources/plugins/CodeMirror-master/addon/edit/matchbrackets.js"></script>
<script src="<%=_mainProjectUrl%>/resources/plugins/bootstrap-select-1.11.2/dist/js/bootstrap-select.min.js"></script>
<script src="<%=_mainProjectUrl%>/resources/plugins/bootstrap-select-1.11.2/dist/js/i18n/defaults-zh_CN.min.js"></script>
<script src="<%=basePath%>/resources/js/assembly.js"></script>
<script src="<%=basePath%>/resources/js/config-temple.js"></script>
<script src="<%=basePath%>/resources/js/formatting.js"></script>
<script>
    subPage = {
        codeMirror: null,
        codeMirrorJs: null,
        codeMirrorJsForm: null,
        codeMirrorExternalJs: null,
        needRefreshCodeHtml: true,
        needRefreshCodeJs: true,
        needRefreshCodeJsForm: true,
        needRefreshExternalJs: true,
        wid: '${object.wid}',
        code: '',
        jscode: '',
        jscodeform: '',
        externaljscode: '',
        selectid: '',
        saveData: function (el) {
            var jscode = subPage.jscode;
            if (subPage.codeMirrorJs != null) {
                jscode = subPage.codeMirrorJs.getValue();
            }
            var jscodeform = subPage.jscodeform;
            if (subPage.codeMirrorJsForm != null) {
                jscodeform = subPage.codeMirrorJsForm.getValue();
            }
            var externaljscode = $('#externaljavascript').val();
            if (subPage.codeMirrorExternalJs != null) {
                externaljscode = subPage.codeMirrorExternalJs.getValue();
            }
            var code = subPage.code;
            var $oldCode = $('<div>' + code + '</div>');
            $oldCode.find('junducif').removeAttr('class').removeAttr('data-group-name').removeAttr('data-order')
                .removeAttr('data-wid').removeAttr('data-assembly-id');
            code = $oldCode.html();
            $.post(tool.initParams('<%=basePath%>/s/biz/sysJsp/save'), {
                'wid': $('#wid').val(),
                'code': subPage.code,
                'codejsp': code,
                'jscode': jscode,
                'jscodels': jscodeform,
                'savetype': '1',
                'externaljavascript': externaljscode
            }, function (data) {
                tool.alert('保存成功');
            });
        },
        saveData_ls: function (el) {
            var jscode = subPage.jscode;
            if (subPage.codeMirrorJs != null) {
                jscode = subPage.codeMirrorJs.getValue();
            }
            var code = subPage.code;
            var $oldCode = $('<div>' + code + '</div>');
            $oldCode.find('junducif').removeAttr('class').removeAttr('data-group-name').removeAttr('data-order')
                .removeAttr('data-wid').removeAttr('data-assembly-id');
            code = $oldCode.html();
            $.post(tool.initParams('<%=basePath%>/s/biz/sysJsp/save'), {
                'wid': $('#wid').val(),
                'codels': subPage.code,
                'jscodels': jscode,
                'savetype': '2'
            }, function (data) {
                tool.alert('保存成功');
            });
        }
    }
    var index = 0;

    var ass_object = null;
    $(document).ready(function () {
//        var w = get_obj_body('.sb-toggle').parents('nav').css('width');
//        if (parseInt(w.replace('px', '')) > 150) {
//            get_obj_body('.sb-toggle').find('i').click();
//        }
        var code = $('#code').val();
        var jscode = $('#jscode').val();
        var jscodeform = $('#jscodeform').val();
        if (code != null && code != '' && code != 'null') {
            setCode(code.replaceAll('junduquote', "'"));
        }
        if (jscode != null && jscode != '' && jscode != 'null') {
            subPage.jscode = jscode.replaceAll('junduquote', "'");
        }
        if (jscodeform != null && jscodeform != '' && jscodeform != 'null') {
            subPage.jscodeform = jscodeform.replaceAll('junduquote', "'");
        }
        $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
            if (e.target.hash == "#code-mirror-html") {//激活代码tab
                removeElement(this);
                if (subPage.needRefreshCodeHtml) {
                    subPage.needRefreshCodeHtml = false;
                    $('#code-mirror-html textarea').val(subPage.code.replaceAll('jundukeji', 'select').replaceAll('junducif', 'c:if'));
                    subPage.codeMirror = CodeMirror.fromTextArea($('#code-mirror-html textarea')[0], {
                        lineNumbers: true,
                        matchBrackets: true,
                        indentUnit: 4,
                        indentWithTabs: true,
                        mode: 'htmlmixed'
                    });
                    subPage.codeMirror.on('change', function (Editor, changes) {
                    });
                }

            }
            if (e.target.hash == "#code-mirror-external-js") {//激活外部JavaScript tab
                removeElement(this);
                if (subPage.needRefreshExternalJs) {
                    subPage.needRefreshExternalJs = false;
                    subPage.codeMirrorExternalJs = CodeMirror.fromTextArea($('#code-mirror-external-js textarea')[0], {
                        lineNumbers: true,
                        matchBrackets: true,
                        indentUnit: 4,
                        indentWithTabs: true,
                        mode: 'htmlmixed'
                    });
                    subPage.codeMirrorExternalJs.setValue($('#externaljavascript').val());
                }
            }
            if (e.target.hash == "#code-mirror-js") {//激活代码tab
                removeElement(this);
                if (subPage.needRefreshCodeJs) {
                    subPage.needRefreshCodeJs = false;
                    subPage.codeMirrorJs = CodeMirror.fromTextArea($('#code-mirror-js textarea')[0], {
                        lineNumbers: true,
                        matchBrackets: true,
                        indentUnit: 4,
                        indentWithTabs: true,
                        mode: 'javascript'
                    });
                    subPage.codeMirrorJs.setValue(subPage.jscode);
                }
            }
            if (e.target.hash == "#code-mirror-js-form") {//激活代码tab
                removeElement(this);
                if (subPage.needRefreshCodeJsForm) {
                    subPage.needRefreshCodeJsForm = false;
                    subPage.codeMirrorJsForm = CodeMirror.fromTextArea($('#code-mirror-js-form textarea')[0], {
                        lineNumbers: true,
                        matchBrackets: true,
                        indentUnit: 4,
                        indentWithTabs: true,
                        mode: 'javascript'
                    });
                    subPage.codeMirrorJsForm.setValue(subPage.jscodeform);
                }
            }
            if (e.target.hash == "#panel_tab_example1") {
                setCode(getCode());
            }
        })
        $('li[data-temple-index]').click(function () {
            var $el = $(this);
            index = Number($el.attr('data-temple-index'));
            opendialog(index, null, this, 1);
        });
    });

    /**
     *
     *获取验证中输入的最大字数
     */
    function getMaxCount() {
        var validate_o;
        if (tabModel) {
            validate_o = $('.my-modal', document).find('.validate');
        } else {
            validate_o = $('.validate');
        }
        var maxSize = validate_o.find('#maxSize').val();
        if (maxSize == null || maxSize == '')
            maxSize = -1;
        return maxSize;
    }

    /**
     * 获取验证
     * return String
     */
    function getValidate() {
        var validate = '';
        var validate_o;
        if (tabModel) {
            validate_o = $('.my-modal', document).find('.validate');
        } else {
            validate_o = $('.validate');
        }
        validate_o.find('input[type="checkbox"]:checked').each(function () {
            var th_val = $(this).attr('value');
            if ($(this).hasClass('custom')) {
                validate += 'custom[' + th_val + '],';
            } else {
                validate += th_val + ',';
            }
        });
        var minSize = validate_o.find('#minSize').val();
        var maxSize = validate_o.find('#maxSize').val();
        var min = validate_o.find('#min').val();
        var max = validate_o.find('#max').val();
        var v_method = validate_o.find('#v_method').val();
        if (minSize != null && minSize != '') validate += 'minSize[' + minSize + '],';
        if (maxSize != null && maxSize != '') validate += 'maxSize[' + maxSize + '],';
        if (min != null && min != '') validate += 'min[' + min + '],';
        if (max != null && max != '') validate += 'max[' + max + '],';
        if (v_method != null && v_method != '') {
            if (v_method.indexOf('(') == -1) v_method += '()'
            validate += 'method[' + v_method + '],';
        }

        if (validate != '') {
            validate = 'validate[' + validate.substring(0, validate.length - 1) + '] ';
        }
        return validate;
    }

    function getFileType() {
        var filetype = '';
        var filetype_o;
        if (tabModel) {
            filetype_o = $('.my-modal', document).find('.file-type');
        } else {
            filetype_o = $('.file-type');
        }
        filetype_o.find('input[type="checkbox"]:checked').each(function () {
            var th_val = $(this).attr('value');
            filetype += th_val + ";";
        });
        return filetype;
    }
    function initFileType(file_type) {
        var filetype_o;
        if (tabModel) {
            filetype_o = $('.my-modal', document).find('.file-type');
        } else {
            filetype_o = $('.file-type');
        }
        filetype_o.find('input[name="file-type"]').each(function () {
            var str = $(this).val();
            if (file_type.indexOf(str) != -1) {
                $(this).attr('checked', 'checked')
            }
        });
    }


    /**
     * 初始化验证--修改
     * return String
     */
    function initvalidate(validate) {
        var validate_o;
        if (tabModel) {
            validate_o = $('.my-modal', document).find('.validate');
        } else {
            validate_o = $('.validate');
        }
        validate_o.find('input[type="checkbox"]').each(function () {
            var th_val = $(this).attr('value');
            if (validate.indexOf(th_val) != -1) {
                $(this).attr('checked', 'checked')
            }
        });
        if (validate.indexOf('minSize[') != -1) {
            var minSize = validate.substring(validate.indexOf('minSize[') + 8);
            minSize = minSize.substring(0, minSize.indexOf(']'));
            validate_o.find('#minSize').val(minSize);
        }
        if (validate.indexOf('maxSize[') != -1) {
            var maxSize = validate.substring(validate.indexOf('maxSize[') + 8);
            maxSize = maxSize.substring(0, maxSize.indexOf(']'));
            validate_o.find('#maxSize').val(maxSize);
        }
        if (validate.indexOf('min[') != -1) {
            var min = validate.substring(validate.indexOf('min[') + 4);
            min = min.substring(0, min.indexOf(']'));
            validate_o.find('#min').val(min);
        }
        if (validate.indexOf('max[') != -1) {
            var max = validate.substring(validate.indexOf('max[') + 4);
            max = max.substring(0, max.indexOf(']'));
            validate_o.find('#max').val(max);
        }
        if (validate.indexOf('method[') != -1) {
            var method = validate.substring(validate.indexOf('method[') + 7);
            method = method.substring(0, method.indexOf(']'));
            validate_o.find('#v_method').val(method);
        }
    }
    function getElementLeft(element) {
        var actualLeft = element.offsetLeft;
        var current = element.offsetParent;
        while (current !== null) {
            actualLeft += current.offsetLeft;
            current = current.offsetParent;
        }
        return actualLeft;
    }
    function getElementTop(element) {
        var actualTop = element.offsetTop;
        var current = element.offsetParent;
        while (current !== null) {
            actualTop += current.offsetTop;
            current = current.offsetParent;
        }
        return actualTop;
    }
    function editElement(el, classs) {
        removeElement(el);
        //if(classs=='layout') editLayout();
        $('.' + classs).each(function () {
            if (classs != 'layout') $('.edit-hidden').attr('type', 'text');
            var width = $(this).css('width');
            var height = $(this).css('height');
            if (width == '0' || width == '0px') width = '50px;'
            if (height == '0' || height == '0px') height = '50px;'
            var title = '';
            if (classs == 'layout') title = $(this).attr('data-group-name');
            else title = $(this).attr('title');
            if (title == undefined) title = '';
            var data_order = $(this).attr('data-order');
            if (data_order == undefined) data_order = '';
            var tthis = null;
            $('#preview').each(function () {
                tthis = this
            });
            var zIndex = 150;
            if (classs == 'edit-element') {
                $(this).parents('.edit-element').length > 0;
                zIndex = 151;
            }
            if (this.nodeName == 'C:IF') {
                zIndex = 152;
            }
            $('#preview').append('<div title="' + title + '" class="mask" onclick="editElementData(\'' + $(this).attr('data-assembly-id') + '\',\'' + $(this).attr('data-wid') + '\',this)"  ' +
                'style="z-index: ' + zIndex + ';width: ' + width + ';height: ' + height + ';' +
                'top: ' + (getElementTop(this) - getElementTop(tthis)) + 'px;left: ' + (getElementLeft(this) - getElementLeft(tthis)) + 'px;">' + title + '&nbsp;' + data_order + '</div>');

        });

    }
    function removeElement(el) {
        $(el).parents('body').find('.mask').remove();
        $('.edit-hidden').attr('type', 'hidden');
        //$('.layout').removeClass('layout-active');

    }
    function editElementData(index, datawid, el) {
        opendialog(index, datawid, el, 2)
    }
    function opendialog(index, datawid, el, type) {
        var $el = $(el);
        ass_object = assembly[index];
        var styles = ass_object.style;

        var removeclass = "btn-danger btn-sm";
        var copyclass = "btn-success btn-sm";
        if (type == 1) {
            removeclass += " hide";
        }
        if (type == 1 || (index != '4' && index != '5' && index != '6' && index != '7' && index != '41' && index != '92')) {
            copyclass += " hide";
        }

        if (styles != null) {
            bootbox.dialog({
                title: ass_object.assemblyName,
                className: "my-modal",
                message: $('#modal-dialog').html(),
                buttons: {
                    copy: {
                        label: "复制代码",
                        className: copyclass,
                        callback: function () {
                            var oldCode = getCode();
                            var $oldCode = $('<div>' + oldCode + '</div>');
                            var htm = $oldCode.find('[data-wid="' + datawid + '"]').prop('outerHTML');
                            copy_code(htm);
                        }
                    },
                    close: {
                        label: "关闭",
                        className: "btn-default btn-sm",
                        callback: function () {
                        }
                    },
                    remove: {
                        label: "删除",
                        className: removeclass,
                        callback: function () {
                            var oldCode = getCode();
                            var $oldCode = $('<div>' + oldCode + '</div>');
                            //记录当前对象的父对象
                            var oparent;
                            if (index == '4' || index == '5' || index == '6') {//记录当前对象的父对象
                                oparent = $oldCode.find('[data-wid="' + datawid + '"]').parent();
                            }
                            $oldCode.find('[data-wid="' + datawid + '"]').remove();
                            if (index == '4' || index == '5' || index == '6') {//判断当前对象的父对象是否是另加的rowdiv并且里面已经没内容
                                if (oparent.hasClass('data-group') && oparent.hasClass('row')
                                    && oparent.find('div').html() == undefined) {
                                    oparent.remove();//删除rowdiv
                                }
                            }
                            oldCode = $oldCode.html();
                            setCode(oldCode);
                            removeElement(el);
                        }
                    },
                    success: {
                        label: "添加",
                        className: "btn-success btn-sm",
                        callback: function () {
                            //console.log('验证通过...');
                            var config = getConfig(index);
                            if (index == '56') {
                                config.template = get_code();
                                if (config.template == null || config.template == '') {
                                    tool.alert('请先复制一个分组或者表格');
                                    return false;
                                }
                                config.order = get_code_obj().children().eq(0).attr('data-order');
                                if (get_code_obj().children().eq(0).attr('data-assembly-id') == '7'
                                    || get_code_obj().children().eq(0).attr('data-assembly-id') == '41') {
                                    index = '561';
                                }
                                var temp = config.template;

                            } else {
                                var temp = config.template;
                                var data_wid_new = getNewElementId();
                                temp = replaceBasicInformation(temp, config, index, data_wid_new);
                                config.template = temp;
                            }

                            var newCode = '';
                            var contextCode = '';//修改分组的时候先记录分组里面之前的内容，然后删除以前的分组，创建新的分组，再把之前的内容加入到新创建的分组
                            var oldCode = getCode();
                            if (index == '10') config.order = '1000';//隐藏文本框放到最上面
                            if (index != '4' && index != '5' && index != '39' && index != '6' && index != '36' && index != '7' && index != '10' && index != '44' &&
                                index != '46' && index != '52' && index != '53' && index != '54' && index != '56' && index != '561' && index != '57' &&
                                index != '58' && index != '75' && index != '89' && index != '90') {
                                if (config.groupGenus == '') {
                                    tool.alert('请选择分组');
                                    return false;
                                }
                            }

                            if (index == '85') {
                                if (isNaN(config.ratyCount)) {
                                    tool.alert('请输入数字！');
                                    return false;
                                }
                            }

                            if (type == 2) {//修改时，先删除选中的对象，然后重新创建
                                var $oldCode = $('<div>' + oldCode + '</div>');
                                var oparent;//记录当前对象的父对象
                                if (index == '4' || index == '36' || index == '54') {
                                    oparent = $oldCode.find('[data-wid="' + datawid + '"]').parent();
                                    contextCode = $oldCode.find('[data-wid="' + datawid + '"]').html();
                                } else if (index == '5' || index == '6') {
                                    oparent = $oldCode.find('[data-wid="' + datawid + '"]').parent();
                                    contextCode = $oldCode.find('[data-wid="' + datawid + '"]').find('.panel-body').html();
                                }
                                if (index != '90') {
                                    $oldCode.find('[data-wid="' + datawid + '"]').remove();
                                } else {
                                    $oldCode.find('[data-wid="' + datawid + '"]').find('input:first').attr("id", $(config.template).attr("id"));
                                    $oldCode.find('[data-wid="' + datawid + '"]').find('input:first').attr("name", $(config.template).attr("name"));
                                    $oldCode.find('[data-wid="' + datawid + '"]').find('input:first').attr("value", $(config.template).attr("value"));
                                }

                                if (index == '4' || index == '5' || index == '6') {//判断当前对象的父对象是否是另加的rowdiv并且里面已经没内容
                                    if (oparent.hasClass('data-group') && oparent.hasClass('row') && oparent.find('div').html() == undefined) {
                                        oparent.remove();//删除rowdiv
                                    }
                                }
                                oldCode = $oldCode.html();
                                //setCode($('#preview').html());
                            }

                            //查找代码应该放置的位置
                            if (oldCode != null && oldCode != '') {
                                //是否是顶级分组
                                if (config.groupGenus == '') {
                                    if (index == '4' || index == '5' || index == '6' || index == '56' || index == '36') {
                                        config.template = '<div class="row data-group" data-order="' + config.order + '" >' + config.template + '</div>';
                                    }
                                    newCode = orderElement(oldCode, config);
                                } else {
                                    var $oldCode = $('<div>' + oldCode + '</div>');
                                    var parentGroup = $oldCode.find('[data-group-name="' + config.groupGenus + '"]');
                                    if ((parentGroup.attr('data-assembly-id') == '5' || parentGroup.attr('data-assembly-id') == '6' )) {
                                        parentGroup = parentGroup.find('.panel-body');
                                    }
                                    //如果是布局
                                    if ((index == '4' || index == '5' || index == '6' || index == '56' || index == '36' )) {

                                        if (parentGroup.children('div[class*="row data-group"]').length == 0) {
                                            parentGroup = parentGroup.append('<div class="row data-group" data-order="' + config.order + '"></div>')
                                        }

                                        parentGroup = parentGroup.children('[class*="row data-group"]');


                                    }
                                    if (config.groupType == 'table-td') {//如果是可编辑表格
                                        settdfortable(parentGroup, config.template)
                                    } else {
                                        if (index != "90") {
                                            newCode = orderElement(parentGroup.html(), config);
                                            parentGroup.html(newCode);
                                        } else {
                                            parentGroup.html($(oldCode).html());
                                        }

                                    }
                                    newCode = $oldCode.html();
                                }
                            } else {
                                if (index == '4' || index == '5' || index == '6' || index == '56' || index == '36') {
                                    temp = '<div class="row data-group" data-order="' + config.order + '">' + temp + '</div>';
                                }
                                newCode = temp;
                            }
                            setCode(newCode);
                            if (type == 2 && (index == '4' || index == '5' || index == '6' || index == '36' || index == '54')) {
                                oldCode = getCode();
                                var $oldCode = $('<div>' + oldCode + '</div>');
                                if (index == '5' || index == '6') {
                                    $oldCode.find('[data-wid="' + data_wid_new + '"]').find('.panel-body').html(contextCode);
                                } else {
                                    $oldCode.find('[data-wid="' + data_wid_new + '"]').html(contextCode);
                                }
                                newCode = $oldCode.html();
                                setCode(newCode);
                            }
                            if (type == 2 && index == '41') {//修改表格时,保存表格里面之前设置的元素
                                oldCode = getCode();
                                var $oldCode = $('<div>' + oldCode + '</div>');
                                var parentGroup = $oldCode.find('[data-group-name="' + config.groupGenus + '"]');
                                var configs = getEditTableConfig();
                                if (configs.length > 0) {
                                    for (var i = 0; i < configs.length; i++) {
                                        tableElement = configs[i].tableElement;
                                        if (tableElement != null && tableElement != '') {
                                            settdfortable(parentGroup.find('td').eq(i + 1), tableElement);
                                        }
                                    }
                                }
                                setCode($oldCode.html());
                            }


                            if ((index == '4' || index == '5' || index == '6' || index == '36' || index == '56')) {
                                editElement(el, 'layout');
                            } else {
                                editElement(el, 'edit-element');
                                tool.initBootstrapSelectBySelector(".selectpicker");
                            }
                        }
                    }
                }
            });

            subPage.selectid = '';
            initConfigSelect(Number(index));
            if (type == 1 && ((Number(index) >= 19 && Number(index) <= 34) || index == '78' || index == '91' || index == '92')) {
                initbutton(el, index);
            } else if (type == 2) {
                initContext(datawid, el, index);
            }

            //绑定id、name、value
            getobj('#element-id').change(function () {
                if ($(this).val() == '') {
                    getobj('#element-id-1').removeAttr('readonly');
                } else {
                    getobj('#element-id-1').attr('readonly', 'readonly');
                    getobj('#element-id-1').val('');
                }
                //if (getobj('#element-name').val() == null || getobj('#element-name').val() == '') {
                getobj('#element-name').val($(this).val());
                //}
                //if (getobj('#element-value').val() == 'object.') {
                getobj('#element-value').val('object.' + $(this).val());
                //}
            });
            //绑定id、name、value
            getobj('#element-id-1').change(function () {
                //if (getobj('#element-name').val() == null || getobj('#element-name').val() == '') {
                getobj('#element-name').val($(this).val());
                //}
                //if (getobj('#element-value').val() == 'object.') {
                getobj('#element-value').val('object.' + $(this).val());
                //}
            });

        } else {
            console.log('组件' + $el.html() + '未找到');
        }
    }

    function settdfortable(parentGroup, html) {
        parentGroup.html(html);
        var dataTables_wrapper = parentGroup.parents('.dataTables_wrapper');
        var functionName = getNewElementId();
        var _tr_temp = dataTables_wrapper.find('tbody tr:eq(0)');
        _tr_temp.find('input, select').val('');
        var _tbody = _tr_temp.prop('outerHTML').replaceAll('\n', '');
        var newVar = getNewElementId();
        var _function = 'var ' + newVar + ' = 0;';
        _function += 'function ' + functionName + '(el){\n';
        _function += 'var $el = $(el);';
        _function += 'var $table = $el.parents(".dataTables_wrapper").find("table");';
        _function += 'if(' + newVar + ' == 0){' +
            newVar + ' = $table.find(\'tbody tr\').length;' +
            '}';
        var oldListName = _tr_temp.find('input,select').eq(1);
        var newListName = _tr_temp.find('input:hidden').attr('name');
        if (oldListName.length > 0) {
            newListName = newListName.substring(0, newListName.indexOf('\['));
            oldListName = oldListName.attr('name');
            oldListName = oldListName.substring(0, oldListName.indexOf('\['));
        }
        _tbody = _tbody.replaceAll('"' + oldListName + '\\[', '"' + newListName + '[');
        _function += "if(($table.parent().attr('data-max-length') == null || $table.parent().attr('data-max-length') == '') || $table.find('tbody').find('tr').length < Number($table.parent().attr('data-max-length'))){\n";
        _function += '$table.append(\'' + _tbody + '\'.replaceAll(\'\\\\[0\\\\]\',\'[\' + ' + newVar + ' + \']\').replaceAll(\'\\\\[\\\\]\',\'[\' + ' + newVar + ' + \']\'));' +
            'Main.initEditTable($table.find(\'tr:last-child\'));' + newVar + '++;';
        _function += "}else{\n" +
            "    parent.toastr.warning('最多只能添加 ' + $table.parent().attr('data-max-length') + ' 条', '超过数据上限')\n" +
            "}" +
            "$table.find(\'tr:last\').find('input,textarea').each(function(){" +
            "var defaultvalue= $(this).attr(\'defaultvalue\');" +
            "if(defaultvalue!=undefined && defaultvalue!=\'undefined\' && defaultvalue!=null && defaultvalue!=\'\'){" +
            "	$(this).val(defaultvalue);" +
            "}" +
            "});}";

        dataTables_wrapper.find('.btn-success').attr('onclick', functionName + '(this)');
        var newDataTables_wrapper = dataTables_wrapper.find('.btn-success').prop('outerHTML');
        newDataTables_wrapper += dataTables_wrapper.find('table').prop('outerHTML');
        newDataTables_wrapper += '<script>' + _function + '<\/script>';
        dataTables_wrapper.html(newDataTables_wrapper);
    }

    //修改时初始化数据
    function initContext(datawid, el, index) {

        var oldCode = getCode();
        var $oldCode = $('<div>' + oldCode + '</div>');
        var obj = $oldCode.find('[data-wid="' + datawid + '"]');
        var config = {};
        var style = '', group_genus = '', group_name = '', title = '', src = '', order = '', classs = '',
            element_id = '', element_name = '',
            method = '', element_value = '', element_type = '', table_name = '', select_key = '', select_text = '',
            field_up_id = '',
            field_up_val = '', file_query = '', query_val = '', data_childselect = '', select_list = '', list_key = '',
            list_value = '', format = '', zdlb = '', width = '', validate = '', items = '', url = '', default_text = '',
            event_click = '',
            icon = '', btn_size = '', btn_style = '', ratyCount = '', if_test = '', checkbox_id = '', file_size = '',
            file_type = '',
            file_name = '', file_value = '', file_width = '', checkbox_url = '', label_box = '', tit_remind = '',
            is_onlyread = '', is_checekAll = '',
            lcbm = '', file_alt = '', in_color = '', placeholder = '', ssyhqx = '', modalTitle = '', callback = '',
            modalId = '', modalCode = '',
            in_wb_color = '', dataComparison = '', jsppath = '', file_length = '', finishFun = '', moreQuery = '',
            is_ShowSearchBox = '', is_Showclear = '', cur_val = '',
            element_defaultvalue = '', inputWidth = '';
        moreQuery = obj.hasClass('more-query');
        subPage.selectid = '';
        order = obj.attr('data-order');
        group_genus = obj.parents('.layout').attr('data-group-name');
        if (index == '86' || index == '47' || index == '48') {
            group_genus = obj.parents('td').attr('data-group-name');
            classs = obj.find('input').attr('class');
            element_defaultvalue = obj.find('input').attr('defaultvalue');
            inputWidth = obj.find('input').width() + "px";
        }
        if (index == '49' || index == '50' || index == '51') {
            group_genus = obj.parents('td').attr('data-group-name');
            classs = obj.find('select').attr('class');
            element_defaultvalue = obj.find('select').attr('defaultvalue');
        }
        if (index == '4' || index == '5' || index == '6' || index == '89') {//分组
            group_name = obj.attr('data-group-name');
            element_id = obj.attr('id');
            classs = obj.attr('class');
            if (classs.indexOf("col-xs-") != -1) width = classs.substring(classs.indexOf("col-xs-")).trim();
            else width = 'col-xs-12';
            if (index == '5') {
                tit_remind = obj.attr('tit-remind');
            }
            style = '0';
        } else if (index == '54') {
            group_name = obj.attr('data-group-name');
            element_id = obj.attr('id');
            style = '0';
        } else if (index == '36') {//条件分组
            group_name = obj.attr('data-group-name');
            if_test = obj.attr('test').replace('$\{', '').replace('}', '');
            style = '0';
        } else if (index == '43') {//文本、list汇总信息
            label_box = obj.html().trim();
            in_wb_color = obj.attr('color');
            style = '0';
        } else if (index == '53') {//文本、list汇总信息
            label_box = obj.html().trim();
            in_color = obj.attr('data-style');
            config.dataHis = obj.attr('data-his');
            style = '0';
        } else if (index == '44') {//input操作记录
            lcbm = obj.attr('lcbm');
            element_value = obj.attr('value');
            style = '0';
        } else if (index == '52') {//tab
            obj.find('ul li').each(function (i) {
                tableTitle = $(this).find('a').text().trim();
                tableUrl = obj.find('.tab-content').find('div').eq(i).attr('data-nav-url');
                if (i > 0) getobj('.nav-tabs-config').find('.form-group').find('.add-table-config').click();
                getobj('.nav-tabs-config').find('.form-group').eq(i).find('.nav-tabs-title').val(tableTitle);
                getobj('.nav-tabs-config').find('.form-group').eq(i).find('.nav-tabs-url').val(tableUrl);
                getobj('.nav-tabs-config').find('.form-group').eq(i).find('.nav-tabs-order').val(100 - (i) * 3);

            });
            style = '0';
        } else if (index == '75') {//静态tab页
            obj.find('ul li').each(function (i) {
                tableTitle = $(this).find('a').text().trim();
                tableUrl = obj.find('.tab-content').find('form').eq(i).attr('data-action');
                var code = obj.find('.tab-content').eq(i).find('[data-group-name]').html();
//                console.log(code);
                if (i > 0) getobj('.static-nav-tabs-config').find('.form-group').find('.add-table-config').click();
                getobj('.static-nav-tabs-config').find('.form-group').eq(i).find('.nav-tabs-code').val(code);
                getobj('.static-nav-tabs-config').find('.form-group').eq(i).find('.nav-tabs-title').val(tableTitle);
                getobj('.static-nav-tabs-config').find('.form-group').eq(i).find('.nav-tabs-url').val(tableUrl);
                getobj('.static-nav-tabs-config').find('.form-group').eq(i).find('.nav-tabs-order').val(100 - (i) * 3);
            });
            style = '0';
        } else if (index == '74') {//向导式表单
            element_id = obj.attr('id').replace('-form', '');
            finishFun = obj.attr('data-finish-fun');
            obj.find('.wizard-step').each(function (i) {
                var $content = $(this);
                if (i != 0) {
                    $('.my-modal', document).find('#wizard-config .add-wizard-config').click();
                }
                config.order = (obj.find('.wizard-step').length - i) * 5;
                config.title = $content.find('.StepTitle').html();
                config.title = config.title.substring(config.title.indexOf('步') + 1, config.title.length).trim();
                config.validateSteps = $content.attr('data-validateSteps');
                config.showStep = $content.attr('data-showStep');
                config.code = $content.find('[data-group-name]').html();
//                console.log(config.code);
                getobj('.wizard-config').find('.form-group').eq(i).find('.wizard-code').val(config.code);
                getobj('.wizard-config').find('.form-group').eq(i).find('.wizard-title').val(config.title);
                getobj('.wizard-config').find('.form-group').eq(i).find('.wizard-order').val(config.order);
                getobj('.wizard-config').find('.form-group').eq(i).find('.wizard-validateSteps-fun').val(config.validateSteps);
                getobj('.wizard-config').find('.form-group').eq(i).find('.wizard-showStep-fun').val(config.showStep);
                i++;
            });
            style = '0';
        } else if (index == '92') {
            element_id = obj.find("button:first").attr("id");
            title = obj.find("button:first").html();
            btn_size = obj.find("button:first").attr('data-btn-size');
            event_click = obj.find("button:first").attr('onclick');
            classs = obj.find("button:first").attr('class');
            btn_style = obj.find("button:first").attr('data-btn-class');
            style = '0';
            var tmp = '';
            var as = obj.find("a");
            for (var i = 0; i < as.length; i++) {
                if (i != 0) {
                    $('.my-modal', document).find('#select-btn-item .add-selectbtn-config').click();
                }
                var method = $(as[i]).attr("href");
                method = method.substring(method.indexOf("(") + 1, method.lastIndexOf(")"));
                var title = $(as[i]).html();
                getobj('#select-btn-item').find('.form-group').eq(i).find('.selectbtn-title').val(title);
                getobj('#select-btn-item').find('.form-group').eq(i).find('.selectbtn-method').val(method);
            }
        } else if (index == '7') {//table

            element_id = obj.attr('id');
            items = obj.find('tbody').attr('items').replace('$\{', '').replace('}', '');
            checkbox_id = obj.find('tbody').find('tr:last > input:checkbox').attr('data-values');
            if (checkbox_id == null || checkbox_id == '') {
                checkbox_id = obj.find('tbody').find('tr:last').attr('id').replace('tr_$\{table_object.', '').replace('}', '');
            }

            checkbox_url = obj.find('tbody').find('tr:first').attr('onclick');
            if (checkbox_url != null && checkbox_url != '') checkbox_url = checkbox_url.replace('tool.loadFormByTr(this,\'<\%=basePath %>/s/', '').replace('\')', '');
            var z = 0;
            var tits = new Array();
            var subtits = new Array();
            if (obj.find('thead').find('tr').length == 1) {
                obj.find('thead').find('tr').find('th').each(function (i) {
                    tits[i] = $(this).text().trim();
                    subtits[i] = $(this).text().trim();
                });
            } else {
                var i = 0;
                var j = 0;
                obj.find('thead').find('tr:first').find('th').each(function () {
                    if ($(this).attr('colspan') != null && $(this).attr('colspan') != ''
                        && $(this).attr('colspan') != '1') {
                        var colspan = $(this).attr('colspan');
                        for (var z = 0; z < parseInt(colspan); z++) {
                            tits[i + z] = $(this).text().trim();
                            subtits[i + z] = obj.find('thead').find('tr:last').find('th').eq(j).text().trim();
                            j++;
                        }
                        i = i + parseInt(colspan);
                    } else {
                        tits[i] = $(this).text().trim();
                        subtits[i] = '';
                        i++;
                    }

                });
            }
            obj.find('tbody').find('tr:first').find('td').each(function (i) {
                if ($(this).attr('data-element-type') != 'auto-add') {
                    if (i == 0 && checkbox_id != '') return;
                    tableTitle = tits[i];
                    tableSubTitle = subtits[i];
                    var _temp = $(this).prop('outerHTML');
                    if (_temp.indexOf('<\c\:if') > -1) {
                        tableContent = $(this).html();
                    } else if ($(this).find('input').length > 0) {
                        tableContent = $(this).find('input').attr('name');
                    } else {
                        tableContent = $(this).text().trim().replace('$\{table_object.', '').replace('}', '');
                    }
                    tableLinkPath = $(this).find('a').attr('onclick');
                    tableZdlb = $(this).attr('zdlb');
                    tableclass = $(this).attr('class');
                    tableif = $(this).attr('hide');
                    tableinput = $(this).html();
                    tableGroup = $(this).attr('data-group-name');
                    tableEvent = $(this).find('a').attr('onclick');
                    if (tableEvent == null) {
                        tableEvent = $(this).find('input').attr('onblur');
                    }
                    if (tableLinkPath != null && tableLinkPath.indexOf('<\%=basePath%>/s/') == -1) {
                        tableLinkPath = '';
                    } else if (tableEvent == null || tableEvent == '' || tableLinkPath != null) {
                        tableEvent = '';
                    }

                    if (tableLinkPath != null && tableLinkPath != '')
                        tableLinkPath = tableLinkPath.replace('tool.openSubviewByForm(this,\'<\%=basePath%>/s/', '').replace('\')', '');
                    if (z > 0) getobj('.table-config').find('.form-group').find('.add-table-config').click();
                    getobj('.table-config').find('.form-group').eq(z).find('.table-title').val(tableTitle);
                    getobj('.table-config').find('.form-group').eq(z).find('.table-subtitle').val(tableSubTitle);
                    getobj('.table-config').find('.form-group').eq(z).find('.table-group').val(tableGroup);
                    if (tableGroup == null || tableGroup == "") {
                        getobj('.table-config').find('.form-group').eq(z).find('.table-content').val(tableContent);
                    }
                    getobj('.table-config').find('.form-group').eq(z).find('.link-path').val(tableLinkPath);
                    getobj('.table-config').find('.form-group').eq(z).find('.table-zdlb').val(tableZdlb);
                    getobj('.table-config').find('.form-group').eq(z).find('.table-if').val(tableif);
                    getobj('.table-config').find('.form-group').eq(z).find('.table-class').val(tableclass);
                    getobj('.table-config').find('.form-group').eq(z).find('.table-event').val(tableEvent);
                    getobj('.table-config').find('.form-group').eq(z).find('.table-content-length').val($(this).attr('data-ell-length'));
                    if ($(this).find('input').length > 0) {
                        getobj('.table-config').find('.form-group').eq(z).find('input[type*="checkbox"]').attr('checked', 'checked');
                    }
                    getobj('.table-config').find('.form-group').eq(z).find('.table-order').val(100 - (z) * 3);
                    z++;
                }
            });
            var $btns = obj.find('tbody').find('tr:first').find('td:last').find('a.btn');
            $btns.each(function (i) {
                var $btn = $(this);
                if (i != 0) {
                    $('.my-modal', document).find('#button-config .add-table-button-config').click();
                }
                config.order = ($btns.length - i) * 5;
                config.content = $btn.html();
                config.title = $btn.attr('data-original-title');
                config.style = $btn.attr('class').replace('tooltips', '').replace('btn-xs', '').replace('btn', '').trim();
                config.event = $btn.attr('onclick');
                config.tabName = $btn.attr('data-tab-name');
                getobj('#button-config').find('.form-group').eq(i).find('.btn-order').val(config.order);
                getobj('#button-config').find('.form-group').eq(i).find('.btn-tab-name').val(config.tabName);
                getobj('#button-config').find('.form-group').eq(i).find('.btn-title').val(config.title);
                getobj('#button-config').find('.form-group').eq(i).find('.btn-content').val(config.content);
//                console.log(config.style);
                getobj('#button-config').find('.form-group').eq(i).find('.table-btn-style').val(config.style);
                initSelectBySelector('.my-modal .table-btn-style');
                getobj('#button-config').find('.form-group').eq(i).find('.btn-event').val(config.event);
                i++;
            });

            style = '0';
        } else if (index == '41') {//可编辑table
            config.maxDatalength = obj.attr('data-max-length');
            element_id = obj.attr('id');
            items = obj.find('tbody').attr('items').replace('$\{', '').replace('}', '');
            obj.find('th').each(function (i) {
                if (i == obj.find('th').length - 1) return false;
                tableTitle = $(this).text().trim();
                tableElement = obj.find('tbody').find('tr:first').find('td').eq(i + 1).html();
                if (i > 0) getobj('.table-config-edit').find('.form-group').find('.add-table-config').click();
                getobj('.table-config-edit').find('.form-group').eq(i).find('.table-title').val(tableTitle);
                getobj('.table-config-edit').find('.form-group').eq(i).find('.table-element').val(tableElement);
                getobj('.table-config-edit').find('.form-group').eq(i).find('.table-order').val(100 - (i) * 3);

            });
            style = '0';
        } else {
            style = obj.attr('class');
            if ((index != '10' && (Number(index) < 18 || ( Number(index) > 34 && Number(index) < 36)))
                || index == '40' || index == '45' || index == '60' || index == '76' || index == '77' || index == '79' || index == '80' || index == '81' || index == '82' || index == '93') {
                title = obj.find('label:first').attr('title');
            } else if (index == '42') {
                title = obj.attr('title');
                style = '0';

            } else {
                title = obj.text().trim();
                style = '0';
            }
            if (index == '81') {
                element_value = obj.find('p.form-control-static').html().replace('$\{', '').replace('}', '');
            } else if (index == '76') {
                element_id = obj.find('input:last').attr('id');
                element_name = obj.find('input:last').attr('name');
                placeholder = obj.find('input:last').attr('placeholder');
                element_value = obj.find('input:last').attr('value').replace('$\{', '').replace('}', '');
                classs = obj.find('input:last').attr('class');
                is_onlyread = obj.find('input:last').attr('readonly');
                element_id = element_id.replaceAll('End', '');
                element_name = element_name.replaceAll('End', '');
                element_value = element_value.replaceAll('End', '');
            } else if (index == '77') {
                element_id = obj.find('input:last').attr('id');
                element_name = obj.find('input:last').attr('name');
                element_value = obj.find('input:last').attr('value').replace('$\{', '').replace('}', '');
                format = obj.find('input:first').attr('data-format');
                classs = obj.find('input:last').attr('class');
                element_id = element_id.replaceAll('End', '');
                element_name = element_name.replaceAll('End', '');
                element_value = element_value.replaceAll('End', '');

            } else if (index == '8' || index == '61') {//输入框

                element_id = obj.find('input:first').attr('id');
                element_defaultvalue = obj.find('input:first').attr('defaultvalue');
                element_name = obj.find('input:first').attr('name');
                placeholder = obj.find('input:first').attr('placeholder');
                element_value = obj.find('input:first').attr('value').replace('$\{', '').replace('}', '');
                classs = obj.find('input:first').attr('class');
                is_onlyread = obj.find('input:first').attr('readonly');
                is_Showclear = obj.find('i:first').attr('class');
                if (is_Showclear != null && is_Showclear != "") {
                    is_Showclear = 'true';
                } else {
                    is_Showclear = 'fasle';
                }
            } else if (index == '90') {
                element_id = obj.find('input:first').attr('id');
                element_name = obj.find('input:first').attr('name');
                element_value = obj.find('input:first').attr('value').replace('$\{', '').replace('}', '');
            } else if (index == '47') {
                element_name = obj.find('input:first').attr('name');
                var eindex = element_name.lastIndexOf(".");
                element_name = element_name.substring(eindex + 1);
                placeholder = obj.find('input:first').attr('placeholder');
                is_onlyread = obj.find('input:first').attr('readonly');
            } else if (index == '45' || index == '62') {//文本域
                element_id = obj.find('textarea:first').attr('id');
                element_defaultvalue = obj.find('textarea:first').attr('defaultvalue');
                element_name = obj.find('textarea:first').attr('name');
                placeholder = obj.find('textarea:first').attr('placeholder');
                element_value = obj.find('textarea:first').attr('value').replace('$\{', '').replace('}', '');
                classs = obj.find('textarea:first').attr('class');
                is_onlyread = obj.find('textarea:first').attr('readonly');
            } else if (index == '9' || index == '63') {//时间
                element_id = obj.find('input:first').attr('id');
                element_defaultvalue = obj.find('input:first').attr('defaultvalue');
                element_name = obj.find('input:first').attr('name');
                element_value = obj.find('input:first').attr('value').replace('$\{', '').replace('}', '');
                format = obj.find('input:first').attr('data-format');
                classs = obj.find('input:first').attr('class');
                config.minDate = obj.find('input:first').attr('data-minDate');
                config.maxDate = obj.find('input:first').attr('data-maxDate');
            } else if (index == '48') {
                element_name = obj.find('input:first').attr('name');
                var eindex = element_name.lastIndexOf(".");
                element_name = element_name.substring(eindex + 1);
                format = obj.find('input:first').attr('data-format');
                config.minDate = obj.find('input:first').attr('data-minDate');
                config.maxDate = obj.find('input:first').attr('data-maxDate');
            } else if (index == '49') {
                element_name = obj.find('select:first').attr('name');
                var eindex = element_name.lastIndexOf(".");
                element_name = element_name.substring(eindex + 1);
                zdlb = obj.find('select:first').attr('zdlb');
                is_onlyread = obj.find('select:first').attr('disabled');
            } else if (index == '50') {
                element_name = obj.find('select:first').attr('name');
                var eindex = element_name.lastIndexOf(".");
                element_name = element_name.substring(eindex + 1);
                element_value = obj.find('select:first').attr('data-value').replace('$\{', '').replace('}', '');
                table_name = obj.find('select:first').attr('data-table-name');
                select_key = obj.find('select:first').attr('data-field-id');
                select_text = obj.find('select:first').attr('data-field-name');
                field_up_id = obj.find('select:first').attr('data-field-up-id');
                field_up_val = obj.find('select:first').attr('data-file-up-val');
                file_query = obj.find('select:first').attr('data-file-query');
                query_val = obj.find('select:first').attr('data-query-val');
                cur_val = obj.find('select:first').attr('data-cur-val');
                data_childselect = obj.find('select:first').attr('data-childselect');
                classs = obj.find('select:first').attr('class');
                is_onlyread = obj.find('select:first').attr('disabled');
                config.orderField = obj.find('select:first').attr('data-order-field');
                config.orderType = obj.find('select:first').attr('data-order-type');
                if (is_onlyread) is_onlyread = "readonly";
            } else if (index == '51') {
                element_name = obj.find('select:first').attr('name');
                var eindex = element_name.lastIndexOf(".");
                element_name = element_name.substring(eindex + 1);
                is_onlyread = obj.find('select:first').attr('disabled');
            } else if (index == '86') {
                element_name = obj.find('input:first').attr('name');
                var eindex = element_name.lastIndexOf(".");
                element_name = element_name.substring(eindex + 1);
                placeholder = obj.find('textarea:first').attr('placeholder');
                is_onlyread = obj.find('textarea:first').attr('readonly');
            } else if (index == '10' || index == '64') {//隐藏文本框
                element_id = obj.attr('id');
                element_name = obj.attr('name');
                element_value = obj.attr('value').replace('$\{', '').replace('}', '');
            } else if (index == '11' || index == '65') {//字典
                element_id = obj.find('select:first').attr('id');
                element_defaultvalue = obj.find('select:first').attr('defaultvalue');
                element_name = obj.find('select:first').attr('name');
                zdlb = obj.find('select:first').attr('zdlb');
                is_ShowSearchBox = obj.find('select:first').attr('data-show-searchbox');
                if (is_ShowSearchBox == null || is_ShowSearchBox == "") {
                    is_ShowSearchBox = "false";
                }
                element_value = obj.find('select:first').attr('value').replace('$\{', '').replace('}', '');
                classs = obj.find('select:first').attr('class');
                is_onlyread = obj.find('select:first').attr('disabled');
                if (is_onlyread) is_onlyread = "readonly";
            } else if (index == '12' || index == '66' || index == '93') {//select-list
                element_id = obj.find('jundukeji:first').attr('id');
                element_defaultvalue = obj.find('jundukeji:first').attr('defaultvalue');
                element_name = obj.find('jundukeji:first').attr('name');
                zdlb = obj.find('jundukeji:first').attr('zdlb');
                element_value = obj.find('jundukeji:first').attr('data-value').replace('$\{', '').replace('}', '');
                classs = obj.find('jundukeji:first').attr('class');
                items = obj.find('jundukeji:first').attr('items').replace('$\{', '').replace('}', '');
                list_key = obj.find('jundukeji:first').find('option:last').attr('value').replace('$\{items_object.', '').replace('}', '');
                list_value = obj.find('jundukeji:first').find('option:last').html().replace('$\{items_object.', '').replace('}', '');
                is_onlyread = obj.find('select:first').attr('disabled');
                if (is_onlyread) is_onlyread = "readonly";
                is_ShowSearchBox = obj.find('jundukeji:first').attr('data-show-searchbox');
                if (is_ShowSearchBox == null || is_ShowSearchBox == "") {
                    is_ShowSearchBox = "false";
                }
            } else if (index == '13' || index == '67') {//select-table-list
                element_id = obj.find('select:first').attr('id');
                element_defaultvalue = obj.find('select:first').attr('defaultvalue');
                element_name = obj.find('select:first').attr('name');
                element_value = obj.find('select:first').attr('data-value').replace('$\{', '').replace('}', '');
                table_name = obj.find('select:first').attr('data-table-name');
                select_key = obj.find('select:first').attr('data-field-id');
                select_text = obj.find('select:first').attr('data-field-name');
                field_up_id = obj.find('select:first').attr('data-field-up-id');
                field_up_val = obj.find('select:first').attr('data-file-up-val');
                file_query = obj.find('select:first').attr('data-file-query');
                is_ShowSearchBox = obj.find('select:first').attr('data-show-searchbox');
                config.otherQuery = obj.find('select:first').attr('data-other-query');
                if (is_ShowSearchBox == null || is_ShowSearchBox == "") {
                    is_ShowSearchBox = "false";
                }
                query_val = obj.find('select:first').attr('data-query-val');
                cur_val = obj.find('select:first').attr('data-cur-val');
                data_childselect = obj.find('select:first').attr('data-childselect');
                classs = obj.find('select:first').attr('class');
                is_onlyread = obj.find('select:first').attr('disabled');
                config.orderField = obj.find('select:first').attr('data-order-field');
                config.orderType = obj.find('select:first').attr('data-order-type');

                if (is_onlyread) is_onlyread = "readonly";
            } else if (index == '14' || index == '68') {//ajax-select-list
                element_id = obj.find('select:first').attr('id');
                element_defaultvalue = obj.find('select:first').attr('defaultvalue');
                element_name = obj.find('select:first').attr('name');
                element_value = obj.find('select:first').attr('data-value').replace('$\{', '').replace('}', '');
                url = obj.find('select:first').attr('data-select-url').replace('<%="<%=basePath%\>/s/"%>', '');
                classs = obj.find('select:first').attr('class');
                is_onlyread = obj.find('select:first').attr('disabled');
                if (is_onlyread) is_onlyread = "readonly";
            } else if (index == '15' || index == '69') {//searchSelect-select-list
                element_id = obj.find('select:first').attr('id');
                element_defaultvalue = obj.find('select:first').attr('defaultvalue');
                element_name = obj.find('select:first').attr('name');
                element_value = obj.find('select:first').attr('data-value').replace('$\{', '').replace('}', '');
                url = obj.find('select:first').attr('data-select-url').replace('<%="<%=basePath%\>/s/"%>', '');
                default_text = obj.find('select:first').find('option').html()
                    .replace('$\{', '').replace('}', '');
                classs = obj.find('select:first').attr('class');
            } else if (index == '16' || index == '70') {//listCheckbox

                element_name = obj.find('input:eq(1)').attr('name');
                element_value = obj.find('label').eq(1).attr('data-value');
                list_key = obj.find('input:eq(1)').attr('value').replace(
                    '$\{items_object.', '').replace('}', '');
                list_value = obj.find('label').eq(1).attr('data-text');
                items = obj.find('label').eq(1).attr('data-items').replace(
                    '$\{', '').replace('}', '');
                classs = obj.find('input:eq(1)').attr('class');
                is_onlyread = obj.find('input:eq(1)').attr('disabled');
                if (obj.html().indexOf("全选") != -1) {
                    is_checekAll = "checkAll";
                }
                if (is_onlyread) is_onlyread = "readonly";
            } else if (index == '17' || index == '71') {//listradio
                element_name = obj.find('input:first').attr('name');
                element_value = obj.find('label').eq(1).attr('data-value');
                list_key = obj.find('input:first').attr('value').replace(
                    '$\{items_object.', '').replace('}', '');
                list_value = obj.find('label').eq(1).attr('data-text');
                items = obj.find('label').eq(1).attr('data-items').replace(
                    '$\{', '').replace('}', '');
                classs = obj.find('input:first').attr('class');
                is_onlyread = obj.find('input:first').attr('disabled');
                if (is_onlyread) is_onlyread = "readonly";
            } else if ((Number(index) >= 18 && Number(index) <= 34) || index == '78' || index == '91' || index == '92') {//按钮
                element_id = obj.attr('id');
                event_click = obj.attr('onclick');
                icon = obj.find('i').attr('class').replace('fa ', '');
                classs = obj.attr('class');
                btn_size = obj.attr('data-btn-size');
                btn_style = obj.attr('data-btn-class');
                ssyhqx = obj.attr('ssyhqx');
                config.groupJurisdiction = obj.attr('data-group-jurisdiction');
            } else if (index == '40') {//文件上传
                element_id = obj.find('input:last').attr('id');
                element_name = obj.find('input:last').attr('name');
//                element_value = obj.find('input:last').attr('value').replace('$\{', '').replace('}', '');
                file_size = obj.find('input:last').attr('filesize');
                file_type = obj.find('input:last').attr('filetype');
//                file_name = obj.find('input').eq(2).attr('id');
//                file_value = obj.find('input').eq(2).attr('value').replace('$\{', '').replace('}', '');
            } else if (index == '42') {//图片上传
                element_id = obj.find('input:last').attr('id');
                element_name = obj.find('input:last').attr('name');
                file_length = obj.find('input:first').attr('data-filelength');
                if (element_name.indexOf('.') > -1) {
                    element_name = element_name.substring(0, element_name.indexOf('.'));
                }
//                element_value = obj.find('input:last').attr('value').replace('$\{', '').replace('}', '');
                file_width = obj.find('img:last').attr('width');
                config.height = obj.find('img:last').attr('height');
                file_alt = obj.find('img:last').attr('alt');
//                file_name = obj.find('input').eq(2).attr('id');
            } else if (index == '55') {//打开url模态框
                element_id = obj.attr('id');
                icon = obj.find('i').attr('class').replace('fa ', '');
                classs = obj.attr('class');
                btn_size = obj.attr('data-btn-size');
                btn_style = obj.attr('data-btn-class');
                url = obj.attr('data-url');
                config.iframe = obj.attr('data-iframe');
                title = obj.text().trim();
                ssyhqx = obj.attr('ssyhqx');
            } else if (index == '60') {//文本编辑器
                element_id = obj.find('input:first').attr('data-id');
                subPage.selectid = element_id;
                element_name = obj.find('input:first').attr('data-name');
                element_value = obj.find('input:first').attr('data-val');
            } else if (index == '59') {//打开指定id模态框
                element_id = obj.attr('id');
                icon = obj.find('i').attr('class').replace('fa ', '');
                classs = obj.attr('class');
                btn_size = obj.attr('data-btn-size');
                btn_style = obj.attr('data-btn-class');
                title = obj.text().trim();
                ssyhqx = obj.attr('ssyhqx');
                //tool.openModalStatic('modal-2','自定义模态框',sample
                var temp = obj.attr('onclick').replace('tool.openModalStatic(', '').replace(')', '').split(',');
                modalTitle = temp[1].replaceAll('\'', '');
                callback = temp[2];
                modalId = temp[0].replaceAll('\'', '');
            } else if (index == '57') {//模态框
                group_name = obj.attr('data-group-name');
                element_id = obj.attr('id');
            } else if (index == '58') {//自定义模态框
                group_name = obj.attr('data-group-name');
                element_id = obj.attr('id');
                modalCode = obj.html();
            } else if (index == '82') {//图片截取
                var _obj = obj.find('[data-aspectratio]');
                config.aspectRatio = _obj.attr('data-aspectRatio');
                config.calback = _obj.attr('data-callback');
                config.val = _obj.attr('data-val');
            } else if (index == '84') {//ztree
                var _obj = obj.find('ul');
                config.setting = _obj.attr('data-setting');
                config.calback = _obj.attr('data-callback');
                config.url = _obj.attr('data-url');
            }
            if (index == '61' || index == '62' || index == '63' || index == '64' || index == '65' || index == '66' || index == '67' ||
                index == '68' || index == '69' || index == '70' || index == '71') {//数据比对部分
                dataComparison = obj.find('.display-value').html().replace('$\{', '').replace('}', '');
                title = obj.find('label:first').attr('title');
            }
            if (index == '72' || index == '73' || index == '80') {
                title = obj.find('label:first').attr('title');
                items = obj.find('tbody').attr('items').replace('$\{', '').replace('}', '').replace('object.', '');
                file_type = obj.find('input:last').attr('data-filetype');
                file_length = obj.find('input:last').attr('data-filelength');
                file_size = obj.find('input:last').attr('data-filesize');
                element_id = obj.find('input:last').attr('id');
            }
            if (index == '79') {
                getobj('#idcard-posivtive').val(obj.find('input:hidden').eq(1).attr('name'));
                getobj('#idcard-other').val(obj.find('input:hidden').eq(3).attr('name'));
            }
            if (index == '85') {
                title = obj.find('label:first').attr('title');
                element_id = obj.find('p:first').attr('id');
                ratyCount = obj.find('p:first').attr('score-val');
            }
            if (index == '83') {
                element_id = obj.find('img:first').attr('id');
                element_name = obj.find('img:first').attr('name');
                src = obj.find('img:first').attr('src');
            }
            if (index == '88') {
                config.data = obj.attr('data-data');
                config.url = obj.attr('data-url');
                element_id = obj.find('div').attr('id');
                style = '0';
            }
            if (classs.indexOf('validate[') != -1) {
                validate = classs.substring(classs.indexOf('validate[') + 9, classs.indexOf("] "));
            }

            style = style.replace(' more-query', '');

            if (style == 'col-xs-12 nopadding edit-element') {
                style = '0';
            } else if (style == 'col-xxxl-4 col-md-6 col-sm-12 nopadding edit-element') {
                style = '1';
            } else if (style == 'col-xxxl-3 col-md-4 col-sm-6 col-xs-12 nopadding edit-element') {
                style = '2';
            } else if (style == 'corppre-default') {
                style = '3';
            }
        }
        if (title == null || title == '') {
            if (obj.find('label:first').length > 0) {
                title = obj.find('label:first').attr('data-original-title');
            }
        }
        config.customClass = obj.attr('data-custom-class');
        if (moreQuery) {
            getobj('#more-query').val('more-query');
            initSelectBySelector('.my-modal #more-query');
        }
        getobj('#min-date').val(config.minDate);
        getobj('#max-date').val(config.maxDate);
        getobj('#data-order-field').val(config.orderField);
        getobj('#jsppath').val(jsppath);
        getobj('#data-order-type').val(config.orderType);
        getobj('#dataComparison').val(dataComparison);
        getobj('#callback').val(callback);
        getobj('#modal-id').val(modalId);
        initSelectBySelector('.my-modal #modal-id');
        getobj('#modalTitle').val(modalTitle);
        getobj('#style').val(style);
        initSelectBySelector('.my-modal #style');
        getobj('#group-genus').val(group_genus);
        initSelectBySelector('.my-modal #group-genus');
        getobj('#group-name').val(group_name);
        getobj('#title').val(title);
        getobj('#order').val(order);
        getobj('#class').val(classs);
        getobj('#otherQuery').val(config.otherQuery);
        getobj('#data-custom-class').val(config.customClass);
        getobj('#element-id-1').val(element_id);
        getobj('#element-id').val(element_id);
        if (getobj('#element-id').val() == null || getobj('#element-id').val() == '') {
            getobj('#element-id-1').removeAttr('readonly');
            getobj('#element-id').val('');
        } else {
            getobj('#element-id-1').val('');
        }
        //initSelectBySelector('.my-modal #element-id');
        getobj('#file-height').val(config.height);
        getobj('#finish-fun').val(finishFun);
        getobj('#element-name').val(element_name);
        getobj('#field-up-val').val(field_up_val);
        getobj('#method').val(method);
        getobj('#maxDatalength').val(config.maxDatalength);
        getobj('#element-value').val(element_value);
        getobj('#element-type').val(element_type);
        getobj('#table-name').val(table_name);
        if (element_defaultvalue != 'undefined') getobj('#element-defaultvalue').val(element_defaultvalue);
        getobj('#select-key').val(select_key);
        getobj('#select-text').val(select_text);
        getobj('#field-up-id').val(field_up_id);
        getobj('#field-up-val').val(field_up_val);
        getobj('#file-query').val(file_query);
        getobj('#query-val').val(query_val);
        getobj('#data-childselect').val(data_childselect);
        getobj('#select-list').val(select_list);
        getobj('#list-key').val(list_key);
        getobj('#list-value').val(list_value);
        getobj('#format').val(format);
        initSelectBySelector('.my-modal #format');
        if (config.groupJurisdiction != null && config.groupJurisdiction != '') {
            getobj('#group-jurisdiction').val(config.groupJurisdiction.split(','));
            initSelectBySelector('.my-modal #group-jurisdiction');
        }
        getobj('#zdlb').val(zdlb);
        getobj('#width').val(width);
        getobj('#items').val(items);
        getobj('#url').val(url);
        getobj('#src').val(src);
        getobj('#default-text').val(default_text);
        getobj('#event-click').val(event_click);
        getobj('#icon').val(icon);
        getobj('#btn-size').val(btn_size);
        getobj('#btn-style').val(btn_style);
        getobj('#if-test').val(if_test);
        getobj('#checkbox-id').val(checkbox_id);
        getobj('#checkbox-url').val(checkbox_url);
        getobj('#file-size').val(file_size);
        getobj('#file-length').val(file_length);
        getobj('#file-size').val(file_size);
        getobj('#file-width').val(file_width);
        getobj('#file-alt').val(file_alt);
        getobj('#file-type').val(file_type);
        getobj('#file-name').val(file_name);
        getobj('#file-value').val(file_value);
        getobj('#label-box').val(label_box);
        getobj('#in-color').val(in_color);
        getobj('#in-wb-color').val(in_wb_color);
        getobj('#tit-remind').val(tit_remind);
        getobj('#placeholder').val(placeholder);
        getobj('#is-onlyread').val(is_onlyread);
        getobj('#is-checekAll').val(is_checekAll);
        getobj('#is-ShowSearchBox').val(is_ShowSearchBox);
        getobj('#inputWidth').val(inputWidth);
        getobj('')
        getobj('#lcbm').val(lcbm);
        getobj('#ssyhqx').val(ssyhqx);
        getobj('#data-cur-val').val(cur_val);
        getobj('#modal-code').val(modalCode);
        getobj('#iframe').val(config.iframe);
        getobj('#ratyCount').val(ratyCount);
        if (index == '82') {
            getobj('#aspectRatio').val(config.aspectRatio);
            getobj('#callback').val(config.calback);
            getobj('#element-value').val(config.val);
        } else if (index == '84') {//ztree
            getobj('#setting').val(config.setting);
            getobj('#callback').val(config.calback);
        }

        getobj('#ajax-url').val(config.url);
        getobj('#ajax-data').val(config.data);
        getobj('#is-his').val(config.dataHis);
        initSelectBySelector('.my-modal #is-his');
        initSelectBySelector('.my-modal #ssyhqx');
        initSelectBySelector('.my-modal #is-onlyread');
        initSelectBySelector('.my-modal #is-checekAll');
        initSelectBySelector('.my-modal #is-ShowSearchBox');
        initSelectBySelector('.my-modal #is-Showclear');
        initSelectBySelector('.my-modal #width');
        initSelectBySelector('.my-modal #btn-size');
        initSelectBySelector('.my-modal #btn-style');
        initSelectBySelector('.my-modal #zdlb');
        initSelectBySelector('.my-modal #iframe');
        initvalidate(validate);//初始化验证条件
        initFileType(file_type)//初始化文件类型选择

    }


    //新增默认按钮初始化
    function initbutton(el, index) {
        var style = '', group_genus = '', group_name = '', title = '', order = '', classs = '', element_id = '',
            element_name = '', method = '', element_value = '', element_type = '', table_name = '', select_key = '',
            select_text = '', field_up_id = '', field_up_val = '', file_query = '', query_val = '',
            data_childselect = '', select_list = '', list_key = '', list_value = '', format = '', zdlb = '', width = '',
            validate = '', items = '', url = '', default_text = '', event_click = '', icon = '', btn_size = '',
            btn_style = '', ssyhqx = '';
        style = '0';
        btn_size = 'btn btn-sm';
        if (index == '19') {
            title = '新增';
            element_id = 'newbtn';
            event_click = 'tool.addDataByLcbm(this,lcbm)';
            icon = 'fa-plus';
            btn_style = 'btn-success';
            order = '100';
            ssyhqx = '06';
        } else if (index == '20') {
            title = '删除';
            element_id = 'removebtn';
            event_click = 'tool.doRemove(this)';
            icon = 'fa-times';
            btn_style = 'btn-success';
            order = '95';
            ssyhqx = '08';
        } else if (index == '21') {
            title = '修改';
            element_id = 'editbtn';
            event_click = 'tool.editData(this)';
            icon = 'fa-edit';
            btn_style = 'btn-success';
            order = '90';
            ssyhqx = '07';
        } else if (index == '22') {
            title = '保存';
            element_id = 'savebtn';
            event_click = 'tool.saveData(this,null,null,null)';
            icon = 'fa-check';
            btn_style = 'btn-success';
            order = '1';
        } else if (index == '34') {
            title = '暂存';
            element_id = 'savbtn';
            event_click = 'tool.saveData(this,null,null,true)';
            icon = 'fa-check';
            btn_style = 'btn-success';
            order = '1';
        } else if (index == '23') {
            title = '上报';
            element_id = 'sbbtn';
            event_click = 'tool.report_s(this, lcbm, \'3\',null,null, null,null)';
            icon = 'fa-arrow-circle-up';
            btn_style = 'btn-success';
            order = '80';
            ssyhqx = '10';
        } else if (index == '24') {
            title = '审核通过';
            element_id = 'shtgbtn';
            event_click = 'tool.report_s(this, lcbm, \'1\',null,null, null,null)';
            icon = 'fa-share';
            btn_style = 'btn-success';
            order = '85';
            ssyhqx = '11';
        } else if (index == '25') {
            title = '审核退回';
            element_id = 'shthbtn';
            event_click = 'tool.report_open(this, lcbm, \'2\',null,null, null,null)';
            icon = 'fa-reply';
            btn_style = 'btn-success';
            order = '83';
            ssyhqx = '11';
        } else if (index == '26') {
            title = '审核通过并上报';
            element_id = 'shtgsbbtn';
            event_click = 'tool.report_s(this, lcbm, \'4\',null,null, null,null)';
            icon = 'fa-arrow-circle-up';
            btn_style = 'btn-success';
            order = '84';
            ssyhqx = '11';
        } else if (index == '27') {
            title = '取消';
            element_id = 'qxbtn';
            event_click = 'tool.report_s(this, lcbm, \'-1\',null,null, null,null)';
            icon = 'fa-reply-all';
            btn_style = 'btn-success';
            order = '79';
            ssyhqx = '11';
        } else if (index == '33') {
            title = '作废';
            element_id = 'zfbtn';
            event_click = 'tool.report_s(this, lcbm, \'-2\',null,null, null,null)';
            icon = 'fa-reply-all';
            btn_style = 'btn-success';
            order = '79';
            ssyhqx = '11';
        } else if (index == '28') {
            title = '导出';
            element_id = 'exportbtn';
            event_click = 'tool.exportData(jsp, path)';
            icon = 'fa-sign-out';
            btn_style = 'btn-success';
            order = '70';
            ssyhqx = '04';
        } else if (index == '29') {
            title = '打印报表';
            element_id = 'printbtn';
            event_click = '';
            icon = 'fa-print';
            btn_style = 'btn-success';
            order = '60';
            ssyhqx = '05';
        } else if (index == '30') {
            title = '查询2';
            element_id = 'searchbtn';
            event_click = 'tool.doSearch(this)';
            icon = 'fa-search';
            btn_style = 'btn-primary';
            order = '3';
        } else if (index == '91') {
            title = '存为书签';
            element_id = 'saveSerarch';
            event_click = 'tool.doSaveSearch(this)';
            icon = 'fa-tag';
            btn_style = 'btn-primary';
            order = '1';
        } else if (index == '92') {
            title = '按钮下拉';
            element_id = 'selectbtn';
            event_click = '';
            icon = '';
            btn_style = 'btn-success';
            order = '1';
        }
        else if (index == '31') {
            title = '重置';
            element_id = 'resetbtn';
            event_click = 'tool.resetForm(this)';
            icon = 'fa-reply';
            btn_style = 'btn-primary';
            order = '2';
        } else if (index == '32') {
            title = '导入';
            element_id = 'importbtn';
            event_click = 'tool.importData(this,\'importTempID=&table_type=&tzurl=\',name)';
            icon = 'fa-sign-in';
            btn_style = 'btn-success';
            order = '22';
            ssyhqx = '09';
        } else if (index == '78') {
            title = '更多';
            element_id = 'more-query';
            event_click = 'tool.showAllQueryTeam(this)';
            icon = 'fa-angle-down';
            btn_style = 'btn-primary';
            order = '1';
        }
        getobj('#style').val(style);
        getobj('#order').val(order);
        initSelectBySelector('.my-modal #style');
        getobj('#title').val(title);
        getobj('#element-id').val(element_id);
        getobj('#event-click').val(event_click);
        getobj('#icon').val(icon);
        getobj('#btn-size').val(btn_size);
        getobj('#btn-style').val(btn_style);
        getobj('#ssyhqx').val(ssyhqx);
        initSelectBySelector('.my-modal #ssyhqx');
        initSelectBySelector('.my-modal #btn-size');
        initSelectBySelector('.my-modal #btn-style');
    }
    function copy_code(copyText) {
        var copy_o;
        if (tabModel) {
            if ($('body', document).find('#flashcopier').length == 0) {
                $('body', document).append('<div id="flashcopier"></div>');
            }
            copy_o = $('body', document).find('#flashcopier');
        } else {
            if ($('#flashcopier').length == 0) {
                $('body').append('<div id="flashcopier"></div>');
            }
            copy_o = $('#flashcopier');
        }
        copy_o.html(copyText);
    }
    function get_code() {
        var htm = '';
        if (tabModel) {
            htm = $('body', document).find('#flashcopier').html();
        } else {
            htm = $('#flashcopier').html();
        }
        if (htm != null && htm != '') {
            htm = htm.replaceAll("data-wid=\"", "data-wid=\"" + getNewElementId());
        }
        return htm;
    }
    function get_code_obj() {
        return get_obj_body('#flashcopier');
    }
    function get_obj_body(selector) {
        if (tabModel) {
            return $('body', document).find(selector);
        } else {
            return $(selector);
        }
    }
    //修改时获取初始化对象
    function getobj(selector) {
        var validate_o;
        if (tabModel) {
            validate_o = $('.my-modal', document).find(selector);
        } else {
            validate_o = $(selector);
        }
        return validate_o;
    }


    //修改可编辑表格的内容


</script>