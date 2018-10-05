<%@ page language="java" pageEncoding="UTF-8" %> 
<%@include file="../../common/input-header.jsp" %>
<%@include file="../../common/plugins/css/iCheck.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="col-md-8 col-md-offset-2">
    <div class="panel panel-white">
        <div class="panel-heading">
            <h4 class="panel-title" data-localize="frame_yhgl.tjyh">用户信息</h4>
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
            <form class="form-horizontal">
                <input type="hidden" name="is_change" id="is_change" value="0">
                <input type="hidden" name="userid" id="userid" value="${object.userid}">
                <input type="hidden" name="lastlogin" id="lastlogin" value="${object.lastlogin}">
                <input type="hidden" name="userdepart" id="userdepart" value="${object.userdepart}">
                <div class="form-group">
                    <label class="control-label col-sm-3" for="userloginid">
                        <font data-localize="frame_yhgl.dlm">用户名</font> ：
                    </label>

                    <div class="col-sm-9">
                        <input type="text" class="validate[required,maxSize[15]] form-control" id="userloginid"
                               name="userloginid" value="${object.userloginid}">
                        <span class="symbol required"></span>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-3" for="username">
                        <font data-localize="frame_yhgl.yhm"> 昵称</font> ：
                    </label>

                    <div class="col-sm-9">
                        <input type="text" class="validate[required,maxSize[15]] form-control" id="username"
                               name="username" value="${object.username}">
                        <span class="symbol required"></span>
                    </div>
                </div>
                <c:if test="${object.userid == null || object.userid == ''}">
                    <div class="form-group">
                        <label class="control-label col-sm-3">
                            <font data-localize="frame_yhgl.mm"> 密码</font> ：
                        </label>

                        <div class="col-sm-9" style="padding-top: 5px;">
                            <span class="label label-danger">默认密码111111</span>
                        </div>
                    </div>
                </c:if>
                <div class="form-group">
                    <label class="control-label col-sm-3">
                        <font data-localize="frame_yhgl.yhz">用户组</font> ：
                    </label>

                    <div class="col-sm-9" id="groupdiv" value="${groups}">

                        <c:forEach items="${grouplist}" var="obj" varStatus="s">
                            <label class="checkbox-inline">
                                <input type="checkbox" name="groups" class="mgc" value="${obj.id}">&nbsp;${obj.caption}
                            </label>
                        </c:forEach>
                        <span class="symbol required"></span>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-3">
                        <font data-localize="frame_yhgl.czqx">操作权限</font>：
                    </label>

                    <div class="col-sm-9">
                        <c:forEach items="${syscodelist}" var="obj" varStatus="s">
                            <label class="checkbox-inline">
                                <input type="checkbox" name="usertype" class="mgc"
                                       <c:if test="${fn:contains(object.usertype,obj.id)}">checked="checked"</c:if>
                                       value="${obj.id}">&nbsp;${obj.caption}
                            </label>
                        </c:forEach>
                        <span class="symbol required"></span>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-3">
                        <font data-localize="frame_xtgl.bmgl_zzjggl_zt">状态</font> ：
                    </label>

                    <div class="col-sm-9">

                        <label class="radio-inline">
                            <input type="radio" class="mgr" value="1" name="state"
                                   <c:if test="${object.state=='1'}">checked="checked"</c:if>>
                            <font data-localize="frame_xtgl.bmgl_zzjggl_ky">正常</font>
                        </label>
                        <label class="radio-inline">
                            <input type="radio" class="mgr" value="0" name="state"
                                   <c:if test="${object.state=='0'}">checked="checked"</c:if>>
                            <font data-localize="frame_xtgl.bmgl_zzjggl_jy"> 禁用</font>
                        </label>
                        <span class="symbol required"></span>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-12 frame-btn-group">
                        <button class="btn btn-sm btn-success" type="button" onclick="tool.saveData(this)">
                            <font data-localize="frame_button.save">保存</font><i class="fa fa-check"></i>
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <%@include file="../../common/input-bottom.jsp" %>
    <script>
        subPage = {
            save_callback: function (data, $form_element) {
                //如果表单中有 wid 元素 并且 data 对象中有wid属性
                if (!isBlank(data.data)) {
                    $form_element.find("#userid").val(data.data.userid);
                }
            }
        }
        $(function () {
            var groups = $('#groupdiv').attr('value') + ',';
            $('#groupdiv').find('input[type="checkbox"]').each(function (i) {
                if (groups.indexOf($(this).attr('value') + ',') != -1) {
                    $(this).attr('checked', 'checked');
                }
            });
        });
    </script>
</div>
