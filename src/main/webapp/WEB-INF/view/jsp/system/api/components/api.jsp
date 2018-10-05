<%@ page language="java" pageEncoding="utf-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path;
%>
<%@ taglib prefix="jd" uri="/WEB-INF/TLD/custom.tld" %>
<h1 id="form">表单</h1>

<h2 id="form-explain">说明</h2>

<p>
    表单对象需要放到form中
    <pre class="syntax brush-html">
&lt;form class="form-horizontal"&gt;
    &lt;!-- start:表单 --!&gt;
    &lt;!-- end:表单 --!&gt;
&lt;/form&gt;</pre>
</p>

<h2 id="form-input">文本框</h2>

<p>

<pre class="syntax brush-html">
&lt;form class="form-horizontal"&gt;
    &lt;!-- start:表单 --!&gt;
    &lt;!-- jd:lable中的id解析之后为lable的for --!&gt;
    &lt;jd:lable col="1" id="sample-input" lable="普通文本框"&gt;
        &lt;input type="text" id="sample-input" name="sample-input" class="form-control"&gt;
    &lt;/jd:lable&gt;
    &lt;!-- end:表单 --!&gt;
&lt;/form&gt;
</pre>
<jd:panel className="panel-white mt20" title="文本框示例">
    <form class="form-horizontal">
        <jd:lable col="1" lable="普通文本框">
            <input type="text" class="form-control">
        </jd:lable>
    </form>
</jd:panel>
<jd:panel className="panel-white mt20" title="常用文本框示例">
    <form class="form-horizontal">
        <div class="form-group">
            <label class="col-sm-2 col-xs-3  control-label" for="form-field-1">
                文本框：
            </label>
            <div class="col-sm-9 col-xs-8">
                <input type="text" placeholder="Text Field" id="form-field-1" class="form-control"/>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label" for="form-field-2">
                密码框：
            </label>
            <div class="col-sm-9">
                <input type="password" placeholder="Password" id="form-field-2" class="form-control">
            </div>
        </div>
        <div class="form-group has-success">
            <label class="col-sm-2 control-label" for="form-field-3">
                成功：
            </label>
            <div class="col-sm-9">
                <input type="text" id="form-field-3" class="form-control">
            </div>
        </div>
        <div class="form-group has-warning">
            <label class="col-sm-2 control-label" for="form-field-4">
                警告：
            </label>
            <div class="col-sm-9">
                <input type="text" id="form-field-4" class="form-control">
            </div>
        </div>
        <div class="form-group has-error">
            <label class="col-sm-2 control-label" for="form-field-5">
                错误：
            </label>
            <div class="col-sm-9">
                <input type="text" id="form-field-5" class="form-control">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label" for="form-field-7">
                提示 (右)：
            </label>
            <div class="col-sm-7">
                <input type="text" placeholder="Text Field" id="form-field-7" class="form-control">
            </div>
            <span class="help-inline col-sm-2"> <i class="fa fa-info-circle"></i> 这里是提示信息... </span>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label" for="form-field-8">
                Tooltip 文本框：
            </label>
            <div class="col-sm-9">
                <input id="form-field-8" class="form-control tooltips" type="text" data-placement="top" title=""
                       placeholder="Tooltip on hover" data-rel="tooltip" data-original-title="Hello Tooltip!">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">
                不同大小的文本框：
            </label>
            <div class="col-sm-2">
                <input type="text" placeholder="Text Field" id="form-field-9" class="form-control">
            </div>
            <div class="col-sm-3">
                <input type="text" placeholder="Text Field" id="form-field-10" class="form-control">
            </div>
            <div class="col-sm-4">
                <input type="text" placeholder="Text Field" id="form-field-11" class="form-control">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">
                带图标的文本框：
            </label>
            <div class="col-sm-3">
            <span class="input-icon">
                <input type="text" placeholder="Text Field" id="form-field-14" class="form-control">
                <i class="fa fa-user"></i>
            </span>
            </div>
            <div class="col-sm-3">
            <span class="input-icon">
                <input type="text" placeholder="Text Field" id="form-field-15" class="form-control">
                <i class="fa fa-quote-left"></i>
            </span>
            </div>
            <div class="col-sm-3">
            <span class="input-icon">
                <input type="text" placeholder="Text Field" id="form-field-16" class="form-control">
                <i class="fa fa-hand-o-right"></i>
            </span>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">
                图标在右边：
            </label>
            <div class="col-sm-3">
            <span class="input-icon input-icon-right">
                <input type="text" placeholder="Text Field" id="form-field-17" class="form-control">
                <i class="fa fa-rocket"></i>
            </span>
            </div>
            <div class="col-sm-3">
            <span class="input-icon input-icon-right">
                <input type="text" placeholder="Text Field" id="form-field-18" class="form-control">
                <i class="fa fa-quote-right"></i>
            </span>
            </div>
            <div class="col-sm-3">
            <span class="input-icon input-icon-right">
                <input type="text" placeholder="Text Field" id="form-field-19" class="form-control">
                <i class="fa fa-hand-o-left"></i>
            </span>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label" for="form-field-21">
                禁用的文本框：
            </label>
            <div class="col-sm-9">
                <input type="text" placeholder="Text Field" id="form-field-21" class="form-control" disabled="disabled">
            </div>
        </div>
    </form>
</jd:panel>
</p>

<h2 id="form-select">下拉框</h2>

<p>
<pre class="syntax brush-html">
&lt;!-- 为保持风格统一,请尽量使用自定义样式(基于select2) --!&gt;
&lt;jd:lable col="1" lable="自定义样式"&gt;
    &lt;select class="form-control select2-auto"&gt;
        &lt;option value=""&gt;&nbsp;&lt;/option&gt;
        &lt;option value="1"&gt;下拉选项1&lt;/option&gt;
        &lt;option value="2"&gt;下拉选项2&lt;/option&gt;
        &lt;option value="3"&gt;下拉选项3&lt;/option&gt;
    &lt;/select&gt;
&lt;/jd:lable&gt;
&lt;!-- 从字典表中加载数据,需要在select的class中添加select2-code,并添加属性zdlb --!&gt;
&lt;jd:lable col="1" lable="从字典中加载"&gt;
    &lt;select class="form-control select2-code" zdlb="mz"&gt;&lt;/select&gt;
&lt;/jd:lable&gt;

</pre>
<jd:panel className="panel-white mt20" title="下拉框示例">
    <form class="form-horizontal">
        <jd:lable col="1" lable="默认样式">
            <select class="form-control">
                <option value="">&nbsp;</option>
                <option value="1">下拉选项1</option>
                <option value="2">下拉选项2</option>
                <option value="3">下拉选项3</option>
            </select>
        </jd:lable>
        <jd:lable col="1" lable="自定义样式">
            <select class="form-control select2-auto">
                <option value="">&nbsp;</option>
                <option value="1">下拉选项1</option>
                <option value="2">下拉选项2</option>
                <option value="3">下拉选项3</option>
            </select>
        </jd:lable>
        <jd:lable col="1" lable="从字典中加载">
            <select class="form-control select2-code" zdlb="mz"></select>
        </jd:lable>
    </form>
</jd:panel>
</p>

<h2 id="form-radio">单选框</h2>

<p>

<jd:panel className="panel-white mt20" title="常用单选框示例">
    <form class="form-horizontal">
        <label class="radio-inline">
            <input type="radio" value="" name="optionsRadios" class="grey">
            Radio Button 1
        </label>
        <label class="radio-inline">
            <input type="radio" value="" name="optionsRadios" class="grey">
            Radio Button 2
        </label>
        <h5 class="space15"> Vertical radio </h5>
        <div class="radio">
            <label>
                <input type="radio" value="" name="optionsRadios2" class="grey">
                Radio Button 1
            </label>
        </div>
        <div class="radio">
            <label>
                <input type="radio" value="" name="optionsRadios2" class="grey">
                Radio Button 2
            </label>
        </div>
        <div class="radio">
            <label>
                <input type="radio" value="" name="optionsRadios2" class="grey">
                Radio Button 3
            </label>
        </div>
        <div class="radio">
            <label>
                <input type="radio" value="" name="optionsRadios2" class="grey" disabled="disabled">
                Disabled
            </label>
        </div>
        <h5 class="space15"> Verious Colours </h5>
        <label class="radio-inline">
            <input type="radio" class="red" value="" checked="checked" name="optionsRadios3">
            Radio Button 1
        </label>
        <label class="radio-inline">
            <input type="radio" class="green" value="" checked="checked" name="optionsRadios4">
            Radio Button 2
        </label>
        <label class="radio-inline">
            <input type="radio" class="teal" value="" checked="checked" name="optionsRadios5">
            Radio Button 3
        </label>
        <label class="radio-inline">
            <input type="radio" class="orange" value="" checked="checked" name="optionsRadios6">
            Radio Button 4
        </label>
        <label class="radio-inline">
            <input type="radio" class="purple" value="" checked="checked" name="optionsRadios7">
            Radio Button 5
        </label>
        <label class="radio-inline">
            <input type="radio" class="yellow" value="" checked="checked" name="optionsRadios8">
            Radio Button 6
        </label>
        <h5 class="space15"> Verious Styles </h5>
        <label class="radio-inline">
            <input type="radio" class="square-black" value="" checked="checked" name="optionsRadios9">
            Radio Button 1
        </label>
        <label class="radio-inline">
            <input type="radio" class="square-grey" value="" checked="checked" name="optionsRadios10">
            Radio Button 2
        </label>
        <label class="radio-inline">
            <input type="radio" class="square-red" value="" checked="checked" name="optionsRadios11">
            Radio Button 3
        </label>
        <label class="radio-inline">
            <input type="radio" class="square-green" value="" checked="checked" name="optionsRadios12">
            Radio Button 4
        </label>
        <label class="radio-inline">
            <input type="radio" class="square-teal" value="" checked="checked" name="optionsRadios13">
            Radio Button 5
        </label>
        <label class="radio-inline">
            <input type="radio" class="square-orange" value="" checked="checked" name="optionsRadios14">
            Radio Button 6
        </label>
        <label class="radio-inline">
            <input type="radio" class="square-purple" value="" checked="checked" name="optionsRadios15">
            Radio Button 7
        </label>
        <label class="radio-inline">
            <input type="radio" class="square-yellow" value="" checked="checked" name="optionsRadios16">
            Radio Button 8
        </label>
        <h5 class="space15"> Verious Styles </h5>
        <label class="radio-inline">
            <input type="radio" class="flat-black" value="" checked="checked" name="optionsRadios17">
            Radio Button 1
        </label>
        <label class="radio-inline">
            <input type="radio" class="flat-grey" value="" checked="checked" name="optionsRadios18">
            Radio Button 2
        </label>
        <label class="radio-inline">
            <input type="radio" class="flat-red" value="" checked="checked" name="optionsRadios19">
            Radio Button 3
        </label>
        <label class="radio-inline">
            <input type="radio" class="flat-green" value="" checked="checked" name="optionsRadios20">
            Radio Button 4
        </label>
        <label class="radio-inline">
            <input type="radio" class="flat-teal" value="" checked="checked" name="optionsRadios21">
            Radio Button 5
        </label>
        <label class="radio-inline">
            <input type="radio" class="flat-orange" value="" checked="checked" name="optionsRadios22">
            Radio Button 6
        </label>
        <label class="radio-inline">
            <input type="radio" class="flat-purple" value="" checked="checked" name="optionsRadios23">
            Radio Button 7
        </label>
        <label class="radio-inline">
            <input type="radio" class="flat-yellow" value="" checked="checked" name="optionsRadios24">
            Radio Button 8
        </label>
    </form>
</jd:panel>
</p>

<h2 id="form-checkbox">复选框</h2>

<p>
<jd:panel className="panel-white mt20" title="常用复选框示例">
    <form class="form-horizontal">
        <h5 class="space15"> Inline Checkbox </h5>
        <label class="checkbox-inline">
            <input type="checkbox" value="" class="grey">
            Checkbox 1
        </label>
        <label class="checkbox-inline">
            <input type="checkbox" value="" class="grey">
            Checkbox 2
        </label>
        <h5 class="space15"> Vertical Checkbox </h5>
        <div class="checkbox">
            <label>
                <input type="checkbox" value="" class="grey">
                Checkbox 1
            </label>
        </div>
        <div class="checkbox">
            <label>
                <input type="checkbox" value="" class="grey">
                Checkbox 2
            </label>
        </div>
        <div class="checkbox">
            <label>
                <input type="checkbox" value="" class="grey">
                Checkbox 3
            </label>
        </div>
        <div class="checkbox">
            <label>
                <input type="checkbox" value="" class="grey" disabled="disabled">
                Disabled
            </label>
        </div>
        <h5 class="space15"> Verious Colours </h5>
        <label class="checkbox-inline">
            <input type="checkbox" class="red" value="" checked="checked">
            Checkbox 1
        </label>
        <label class="checkbox-inline">
            <input type="checkbox" class="green" value="" checked="checked">
            Checkbox 2
        </label>
        <label class="checkbox-inline">
            <input type="checkbox" class="teal" value="" checked="checked">
            Checkbox 3
        </label>
        <label class="checkbox-inline">
            <input type="checkbox" class="orange" value="" checked="checked">
            Checkbox 4
        </label>
        <label class="checkbox-inline">
            <input type="checkbox" class="purple" value="" checked="checked">
            Checkbox 5
        </label>
        <label class="checkbox-inline">
            <input type="checkbox" class="yellow" value="" checked="checked">
            Checkbox 6
        </label>
        <h5 class="space15"> Verious Styles </h5>
        <label class="checkbox-inline">
            <input type="checkbox" class="square-black" value="" checked="checked">
            Checkbox 1
        </label>
        <label class="checkbox-inline">
            <input type="checkbox" class="square-grey" value="" checked="checked">
            Checkbox 2
        </label>
        <label class="checkbox-inline">
            <input type="checkbox" class="square-red" value="" checked="checked">
            Checkbox 3
        </label>
        <label class="checkbox-inline">
            <input type="checkbox" class="square-green" value="" checked="checked">
            Checkbox 4
        </label>
        <label class="checkbox-inline">
            <input type="checkbox" class="square-teal" value="" checked="checked">
            Checkbox 5
        </label>
        <label class="checkbox-inline">
            <input type="checkbox" class="square-orange" value="" checked="checked">
            Checkbox 6
        </label>
        <label class="checkbox-inline">
            <input type="checkbox" class="square-purple" value="" checked="checked">
            Checkbox 7
        </label>
        <label class="checkbox-inline">
            <input type="checkbox" class="square-yellow" value="" checked="checked">
            Checkbox 8
        </label>
        <h5 class="space15"> Verious Styles </h5>
        <label class="checkbox-inline">
            <input type="checkbox" class="flat-black" value="" checked="checked">
            Checkbox 1
        </label>
        <label class="checkbox-inline">
            <input type="checkbox" class="flat-grey" value="" checked="checked">
            Checkbox 2
        </label>
        <label class="checkbox-inline">
            <input type="checkbox" class="flat-red" value="" checked="checked">
            Checkbox 3
        </label>
        <label class="checkbox-inline">
            <input type="checkbox" class="flat-green" value="" checked="checked">
            Checkbox 4
        </label>
        <label class="checkbox-inline">
            <input type="checkbox" class="flat-teal" value="" checked="checked">
            Checkbox 5
        </label>
        <label class="checkbox-inline">
            <input type="checkbox" class="flat-orange" value="" checked="checked">
            Checkbox 6
        </label>
        <label class="checkbox-inline">
            <input type="checkbox" class="flat-purple" value="" checked="checked">
            Checkbox 7
        </label>
        <label class="checkbox-inline">
            <input type="checkbox" class="flat-yellow" value="" checked="checked">
            Checkbox 8
        </label>
    </form>
</jd:panel>
</p>

<h2 id="form-date">日期插件</h2>

<p>
<pre class="syntax brush-html">
&lt;!-- 日期插件需要添加 data-element-type="datepicker" 属性--&gt;
&lt;jd:lable col="1" lable="日期插件"&gt;
    &lt;input type="text" class="form-control" data-element-type="datetimepicker" &gt;
&lt;/jd:lable&gt;
</pre>
<jd:panel className="panel-white mt20" title="常用日期插件示例">
    <form class="form-horizontal">
        <jd:lable col="1" lable="默认日期">
            <input type="text" class="form-control" data-element-type="datetimepicker">
        </jd:lable>
    </form>
</jd:panel>
如日期需要精确到时间可设置 <code>data-format</code> 为 <code>YYYY-MM-DD HH:mm:ss</code>
<jd:panel className="panel-white mt20" title="常用日期插件示例">
    <form class="form-horizontal">
        <jd:lable col="1" lable="YYYY-MM-DD HH:mm:ss">
            <input type="text" class="form-control" data-element-type="datetimepicker" data-format="YYYY-MM-DD HH:mm:ss">
        </jd:lable>
        <jd:lable col="1" lable="YYYY-MM">
            <input type="text" class="form-control" data-element-type="datetimepicker" data-format="YYYY-MM">
        </jd:lable>
        <jd:lable col="1" lable="YYYY">
            <input type="text" class="form-control" data-element-type="datetimepicker" data-format="YYYY">
        </jd:lable>
        <jd:lable col="1" lable="HH:mm:ss">
            <input type="text" class="form-control" data-element-type="datetimepicker" data-format="HH:mm:ss">
        </jd:lable>
        <jd:lable col="1" lable="HH:mm">
            <input type="text" class="form-control" data-element-type="datetimepicker" data-format="HH:mm">
        </jd:lable>
    </form>
</jd:panel>
如需要其他日期时间格式,请参考下表定义 <code>data-format</code>
<table class="table table-striped table-bordered">
    <tbody>
    <tr>
        <th></th>
        <th>Token</th>
        <th>Output</th>
    </tr>
    <tr>
        <td><b>年</b></td>
        <td>YY</td>
        <td>70 71 ... 29 30</td>
    </tr>
    <tr>
        <td></td>
        <td>YYYY</td>
        <td>1970 1971 ... 2029 2030</td>
    </tr>
    <tr>
        <td><b>月</b></td>
        <td>M</td>
        <td>1 2 ... 11 12</td>
    </tr>
    <tr>
        <td></td>
        <td>Mo</td>
        <td>1st 2nd ... 11th 12th</td>
    </tr>
    <tr>
        <td></td>
        <td>MM</td>
        <td>01 02 ... 11 12</td>
    </tr>
    <tr>
        <td></td>
        <td>MMM</td>
        <td>Jan Feb ... Nov Dec</td>
    </tr>
    <tr>
        <td></td>
        <td>MMMM</td>
        <td>January February ... November December</td>
    </tr>
    <tr>
        <td><b>日</b></td>
        <td>D</td>
        <td>1 2 ... 30 31</td>
    </tr>
    <tr>
        <td></td>
        <td>Do</td>
        <td>1st 2nd ... 30th 31st</td>
    </tr>
    <tr>
        <td></td>
        <td>DD</td>
        <td>01 02 ... 30 31</td>
    </tr>
    <tr>
        <td><b>AM/PM</b></td>
        <td>A</td>
        <td>AM PM</td>
    </tr>
    <tr>
        <td></td>
        <td>a</td>
        <td>am pm</td>
    </tr>
    <tr>
        <td><b>时</b></td>
        <td>H</td>
        <td>0 1 ... 22 23</td>
    </tr>
    <tr>
        <td></td>
        <td>HH</td>
        <td>00 01 ... 22 23</td>
    </tr>
    <tr>
        <td></td>
        <td>h</td>
        <td>1 2 ... 11 12</td>
    </tr>
    <tr>
        <td></td>
        <td>hh</td>
        <td>01 02 ... 11 12</td>
    </tr>
    <tr>
        <td><b>分</b></td>
        <td>m</td>
        <td>0 1 ... 58 59</td>
    </tr>
    <tr>
        <td></td>
        <td>mm</td>
        <td>00 01 ... 58 59</td>
    </tr>
    <tr>
        <td><b>秒</b></td>
        <td>s</td>
        <td>0 1 ... 58 59</td>
    </tr>
    <tr>
        <td></td>
        <td>ss</td>
        <td>00 01 ... 58 59</td>
    </tr>
    <tr>
        <td colspan="2">如需其他格式,请参考</td>
        <td><a target="_blank" href="http://momentjs.com/docs/#/displaying/format/">http://momentjs.com/docs/#/displaying/format/</a></td>
    </tr>
    </tbody>
</table>
<pre class="syntax brush-html">
&lt;!-- 如需设置 最大/最小 时间,可添加 data-maxDate/data-minDate 属性,格式为 YYYY-MM-DD --&gt;
&lt;jd:lable col="1" lable="日期插件"&gt;
    &lt;input type="text" class="form-control" data-element-type="datetimepicker" data-minDate="2016-01-15" &gt;
&lt;/jd:lable&gt;
</pre>
<jd:panel className="panel-white mt20" title="常用日期插件示例">
    <form class="form-horizontal">
        <jd:lable col="1" lable="日期示例">
            <input type="text" class="form-control" data-element-type="datetimepicker" data-minDate="2016-01-15">
        </jd:lable>
    </form>
</jd:panel>
<pre class="syntax brush-html">
&lt;!-- 起止时间 --&gt;
&lt;!-- 添加data-min-date-element/data-max-date-element设置起始时间 --&gt;
&lt;input id="datetimepicker-1" type="text"
    data-element-type="datetimepicker" data-max-date-element="datetimepicker-2" class="form-control" &gt;
&lt;input id="datetimepicker-2" type="text"
    data-element-type="datetimepicker" data-min-date-element="datetimepicker-1" class="form-control"  &gt;
</pre>
<jd:panel className="panel-white mt20" title="常用日期插件示例">
    <form class="form-horizontal">
        <div class="col-xs-12">
            <div class="form-group"><label class="col-sm-2 control-label ell">起止时间：</label>
                <div class="col-sm-5">
                    <input id="datetimepicker-1" data-element-type="datetimepicker" data-max-date-element="datetimepicker-2" type="text" class="form-control">
                </div>
                <div class="col-sm-5">
                    <input id="datetimepicker-2" data-element-type="datetimepicker" data-min-date-element="datetimepicker-1" type="text" class="form-control">
                </div>
            </div>
        </div>
    </form>
</jd:panel>
</p>
<h1 id="tab">框架Tab页</h1>
<h2 id="tab-explain">说明</h2>
<p>
    如需将框架改为Tab模式打开页面,请到系统管理-系统设置-系统信息设置将 <code>是否启用Tab</code> 更改为 <code>是</code><br/>
    注:方法名以及书写规范与不使用tab一样
</p>
<h2 id="tab-callback">事件</h2>
<p>
    1.点击tab页标题会调用页面中<code>isRefresh()</code>来判断当激活当前tab时是否需要刷新页面  注:请勿与<code>isSubmitForm()</code>同时返回true<br/>
    2.点击tab页标题会调用页面中<code>isSubmitForm()</code>来判断当激活当前tab时是否需要提交表单 注:请勿与<code>isRefresh()</code>同时返回true<br/>
    3.点击tab页标题会调用页面中<code>initPage()</code>来初始化当前页面(如不需要可忽略)<br/>
    4.双击tab页标题会刷新页面<br/>
    注:以上事件写在<code>main.js中</code>
</p>
<h2 id="tab-add">添加Tab</h2>
<p>
    页面中如需在新tab页中打开页面可使用<code>tool.openview(this,'http://www.baidu.com','新建标签页')</code>方法
    注:如第三个参数(tab页名称)未填写,程序会先去查找this标签中是否有<code>data-tab-name</code>属性,如果没有则会使用<code>$(this).html()</code>获取内容并过滤html标签<code>标签页名称最多支持7个字符,超出会自动截取</code>
</p>
<h2>关闭当前Tab</h2>
<p>
    页面中如需关闭当前tab页,可调用<code>tool.closeCurrentTab()</code>方法
</p>

<h1 id="alert">弹出框</h1>
<p>
    为保证提示框在各浏览器下样式统一,请使用以下方法弹出提示<br/>

<pre class="syntax brush-html">
&lt;button type="button" class="btn btn-sm btn-success" onclick="tool.alert('基本提示')"&gt;基本&lt;/button&gt;
&lt;button type="button" class="btn btn-sm btn-success" onclick="tool.alertInfo('这里是标题','这里是副标题')"&gt;提醒&lt;/button&gt;
&lt;button type="button" class="btn btn-sm btn-success" onclick="tool.alertSuccess('这里是标题','这里是副标题')"&gt;成功&lt;/button&gt;
&lt;button type="button" class="btn btn-sm btn-success" onclick="tool.alertWarning('这里是标题','这里是副标题')"&gt;警告&lt;/button&gt;
&lt;button type="button" class="btn btn-sm btn-success" onclick="tool.alertError('这里是标题','这里是副标题')"&gt;错误&lt;/button&gt;
&lt;button type="button" class="btn btn-sm btn-success" onclick="tool.alertConfirm('确定要删除勾选的数据吗?','删除后将无法恢复，请谨慎操作！',function (){alert('true')})"&gt;询问&lt;/button&gt;
</pre>

<button type="button" class="btn btn-sm btn-success" onclick="tool.alert('基本提示')">基本</button>
<button type="button" class="btn btn-sm btn-success" onclick="tool.alertInfo('这里是标题','这里是副标题')">提醒</button>
<button type="button" class="btn btn-sm btn-success" onclick="tool.alertSuccess('这里是标题','这里是副标题')">成功</button>
<button type="button" class="btn btn-sm btn-success" onclick="tool.alertWarning('这里是标题','这里是副标题')">警告</button>
<button type="button" class="btn btn-sm btn-success" onclick="tool.alertError('这里是标题','这里是副标题')">错误</button>
<button type="button" class="btn btn-sm btn-success" onclick="tool.alertConfirm('确定要删除勾选的数据吗?','删除后将无法恢复，请谨慎操作！',function (){alert('true')})">询问</button>
</p>
注:如需更多示例 <a target="_blank" href="<%=basePath%>/resources/plugins/sweetalert-master/index.html">点此访问更多文档</a> 注:如使用tab模式,请使用<code>tool.alert()</code>或<code>window.parent.swal()</code>调用


<h1 id="import">导入</h1>

<h2 id="import-mb">配置</h2>

<p>
    模板配置字段
    <pre class="syntax brush-html">
处理url：处理controller连接，比如s/biz/zjxd</pre>
</p>
<p>
 系统自动检验规则：在T_IMPORT_TEMPINFO表中将fieldtype字段值改为以下：
    <pre class="syntax brush-html">
DATE：日期
VARCHAR2：文本
SHZHM：身份证号
XM：姓名【2-10位的汉字】
DHHM：电话号码
INTEGER：整数
DOUBLE：数值</pre>
</p>
<h2 id="import-con">controoler</h2>

<p>
  controller需配置方法
    <pre class="syntax brush-html">
@RequestMapping(value = "/importBefore", produces = { "application/json;charset=UTF-8" })
	public @ResponseBody void importBefore(@ModelAttribute("importTempID") String importTempID,@ModelAttribute("table_type") String table_type,
			ModelMap modelMap, HttpServletResponse response,
			HttpServletRequest request) throws IOException {
		try {
			getService().importBefore(modelMap);
			CommonQuery.print(response,"{\"res\":\"success\",\"msg\":\"执行成功!\",\"data\":{}}");
		} catch (Exception e) {
			CommonQuery.print(response,"{\"res\":\"danger\",\"msg\":\"执行失败!"+ e.getMessage() + "\",\"data\":{}}");
		}
	}
	
	@RequestMapping(value = "/importAfter", produces = { "application/json;charset=UTF-8" })
	public @ResponseBody void importAfter(@ModelAttribute("importTempID") String importTempID,@ModelAttribute("table_type") String table_type,
			ModelMap modelMap, HttpServletResponse response,
			HttpServletRequest request) throws IOException {
		try {
			getService().importAfter(modelMap);
			CommonQuery.print(response,"{\"res\":\"success\",\"msg\":\"执行成功!\",\"data\":{}}");
		} catch (Exception e) {
			CommonQuery.print(response,"{\"res\":\"danger\",\"msg\":\"执行失败!"+ e.getMessage() + "\",\"data\":{}}");
		}
		
	}</pre>
</p>

<h2 id="import-page">页面</h2>
<p>
<pre class="syntax brush-html">
importdata:function(el,wid){
		var url = '';
		url = basePath+"/system/excelUserImport-input.action?importTempID=16032110181960910001&table_type="+wid+
				"&tzurl=导入成功之后跳转地址全路径（带basepath）";//跳转地址参数可为空
		tool.openview(el,url);
	},</pre>
</p>


<h1 id="upload">上传文件</h1>
<h2 id="upload-page">页面</h2>
<p>
   js代码
    <pre class="syntax brush-html">
subPage = {
	onSelect:function(file){
        $("#upload").css({"display":"inline-block"});
    },
    onUploadSuccess:function(file, data, response){
    	openimport('文件已上传，解析中...');
    	closeimport();
        data=data.replace("\\","");
        data=data.replace("\\","/");

        data = eval("("+data+")");
        $('#fj_new').val(data.filePath);//新上传的文件路径
        $('#fj_name').val(data.fileold);//上传文件的名称
        $('#fj_font').html(data.fileold);//页面显示文件名
        
    }	
}
var form_el = null;
$(function(){
	tool.initFileUpload("#fileUpload",null,null,true,"*.xls",1,subPage.onSelect,subPage.onUploadSuccess);
    $("#upload").click(function (){
        form_el = $(this).parents(".form-horizontal");
        $('#fileUpload').uploadify('upload','*');
    });
});</pre>
</p>
<p>
   jsp代码
    <pre class="syntax brush-html">
&lt;input type="file" id="fileUpload" &gt;
&lt;input type="hidden" name="fj_new" id="fj_new" /&gt;
&lt;input type="hidden" name="fj" id="fj" value="${object.fj }" /&gt; 
&lt;input type="hidden"  name="fj_name" id="fj_name" /&gt; 
&lt;font id="fj_font"&gt;&lt;/font&gt;</pre>
</p>
<p>
   java代码
    <pre class="syntax brush-html">
if(StringUtil.isNotBlank(object.getFj_new())){//说明新上传了文件
	if(StringUtil.isNotBlank(object.getFj())){//说明以前也上传过文件，那么将之前的文件删除
		UploadFile.statdeletefile(object.getFj());
	}
	//将新文件复制到正式文件夹目录，并且赋值给文件路径字段
	object.setFj(UploadFile.copyfile(object.getFj_new(), object.getFj_name()));
}</pre>
</p>
<p>
   上传文件下载
    <pre class="syntax brush-html">
&lt;a onclick="tool.downloadfile('文件路径')"&gt;文件名称&lt;/a&gt;</pre>
</p>

<h1 id="glyphicons">字体图标</h1>

<h2 id="glyphicons-glyphs">所有可使用的图标</h2>
<p>
    <div class="panel panel-white">
        <div class="panel-body">
            <br>
            <h5 class="subtitle">71 New Icons in 4.1</h5>
            <ul class="row the-icons">
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-automobile"></i> fa-automobile
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-bank"></i> fa-bank
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-behance"></i> fa-behance
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-behance-square"></i> fa-behance-square
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-bomb"></i> fa-bomb
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-building"></i> fa-building
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-cab"></i> fa-cab
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-car"></i> fa-car
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-child"></i> fa-child
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-circle-o-notch"></i> fa-circle-o-notch
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-circle-thin"></i> fa-circle-thin
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-codepen"></i> fa-codepen
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-cube"></i> fa-cube
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-cubes"></i> fa-cubes
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-database"></i> fa-database
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-delicious"></i> fa-delicious
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-deviantart"></i> fa-deviantart
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-digg"></i> fa-digg
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-drupal"></i> fa-drupal
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-empire"></i> fa-empire
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-envelope-square"></i> fa-envelope-square
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-fax"></i> fa-fax
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-file-archive-o"></i> fa-file-archive-o
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-file-audio-o"></i> fa-file-audio-o
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-file-code-o"></i> fa-file-code-o
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-file-excel-o"></i> fa-file-excel-o
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-file-image-o"></i> fa-file-image-o
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-file-movie-o"></i> fa-file-movie-o
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-file-pdf-o"></i> fa-file-pdf-o
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-file-photo-o"></i> fa-file-photo-o
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-file-picture-o"></i> fa-file-picture-o
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-file-powerpoint-o"></i> fa-file-powerpoint-o
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-file-sound-o"></i> fa-file-sound-o
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-file-video-o"></i> fa-file-video-o
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-file-word-o"></i> fa-file-word-o
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-file-zip-o"></i> fa-file-zip-o
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-ge"></i> fa-ge
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-git"></i> fa-git
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-git-square"></i> fa-git-square
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-google"></i> fa-google
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-graduation-cap"></i> fa-graduation-cap
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-hacker-news"></i> fa-hacker-news
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-header"></i> fa-header
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-history"></i> fa-history
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-institution"></i> fa-institution
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-joomla"></i> fa-joomla
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-jsfiddle"></i> fa-jsfiddle
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-language"></i> fa-language
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-life-bouy"></i> fa-life-bouy
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-life-ring"></i> fa-life-ring
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-life-saver"></i> fa-life-saver
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-mortar-board"></i> fa-mortar-board
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-openid"></i> fa-openid
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-paper-plane"></i> fa-paper-plane
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-paper-plane-o"></i> fa-paper-plane-o
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-paragraph"></i> fa-paragraph
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-paw"></i> fa-paw
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-pied-piper"></i> fa-pied-piper
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-pied-piper-alt"></i> fa-pied-piper-alt
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-pied-piper-square"></i> fa-pied-piper-square
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-qq"></i> fa-qq
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-ra"></i> fa-ra
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-rebel"></i> fa-rebel
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-recycle"></i> fa-recycle
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-reddit"></i> fa-reddit
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-reddit-square"></i> fa-reddit-square
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-send"></i> fa-send
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-send-o"></i> fa-send-o
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-share-alt"></i> fa-share-alt
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-share-alt-square"></i> fa-share-alt-square
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-slack"></i> fa-slack
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-sliders"></i> fa-sliders
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-soundcloud"></i> fa-soundcloud
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-space-shuttle"></i> fa-space-shuttle
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-spoon"></i> fa-spoon
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-spotify"></i> fa-spotify
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-steam"></i> fa-steam
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-steam-square"></i> fa-steam-square
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-stumbleupon"></i> fa-stumbleupon
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-stumbleupon-circle"></i> fa-stumbleupon-circle
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-support"></i> fa-support
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-taxi"></i> fa-taxi
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-tencent-weibo"></i> fa-tencent-weibo
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-tree"></i> fa-tree
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-university"></i> fa-university
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-vine"></i> fa-vine
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-wechat"></i> fa-wechat
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-weixin"></i> fa-weixin
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-wordpress"></i> fa-wordpress
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-yahoo"></i> fa-yahoo
                </li>
            </ul>
            <br>
            <h5 class="subtitle">Web Application Icons</h5>
            <ul class="row the-icons">
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-adjust"></i> fa-adjust
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-anchor"></i> fa-anchor
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-archive"></i> fa-archive
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-arrows"></i> fa-arrows
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-arrows-h"></i> fa-arrows-h
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-arrows-v"></i> fa-arrows-v
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-asterisk"></i> fa-asterisk
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-ban"></i> fa-ban
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-bar-chart-o"></i> fa-bar-chart-o
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-barcode"></i> fa-barcode
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-bars"></i> fa-bars
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-beer"></i> fa-beer
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-bell"></i> fa-bell
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-bell-o"></i> fa-bell-o
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-bolt"></i> fa-bolt
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-book"></i> fa-book
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-bookmark"></i> fa-bookmark
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-bookmark-o"></i> fa-bookmark-o
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-briefcase"></i> fa-briefcase
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-bug"></i> fa-bug
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-building-o"></i> fa-building-o
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-bullhorn"></i> fa-bullhorn
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-bullseye"></i> fa-bullseye
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-calendar"></i> fa-calendar
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-calendar-o"></i> fa-calendar-o
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-camera"></i> fa-camera
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-camera-retro"></i> fa-camera-retro
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-caret-square-o-down"></i> fa-caret-square-o-down
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-caret-square-o-left"></i> fa-caret-square-o-left
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-caret-square-o-right"></i> fa-caret-square-o-right
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-caret-square-o-up"></i> fa-caret-square-o-up
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-certificate"></i> fa-certificate
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-check"></i> fa-check
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-check-circle"></i> fa-check-circle
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-check-circle-o"></i> fa-check-circle-o
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-check-square"></i> fa-check-square
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-check-square-o"></i> fa-check-square-o
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-circle"></i> fa-circle
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-circle-o"></i> fa-circle-o
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-clock-o"></i> fa-clock-o
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-cloud"></i> fa-cloud
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-cloud-download"></i> fa-cloud-download
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-cloud-upload"></i> fa-cloud-upload
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-code"></i> fa-code
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-code-fork"></i> fa-code-fork
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-coffee"></i> fa-coffee
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-cog"></i> fa-cog
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-cogs"></i> fa-cogs
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-comment"></i> fa-comment
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-comment-o"></i> fa-comment-o
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-comments"></i> fa-comments
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-comments-o"></i> fa-comments-o
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-compass"></i> fa-compass
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-credit-card"></i> fa-credit-card
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-crop"></i> fa-crop
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-crosshairs"></i> fa-crosshairs
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-cutlery"></i> fa-cutlery
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-dashboard"></i> fa-dashboard
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-desktop"></i> fa-desktop
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-dot-circle-o"></i> fa-dot-circle-o
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-download"></i> fa-download
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-edit"></i> fa-edit
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-ellipsis-h"></i> fa-ellipsis-h
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-ellipsis-v"></i> fa-ellipsis-v
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-envelope"></i> fa-envelope
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-envelope-o"></i> fa-envelope-o
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-eraser"></i> fa-eraser
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-exchange"></i> fa-exchange
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-exclamation"></i> fa-exclamation
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-exclamation-circle"></i> fa-exclamation-circle
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-exclamation-triangle"></i> fa-exclamation-triangle
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-external-link"></i> fa-external-link
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-external-link-square"></i> fa-external-link-square
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-eye"></i> fa-eye
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-eye-slash"></i> fa-eye-slash
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-female"></i> fa-female
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-fighter-jet"></i> fa-fighter-jet
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-film"></i> fa-film
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-filter"></i> fa-filter
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-fire"></i> fa-fire
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-fire-extinguisher"></i> fa-fire-extinguisher
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-flag"></i> fa-flag
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-flag-checkered"></i> fa-flag-checkered
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-flag-o"></i> fa-flag-o
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-flash"></i> fa-flash
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-flask"></i> fa-flask
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-folder"></i> fa-folder
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-folder-o"></i> fa-folder-o
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-folder-open"></i> fa-folder-open
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-folder-open-o"></i> fa-folder-open-o
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-frown-o"></i> fa-frown-o
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-gamepad"></i> fa-gamepad
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-gavel"></i> fa-gavel
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-gear"></i> fa-gear
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-gears"></i> fa-gears
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-gift"></i> fa-gift
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-glass"></i> fa-glass
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-globe"></i> fa-globe
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-group"></i> fa-group
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-hdd-o"></i> fa-hdd-o
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-headphones"></i> fa-headphones
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-heart"></i> fa-heart
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-heart-o"></i> fa-heart-o
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-home"></i> fa-home
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-inbox"></i> fa-inbox
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-info"></i> fa-info
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-info-circle"></i> fa-info-circle
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-key"></i> fa-key
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-keyboard-o"></i> fa-keyboard-o
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-laptop"></i> fa-laptop
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-leaf"></i> fa-leaf
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-legal"></i> fa-legal
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-lemon-o"></i> fa-lemon-o
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-level-down"></i> fa-level-down
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-level-up"></i> fa-level-up
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-lightbulb-o"></i> fa-lightbulb-o
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-location-arrow"></i> fa-location-arrow
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-lock"></i> fa-lock
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-magic"></i> fa-magic
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-magnet"></i> fa-magnet
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-mail-forward"></i> fa-mail-forward
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-mail-reply"></i> fa-mail-reply
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-mail-reply-all"></i> fa-mail-reply-all
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-male"></i> fa-male
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-map-marker"></i> fa-map-marker
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-meh-o"></i> fa-meh-o
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-microphone"></i> fa-microphone
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-microphone-slash"></i> fa-microphone-slash
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-minus"></i> fa-minus
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-minus-circle"></i> fa-minus-circle
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-minus-square"></i> fa-minus-square
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-minus-square-o"></i> fa-minus-square-o
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-mobile"></i> fa-mobile
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-mobile-phone"></i> fa-mobile-phone
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-money"></i> fa-money
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-moon-o"></i> fa-moon-o
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-music"></i> fa-music
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-pencil"></i> fa-pencil
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-pencil-square"></i> fa-pencil-square
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-pencil-square-o"></i> fa-pencil-square-o
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-phone"></i> fa-phone
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-phone-square"></i> fa-phone-square
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-picture-o"></i> fa-picture-o
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-plane"></i> fa-plane
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-plus"></i> fa-plus
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-plus-circle"></i> fa-plus-circle
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-plus-square"></i> fa-plus-square
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-plus-square-o"></i> fa-plus-square-o
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-power-off"></i> fa-power-off
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-print"></i> fa-print
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-puzzle-piece"></i> fa-puzzle-piece
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-qrcode"></i> fa-qrcode
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-question"></i> fa-question
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-question-circle"></i> fa-question-circle
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-quote-left"></i> fa-quote-left
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-quote-right"></i> fa-quote-right
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-random"></i> fa-random
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-refresh"></i> fa-refresh
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-reply"></i> fa-reply
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-reply-all"></i> fa-reply-all
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-retweet"></i> fa-retweet
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-road"></i> fa-road
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-rocket"></i> fa-rocket
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-rss"></i> fa-rss
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-rss-square"></i> fa-rss-square
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-search"></i> fa-search
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-search-minus"></i> fa-search-minus
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-search-plus"></i> fa-search-plus
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-share"></i> fa-share
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-share-square"></i> fa-share-square
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-share-square-o"></i> fa-share-square-o
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-shield"></i> fa-shield
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-shopping-cart"></i> fa-shopping-cart
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-sign-in"></i> fa-sign-in
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-sign-out"></i> fa-sign-out
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-signal"></i> fa-signal
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-sitemap"></i> fa-sitemap
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-smile-o"></i> fa-smile-o
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-sort"></i> fa-sort
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-sort-alpha-asc"></i> fa-sort-alpha-asc
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-sort-alpha-desc"></i> fa-sort-alpha-desc
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-sort-amount-asc"></i> fa-sort-amount-asc
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-sort-amount-desc"></i> fa-sort-amount-desc
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-sort-asc"></i> fa-sort-asc
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-sort-desc"></i> fa-sort-desc
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-sort-down"></i> fa-sort-down
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-sort-numeric-asc"></i> fa-sort-numeric-asc
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-sort-numeric-desc"></i> fa-sort-numeric-desc
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-sort-up"></i> fa-sort-up
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-spinner"></i> fa-spinner
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-square"></i> fa-square
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-square-o"></i> fa-square-o
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-star"></i> fa-star
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-star-half"></i> fa-star-half
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-star-half-empty"></i> fa-star-half-empty
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-star-half-full"></i> fa-star-half-full
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-star-half-o"></i> fa-star-half-o
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-star-o"></i> fa-star-o
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-subscript"></i> fa-subscript
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-suitcase"></i> fa-suitcase
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-sun-o"></i> fa-sun-o
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-superscript"></i> fa-superscript
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-tablet"></i> fa-tablet
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-tachometer"></i> fa-tachometer
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-tag"></i> fa-tag
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-tags"></i> fa-tags
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-tasks"></i> fa-tasks
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-terminal"></i> fa-terminal
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-thumb-tack"></i> fa-thumb-tack
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-thumbs-down"></i> fa-thumbs-down
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-thumbs-o-down"></i> fa-thumbs-o-down
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-thumbs-o-up"></i> fa-thumbs-o-up
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-thumbs-up"></i> fa-thumbs-up
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-ticket"></i> fa-ticket
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-times"></i> fa-times
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-times-circle"></i> fa-times-circle
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-times-circle-o"></i> fa-times-circle-o
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-tint"></i> fa-tint
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-toggle-down"></i> fa-toggle-down
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-toggle-left"></i> fa-toggle-left
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-toggle-right"></i> fa-toggle-right
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-toggle-up"></i> fa-toggle-up
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-trash-o"></i> fa-trash-o
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-trophy"></i> fa-trophy
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-truck"></i> fa-truck
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-umbrella"></i> fa-umbrella
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-unlock"></i> fa-unlock
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-unlock-alt"></i> fa-unlock-alt
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-unsorted"></i> fa-unsorted
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-upload"></i> fa-upload
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-user"></i> fa-user
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-users"></i> fa-users
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-video-camera"></i> fa-video-camera
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-volume-down"></i> fa-volume-down
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-volume-off"></i> fa-volume-off
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-volume-up"></i> fa-volume-up
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-warning"></i> fa-warning
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-wheelchair"></i> fa-wheelchair
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-wrench"></i> fa-wrench
                </li>
            </ul>
            <br>
            <h5 class="subtitle">Form Control Icons</h5>
            <ul class="row the-icons">
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-check-square"></i> fa-check-square
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-check-square-o"></i> fa-check-square-o
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-circle"></i> fa-circle
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-circle-o"></i> fa-circle-o
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-dot-circle-o"></i> fa-dot-circle-o
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-minus-square"></i> fa-minus-square
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-minus-square-o"></i> fa-minus-square-o
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-plus-square"></i> fa-plus-square
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-plus-square-o"></i> fa-plus-square-o
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-square"></i> fa-square
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-square-o"></i> fa-square-o
                </li>
            </ul>
            <br>
            <h5 class="subtitle">Currency Icons</h5>
            <ul class="row the-icons">
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-bitcoin"></i> fa-bitcoin
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-btc"></i> fa-btc
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-cny"></i> fa-cny
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-dollar"></i> fa-dollar
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-eur"></i> fa-eur
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-euro"></i> fa-euro
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-gbp"></i> fa-gbp
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-inr"></i> fa-inr
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-jpy"></i> fa-jpy
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-krw"></i> fa-krw
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-money"></i> fa-money
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-rmb"></i> fa-rmb
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-rouble"></i> fa-rouble
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-rub"></i> fa-rub
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-ruble"></i> fa-ruble
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-rupee"></i> fa-rupee
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-try"></i> fa-try
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-turkish-lira"></i> fa-turkish-lira
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-usd"></i> fa-usd
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-won"></i> fa-won
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-yen"></i> fa-yen
                </li>
            </ul>
            <br>
            <h5 class="subtitle">Text Editor Icons</h5>
            <ul class="row the-icons">
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-align-center"></i> fa-align-center
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-align-justify"></i> fa-align-justify
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-align-left"></i> fa-align-left
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-align-right"></i> fa-align-right
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-bold"></i> fa-bold
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-chain"></i> fa-chain
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-chain-broken"></i> fa-chain-broken
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-clipboard"></i> fa-clipboard
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-columns"></i> fa-columns
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-copy"></i> fa-copy
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-cut"></i> fa-cut
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-dedent"></i> fa-dedent
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-eraser"></i> fa-eraser
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-file"></i> fa-file
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-file-o"></i> fa-file-o
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-file-text"></i> fa-file-text
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-file-text-o"></i> fa-file-text-o
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-files-o"></i> fa-files-o
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-floppy-o"></i> fa-floppy-o
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-font"></i> fa-font
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-indent"></i> fa-indent
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-italic"></i> fa-italic
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-link"></i> fa-link
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-list"></i> fa-list
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-list-alt"></i> fa-list-alt
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-list-ol"></i> fa-list-ol
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-list-ul"></i> fa-list-ul
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-outdent"></i> fa-outdent
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-paperclip"></i> fa-paperclip
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-paste"></i> fa-paste
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-repeat"></i> fa-repeat
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-rotate-left"></i> fa-rotate-left
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-rotate-right"></i> fa-rotate-right
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-save"></i> fa-save
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-scissors"></i> fa-scissors
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-strikethrough"></i> fa-strikethrough
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-table"></i> fa-table
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-text-height"></i> fa-text-height
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-text-width"></i> fa-text-width
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-th"></i> fa-th
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-th-large"></i> fa-th-large
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-th-list"></i> fa-th-list
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-underline"></i> fa-underline
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-undo"></i> fa-undo
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-unlink"></i> fa-unlink
                </li>
            </ul>
            <br>
            <h5 class="subtitle">Directional Icons</h5>
            <ul class="row the-icons">
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-angle-double-down"></i> fa-angle-double-down
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-angle-double-left"></i> fa-angle-double-left
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-angle-double-right"></i> fa-angle-double-right
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-angle-double-up"></i> fa-angle-double-up
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-angle-down"></i> fa-angle-down
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-angle-left"></i> fa-angle-left
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-angle-right"></i> fa-angle-right
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-angle-up"></i> fa-angle-up
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-arrow-circle-down"></i> fa-arrow-circle-down
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-arrow-circle-left"></i> fa-arrow-circle-left
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-arrow-circle-o-down"></i> fa-arrow-circle-o-down
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-arrow-circle-o-left"></i> fa-arrow-circle-o-left
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-arrow-circle-o-right"></i> fa-arrow-circle-o-right
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-arrow-circle-o-up"></i> fa-arrow-circle-o-up
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-arrow-circle-right"></i> fa-arrow-circle-right
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-arrow-circle-up"></i> fa-arrow-circle-up
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-arrow-down"></i> fa-arrow-down
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-arrow-left"></i> fa-arrow-left
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-arrow-right"></i> fa-arrow-right
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-arrow-up"></i> fa-arrow-up
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-arrows"></i> fa-arrows
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-arrows-alt"></i> fa-arrows-alt
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-arrows-h"></i> fa-arrows-h
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-arrows-v"></i> fa-arrows-v
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-caret-down"></i> fa-caret-down
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-caret-left"></i> fa-caret-left
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-caret-right"></i> fa-caret-right
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-caret-square-o-down"></i> fa-caret-square-o-down
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-caret-square-o-left"></i> fa-caret-square-o-left
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-caret-square-o-right"></i> fa-caret-square-o-right
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-caret-square-o-up"></i> fa-caret-square-o-up
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-caret-up"></i> fa-caret-up
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-chevron-circle-down"></i> fa-chevron-circle-down
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-chevron-circle-left"></i> fa-chevron-circle-left
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-chevron-circle-right"></i> fa-chevron-circle-right
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-chevron-circle-up"></i> fa-chevron-circle-up
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-chevron-down"></i> fa-chevron-down
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-chevron-left"></i> fa-chevron-left
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-chevron-right"></i> fa-chevron-right
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-chevron-up"></i> fa-chevron-up
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-hand-o-down"></i> fa-hand-o-down
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-hand-o-left"></i> fa-hand-o-left
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-hand-o-right"></i> fa-hand-o-right
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-hand-o-up"></i> fa-hand-o-up
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-long-arrow-down"></i> fa-long-arrow-down
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-long-arrow-left"></i> fa-long-arrow-left
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-long-arrow-right"></i> fa-long-arrow-right
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-long-arrow-up"></i> fa-long-arrow-up
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-toggle-down"></i> fa-toggle-down
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-toggle-left"></i> fa-toggle-left
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-toggle-right"></i> fa-toggle-right
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-toggle-up"></i> fa-toggle-up
                </li>
            </ul>
            <br>
            <h5 class="subtitle">Video Player Icons</h5>
            <ul class="row the-icons">
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-arrows-alt"></i> fa-arrows-alt
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-backward"></i> fa-backward
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-compress"></i> fa-compress
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-eject"></i> fa-eject
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-expand"></i> fa-expand
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-fast-backward"></i> fa-fast-backward
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-fast-forward"></i> fa-fast-forward
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-forward"></i> fa-forward
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-pause"></i> fa-pause
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-play"></i> fa-play
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-play-circle"></i> fa-play-circle
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-play-circle-o"></i> fa-play-circle-o
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-step-backward"></i> fa-step-backward
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-step-forward"></i> fa-step-forward
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-stop"></i> fa-stop
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-youtube-play"></i> fa-youtube-play
                </li>
            </ul>
            <br>
            <h5 class="subtitle">Brand Icons</h5>
            <ul class="row the-icons">
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-adn"></i> fa-adn
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-android"></i> fa-android
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-apple"></i> fa-apple
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-bitbucket"></i> fa-bitbucket
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-bitbucket-square"></i> fa-bitbucket-square
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-bitcoin"></i> fa-bitcoin
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-btc"></i> fa-btc
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-css3"></i> fa-css3
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-dribbble"></i> fa-dribbble
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-dropbox"></i> fa-dropbox
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-facebook"></i> fa-facebook
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-facebook-square"></i> fa-facebook-square
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-flickr"></i> fa-flickr
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-foursquare"></i> fa-foursquare
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-github"></i> fa-github
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-github-alt"></i> fa-github-alt
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-github-square"></i> fa-github-square
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-gittip"></i> fa-gittip
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-google-plus"></i> fa-google-plus
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-google-plus-square"></i> fa-google-plus-square
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-html5"></i> fa-html5
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-instagram"></i> fa-instagram
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-linkedin"></i> fa-linkedin
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-linkedin-square"></i> fa-linkedin-square
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-linux"></i> fa-linux
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-maxcdn"></i> fa-maxcdn
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-pagelines"></i> fa-pagelines
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-pinterest"></i> fa-pinterest
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-pinterest-square"></i> fa-pinterest-square
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-renren"></i> fa-renren
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-skype"></i> fa-skype
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-stack-exchange"></i> fa-stack-exchange
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-stack-overflow"></i> fa-stack-overflow
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-trello"></i> fa-trello
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-tumblr"></i> fa-tumblr
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-tumblr-square"></i> fa-tumblr-square
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-twitter"></i> fa-twitter
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-twitter-square"></i> fa-twitter-square
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-vimeo-square"></i> fa-vimeo-square
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-vk"></i> fa-vk
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-weibo"></i> fa-weibo
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-windows"></i> fa-windows
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-xing"></i> fa-xing
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-xing-square"></i> fa-xing-square
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-youtube"></i> fa-youtube
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-youtube-play"></i> fa-youtube-play
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-youtube-square"></i> fa-youtube-square
                </li>
            </ul>
            <br>
            <h5 class="subtitle">Medical Icons</h5>
            <ul class="row the-icons">
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-ambulance"></i> fa-ambulance
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-h-square"></i> fa-h-square
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-hospital-o"></i> fa-hospital-o
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-medkit"></i> fa-medkit
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-plus-square"></i> fa-plus-square
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-stethoscope"></i> fa-stethoscope
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-user-md"></i> fa-user-md
                </li>
                <li class="fa-hover col-md-3 col-sm-4">
                    <i class="fa fa-wheelchair"></i> fa-wheelchair
                </li>
            </ul>
        </div>
    </div>
</p>

<h2 id="glyphicons-how-to-use">如何使用</h2>
<p>
<pre class="syntax brush-html">
    &lt;i class="fa fa-camera-retro"&gt;&lt;/i&gt; fa-camera-retro
</pre>
<jd:panel className="panel-white mt20" title="如何使用">
    <i class="fa fa-camera-retro"></i> fa-camera-retro<br/>
    使用字体图标class中需要添加<code>fa</code>样式,建议使用<code>i</code>标签
</jd:panel>
<div class="panel panel-white">
    <div class="panel-heading">
        <h4 class="panel-title">图标大小</h4>
    </div>
    <div class="panel-body">
        <div class="col-md-3 col-sm-4">
            <p>
                <i class="fa fa-camera-retro fa-lg"></i> fa-lg
            </p>
            <p>
                <i class="fa fa-camera-retro fa-2x"></i> fa-2x
            </p>
            <p>
                <i class="fa fa-camera-retro fa-3x"></i> fa-3x
            </p>
            <p>
                <i class="fa fa-camera-retro fa-4x"></i> fa-4x
            </p>
            <p>
                <i class="fa fa-camera-retro fa-5x"></i> fa-5x
            </p>
        </div>
        <div class="col-md-9 col-sm-8">
            <p>
                To increase icon sizes relative to their container, use the <code> fa-lg </code>
                (33% increase), <code> fa-2x </code>
                , <code> fa-3x </code>
                , <code> fa-4x </code>
                , or <code> fa-5x </code>
                classes.
            </p>
            <div class="highlight">
<pre class="syntax brush-html">
&lt;i class="fa fa-camera-retro fa-lg"&gt;&lt;/i&gt; fa-lg
&lt;i class="fa fa-camera-retro fa-2x"&gt;&lt;/i&gt; fa-2x
&lt;i class="fa fa-camera-retro fa-3x"&gt;&lt;/i&gt; fa-3x
&lt;i class="fa fa-camera-retro fa-4x"&gt;&lt;/i&gt; fa-4x
&lt;i class="fa fa-camera-retro fa-5x"&gt;&lt;/i&gt; fa-5x
</pre>
            </div>
            <div class="alert alert-success mt15">
                <ul class="fa-ul">
                    <li>
                        <i class="fa fa-exclamation-triangle fa-li fa-lg"></i>
                        如果图标的顶部或底部缺失,请检查容器高度是否小于line-height
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
<div class="panel panel-white">
    <div class="panel-heading">
        <h4 class="panel-title">旋转&反转</h4>
    </div>
    <div class="panel-body">
        <div class="col-md-3 col-sm-4">
            <p class="text-extra-large">
                <i class="fa fa-shield"></i>&nbsp; normal
                <br>
                <i class="fa fa-shield fa-rotate-90"></i>&nbsp; fa-rotate-90
                <br>
                <i class="fa fa-shield fa-rotate-180"></i>&nbsp; fa-rotate-180
                <br>
                <i class="fa fa-shield fa-rotate-270"></i>&nbsp; fa-rotate-270
                <br>
                <i class="fa fa-shield fa-flip-horizontal"></i>&nbsp; fa-flip-horizontal
                <br>
                <i class="fa fa-shield fa-flip-vertical"></i>&nbsp; fa-flip-vertical
            </p>
        </div>
        <div class="col-md-9 col-sm-8">
            <p>
                如果需要旋转&反转图标,请添加<code> fa-rotate-* </code>&<code> fa-flip-* </code> class
            </p>
            <div class="highlight">
<pre class="syntax brush-html">
&lt;i class="fa fa-shield"&gt;&lt;/i&gt; normal&lt;br&gt;
&lt;i class="fa fa-shield fa-rotate-90"&gt;&lt;/i&gt; fa-rotate-90&lt;br&gt;
&lt;i class="fa fa-shield fa-rotate-180"&gt;&lt;/i&gt; fa-rotate-180&lt;br&gt;
&lt;i class="fa fa-shield fa-rotate-270"&gt;&lt;/i&gt; fa-rotate-270&lt;br&gt;
&lt;i class="fa fa-shield fa-flip-horizontal"&gt;&lt;/i&gt; fa-flip-horizontal&lt;br&gt;
&lt;i class="fa fa-shield fa-flip-vertical"&gt;&lt;/i&gt; icon-flip-vertical
</pre>
            </div>
        </div>
    </div>
</div>
<div class="panel panel-white">
    <div class="panel-heading">
        <h4 class="panel-title">层叠图标</h4>
    </div>
    <div class="panel-body">
        <div class="col-md-3 col-sm-4">
            <div class="margin-bottom">
                <span class="fa-stack fa-lg"> <i class="fa fa-square-o fa-stack-2x"></i> <i class="fa fa-twitter fa-stack-1x"></i> </span>
                fa-twitter on fa-square-o
                <br>
                <span class="fa-stack fa-lg"> <i class="fa fa-circle fa-stack-2x"></i> <i class="fa fa-flag fa-stack-1x fa-inverse"></i> </span>
                fa-flag on fa-circle
                <br>
                <span class="fa-stack fa-lg"> <i class="fa fa-square fa-stack-2x"></i> <i class="fa fa-terminal fa-stack-1x fa-inverse"></i> </span>
                fa-terminal on fa-square
                <br>
                <span class="fa-stack fa-lg"> <i class="fa fa-camera fa-stack-1x"></i> <i class="fa fa-ban fa-stack-2x text-danger"></i> </span>
                fa-ban on fa-camera
            </div>
        </div>
        <div class="col-md-9 col-sm-8">
            <p>
                To stack multiple icons, use the <code> fa-stack </code>
                class on the parent, the <code> fa-stack-1x </code>
                for the regularly sized icon, and <code> fa-stack-2x </code>
                for the larger icon. <code> fa-inverse </code>
                can be used as an alternative icon color. You can even throw
                <a href="#larger">
                    larger icon
                </a>
                classes on the parent
                to get further control of sizing.
            </p>
            <div class="highlight">
<pre class="syntax brush-html">
&lt;span class="fa-stack fa-lg"&gt;
  &lt;i class="fa fa-square-o fa-stack-2x"&gt;&lt;/i&gt;
  &lt;i class="fa fa-twitter fa-stack-1x"&gt;&lt;/i&gt;
&lt;/span&gt;
fa-twitter on fa-square-o&lt;br&gt;
&lt;span class="fa-stack fa-lg"&gt;
  &lt;i class="fa fa-circle fa-stack-2x"&gt;&lt;/i&gt;
  &lt;i class="fa fa-flag fa-stack-1x fa-inverse"&gt;&lt;/i&gt;
&lt;/span&gt;
fa-flag on fa-circle&lt;br&gt;
&lt;span class="fa-stack fa-lg"&gt;
  &lt;i class="fa fa-square fa-stack-2x"&gt;&lt;/i&gt;
  &lt;i class="fa fa-terminal fa-stack-1x fa-inverse"&gt;&lt;/i&gt;
&lt;/span&gt;
fa-terminal on fa-square&lt;br&gt;
&lt;span class="fa-stack fa-lg"&gt;
  &lt;i class="fa fa-camera fa-stack-1x"&gt;&lt;/i&gt;
  &lt;i class="fa fa-ban fa-stack-2x text-danger"&gt;&lt;/i&gt;
&lt;/span&gt;
fa-ban on fa-camera
</pre>
            </div>
        </div>
    </div>
</div>
</p>
<h1 id="btn-groups">按钮</h1>
<p>
    按钮可使用<code>a</code>&<code>button</code>标签并添加<code>btn</code>class;如使用button必须添加<code>type</code>属性
</p>
<h2 id="btn-groups-single">基本实例</h2>
<div>
    <div class="panel panel-white">
        <div class="panel-heading">
            <h4 class="panel-title">Buttons</h4>
        </div>
        <div class="panel-body buttons-widget">
            <h5>Default <span class="">Buttons</span></h5>
            <p class="space20">
                <!-- Standard grey button with gradient -->
                <button type="button" class="btn btn-default">
                    Default
                </button>
                <!-- Provides extra visual weight and identifies the primary action in a set of buttons -->
                <button type="button" class="btn btn-primary">
                    Primary
                </button>
                <!-- Indicates a successful or positive action -->
                <button type="button" class="btn btn-success">
                    Success
                </button>
                <!-- Contextual button for informational alert messages -->
                <button type="button" class="btn btn-primary">
                    Info
                </button>
                <!-- Indicates caution should be taken with this action -->
                <button type="button" class="btn btn-warning">
                    Warning
                </button>
                <!-- Indicates a dangerous or potentially negative action -->
                <button type="button" class="btn btn-danger">
                    Danger
                </button>
                <!-- Deemphasize a button by making it look like a link while maintaining button behavior -->
                <button type="button" class="btn btn-link">
                    Link
                </button>
            </p>
            <h5>Colorful <span class="">Buttons</span></h5>
            <p class="space20">
                <button type="button" class="btn btn-azure">
                    Azure
                </button>
                <button type="button" class="btn btn-light-azure">
                    Light Azure
                </button>
                <button type="button" class="btn btn-dark-azure">
                    Dark Azure
                </button>
                <button type="button" class="btn btn-beige">
                    Beige
                </button>
                <button type="button" class="btn btn-light-beige">
                    Light Beige
                </button>
                <button type="button" class="btn btn-dark-beige">
                    Dark Beige
                </button>
                <button type="button" class="btn btn-orange">
                    Orange
                </button>
                <button type="button" class="btn btn-light-orange">
                    Light Orange
                </button>
                <button type="button" class="btn btn-dark-orange">
                    Dark Orange
                </button>
                <button type="button" class="btn btn-danger">
                    Red
                </button>
                <button type="button" class="btn btn-light-red">
                    Light Red
                </button>
                <button type="button" class="btn btn-dark-red">
                    Dark Red
                </button>
                <button type="button" class="btn btn-success">
                    Green
                </button>
                <button type="button" class="btn btn-light-green">
                    Light Green
                </button>
                <button type="button" class="btn btn-dark-green">
                    Dark Green
                </button>
                <button type="button" class="btn btn-primary">
                    Blue
                </button>
                <button type="button" class="btn btn-light-blue">
                    Light Blue
                </button>
                <button type="button" class="btn btn-dark-blue">
                    Dark Blue
                </button>
                <button type="button" class="btn btn-warning">
                    Yellow
                </button>
                <button type="button" class="btn btn-light-yellow">
                    Light Yellow
                </button>
                <button type="button" class="btn btn-dark-yellow">
                    Dark Yellow
                </button>
                <button type="button" class="btn btn-purple">
                    Purple
                </button>
                <button type="button" class="btn btn-light-purple">
                    Light Purple
                </button>
                <button type="button" class="btn btn-dark-purple">
                    Dark Purple
                </button>
                <button type="button" class="btn btn-grey">
                    Grey
                </button>
                <button type="button" class="btn btn-light-grey">
                    Light Grey
                </button>
                <button type="button" class="btn btn-dark-grey">
                    Dark Grey
                </button>
            </p>
            <h5>Square <span class="">Buttons</span></h5>
            <p>
                Do you like the square buttons? Add <code> .btn-squared </code>
                to it
            </p>
            <p class="space20">
                <!-- Standard grey button with gradient -->
                <button type="button" class="btn btn-default btn-squared">
                    Squared
                </button>
                <!-- Provides extra visual weight and identifies the primary action in a set of buttons -->
                <button type="button" class="btn btn-primary btn-squared">
                    Squared
                </button>
                <!-- Indicates a successful or positive action -->
                <button type="button" class="btn btn-success btn-squared btn-lg">
                    Squared
                </button>
                <!-- Contextual button for informational alert messages -->
                <button type="button" class="btn btn-primary btn-squared btn-lg">
                    Squared <i class="fa fa-arrow-circle-right"></i>
                </button>
            </p>
            <h5>Disabled <span class="">State</span></h5>
            <p>
                Add the <code> disabled </code>
                attribute to <code> &lt;button&gt; </code>
                buttons.
            </p>
            <p class="space20">
                <button type="button" class="btn btn-primary" disabled="disabled">
                    Disabled
                </button>
                <button type="button" class="btn btn-azure" disabled="disabled">
                    Disabled
                </button>
                <button type="button" class="btn btn-beige" disabled="disabled">
                    Disabled
                </button>
            </p>
            <h5>Sizes</h5>
            <p>
                Fancy larger or smaller buttons? Add <code> .btn-lg </code>
                , <code> .btn-sm </code>
                , or <code> .btn-xs </code>
                for additional sizes.
            </p>
            <p class="space20">
                <button type="button" class="btn btn-danger btn-lg">
                    Large button
                </button>
                <button type="button" class="btn btn-success btn-sm">
                    Small button
                </button>
                <button type="button" class="btn btn-primary btn-xs">
                    Extra small button
                </button>
            </p>
            <h5>Button <span class="">tags</span></h5>
            <p>
                Use the button classes on an <code> &lt;a&gt; </code>
                , <code> &lt;button&gt; </code>
                , or <code> &lt;input&gt; </code>
                element.
            </p>
            <p class="space20">
                <button class="btn btn-purple">
                    Button <i class="fa fa-arrow-circle-right"></i>
                </button>
                <input type="submit" value="Submit" class="btn btn-danger">
                <a class="btn btn-dark-grey" href="#">
                    Go to link <i class="fa fa-arrow-circle-right"></i>
                </a>
            </p>
            <h5>Button <span class="">groups</span></h5>
            <p>
                Wrap a series of buttons with <code> .btn </code>
                in <code> .btn-group </code>
                .
            </p>
            <div class="space12">
                <div class="btn-group btn-group-lg">
                    <a class="btn btn-default active" href="javascript:;">
                        Tools
                    </a>
                    <a class="btn btn-default hidden-xs" href="javascript:;">
                        Settings
                    </a>
                    <a class="btn btn-default" href="javascript:;">
                        Help
                    </a>
                    <a class="btn btn-default" href="javascript:;">
                        Contact
                    </a>
                </div>
            </div>
            <div class="space12">
                <div class="btn-group">
                    <a class="btn btn-azure active" href="javascript:;">
                        Tools
                    </a>
                    <a class="btn btn-azure hidden-xs" href="javascript:;">
                        Settings
                    </a>
                    <a class="btn btn-azure" href="javascript:;">
                        Help
                    </a>
                    <a class="btn btn-azure" href="javascript:;">
                        Contact
                    </a>
                </div>
            </div>
            <div class="space12">
                <div class="btn-group btn-group-sm">
                    <a class="btn btn-danger active" href="javascript:;">
                        Tools
                    </a>
                    <a class="btn btn-danger" href="javascript:;">
                        Settings
                    </a>
                    <a class="btn btn-danger" href="javascript:;">
                        Help
                    </a>
                    <a class="btn btn-danger" href="javascript:;">
                        Contact
                    </a>
                </div>
            </div>
            <div class="space12">
                <div class="btn-group btn-group-xs">
                    <a class="btn btn-success active" href="javascript:;">
                        Tools
                    </a>
                    <a class="btn btn-success" href="javascript:;">
                        Settings
                    </a>
                    <a class="btn btn-success" href="javascript:;">
                        Help
                    </a>
                    <a class="btn btn-success" href="javascript:;">
                        Contact
                    </a>
                </div>
            </div>
            <div class="space12">
                <div class="btn-group-vertical">
                    <a class="btn btn-orange" href="javascript:;">
                        Tools
                    </a>
                    <a class="btn btn-orange active" href="javascript:;">
                        Settings
                    </a>
                    <a class="btn btn-orange" href="javascript:;">
                        Help
                    </a>
                    <a class="btn btn-orange" href="javascript:;">
                        Contact
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>
<h2 id="highcharts">图表</h2>
<h3 id="highcharts-curve">曲线图</h3>
<p>
    <div id="container-1"></div>
    <script>
        $(function () {
            var config = {
                type:'line',
                selector: '#container-1',
                title: '温度趋势图',
                subtitle: '副标题',
                xData: ['一月','二月','三月','四月','五月','六月','七月','八月','九月','十月','十一月','十二月'],
                yCompany: '温度趋势图(°C)',
                suffix: '°C',
                data: [{
                    name: '南京',
                    data: [7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6]
                }, {
                    name: '苏州',
                    data: [-0.2, 0.8, 5.7, 11.3, 17.0, 22.0, 24.8, 24.1, 20.1, 14.1, 8.6, 2.5]
                }, {
                    name: '杭州',
                    data: [-0.9, 0.6, 3.5, 8.4, 13.5, 17.0, 18.6, 17.9, 14.3, 9.0, 3.9, 1.0]
                }, {
                    name: '北京',
                    data: [3.9, 4.2, 5.7, 8.5, 11.9, 15.2, 17.0, 16.6, 14.2, 10.3, 6.6, 4.8]
                }]
            }
            tool.initchart(config);
        });
    </script>
<pre class="syntax brush-javascript">
$(function () {
    var config = {
        type:'line', //图表类型
        selector: '#container-1', //选择器
        title: '温度趋势图', //标题
        subtitle: '副标题', //副标题
        xData: ['一月','二月','三月','四月','五月','六月','七月','八月','九月','十月','十一月','十二月'], //x轴数组
        yCompany: '温度趋势图(°C)', //Y轴说明
        suffix: '°C', //单位
        data: [{
            name: '南京',
            data: [7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6]
        }, {
            name: '苏州',
            data: [-0.2, 0.8, 5.7, 11.3, 17.0, 22.0, 24.8, 24.1, 20.1, 14.1, 8.6, 2.5]
        }, {
            name: '杭州',
            data: [-0.9, 0.6, 3.5, 8.4, 13.5, 17.0, 18.6, 17.9, 14.3, 9.0, 3.9, 1.0]
        }, {
            name: '北京',
            data: [3.9, 4.2, 5.7, 8.5, 11.9, 15.2, 17.0, 16.6, 14.2, 10.3, 6.6, 4.8]
        }]
    }
    tool.initchart(config);
});
</pre>
</p>
<h3 id="highcharts-column">柱状图</h3>
<p>
<div id="container-2"></div>
<script>
    $(function () {
        var config = {
            type:'column', //图表类型
            selector: '#container-2', //选择器
            title: '温度趋势图', //标题
            subtitle: '副标题', //副标题
            xData: ['一月','二月','三月','四月','五月','六月','七月','八月','九月','十月','十一月','十二月'], //x轴数组
            yCompany: '温度趋势图(°C)', //Y轴说明
            suffix: '°C', //单位
            data: [{
                name: '南京',
                data: [7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6]
            }, {
                name: '苏州',
                data: [-0.2, 0.8, 5.7, 11.3, 17.0, 22.0, 24.8, 24.1, 20.1, 14.1, 8.6, 2.5]
            }, {
                name: '杭州',
                data: [-0.9, 0.6, 3.5, 8.4, 13.5, 17.0, 18.6, 17.9, 14.3, 9.0, 3.9, 1.0]
            }, {
                name: '北京',
                data: [3.9, 4.2, 5.7, 8.5, 11.9, 15.2, 17.0, 16.6, 14.2, 10.3, 6.6, 4.8]
            }]
        }
        tool.initchart(config);
    });
</script>
<pre class="syntax brush-javascript">
$(function () {
    var config = {
        type:'column', //图表类型
        selector: '#container-2', //选择器
        title: '温度趋势图', //标题
        subtitle: '副标题', //副标题
        xData: ['一月','二月','三月','四月','五月','六月','七月','八月','九月','十月','十一月','十二月'], //x轴数组
        yCompany: '温度趋势图(°C)', //Y轴说明
        suffix: '°C', //单位
        data: [{
            name: '南京',
            data: [7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6]
        }, {
            name: '苏州',
            data: [-0.2, 0.8, 5.7, 11.3, 17.0, 22.0, 24.8, 24.1, 20.1, 14.1, 8.6, 2.5]
        }, {
            name: '杭州',
            data: [-0.9, 0.6, 3.5, 8.4, 13.5, 17.0, 18.6, 17.9, 14.3, 9.0, 3.9, 1.0]
        }, {
            name: '北京',
            data: [3.9, 4.2, 5.7, 8.5, 11.9, 15.2, 17.0, 16.6, 14.2, 10.3, 6.6, 4.8]
        }]
    }
    tool.initchart(config);
});
</pre>
</p>
<h3 id="highcharts-pie">饼状图</h3>
<p>
<div id="container-3"></div>
<script>
    $(function () {
        var config = {
            type:'pie',
            title: '浏览器市场占有率',
            selector: '#container-3',
            yCompany: '占有率', //文字说明
            data: [
                ['Firefox',   45.0],
                ['IE',       26.8],
                {
                    name: 'Chrome',
                    y: 12.8,
                    sliced: true,
                    selected: true
                },
                ['Safari',    8.5],
                ['Opera',     6.2],
                ['Others',   0.7]
            ]
        }
        tool.initchart(config);
    });
</script>
<pre class="syntax brush-javascript">
$(function () {
    var config = {
        type:'pie', //图表类型
        title: '浏览器市场占有率', //标题
        selector: '#container-3', //选择器
        yCompany: '占有率', //文字说明
        data: [
            ['Firefox',   45.0],
            ['IE',       26.8],
            {
                name: 'Chrome',
                y: 12.8,
                sliced: true,
                selected: true
            },
            ['Safari',    8.5],
            ['Opera',     6.2],
            ['Others',   0.7]
        ]
    }
    tool.initchart(config);
});
</pre>
</p>
<h2 id="btn-groups-sizing"></h2>
<p></p>
<h2 id="btn-groups-nested"></h2>
<p></p>
<h2 id="btn-groups-vertical"></h2>
<p></p>
<h2 id="btn-groups-justified"></h2>
<p></p>
<h2 id=""></h2>
<p></p>
