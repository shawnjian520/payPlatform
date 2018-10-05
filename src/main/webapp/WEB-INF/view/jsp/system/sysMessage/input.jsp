<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String basePath = request.getContextPath();
%>
<%@include file="../../common/input-header.jsp" %>
<%@include file="../../common/plugins/css/summernote.jsp" %>
<%@include file="../../common/plugins/css/uploadify.jsp" %>
<%@include file="../../common/plugins/css/select2.jsp" %>
<div id="page-content">
    <div class="col-md-12">
        <div class="panel panel-white">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <c:if test="${tsysMessage==null || tsysMessage.wid==null || tsysMessage.wid=='' }"><font data-localize="frame_tzgl.xtz_xtz">写通知</font></c:if>
                    <c:if test="${readonly=='1' || readonly=='3' }">${tsysMessage.xxbt}</c:if>
                    <c:if test="${readonly=='2' }"><font data-localize="frame_tzgl.xtz_bjtz">编辑通知</font></c:if>
                </h4>
            </div>
            <form role="form" class="form-horizontal">
                <input type="hidden" id="wid" name="wid" value="${tsysMessage.wid}"/>
                <input type="hidden" id="xxfsr" name="xxfsr" value="${tsysMessage.xxfsr}"/>
                <input type="hidden" id="xxfsbm" name="xxfsbm" value="${tsysMessage.xxfsbm}"/>
                <input type="hidden" id="fszt" name="fszt" value="${tsysMessage.fszt}"/>
                <input type="hidden" id="fj" name="fj" value="${fj}"/>
                <input type="hidden" id="jsrid" name="jsrid" value="${jsrid}"/>
                <c:if test="${readonly!='3' }">
                    <table style="width: 100%;">
                        <tr>
                            <td width="10px;">&nbsp;</td>
                            <td>
                                <div class="form-group">
                                    <label class="col-xxxl-1 col-sm-2 control-label ell"> <font data-localize="frame_tzgl.xtz_jsbm">接收部门</font> ： </label>

                                    <div class="col-xxxl-11 col-sm-10">
                                        <input type="text" id="jsrname" name="jsrname"
                                               readonly="readonly" class="validate[required] form-control"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xxxl-1 col-sm-2 control-label ell"> <font data-localize="frame_tzgl.xtz_bt">主题</font>： </label>

                                    <div class="col-xxxl-11 col-sm-10">
                                        <input type="text" id="xxbt" name="xxbt"
                                               class="validate[required,maxSize[40]] form-control"
                                               value="${tsysMessage.xxbt}"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xxxl-1 col-sm-2 control-label ell"> <font data-localize="frame_tzgl.xtz_tzlx">通知类型</font>： </label>

                                    <div class="col-xxxl-11 col-sm-10">
                                        <select value="${tsysMessage.xxly}"
                                                zdlb="xxly" name="xxly" id="xxly"
                                                class="validate[required]  form-control select2-code"
                                                style="width: 100%;height: 32px;"></select>
                                    </div>
                                </div>
                                <c:if test="${readonly!='2' || (readonly=='2' && listfj!=null && listfj[0]!=null) }">
                                    <div class="form-group">
                                        <label class="col-xxxl-1 col-sm-2 control-label ell"> <font data-localize="frame_tzgl.xtz_tjfj">添加附件</font>： </label>
                                        <div class="col-xxxl-11 col-sm-10">
                                            <c:if test="${tsysMessage==null || tsysMessage.wid==null || tsysMessage.wid=='' || tsysMessage.fszt!='1' }">
                                                <input type="file" id="fileUpload">
                                            </c:if>
                                            <input type="hidden" id="countfj" value="${countfj }"/>
                                            <div id="fjdiv">
                                                <c:forEach items="${listfj }" var="obj">
                                                    <div><a onclick="tool.downloadfile('${obj.fj }')">${obj.fjm }</a>
                                                        <c:if test="${tsysMessage==null || tsysMessage.wid==null || tsysMessage.wid=='' || tsysMessage.fszt!='1' }">
                                                            <a name="deletefj"
                                                               onclick="removefj('${obj.fjm},${obj.fj}',this)" data-localize="frame_tzgl.xtz_scfj">删除附件</a></c:if>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                        </div>
                                    </div>
                                </c:if>

                                <div class="form-group">
                                    <label class="col-xxxl-1 col-sm-2 control-label ell"> <font data-localize="frame_tzgl.xtz_zwnr">正文内容</font>： </label>
                                    <div class="col-xxxl-11 col-sm-10">
                                        <input type="hidden" name="xxnr" id="xxnr" value=""/>
                                        <textarea style="" class="summernote"
                                                  placeholder="Info...">${tsysMessage.xxnr}</textarea>
                                    </div>
                                </div>

                                <c:if test="${tsysMessage==null || tsysMessage.wid==null || tsysMessage.wid=='' || tsysMessage.fszt!='1' }">
                                    <div class="form-group" id="savediv">
                                        <div class="col-md-offset-2 col-sm-9">
                                            <button class="btn btn-sm btn-success" type="button"
                                                    onclick="saveData_xxfb1(this)">
                                               <font data-localize="frame_button.send">发送</font>  <i class="fa fa-check"></i>
                                            </button>
                                            <button class="btn btn-sm btn-success" type="button"
                                                    onclick="saveData_xxfb(this)">
                                               <font data-localize="frame_button.bccg" >  保存草稿 </font><i class="fa fa-check"></i>
                                            </button>
                                        </div>
                                    </div>
                                </c:if>
                            </td>
                            <td valign="top" width="300px;">
                                <div class="col-sm-12" style="height: 480px;">
                                    <div class="tabbable" style="height: 480px;">
                                        <ul style="height: 35px;"
                                            class="nav nav-tabs padding-12 tab-color-blue background-blue"
                                            id="myTab4">
                                            <li class="active" style="height: 35px;"><a style="height: 35px;" data-localize="frame_tzgl.xtz_jsbm">接收部门</a>
                                            </li>
                                            <div style="margin-top: 10px;" id="xzbms"><font data-localize="frame_tzgl.xtz_hwxzbm">还未选中部门</font></div>
                                        </ul>

                                        <div class="tab-content" style="height: 410px;">
                                            <div id="home4" name="jsrDiv" class="tab-pane in active"
                                                 style="padding: 0px;">
                                               <iframe width="270px" marginwidth="0" scrolling="yes" height="410px"
                                                        frameborder="0" name="jsbmIframe" id="jsbmIframe"
                                                        loadsrc="<%=basePath%>/s/biz/sysMessage/getjsbm?wid=${tsysMessage.wid}"></iframe>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </table>

                </c:if>
                <c:if test="${readonly=='3' }">
                    <div class="form-group">
                        <label class="col-xxxl-1 col-sm-2 control-label ell"> <font data-localize="frame_tip.fj">附件</font>： </label>
                        <div class="col-xxxl-11 col-sm-10">
                            <div id="fjdiv">
                                <c:forEach items="${listfj }" var="obj">
                                    <div><a onclick="tool.downloadfile('${obj.fj }')">${obj.fjm }</a></div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-xxxl-1 col-sm-2 control-label ell"> <font data-localize="frame_tzgl.xtz_nr">内容</font>： </label>
                        <div class="col-xxxl-11 col-sm-10" style="padding-top: 5px;">
                                ${tsysMessage.xxnr}
                        </div>
                    </div>
                    <div class="form-group" id="savediv">
                        <div class="col-md-offset-1 col-sm-12">
                            <button class="btn btn-sm btn-success" type="button"
                                    onclick="tool.openview(this,'<%=basePath%>/s/biz/sysMessage/openCreatehf?wid=${tsysMessage.wid }','回复通知')">
                                <font data-localize="frame_button.reply">回复</font> <i class="fa fa-check"></i>
                            </button>
                        </div>
                    </div>
                </c:if>
            </form>
        </div>
    </div>
</div>
<%@include file="../../common/plugins/js/summernote.jsp" %>
<%@include file="../../common/plugins/js/uploadify.jsp" %>
<%@include file="../../common/plugins/js/select2.jsp" %>
<%@include file="../../common/input-bottom.jsp" %>
<script>

    subPage = {

        save_callback: function (data, form_element) {
            $('#savediv').remove();
            $('#fileUpload').remove();
            $('#upload').remove();
            $('a[name*="deletefj"]').remove();
        }
    }
    function saveData_xxfb(tt) {
        var sHTML = $('.summernote').code();
        $('#xxnr').val(sHTML);

        tool.saveData(tt);
    }
    function saveData_xxfb1(tt) {
        var sHTML = $('.summernote').code();
        $('#xxnr').val(sHTML);
        $('#fszt').val('1');
        tool.saveData(tt);

    }
    $(document).ready(function () {
        tool.initFileUpload("#fileUpload", null, null, true, "*.*", 1, onSelect, onUploadSuccess);

         $('#jsbmIframe').each(function () {
            var tt = $(this);
            var url = $(this).attr('loadsrc');

            if (url != null && url.indexOf('jd=') == -1) {
                tt.attr('src', tool.initParams(url));
            }
        });
    });
    function onSelect(file) {
        $("#upload").css({"display": "inline-block"});
    }
    function onUploadSuccess(file, data, response) {
        data = eval("(" + data + ")");
        var path = data.filePath;
        $('#fj').val($('#fj').val() + data.fileold + ',' + data.filePath + ';');
        $('#fjdiv').append('<div>' + data.fileold + '<a name="deletefj" onclick="removefj(\'' +
                data.fileold + ',' + data.filePath + ';\',this)">删除附件</a></div>');
    }
    function removefj(fj, tt) {
        $('#fj').val($('#fj').val().replace(fj, ''));
        $(tt).parent().remove();
    }
</script>