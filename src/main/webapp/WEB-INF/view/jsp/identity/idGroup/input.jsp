<%@ page language="java" pageEncoding="UTF-8" %>
<%@include file="../../common/input-header.jsp" %>
<%@include file="../../common/plugins/css/select2.jsp" %>
<%@include file="../../common/plugins/css/iCheck.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="col-md-8 col-md-offset-2"> 
    <div class="panel panel-white">
        <div class="panel-heading">
            <h4 class="panel-title">用户组维护</h4>
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
                            <a class="panel-expand" href="#" >
                                <i class="fa fa-expand"></i> <span>全屏</span>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="panel-body">
            <form role="form" class="form-horizontal">
                <input type="hidden" id="is_change0" name="is_change" value="0">
                <input type="hidden" id="groupid" name="groupid" value="${object.groupid}">
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="groupname">
                        <font data-localize="frame_xipz.yhzwh_zmc">组名称</font>：
                    </label>
                    <div class="col-sm-9">
                        <input type="text" placeholder="" class="form-control validate[required,maxSize[15]]" id="groupname"
                               name="groupname" value="${object.groupname}">
                        <span class="symbol required"></span>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">
                        <font data-localize="frame_xipz.jswh_zt">状态</font> ：
                    </label>

                    <div class="col-sm-9">
                        <label class="radio-inline">
                            <input name="state" value="1" type="radio" class="mgr validate[required]"  <c:if
                                    test="${object.state==1||object.state==null||object.state==''}">
                                   checked="checked" </c:if>>
                            <font data-localize="frame_xtgl.bmgl_zzjggl_ky">启用</font>
                        </label>
                        <label class="radio-inline">
                            <input name="state" value="0" type="radio" class="mgr validate[required]"  <c:if
                                    test="${object.state!=1&&object.state!=null&&object.state!=''}">
                                   checked="checked" </c:if>>
                            <font data-localize="frame_xtgl.bmgl_zzjggl_jy"> 禁用</font>
                        </label>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label">
                        <font data-localize="frame_xtgl.sjzd_zdwh_zdlb">所属分组</font>：
                    </label>
                    <div class="col-sm-9">

                        <select name="grouptype" id="grouptype" data-show-searchbox="true"
                                class="form-control select2-auto parameter">
                            <c:forEach items="${syscodelist}" var="c" varStatus="s">
                                <option
                                        <c:if test="${object.grouptype==c.id }">selected="selected"</c:if>
                                        value="${c.id }">${c.caption}</option>
                            </c:forEach>
                        </select>
                        <span class="symbol required"></span>
                    </div>
                </div>


                <div class="form-group">
                    <label class="col-sm-2 control-label">
                        <font data-localize="frame_xtgl.rzgl_ms">描述</font>：
                    </label>

                    <div class="col-sm-9">
                        <input type="text" placeholder="" class="form-control " id="" value="描述暂不可用（忽略）">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label"><font
                            data-localize="frame_xipz.yhzwh_yyjs">拥有角色 </font>：</label>
                    <div class="col-sm-9" id="groupdiv">

                        <c:forEach items="${allRoles}" var="obj" varStatus="s">

                            <label class="checkbox-inline">
                                <input type="checkbox" name="myRoles_id" class="mgc"
                                <c:forEach items="${myRoles_id}" var="a" varStatus="ms">
                                       <c:if test="${obj.roleid==a}">checked="checked"</c:if>
                                </c:forEach> value="${obj.roleid}">&nbsp;${obj.rolename}
                            </label>
                        </c:forEach>

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
<%@include file="../../common/plugins/js/select2.jsp" %>
<%@include file="../../common/input-bottom.jsp" %>
<script>

    subPage = {
        save_callback: function (data, $form_element) {
            //如果表单中有 wid 元素 并且 data 对象中有wid属性
            if (!isBlank(data.data)) {
                $form_element.find("#groupid").val(data.data.groupid);
            }
        }
    }
    $(function () {
        /* var html = '';
         $('#groupdiv').find('input[type="checkbox"]').each(function (i) {
         html += '<label class="checkbox-inline">' + document.getElementById($(this).attr('id')).outerHTML + $(this).next('label').html() + '</label>';
         });
         $('#groupdiv').html(html + "<span class=\"symbol required\"></span>");*/
    });
</script>