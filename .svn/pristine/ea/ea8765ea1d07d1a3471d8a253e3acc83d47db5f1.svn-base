<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="col-md-12">
    <div class="panel panel-white">
        <div class="panel-heading">
            <h4 class="panel-title">机构信息</h4>
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
                <input type="hidden" id="is_change" name="is_change" value="0">
                <input type="hidden" id="departid" name="departid" value="${object.departid }">
                <input type="hidden" id="updepartid" name="updepartid" value="${object.updepartid }">
                <input type="hidden" id="city" name="city">
                <input type="hidden" id="depth" name="depth">
                <input type="hidden" id="type" name="type">
                <input type="hidden" id="bcxz" name="bcxz">
                <div class="alert dn">
                    <button data-dismiss="alert" class="close">
                        ×
                    </button>
                    <strong></strong>
                </div>
                <div class="form-group hide" id="mrzhdiv">
                    <label class="col-sm-2 control-label">
                        <font data-localize="frame_xtgl.bmgl_zzjggl_bmbm"> </font>
                    </label>

                    <div class="col-sm-10" style="color: red;font-size: 16px;">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">
                        <font data-localize="frame_xtgl.bmgl_zzjggl_bmbm"> 部门编码</font>：
                    </label>

                    <div class="col-sm-4">
                        <c:if test="${object.departid==null }">
                            <input type="text" name="departid1" id="departid1" readonly="readonly" class="form-control"
                                   value="(自动生成)">
                        </c:if>
                        <c:if test="${object.departid!=null }">
                            <input type="text" name="departid1" id="departid1" readonly="readonly" class="form-control"
                                   value="${object.departid}">
                        </c:if>
                    </div>
                    <label class="col-sm-2 control-label">
                        <font data-localize="frame_xtgl.bmgl_zzjggl_sjbmmc"> 上级部门名称</font>：
                    </label>

                    <div class="col-sm-4">
                        <input type="text" name="updepartname" id="updepartname" readonly="readonly"
                               class="form-control" value="${object.updepartname}">
                        <span class="symbol required"></span>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="departname">
                        <font data-localize="frame_xtgl.bmgl_zzjggl_bmmc"> 部门名称</font>：
                    </label>

                    <div class="col-sm-4">
                        <input type="text" name="departname" id="departname" class="form-control validate[required]"
                               value="${object.departname}">
                        <span class="symbol required"></span>
                    </div>
                    <label class="col-sm-2 control-label" for="departtype">
                        <font data-localize="frame_xtgl.bmgl_zzjggl_bmlx">部门类型</font>：
                    </label>

                    <div class="col-sm-4">
                        <select name="departtype" id="departtype" class="form-control select2-auto validate[required] ">
                            <c:forEach items="${departtyoelist}" var="o" varStatus="s">
                                <option value="${o.id}"
                                        <c:if test="${o.id==object.departtype}">selected="selected"</c:if> >${o.caption }</option>
                            </c:forEach>

                        </select>
                        <span class="symbol required"></span>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">
                        <font data-localize="frame_xtgl.bmgl_zzjggl_zt">状态</font>：
                    </label>

                    <div class="col-sm-4">
                        <label class="radio-inline">
                            <input name="state" value="1" type="radio" class="mgr" <c:if test="${object.state==1}">
                                   checked="checked"</c:if>>
                            <font data-localize="frame_xtgl.bmgl_zzjggl_ky">启用</font>
                        </label>
                        <label class="radio-inline">
                            <input name="state" value="0" type="radio" class="mgr" <c:if test="${object.state==0}">
                                   checked="checked"</c:if>>
                            <font data-localize="frame_xtgl.bmgl_zzjggl_jy"> 禁用</font>
                        </label>
                        <span class="symbol required-radio"></span>
                    </div>
                    <label class="col-sm-2 control-label" for="linkname">
                        <font data-localize="frame_xtgl.bmgl_zzjggl_px">排序</font>：
                    </label>

                    <div class="col-sm-4">
                        <input type="text" name="ph" id="ph" class="form-control validate[custom[integer]]"
                               value="${object.ph}">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="linkname">
                        <font data-localize="frame_xtgl.bmgl_zzjggl_lxr">联系人</font>：
                    </label>

                    <div class="col-sm-4">
                        <input type="text" name="linkname" id="linkname" class="form-control"
                               value="${object.linkname}">
                    </div>
                    <label class="col-sm-2 control-label" for="address">
                        <font data-localize="frame_xtgl.bmgl_zzjggl_lxdz">联系地址</font>：
                    </label>

                    <div class="col-sm-4">
                        <input type="text" name="address" id="address" class="form-control" value="${object.address}">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="email">
                        <font data-localize="frame_xtgl.bmgl_zzjggl_lxyx">联系邮箱</font>：
                    </label>

                    <div class="col-sm-4">
                        <input type="text" name="email" id="email" class="form-control" value="${object.email}">
                    </div>
                    <label class="col-sm-2 control-label" for="linktel">
                        <font data-localize="frame_xtgl.bmgl_zzjggl_lxdh">联系电话</font>：
                    </label>

                    <div class="col-sm-4">
                        <input type="text" name="linktel" id="linktel" class="form-control" value="${object.linktel}">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="postcode">
                        <font data-localize="frame_xtgl.bmgl_zzjggl_lxyb">联系邮编</font>：
                    </label>

                    <div class="col-sm-4">
                        <input type="text" name="postcode" id="postcode" class="form-control"
                               value="${object.postcode}">
                    </div>
                    <label class="col-sm-2 control-label" for="fax">
                        <font data-localize="frame_xtgl.bmgl_zzjggl_lxcz">联系传真</font>：
                    </label>

                    <div class="col-sm-4">
                        <input type="text" name="fax" id="fax" class="form-control" value="${object.fax}">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-offset-2 col-sm-9">
                        <button class="btn btn-sm btn-success" type="button" onclick="page.saveDepart()">
                            保存 <i class="fa fa-check"></i>
                        </button>
                        <button class="btn btn-sm btn-success" type="button" onclick="page.addChilddepart()">
                            新增下级 <i class="fa fa-plus"></i>
                        </button>
                        <button class="btn btn-sm btn-success" type="button" onclick="page.deleteDepart()">
                            删除 <i class="fa fa-times"></i>
                        </button>
                        <button class="btn btn-sm btn-success" type="button" onclick="page.viewOfDepart()">
                            查看该部门用户 <i class="fa fa-user"></i>
                        </button>
                        <button class="btn btn-sm btn-success" type="button"
                                onclick="tool.exportData('exportDepartUSer.jsp?departid=${object.departid}')">
                            导出该部门及其下级部门用户 <i class="fa fa-sign-in"></i>
                        </button>
                        <br/><br/><br/>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<script>
    subPage = {
        save_callback: function (data, $form_element) {
            //如果表单中有 wid 元素 并且 data 对象中有wid属性
            if (!isBlank(data.data)) {
                $form_element.find("#departid").val(data.data.departid);
                $('#mrzhdiv').find('div').html('已创建账号：' + data.data.userloginid + '，密码默认111111');
                $('#mrzhdiv').removeClass('hide');
            }
        }
    }
</script>