<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<form id="input-form" method="post" class="form-horizontal">
    <input type="hidden" name="wid" id="wid" value="${object.wid}">
    <input type="hidden" name="updeparttype" id="updeparttype" value="${object.updeparttype}">
    <div class="form-group">
        <label class="col-sm-2 control-label" for="name">
            <font data-localize="frame_xtgl.bmgl_zzjglxgl_mc">名称</font>：
        </label>
        <div class="col-sm-9">
            <input type="text" class="form-control validate[required,maxSize[10]]" id="name" name="name"
                   value="${object.name}">
            <span class="symbol required"></span>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label" for="departtype">
            <font data-localize="frame_xtgl.bmgl_zzjglxgl_lx">类型</font>：
        </label>
        <div class="col-sm-9">
            <input type="text" class="form-control validate[custom[positiveInteger],maxSize[10]] " id="departtype"
                   name="departtype" value="${object.departtype}">
            <span class="symbol required"></span>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label" for="departtype">
            <font data-localize="frame_xtgl.bmgl_zzjglxgl_gllx">关联类型</font>：
        </label>
        <div class="col-sm-9">
            <div id="zbdiv">
                <c:forEach items="${departTypelist}" var="obj" varStatus="s">
                    <label class="checkbox-inline">
                        <input type="checkbox" name="othertype" class="mgc"
                               <c:if test="${fn:contains(object.othertype,obj.id)}">checked="checked"</c:if>
                               value="${obj.id}">&nbsp;${obj.caption}
                    </label>
                </c:forEach>
            </div>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">
            <font data-localize="frame_xtgl.bmgl_zzjglxgl_glyhz">关联用户组</font>：
        </label>
        <div class="col-sm-9" id="groupdiv">
            <c:forEach items="${allgrouplist}" var="obj" varStatus="s">
                <label class="checkbox-inline">
                    <input type="checkbox" name="groupid" class="mgc"
                           <c:if test="${fn:contains(object.groupid,obj.id)}">checked="checked"</c:if>
                           value="${obj.id}">&nbsp;${obj.caption}
                </label>
            </c:forEach>
        </div>
    </div>
    <div class="form-group hide">
        <label class="col-sm-2 control-label">
            <font data-localize="frame_xtgl.bmgl_zzjglxgl_glxd">关联学段</font>：
        </label>
        <div class="col-sm-9" id="leftStageMenudiv">
            <c:forEach items="${xdlist}" var="obj" varStatus="s">
                <label class="checkbox-inline">
                    <input type="checkbox" name="leftStageMenu" class="mgc"
                           <c:if test="${fn:contains(object.leftStageMenu,obj.id)}">checked="checked"</c:if>
                           value="${obj.id}">&nbsp;${obj.caption}
                </label>
            </c:forEach>

        </div>
    </div>
    <div class="form-group">
        <div class="col-md-offset-2 col-sm-9">
            <button class="btn btn-sm btn-success" type="button" onclick="page1.savetype(this)">
                <font data-localize="frame_button.save">保存</font><i class="fa fa-check"></i></button>
            <c:if test="${object.wid!=null}">
                <c:if test="${object.wid!='01' }">
                    <button class="btn btn-sm btn-success" type="button" onclick="page1.submitRemoveMenu()">
                        <font data-localize="frame_button.delete">删除 </font> <i class="fa fa-times"></i></button>
                </c:if>
                <button class="btn btn-sm btn-success" type="button"
                        onclick="page1.addtype('${object.departtype}')">
                    <font data-localize="frame_button.newsub">新增子类型</font><i class="fa fa-plus"></i></button>
            </c:if>
        </div>
    </div>
</form>
<script>
    $(function () {
        if (stageMenu) {
            $('#leftStageMenudiv').parent().removeClass('hide');
        }
    });
</script>
<%@include file="../../common/plugins/js/frame.jsp" %>