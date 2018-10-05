<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../../common/input-header.jsp" %>
<%@include file="../../common/plugins/css/summernote.jsp" %>
<%@include file="../../common/plugins/css/uploadify.jsp" %>
<%@include file="../../common/plugins/css/select2.jsp" %>
<div id="page-content">
    <div class="col-md-12">
        <div class="panel panel-white">
            <div class="panel-heading" style="padding: 5px;"><h3>&nbsp;回复通知</h3></div>
            <form role="form" class="form-horizontal">
                <input type="hidden" id="wid" name="wid" value="${tsysMessage.wid}"/>
                <input type="hidden" id="xxfsr" name="xxfsr" value="${tsysMessage.xxfsr}"/>
                <input type="hidden" id="xxfsbm" name="xxfsbm" value="${tsysMessage.xxfsbm}"/>
                <input type="hidden" id="fszt" name="fszt" value="${tsysMessage.fszt}"/>
                <input type="hidden" id="fj" name="fj" value="${fj}"/>
                <input type="hidden" id="jsrid" name="jsrid" value="${jsrid}"/>

                <div class="form-group">
                    <label class="col-sm-1 control-label" for="name"> 接收部门 ： </label>

                    <div class="col-sm-11">
                        <input type="text" id="jsrname" name="jsrname"
                               readonly="readonly" class="validate[required] form-control" value="${jsrname }"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 control-label" for="name"> 通知类型 ： </label>

                    <div class="col-sm-11">
                        <input type="hidden" name="xxly" id="xxly" value="${tsysMessage.xxly }"/>
                        <select value="${tsysMessage.xxly}" disabled="disabled"
                                zdlb="xxly" name="xxly1" id="xxly1"
                                class="validate[required]  form-control select2-code"
                                style="width: 100%;height: 32px;"></select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 control-label" for="name"> 主题： </label>

                    <div class="col-sm-11">
                        <input type="text" id="xxbt" name="xxbt"
                               readonly="readonly" class="validate[required] form-control"
                               value="${tsysMessage.xxbt }"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 control-label" for="name"> <c:if
                            test="${readonly!='2' }">添加</c:if>附件： </label>

                    <div class="col-sm-11">
                        <c:if test="${tsysMessage==null || tsysMessage.wid==null || tsysMessage.wid=='' || tsysMessage.fszt!='1' }">
                            <input type="file" id="fileUpload">
                        </c:if>
                        <input type="hidden" id="countfj" value="${countfj }"/>
                        <div id="fjdiv">
                            <c:forEach items="${listfj }" var="obj">
                                <div>${obj.fjm }
                                    <c:if test="${tsysMessage==null || tsysMessage.wid==null || tsysMessage.wid=='' || tsysMessage.fszt!='1' }">
                                        <a name="deletefj"
                                           onclick="removefj('${obj.fjm},${obj.fj}',this)">删除附件</a></c:if></div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 control-label" for="name"> 正文内容： </label>
                    <div class="col-sm-11">
                        <input type="hidden" name="xxnr" id="xxnr" value=""/>
                        <textarea style="" class="summernote" placeholder="输入中文内容...">${tsysMessage.xxnr}</textarea>
                    </div>
                </div>

                <div class="form-group" id="savediv">
                    <div class="col-md-offset-1 col-sm-9">
                        <button class="btn btn-sm btn-success" type="button"
                                onclick="saveData_xxfb1(this)">
                            发送 <i class="fa fa-check"></i>
                        </button>
                    </div>
                </div>
                <br/>
            </form>


            <style>
                #fjdiv {
                    margin-top: 5px;
                }

                #fjdiv div {
                    line-height: 25px;
                    height: 25px;
                }

                #fjdiv div a {
                    cursor: pointer;
                }
            </style>
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
            $('a[name*="deletefj"]').remove();
        }
    }
    function saveData_xxfb1(tt) {
        var sHTML = $('.summernote').code();
        $('#xxnr').val(sHTML);
        $('#fszt').val('1');
        tool.saveData(tt);

    }
    $(document).ready(function () {
        tool.initFileUpload("#fileUpload", null, null, true, "*.*", 1, onSelect, onUploadSuccess);
    });
    function onSelect(file) {
         
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