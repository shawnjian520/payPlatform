<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="jd" uri="/WEB-INF/TLD/custom.tld" %>
<h1 id="custom-tag" class="page-header">
    自定义标签
</h1>

<p>为方便开发,框架封装以下标签</p>

<h2 id="tag-lable">lable</h2>
<p>
<pre class="syntax brush-html">
&lt;!-- 如要使用封装的jd标签,需要引入此tld --!&gt;
&lt;%@ taglib prefix="jd" uri="/WEB-INF/TLD/custom.tld" %&gt;
&lt;!-- 控件必须放到form中 --!&gt;
&lt;form class="form-horizontal"&gt;
    &lt;!-- jd:lable 中 lable 为 解析后lable的文字说明 --!&gt;
    &lt;!-- jd:lable 中 id 为解析后lable中的for(可为空) --!&gt;
    &lt;!-- jd:lable 中 col 为浏览器窗口宽度在1200~1366px范围内时一行放置几个控件,默认为1 --!&gt;
    &lt;jd:lable id="sample-1" col="3" lable="示例-1"&gt;
        &lt;input type="text" class="form-control" id="sample-1" name="sample-1"&gt;
    &lt;/jd:lable&gt;
    &lt;jd:lable id="sample-2" col="3" lable="示例-2"&gt;
        &lt;input type="text" class="form-control" id="sample-2" name="sample-2"&gt;
    &lt;/jd:lable&gt;
    &lt;jd:lable id="sample-3" col="3" lable="示例-3"&gt;
        &lt;input type="text" class="form-control" id="sample-3" name="sample-3"&gt;
    &lt;/jd:lable&gt;
&lt;/form&gt;
</pre>
    <jd:panel className="panel-white mt20" title="自定义TAG示例 <span class=\"\">一行3列</span>">
        <form class="form-horizontal">
            <jd:lable id="sample-1" col="3" lable="示例-1">
                <input type="text" class="form-control" id="sample-1" name="sample-1">
            </jd:lable>
            <jd:lable id="sample-2" col="3" lable="示例-2">
                <input type="text" class="form-control" id="sample-2" name="sample-2">
            </jd:lable>
            <jd:lable id="sample-3" col="3" lable="示例-3">
                <input type="text" class="form-control" id="sample-3" name="sample-3">
            </jd:lable>

        </form>
    </jd:panel>
<pre class="syntax brush-html">
&lt;form class="form-horizontal"&gt;
    &lt;jd:lable id="sample-4" col="2" lable="示例-4"&gt;
        &lt;input type="text" class="form-control" id="sample-4" name="sample-4"&gt;
    &lt;/jd:lable&gt;
    &lt;jd:lable id="sample-5" col="2" lable="示例-5"&gt;
        &lt;input type="text" class="form-control" id="sample-5" name="sample-5"&gt;
    &lt;/jd:lable&gt;
&lt;/form&gt;
</pre>
    <jd:panel className="panel-white mt20" title="自定义TAG示例 <span class=\"\">一行2列</span>">
        <form class="form-horizontal">
            <jd:lable id="sample-4" col="2" lable="示例-4">
                <input type="text" class="form-control" id="sample-4" name="sample-4">
            </jd:lable>
            <jd:lable id="sample-5" col="2" lable="示例-5">
                <input type="text" class="form-control" id="sample-5" name="sample-5">
            </jd:lable>
        </form>
    </jd:panel>
<pre class="syntax brush-html">
 &lt;form class="form-horizontal"&gt;
    &lt;jd:lable id="sample-6" col="1" lable="示例-6"&gt;
        &lt;input type="text" class="form-control" id="sample-6" name="sample-6"&gt;
    &lt;/jd:lable&gt;
    &lt;jd:lable id="sample-7" col="1" lable="示例-7"&gt;
        &lt;input type="text" class="form-control" id="sample-7" name="sample-7"&gt;
    &lt;/jd:lable&gt;
&lt;/form&gt;
</pre>
    <jd:panel className="panel-white mt20" title="自定义TAG示例 <span class=\"\">一行1列</span>">
        <form class="form-horizontal">
            <jd:lable id="sample-6" col="1" lable="示例-6">
                <input type="text" class="form-control" id="sample-6" name="sample-6">
            </jd:lable>
            <jd:lable id="sample-7" col="1" lable="示例-7">
                <input type="text" class="form-control" id="sample-7" name="sample-7">
            </jd:lable>
        </form>
    </jd:panel>
</p>
<h2 id="tag-panel">panel</h2>

<p>
<pre class="syntax brush-html">
&lt;!-- jd:panel 中className 为panel的class,id为解析后的id,title为解析后的标题 (id,title可为空)--!&gt;
&lt;jd:panel className="panel-white" id="panel-1" title="Panel White"&gt;
    Nullam quis risus eget urna mollis ornare vel eu leo.
&lt;/jd:panel&gt;
</pre>
    <div class="row">
        <div class="col-lg-6 mt20">
            <jd:panel className="panel-white" id="panel-1" title="Panel White">
                Nullam quis risus eget urna mollis ornare vel eu leo.
            </jd:panel>
        </div>
        <div class="col-lg-6 mt20">
            <jd:panel className="panel-blue" id="panel-2" title="Panel Blue">
                Nullam quis risus eget urna mollis ornare vel eu leo.
            </jd:panel>
        </div>
        <div class="col-lg-6">
            <jd:panel className="panel-orange" id="panel-3" title="Panel Orange">
                Nullam quis risus eget urna mollis ornare vel eu leo.
            </jd:panel>
        </div>
        <div class="col-lg-6">
            <jd:panel className="panel-azure" id="panel-4" title="Panel Azure">
                Nullam quis risus eget urna mollis ornare vel eu leo.
            </jd:panel>
        </div>
    </div>
</p>