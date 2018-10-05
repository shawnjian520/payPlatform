<%@ page language="java" pageEncoding="utf-8" %>
<h1 id="portal" class="page-header">
    <a class="anchorjs-link "></a>门户
</h1>

<p>以下为门户页面示例</p>

<h2 id="portal-basic-info">基本格式</h2>

<p>以下为使用框架内 js/css 编码格式
<pre class="syntax brush-html">
&lt;!DOCTYPE html&gt;
&lt;!--[if IE 8]&gt;&lt;html class="ie8" lang="en"&gt;&lt;![endif]--&gt;
&lt;!--[if IE 9]&gt;&lt;html class="ie9" lang="en"&gt;&lt;![endif]--&gt;
&lt;!--[if !IE]&gt;&lt;!--&gt;
&lt;html lang="en"&gt;
&lt;!--&lt;![endif]--&gt;
&lt;head&gt;
    &lt;title&gt;页面名称 | 门户名称&lt;/title&gt;
    &lt;!-- 引入bootstrap及常用插件的css --&gt;
    &lt;jsp:include page="../../common/portals-header.jsp"&gt;&lt;/jsp:include&gt;
    &lt;!-- 如有自定义css,放到这里 --&gt;
    &lt;!-- start:body --&gt;
    &lt;!-- end:body --&gt;
    &lt;!-- 引入bootstrap及常用插件的js --&gt;
    &lt;jsp:include page="../../common/portals-bottom.jsp"&gt;&lt;/jsp:include&gt;
    &lt;!-- 如有自定义js,放到这里 --&gt;
</pre>
</p>
<p>
    以下为不使用框架内 js/css 编码格式
<pre class="syntax brush-html">
&lt;!DOCTYPE html&gt;
&lt;html lang="zh-CN"&gt;
&lt;head&gt;
    &lt;meta charset="utf-8"&gt;
    &lt;meta http-equiv="X-UA-Compatible" content="IE=edge"&gt;
    &lt;meta name="renderer" content="webkit"&gt;
    &lt;meta name="viewport" content="width=device-width, initial-scale=1"&gt;
&lt;/head&gt;
&lt;body&gt;
    &lt;!-- start:body --&gt;
    &lt;!-- end:body --&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>
</p>
<h2 id="portal-plugins">插件</h2>

<p></p>