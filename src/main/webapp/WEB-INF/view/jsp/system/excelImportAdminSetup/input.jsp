<%@ page language="java" pageEncoding="UTF-8" %>
<%@include file="../../common/input-header.jsp" %>
<%@include file="../../common/plugins/css/select2.jsp" %>
<%@include file="../../common/plugins/css/iCheck.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn" %>
<div class="col-md-12">
    <div class="panel panel-white">
        <div class="panel-heading">
            <h4 class="panel-title">编辑模板</h4>
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
                <input type="hidden" id="is_change" value="0">
                <input type="hidden" name="tempID" id="tempID" value="${tempID}">
                <input type="hidden" name="formname" value="theform">
                <div class="form-group">
                    <label class="col-sm-2 control-label">
                        导入Excel从第几行开始：
                    </label>

                    <div class="col-sm-4">
                        <input type="text" name="importrow" id="importrow" class="validate[required] form-control" value="${importrow}">
                        <span class="symbol required"></span>
                    </div>
                    <label class="col-sm-2 control-label">
                        模板是否带说明：
                    </label>

                    <div class="col-sm-4">
                        <label class="radio-inline">
                            <input name="hasdesc" value="1" type="radio" class="mgr" <c:if test="${hasdesc==1}">
                                   checked="checked"</c:if>>
                            是
                        </label>
                        <label class="radio-inline">
                            <input name="hasdesc" value="0" type="radio" class="mgr" <c:if test="${hasdesc==0}">
                                   checked="checked" </c:if>>
                            否
                        </label>
                    </div>

                </div>
                <div class="form-group dataTables_wrapper form-inline edit-element table-align-center">
                    <table id="contentTable" class="table table-bordered table-hover">
                        <thead>
                        <tr>
                            <th rowspan="2">是否导入</th>
                            <th rowspan="2">字段名</th>
                            <th rowspan="2">标题名称</th>
                            <th colspan="5" class="tc">数字字典转换</th>
                            <th rowspan="2">字段类型</th>
                            <th rowspan="2">字段说明</th>
                            <th rowspan="2">必填</th>
                            <th rowspan="2" width="40px">列序</th>
                        </tr>
                        <tr>
                            <th>是否转换</th>
                            <th>转换表</th>
                            <th>转换类别</th>
                            <th>导入值</th>
                            <th>替换值</th>
                        </tr>
                        </thead>
                        <tbody id="listData">
                        <c:forEach items="${listInfo}" var="l" varStatus="s">

                            <tr>
                                <td class="tc">
                                    <div class="checkbox-table">
                                        <input id="${l.filedName}"  type="checkbox" name="listinfo[${s.index}].isImportField" class="mgc need-imp"  <c:if test="${l.filedAlias!=null&&l.filedAlias!=''}">checked=""</c:if>'>
                                    </div>
                                </td>
                                <td>${l.filedName}</td>
                                <td>
                                    <input name="listinfo[${s.index}].filedAlias" value="${l.filedAlias }"<c:if test="${l.filedAlias==null||l.filedAlias==''}"> disabled=''</c:if> type="text">
                                </td>

                                <td class="tc">
                                    <div class="checkbox-table">
                                        <input type="checkbox" id="${l.filedName}_change" name="listinfo[${s.index}].isChange"   <c:if test="${l.replaceSelectTable!=null&&l.replaceSelectTable!=''}">checked=""</c:if>  class="mgc need-alias">
                                        <input type="hidden" name="listinfo[${s.index}].filedLength" value="${l.filedLength }">
                                        <input type="hidden" name="listinfo[${s.index}].scale" value="${l.scale }">
                                        <input type="hidden" name="listinfo[${s.index}].filedName" value="${l.filedName }">
                                    </div>
                                </td>
                                <td  width="300px" >
                                    <select  data-show-searchbox="true" class="form-control select2-auto" importval='${l.importField}'  exportval='${l.exportField}' <c:if test="${l.replaceSelectTable==null ||l.replaceSelectTable=='0'}">disabled=''</c:if> name="listinfo[${s.index}].replaceSelectTable" onchange="tableFields('${l.filedName}','${l.importField}','${l.exportField}' );" id="${l.filedName}_tables">
                                        <option value="">-- 请选择替换表  --</option>
                                        <c:forEach items="${DBTables}" var="d" varStatus="ss">
                                            <option <c:if test="${l.replaceSelectTable==d}">selected="selected"</c:if>  value="${d}">${d}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                                <td>
                                    <select class="form-control select2-auto"  data-show-searchbox="true" <c:if test="${l.replaceField==null}"> disabled='disabled'</c:if> name="listinfo[${s.index}].replaceField" id="${l.filedName}_replaceField">
                                        <option value="">-- 转换类别 --</option>
                                        <c:forEach items="${syscodeList}" var="z" varStatus="t">
                                            <option  <c:if test="${l.replaceField==z.id}">selected="selected"</c:if>  value="${z.id}">${z.caption}</option>
                                        </c:forEach>
                                    </select>
                                </td>

                                <td>
                                    <select  <c:if test="${l.importField==null}">disabled=''</c:if>  name="listinfo[${s.index}].importField" id="${l.filedName}_importField" class="form-control select2-auto"  data-show-searchbox="true" >
                                        <option value="">-- 选择字段 --</option>
                                    </select>
                                </td>
                                <td>
                                    <select <c:if test="${l.exportField==null}">disabled=''</c:if>  name="listinfo[${s.index}].exportField" id="${l.filedName}_exportField" class="form-control select2-auto"  data-show-searchbox="true" >
                                        <option value="">-- 选择字段 --</option>
                                    </select>
                                </td>
                                <td>
                                    <select  <c:if test="${l.filedAlias==null||l.filedAlias==''}">disabled=''</c:if> name="listinfo[${s.index}].filedType">
                                        <option <c:if test="${l.filedType=='DATE'}">selected="selected"</c:if> value="DATE">日期</option>
                                        <option <c:if test="${l.filedType=='VARCHAR2'}">selected="selected"</c:if>  value="VARCHAR2">文本</option>
                                        <option <c:if test="${l.filedType=='SHZHM'}">selected="selected"</c:if>  value="SHZHM">身份证号</option>
                                        <option <c:if test="${l.filedType=='XM'}">selected="selected"</c:if>  value="XM">姓名</option>
                                        <option <c:if test="${l.filedType=='DHHM'}">selected="selected"</c:if>  value="DHHM">电话号码</option>
                                        <option <c:if test="${l.filedType=='INTEGER'}">selected="selected"</c:if>  value="INTEGER">整数</option>
                                        <option <c:if test="${l.filedType=='DOUBLE'}">selected="selected"</c:if>  value="DOUBLE">数值</option>
                                        <option <c:if test="${l.filedType=='EMAIL'}">selected="selected"</c:if>  value="EMAIL">邮箱</option>
                                        <option <c:if test="${l.filedType=='IDCARD'}">selected="selected"</c:if>  value="IDCARD">数字</option>

                                    </select>
                                </td>
                                <td>
                                    <input style="width:120px;" type="text" name="listinfo[${s.index}].fielddesc" value="${l.fielddesc }" <c:if test="${l.filedAlias==null||l.filedAlias==''}">disabled=''</c:if>>
                                </td>
                                <td class="tc">
                                    <div class="checkbox-table">
                                        <input type="checkbox" name="listinfo[${s.index}].isNull" id="${l.filedName}_isNull"  <c:if test="${l.isNull!='true'}">checked=""</c:if>    class="mgc">
                                    </div>
                                </td>
                                <td>
                                    <input type="text" style="width:50px;" id="${l.filedName}_serialNumber" name="listinfo[${s.index}].serialNumber" value="${l.serialNumber }">
                                </td>
                            </tr>

                        </c:forEach>
                        </tbody>
                    </table>

                </div>

                <div class="form-group">
                    <div class="col-sm-12 frame-btn-group">
                        <button class="btn btn-sm btn-success" type="button" onclick="tool.saveData(this)">
                            保存 <i class="fa fa-check"></i>
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<%@include file="../../common/plugins/js/select2.jsp" %>
<%@include file="../../common/input-bottom.jsp" %>
<script type="text/javascript">
    $(document).ready(function (){
        $(".need-imp").click(function(){
                var id = $(this).attr("id");
                if($(this).is(':checked')){
                    $(this).parents("tr").find("input").removeAttr("disabled");
                    $(this).parents("tr").find("select[name*='filedType']").removeAttr("disabled");
                    if($("#"+id+"_change").is(':checked')){
                        $("#"+id+"_tables, #"+id+"_importField, #"+id+"_exportField").removeAttr("disabled");
                    }
                }else{
                    $(this).parents("tr").find("input,select").attr("disabled","disabled");
                }
                $(this).removeAttr("disabled");
        });	
//        $(".need-imp").on('ifChanged', function(){
//
//        });
        $(".need-alias").click(function() {
        	  var id = $(this).attr("id");
                id = id.substring(0,id.length-7);
            if (this.checked) {
                    $("#"+id+"_tables, #"+id+"_importField, #"+id+"_exportField,#"+id+"_replaceField").removeAttr("disabled");
            }else{
            	 $("#"+id+"_tables, #"+id+"_importField, #"+id+"_exportField,#"+id+"_replaceField").attr("disabled","diabled");
            }
        });
//        $(".need-alias").on('ifChanged', function(){
//
//        });

        $('select[id*="_tables"]').each(function(){
        	var objID = $(this).attr('id').substring(0,$(this).attr('id').length-7);
        	if($(this).val()!='0'){
	        	showCodeSort(objID);
        	}else{
        		$("#"+objID + '_replaceField1').next('span:first').addClass('hide');
        	}
        });
        
        $("select[name*='importField']").each(function(){
            var tableName=$(this).parent().prev().prev().children("select").val();
            var importval=$(this).parent().prev().prev().children("select").attr("importval");
            var exportval=$(this).parent().prev().prev().children("select").attr("exportval");
            var field=$(this).parent().prev().prev().children("select").attr("id");
            field=field.substring(0,field.indexOf('_tables'));
        		if(tableName!=null&&tableName!=''){
        			tableFields(field,importval,exportval);
        		}
        })
    });
    //加载表字段
    function tableFields(obj,im,ex) {
        var objImport = $("#"+obj + '_importField');
        var objExport = $("#"+obj + '_exportField');
        var tableName = $("#"+obj + '_tables').val();
        showCodeSort(obj);
        objImport.html("");
        objExport.html("");
        var url = basePath + "/s/ajax/getFidlds?" + (new Date()).getTime();
        $.getJSON(url, {'tableName': tableName}, function (data) {
            $.each(data, function (i) {
            	if(im!=""&&ex!=null&&im!=null&&ex!="")
            	{
            		  if(im==data[i]){
            		      objImport.append("<option selected='selected'  value='"+data[i]+"'>"+data[i]+"</option>");
            		  }else{
            	          objImport.append("<option  value='"+data[i]+"'>"+data[i]+"</option>");
              		  }
              		   if(ex==data[i]){
              		      objExport.append("<option selected='selected' value='"+data[i]+"'>"+data[i]+"</option>");
            		  }else{
            	     	 objExport.append("<option  value='"+data[i]+"'>"+data[i]+"</option>");
              		  }
            	}else{
            		  objImport.append("<option value='"+data[i]+"'>"+data[i]+"</option>");
              		  objExport.append("<option value='"+data[i]+"'>"+data[i]+"</option>");
            	}
            });
            objImport.select2({
                minimumResultsForSearch: 'Infinity',
                theme: "bootstrap",
                width: null
            });
               objExport.trigger("change");
        });
     
    }
    function showCodeSort(objID) {
        var myObj = $("#"+objID + '_tables');
        var codeSort = $("#"+objID + '_replaceField');
        var codeSort1 = $("#"+objID + '_replaceField1');
        if (myObj.val().indexOf('T_SYS_CODE')!=-1 || myObj.val().indexOf('t_sys_code')!=-1  ) {
            codeSort.removeAttr('disabled');
            codeSort1.val("");
            codeSort1.select2({
                minimumResultsForSearch: 'Infinity',
                theme: "bootstrap",
                width: null
            });
            codeSort1.attr('disabled', 'disabled');
            codeSort.next('span:first').removeClass('hide');
            codeSort1.next('span:first').addClass('hide');
        }else if (myObj.val().indexOf('V_SYS_CODE')!=-1 || myObj.val().indexOf('v_sys_code')!=-1) {
            codeSort1.removeAttr('disabled');
            codeSort.val("");
            codeSort.select2({
                minimumResultsForSearch: 'Infinity',
                theme: "bootstrap",
                width: null
            });
            codeSort.attr('disabled', 'disabled');
            codeSort1.next('span:first').removeClass('hide');
            codeSort.next('span:first').addClass('hide');
        } else {
            codeSort.val("");
            codeSort.select2({
                minimumResultsForSearch: 'Infinity',
                theme: "bootstrap",
                width: null
            });
            codeSort.attr('disabled', 'disabled');
            codeSort1.val("");
            codeSort1.select2({
                minimumResultsForSearch: 'Infinity',
                theme: "bootstrap",
                width: null
            });
            codeSort1.attr('disabled', 'disabled');
            codeSort.next('span:first').removeClass('hide');
            codeSort1.next('span:first').addClass('hide');
        }
    }
</script>
