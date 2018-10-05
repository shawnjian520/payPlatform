/**
 * Created by tengchong on 16/5/5.
 * 注: 所有元素按照降序排列
 */

var gridTemple = {
    'grid_header_1': '<div class="col-xs-12 nopadding edit-element" data-custom-class="_in_custom_class_" data-assembly-id="_in_data_assembly_id_" data-order="_in_order_" data-wid="_in_wid_">\n' +
    '    <div class="form-group">\n' +
    '        <label class="col-sm-1 control-label ell nopadding tooltips" data-placement="top" data-original-title="_in_title_" for="_in_id_">_in_title_：</label>\n' +
    '        <div class="col-sm-11">\n',
    'grid_header_2': '<div class="col-xxxl-4 col-md-6 col-sm-12 nopadding edit-element" data-custom-class="_in_custom_class_" data-assembly-id="_in_data_assembly_id_" data-order="_in_order_" data-wid="_in_wid_">\n' +
    '    <div class="form-group">\n' +
    '        <label class="col-sm-2 control-label ell nopadding tooltips" data-placement="top" data-original-title="_in_title_" for="_in_id_">_in_title_：</label>\n' +
    '        <div class="col-sm-10">\n',
    'grid_header_3': '<div class="col-xxxl-3 col-md-4 col-sm-6 col-xs-12 nopadding edit-element" data-custom-class="_in_custom_class_" data-assembly-id="_in_data_assembly_id_" data-order="_in_order_" data-wid="_in_wid_">\n' +
    '    <div class="form-group">\n' +
    '        <label class="col-sm-3 control-label ell nopadding tooltips" data-placement="top" data-original-title="_in_title_" for="_in_id_">_in_title_：</label>\n' +
    '        <div class="col-sm-9">\n',
    'grid_header_4': '<div class="col-xs-12 nopadding edit-element" data-custom-class="_in_custom_class_" data-assembly-id="_in_data_assembly_id_" data-order="_in_order_" data-wid="_in_wid_">\n' +
    '    <div class="form-group">\n' +
    '        <div class="col-sm-12">\n',
    'grid_footer': '        </div>\n' + '    </div>\n' + '</div>',
    'dataComparisonGridHeader': '<div class="col-xs-12 nopadding edit-element" data-custom-class="_in_custom_class_" data-assembly-id="_in_data_assembly_id_" data-order="_in_order_" data-wid="_in_wid_">\n' +
    '    <div class="form-group">\n',
    'dataComparisonGridFooter': '</div></div>',
    'dataComparisonGridFooterHR': '</div><hr/></div>',
    'dataComparisonLable': '<label class="col-sm-2 control-label ell nopadding tooltips" data-placement="top" data-original-title="_in_title_" for="_in_id_">_in_title_：</label>',
    'dataComparison': '<div class="col-sm-4"><p class="form-control-static display-value">${_in_valueData_comparison_}</p></div>',
    'dataComparisonInputHeader': '<div class="col-sm-4">',
    'dataComparisonInputFooter': '</div>',
    'dataComparisonFooterHr': '<div class="col-xs-12 nopadding "><hr class="dividing-line"></div>'
};
var elementTemple = {
    'tableButton': '<a class="btn _in_btn_size_ _in_btn_style_ tooltips" data-tab-name="_in_tabName_" data-placement="top" data-original-title="_in_original_title_" onclick="_in_onclick_" href="javascript:void(0)">_in_content_</a> ',
    //可编辑表格
    'inputForEditTable': '<div data-wid="_in_wid_" data-assembly-id="_in_data_assembly_id_" class="edit-element"><input type="text" defaultvalue="_in_defaultvalue_" placeholder="_in_placeholder_" _is_onlyread_ class="form-control _in_validate_" id="_in_id_" name="_in_name_" value="${table_object._in_value_}"></div>\n',
    'datetimepickerForEditTable': '<div  data-wid="_in_wid_" data-assembly-id="_in_data_assembly_id_" class="edit-element"><div class="rel"><input type="text" defaultvalue="_in_defaultvalue_" data-minDate="_in_data_minDate_" data-maxDate="_in_data_maxDate_" class="form-control _in_validate_" id="_in_id_" name="_in_name_" value="${table_object._in_value_}" data-element-type="datetimepicker" data-format="_in_format_"></div></div>\n',
    'codeSelectForEditTable': '<div  data-wid="_in_wid_" data-assembly-id="_in_data_assembly_id_" class="edit-element"><select _is_onlyread_ defaultvalue="_in_defaultvalue_" class="form-control select2-code _in_validate_" zdlb="_in_zdlb_" id="_in_id_" name="_in_name_" value="${table_object._in_value_}"></select></div>\n',
    'tableSelectForEditTable': '<div  data-wid="_in_wid_" data-other-query="_in_otherQuery_"  data-assembly-id="_in_data_assembly_id_" class="edit-element"><select defaultvalue="_in_defaultvalue_" _is_onlyread_ class="form-control select2-auto _in_validate_" id="_in_id_" name="_in_name_" data-cur-val="_in_data_cur_val_" data-other-query="_in_otherQuery_" data-value="${table_object._in_value_}" ' +
    'data-table-name="_in_table_name_" data-field-id="_in_select_key_" data-field-name="_in_select_text_" data-field-up-id="_in_field_up_id_" ' +
    'data-file-up-val="_in_field_up_val_" data-order-field="_in_data_order_field_" data-order-type="_in_data_order_type_" data-file-query="_in_file_query_" data-query-val="_in_query_val_" data-childselect="_in_data_childselect_" ' +
    '></select></div>\n',
    'ajaxSelectForEditTable': '<div  data-wid="_in_wid_" data-assembly-id="_in_data_assembly_id_" class="edit-element"> <select defaultvalue="_in_defaultvalue_" _is_onlyread_ class="form-control select2-auto _in_validate_" id="_in_id_" name="_in_name_" data-value="${table_object._in_value_}" data-select-url="<%=basePath%>/s/_in_select_url_"></select>\n',
    'text': '<p class="form-control-static display-value">${_in_value_}</p>',
    'input': '<span class="input-icon input-icon-right"><input type="text" defaultvalue="_in_defaultvalue_" placeholder="_in_placeholder_" _is_onlyread_ class="form-control _in_validate_" id="_in_id_" name="_in_name_" value="${_in_value_}"><i  class="fa fa-times-circle" onclick="tool.clearinput(this)"></i></span><span class="symbol _in_required_"></span>\n',
    'inputRange': '<div class="row">' +
    '<div class="col-xs-6"><input type="text" placeholder="_in_placeholder_" _is_onlyread_ class="form-control _in_validate_" id="_in_id_Str" name="_in_name_Str" value="${_in_value_Str}"></div>' +
    '<div class="l interval-character">-</div>' +
    '<div class="col-xs-6"><input type="text" placeholder="_in_placeholder_" _is_onlyread_ class="form-control _in_validate_" id="_in_id_End" name="_in_name_End" value="${_in_value_End}"><span class="symbol _in_required_"></span></div>' +
    '</div>\n',
    'textarea': '<textarea defaultvalue="_in_defaultvalue_" onkeydown="tool.checkMaxInput(this,_textarea_count_)" onkeyup="tool.checkMaxInput(this,_textarea_count_)" onfocus="tool.checkMaxInput(this,_textarea_count_)" onblur="tool.checkMaxInput(this,_textarea_count_)" placeholder="_in_placeholder_" _is_onlyread_ class="form-control _in_validate_" id="_in_id_" name="_in_name_" value="${_in_value_}">${_in_value_}</textarea><span class="symbol _in_required_"></span>\n<div align="right"><span id="_in_id_msg">0</span>/_textarea_count_</div>\n'
    	+'<script>$(function(){$("#_in_id_msg").html($("#_in_id_").val().length);if("_textarea_count_"=="-1"){$("#_in_id_").next().next().remove();$("#_in_id_").removeAttr("onkeydown");$("#_in_id_").removeAttr("onkeyup");$("#_in_id_").removeAttr("onfocus");$("#_in_id_").removeAttr("onblur")}})\n</script> ',
    'inputselecthidden': '            <input type="hidden" id="_in_id_1" name="_in_name_" value="${_in_value_}">\n',
    'inputcheckhidden': '            <input type="hidden" id="_in_name_1" name="_in_name_" value="${_in_value_}">\n',
    'datetimepicker': '            <input defaultvalue="_in_defaultvalue_" type="text" class="form-control _in_validate_" id="_in_id_" name="_in_name_" value="${_in_value_}" data-element-type="datetimepicker" data-format="_in_format_" data-minDate="_in_data_minDate_" data-maxDate="_in_data_maxDate_"><span class="symbol _in_required_"></span>\n',
    'datetimepickerRange': '<div class="row">' +
    '<div class="col-xs-6"><input type="text" class="form-control _in_validate_" data-max-date-element="_in_id_End" id="_in_id_Str" name="_in_name_Str" value="${_in_value_Str}" data-element-type="datetimepicker" data-format="_in_format_"></div>' +
    '<div class="l interval-character">-</div>' +
    '<div class="col-xs-6"><input type="text" class="form-control _in_validate_" data-min-date-element="_in_id_Str" id="_in_id_End" name="_in_name_End" value="${_in_value_End}" data-element-type="datetimepicker" data-format="_in_format_"><span class="symbol _in_required_"></span></div>' +
    '</div>\n',
    'codeSelect': '            <select defaultvalue="_in_defaultvalue_" _is_onlyread_ class="form-control select2-code _in_validate_"   _data-show-searchbox_ zdlb="_in_zdlb_" id="_in_id_" name="_in_name_" value="${_in_value_}"></select><span class="symbol _in_required_"></span>\n',
    'listSelect': '            <jundukeji  _slect_m_ defaultvalue="_in_defaultvalue_" _is_onlyread_ class="form-control _select_type_ _in_validate_" _data-show-searchbox_ items="${_in_items_}" id="_in_id_" name="_in_name_" data-value="${_in_value_}">\n' +
    '<option value="">请选择</option>' +
    '                <c:forEach items="${_in_items_}" var="items_object">\n' +
    '                    <c:if test="${items_object._in_list_key_ == _in_value_}"><option value="${items_object._in_list_key_}" selected>${items_object._in_list_value_}</option></c:if><c:if test="${items_object._in_list_key_ != _in_value_}"><option value="${items_object._in_list_key_}">${items_object._in_list_value_}</option></c:if>\n' +
    '                </c:forEach>\n' +
    '            </jundukeji><span class="symbol _in_required_"></span>\n',
    'tableSelect': '            <select defaultvalue="_in_defaultvalue_" _is_onlyread_ class="form-control select2-auto _in_validate_" data-other-query="_in_otherQuery_" _data-show-searchbox_ id="_in_id_" name="_in_name_" data-order-field="_in_data_order_field_" data-order-type="_in_data_order_type_" data-value="${_in_value_}" ' +
    'data-table-name="_in_table_name_" data-cur-val="_in_data_cur_val_" data-field-id="_in_select_key_" data-field-name="_in_select_text_" data-field-up-id="_in_field_up_id_" ' +
    'data-file-up-val="_in_field_up_val_" data-file-query="_in_file_query_" data-query-val="_in_query_val_" data-childselect="_in_data_childselect_" ' +
    '></select><span class="symbol _in_required_"></span>\n',
    'ajaxSelect': '            <select defaultvalue="_in_defaultvalue_" _is_onlyread_ class="form-control select2-auto _in_validate_" id="_in_id_" name="_in_name_" data-value="${_in_value_}" data-select-url="<%=basePath%>/s/_in_select_url_"></select><span class="symbol _in_required_"></span>\n',
    'searchSelect': '            <select defaultvalue="_in_defaultvalue_" class="form-control _in_validate_" id="_in_id_" name="_in_name_" data-value="${_in_value_}" data-select-url="<%=basePath%>/s/_in_select_url_" data-element-type="searh-select"><option value="${_in_value_}">_in_default_text_</option></select><span class="symbol _in_required_"></span>\n',

    'listCheckbox': '<div> _is_checkAll' +
    '       <c:forEach items="${_in_items_}" var="items_object">\n' +
    '            <label data-items="${_in_items_}" data-text="_in_list_value_" data-value="_in_value_" class="checkbox-inline"><c:if test="${_in_value_ != null && (fn:indexOf(\',\'.concat(_in_value_).concat(\',\'),\',\'.concat(items_object._in_list_key_).concat(\',\')) > -1)}"><input type="checkbox" _is_onlyread_ name="_in_name_" class="grey _in_validate_" value="${items_object._in_list_key_}" checked> ${items_object._in_list_value_}</c:if><c:if test="${_in_value_ == null || !(fn:indexOf(\',\'.concat(_in_value_).concat(\',\'),\',\'.concat(items_object._in_list_key_).concat(\',\')) > -1)}"><input name="_in_name_" _is_onlyread_ type="checkbox" class="grey changecheck _in_validate_" value="${items_object._in_list_key_}"> ${items_object._in_list_value_}</c:if> </label>\n' +
    '       </c:forEach></div><span class="symbol _in_required_"></span>\n',

    'listRadio': '                <div><c:forEach items="${_in_items_}" var="items_object">\n' +
    '                    <label data-items="${_in_items_}" data-text="_in_list_value_" data-value="_in_value_" class="checkbox-inline"><c:if test="${items_object._in_list_key_ == _in_value_}"><input type="radio" _is_onlyread_ name="_in_name_" class="grey _in_validate_" value="${items_object._in_list_key_}" checked> ${items_object._in_list_value_}</c:if><c:if test="${items_object._in_list_key_ != _in_value_}"><input name="_in_name_" _is_onlyread_ type="radio" class="grey _in_validate_" value="${items_object._in_list_key_}"> ${items_object._in_list_value_}</c:if> </label>\n' +
    '                </c:forEach></div><span class="symbol _in_required_"></span>\n',
    'inputForDataComp': '            <input type="text" placeholder="_in_placeholder_" class="form-control _in_validate_" id="_in_id_DataComparison" name="_in_name_DataComparison" value="${_in_valueData_comparison_}" readonly><span class="symbol _in_required_"></span>\n',
    'textareaForDataComp': '            <textarea placeholder="_in_placeholder_" class="form-control _in_validate_" id="_in_id_DataComparison" name="_in_name_DataComparison" value="${_in_valueData_comparison_}" readonly>${_in_valueData_comparison_}</textarea><span class="symbol _in_required_"></span>\n',
    'inputselecthiddenForDataComp': '            <input type="hidden" id="_in_id_1" name="_in_name_DataComparison" value="${_in_valueData_comparison_}" readonly>\n',
    'datetimepickerForDataComp': '            <input type="text" class="form-control _in_validate_" id="_in_id_DataComparison" name="_in_name_DataComparison" value="${_in_valueData_comparison_}" data-element-type="datetimepicker" data-format="_in_format_" readonly><span class="symbol _in_required_"></span>\n',
    'codeSelectForDataComp': '            <select class="form-control select2-code _in_validate_" zdlb="_in_zdlb_" id="_in_id_DataComparison" name="_in_name_DataComparison" value="${_in_valueData_comparison_}" readonly></select><span class="symbol _in_required_"></span>\n',
    'listSelectForDataComp': '            <jundukeji class="form-control select2-auto _in_validate_" items="${_in_items_}" id="_in_id_DataComparison" name="_in_name_DataComparison" data-value="${_in_valueData_comparison_}" readonly>\n' +
    '                <c:forEach items="${_in_items_}" var="items_object">\n' +
    '<option value="">请选择</option>' +
    '                    <c:if test="${items_object._in_list_key_ == _in_valueData_comparison_}"><option value="${items_object._in_list_key_}" selected>${items_object._in_list_value_}</option></c:if><c:if test="${items_object._in_list_key_ != _in_valueData_comparison_}"><option value="${items_object._in_list_key_}">${items_object._in_list_value_}</option></c:if>\n' +
    '                </c:forEach>\n' +
    '            </jundukeji><span class="symbol _in_required_"></span>\n',
    'tableSelectForDataComp': '            <select class="form-control select2-auto _in_validate_" id="_in_id_DataComparison" name="_in_name_DataComparison" data-value="${_in_valueData_comparison_}" ' +
    'data-table-name="_in_table_name_" data-field-id="_in_select_key_" data-field-name="_in_select_text_" data-field-up-id="_in_field_up_id_" ' +
    'data-file-up-val="_in_field_up_val_" data-file-query="_in_file_query_" data-query-val="_in_query_val_" data-childselect="_in_data_childselect_" readonly' +
    '></select><span class="symbol _in_required_"></span>\n',
    'ajaxSelectForDataComp': '            <select class="form-control select2-auto _in_validate_" id="_in_id_DataComparison" name="_in_name_DataComparison" data-value="${_in_valueData_comparison_}" data-select-url="<%=basePath%>/s/_in_select_url_" readonly></select><span class="symbol _in_required_"></span>\n',
    'searchSelectForDataComp': '            <select class="form-control _in_validate_" id="_in_id_DataComparison" name="_in_name_DataComparison" data-value="${_in_valueData_comparison_}" data-select-url="<%=basePath%>/s/_in_select_url_" data-element-type="searh-select" readonly><option value="${_in_valueData_comparison_}">${_in_default_text_}</option></select><span class="symbol _in_required_"></span>\n',
    'listCheckboxForDataComp': '                <c:forEach items="${_in_items_}" var="items_object">\n' +
    '                    <label data-items="${_in_items_}" data-text="_in_list_value_" data-value="_in_valueData_comparison_" class="checkbox-inline"><c:if test="${items_object._in_list_key_ == _in_valueData_comparison_}"><input type="checkbox" name="_in_name_DataComparison" class="grey _in_validate_" value="${items_object._in_list_key_}" checked readonly> ${items_object._in_list_value_}</c:if><c:if test="${items_object._in_list_key_ != _in_valueData_comparison_}"><input type="checkbox" name="_in_name_DataComparison" class="grey" value="${items_object._in_list_key_}" readonly> ${items_object._in_list_value_}</c:if> </label>\n' +
    '                </c:forEach><span class="symbol _in_required_"></span>\n',
    'listRadioForDataComp': '                <c:forEach items="${_in_items_}" var="items_object">\n' +
    '                    <label data-items="${_in_items_}" data-text="_in_list_value_" data-value="_in_valueData_comparison_" class="checkbox-inline"><c:if test="${items_object._in_list_key_ == _in_valueData_comparison_}"><input type="radio" name="_in_name_DataComparison" class="grey _in_validate_" value="${items_object._in_list_key_}" checked readonly> ${items_object._in_list_value_}</c:if><c:if test="${items_object._in_list_key_ != _in_valueData_comparison_}"><input type="radio" name="_in_name_DataComparison" class="grey" value="${items_object._in_list_key_}" readonly> ${items_object._in_list_value_}</c:if> </label>\n' +
    '                </c:forEach><span class="symbol _in_required_"></span>\n',
    'button': '<button data-custom-class="_in_custom_class_" ssyhqx="_in_ssyhqx_" data-group-jurisdiction="_in_group_jurisdiction_" id="_in_id_" data-assembly-id="_in_data_assembly_id_" data-order="_in_order_" data-wid="_in_wid_" type="button" data-btn-size="_in_btn_size_" data-btn-class="_in_btn_class_" class="_in_btn_size_ _in_btn_class_ edit-element" onclick="_in_onclick_"> _in_title_ <i class="fa _in_icon_class_"></i></button>',
    'selectbutton':'<div data-wid="_in_wid_" data-order="_in_order_"  data-assembly-id="_in_data_assembly_id_"  style="display:inline-block;" class="edit-element btn-group"><button id="_in_id_" type="button" onclick="_in_onclick_" data-btn-size="_in_btn_size_"  data-btn-class="_in_btn_class_" class="_in_btn_size_ _in_btn_class_ ">_in_title_</button>'+
    ' <button  type="button" class="_in_btn_size_ _in_btn_class_ dropdown-toggle" data-toggle="dropdown">'+
    '<span class="caret"></span><span class="sr-only">Toggle Dropdown</span>'+
    '</button>'+
    '<ul class="dropdown-menu pull" role="menu">'+
    '_itemsbutton_'+
    '</ul></div>'	
    ,
    'modalButton': '<button ssyhqx="_in_ssyhqx_" data-custom-class="_in_custom_class_" data-iframe="_in_iframe_" data-url="_in_select_url_" id="_in_id_" data-assembly-id="_in_data_assembly_id_" data-order="_in_order_" data-wid="_in_wid_" type="button" data-btn-size="_in_btn_size_" data-btn-class="_in_btn_class_" class="_in_btn_size_ _in_btn_class_ edit-element" onclick="tool.openModal({\'remote\':\'<%=basePath %>/s/_in_select_url_\'},_in_iframe_)"> _in_title_ <i class="fa _in_icon_class_"></i></button>',
    'modalButtonEl': '<button ssyhqx="_in_ssyhqx_" data-custom-class="_in_custom_class_" id="_in_id_" data-assembly-id="_in_data_assembly_id_" data-order="_in_order_" data-wid="_in_wid_" type="button" data-btn-size="_in_btn_size_" data-btn-class="_in_btn_class_" class="_in_btn_size_ _in_btn_class_ edit-element" onclick="tool.openModalStatic(\'_in_modal_id_\',\'_in_modal_title_\',_in_callback_)"> _in_title_ <i class="fa _in_icon_class_"></i></button>',
    'tableConfig': '<div class="form-group">' +
    '<label title="_in_table_config_index_" class="col-sm-1 control-label ell" for="table-title">_in_table_config_index_：</label><div class="col-sm-11" style="margin-bottom: 10px;"><div class="row">' +
    '<div class="col-xs-5"><input type="text" class="form-control table-order" placeholder="排序值" style="width: 15%;float: left;margin-left: 5px;"> ' +
    ' <input type="text" class="form-control table-title" placeholder="标题" style="width: 40%;float: left;margin-left: 5px;"> ' +
    ' <input type="text" class="form-control table-subtitle" placeholder="二级标题" style="width: 37%;float: left;margin-left: 5px;"></div>' +
    '<div class="col-xs-3"><input type="text" class="form-control table-content" style="width: 45%;float: left;margin-left: 5px;" placeholder="内容"><input type="text" class="form-control table-content-length" style="width: 45%;float: left;margin-left: 5px;" placeholder="显示长度(px)"></div>' +
    '<div class="col-xs-2"><input type="text" class="form-control table-zdlb" placeholder="字典类别"></div>' +
    '<div class="col-xs-1"><a class="btn btn-sm btn-warning show-row-config" href="javascript:void(0)"><i class="fa fa-times fa fa-angle-double-down"></i></a></div>' +
    '<div class="col-xs-1"><a class="btn btn-sm btn-danger delete-table-config" href="javascript:void(0)"><i class="fa fa-times fa fa-white"></i></a></div> </div> </div>' +
    '<div class="table-hide"style=" display: none;">' +
    '<label title="" class="col-sm-1 control-label ell"></label>' +
    '<div class="col-sm-11">' +
    '<div class="col-xs-2"> <input type="text" class="form-control link-path" placeholder="链接地址 示例:system/sample/input/\${object.wid}"></div>' +
    '<div class="col-xs-2"> <input type="text" class="form-control table-event" placeholder="事件"> </div>' +
    ' <div class="col-xs-1 nopadding"> <label class="radio-inline"><input type="checkbox" value="true" name="table-input">input</label></div> ' +
    '<div class="col-sm-3"><input type="text"  placeholder="条件例：\${object.name}=\${object.address} }" class="form-control table-if"></div>' +
    '<div class="col-xs-3"> <input type="text" class="form-control table-class" placeholder="样式"> </div>' +
    '</div></div></div>',
    'tableButtonConfig': "<div class=\"form-group\">\n" +
    "    <label title=\"_in_table_config_index_\" class=\"col-sm-1 control-label ell\">_in_table_config_index_：</label>\n" +
    "    <div class=\"col-sm-11\">\n" +
    "        <div class=\"col-xs-1\">\n" +
    "            <input type=\"text\" class=\"form-control btn-order\" placeholder=\"排序值\">\n" +
    "        </div>\n" +
    "        <div class=\"col-xs-2\">\n" +
    "            <input type=\"text\" class=\"form-control btn-content\" placeholder=\"按钮内容\">\n" +
    "        </div>\n" +
    "        <div class=\"col-xs-2\"><input type=\"text\" class=\"form-control btn-tab-name\" placeholder=\"Tab页名称\"></div>" +
    "        <div class=\"col-xs-2\">\n" +
    "            <input type=\"text\" class=\"form-control btn-title\"\n" +
    "                   placeholder=\"按钮提示\">\n" +
    "        </div>\n" +
    "        <div class=\"col-xs-2\">\n" +
    "            <select class=\"table-btn-style\">\n" +
    "                <option value=\"btn-success\">绿色</option>\n" +
    "                <option value=\"btn-default\">白色</option>\n" +
    "                <option value=\"btn-info\">蓝色</option>\n" +
    "                <option value=\"btn-warning\">橙色</option>\n" +
    "                <option value=\"btn-danger\">红色</option>\n" +
    "            </select>\n" +
    "        </div>\n" +
    "        <div class=\"col-xs-2\">\n" +
    "            <input type=\"text\" class=\"form-control btn-event\" placeholder=\"点击事件\">\n" +
    "        </div>\n" +
    "        <div class=\"col-xs-1\">\n" +
    "            <a class=\"btn btn-sm btn-danger delete-table-config\" href=\"javascript:void(0)\"><i class=\"fa fa-times fa fa-white\"></i></a>\n" +
    "        </div>\n" +
    "    </div>\n" +
    "</div>",
    'navTabsConfig': '<div class="form-group">' +
    '<label title="_in_table_config_index_" class="col-sm-1 control-label ell" for="table-title">_in_table_config_index_：</label><div class="col-sm-11"><div class="row">' +
    '<div class="col-xs-1"><input type="text" class="form-control nav-tabs-order" placeholder="排序值"></div>' +
    '<div class="col-xs-3"><input type="text" class="form-control nav-tabs-title" placeholder="标题"></div>' +
    '<label class="col-xs-2 control-label ell"><%=basePath %>/s/</label><div class="col-xs-3"><input type="text" class="form-control nav-tabs-url" placeholder="链接地址 示例:system/sample/list"></div>' +
    '<div class="col-xs-1"><a class="btn btn-sm btn-danger delete-table-config" href="javascript:void(0)"><i class="fa fa-times fa fa-white"></i></a></div></div></div></div>',
    'staticNav': '<div class="form-group">' +
    '<label title="_in_table_config_index_" class="col-sm-1 control-label ell" for="table-title">_in_table_config_index_：</label><div class="col-sm-11"><div class="row">' +
    '<div class="col-xs-1"><input type="text" class="form-control nav-tabs-order" placeholder="排序值"></div>' +
    '<div class="col-xs-3"><input type="text" class="form-control nav-tabs-title" placeholder="标题"><input type="text" class="form-control nav-tabs-code hide"></div>' +
    '<label class="col-xs-2 control-label ell"><%=basePath %>/s/</label><div class="col-xs-3"><input type="text" class="form-control nav-tabs-url" placeholder="表单action 示例:system/sample/list"></div>' +
    '<div class="col-xs-1"><a class="btn btn-sm btn-danger delete-table-config" href="javascript:void(0)"><i class="fa fa-times fa fa-white"></i></a></div></div></div></div>',
    'wizardConfig': '<div class="form-group">' +
    '<label title="_in_table_config_index_" class="col-sm-1 control-label ell" for="table-title">_in_table_config_index_：</label><div class="col-sm-11"><div class="row">' +
    '<div class="col-xs-1"><input type="text" class="form-control wizard-order" placeholder="排序值"></div>' +
    '<div class="col-xs-3"><input type="text" class="form-control wizard-title" placeholder="标题"><input type="text" class="form-control wizard-code hide"></div>' +
    '<div class="col-xs-3"><input type="text" class="form-control wizard-validateSteps-fun" placeholder="点击下一步验证函数 sample($content)"></div>' +
    '<div class="col-xs-3"><input type="text" class="form-control wizard-showStep-fun" placeholder="当前步显示后回调函数 sample($content)"></div>' +
    '<div class="col-xs-1"><a class="btn btn-sm btn-danger delete-table-config" href="javascript:void(0)"><i class="fa fa-times fa fa-white"></i></a></div></div></div></div>',
    'editTableConfig': '<div class="form-group">' +
    '<label title="_in_table_config_index_" class="col-sm-1 control-label ell" for="table-title">_in_table_config_index_：</label><div class="col-sm-11"><div class="row">' +
    '<div class="col-xs-1"><input type="text" class="form-control table-order" placeholder="排序值"></div>' +
    '<div class="col-xs-3"><input type="text" class="form-control table-title" placeholder="标题"><input type="hidden" class="form-control table-element" placeholder="内容"></div>' +
    '<div class="col-xs-1"><a class="btn btn-sm btn-danger delete-table-config" href="javascript:void(0)"><i class="fa fa-times fa fa-white"></i></a></div></div></div></div>',
    'seletbuttonConfig':'<div class="form-group">'+
    '<label title="_in_selectbtn_config_index_" class="col-sm-1 control-label ell" for="table-title">_in_selectbtn_config_index_：</label><div class="col-sm-11"><div class="row">'+
    '<div class="col-xs-3"><input type="text" class="form-control selectbtn-title" placeholder="文本"></div>' +
    '<div class="col-xs-3"> <input type="text" class="form-control selectbtn-method" placeholder="方法"></div>'+
    '<div class="col-xs-1"><a class="btn btn-sm btn-danger delete-selectbtn-config" href="javascript:void(0)"><i class="fa fa-times fa fa-white"></i></a></div></div></div></div>',
    'tableCheckboxAll': ' <th class=\"center w20\ ">\n' +
    '                <div class=\"checkbox-table\">\n' +
    '                    <label>\n' +
    '                        <input type=\"checkbox\" class=\"mgc selectall\">\n' +
    '                    </label>\n' +
    '                </div>\n' +
    '            </th>\n',
    'tableCheckbox': '<td class="center w20 ">\n' +
    '                    <div class="checkbox-table">\n' +
    '                        <label>\n' +
    '                            <input type="checkbox" name="selectNode" class="mgc foocheck" data-values="_in_checkbox_values_" id="_in_checkbox_id_" value="_in_checkbox_id_">\n' +
    '                        </label>\n' +
    '                    </div>\n' +
    '                </td>\n',
    'tableOrderTh': '<th _in_class_start_   data-order-name="_in_tableContent_">_in_tableTitle_</th>\n',
    'tableTh': '<th>_in_tableTitle_</th>\n',
    'tableLinkTd': '<td _in_if_start_   _in_class_start_ data-ell-length="_in_ellLength_"><a onclick="tool.openSubviewByForm(this,\'<%=basePath%>/s/_in_tableLinkPath_\')" href="javascript:void(0)">${table_object._in_tableContent_}</a></td>\n',
    'tableTd': '<td _in_if_start_   _in_class_start_ data-ell-length="_in_ellLength_">${table_object._in_tableContent_}</td>\n',
    'tableEventTd': ' <td _in_if_start_   _in_class_start_  data-ell-length="_in_ellLength_"><a onclick="_in_event_"  href="javascript:void(0)">${table_object._in_tableContent_}</a></td>\n',
    'tableInputTd': '<td _in_if_start_   _in_class_start_ ><input type="text" onblur="_in_event_" class="form-control" name="_in_tableContent_" value="${table_object._in_tableContent_}"></td>\n',
    'tableGroupTd':'<td _in_if_start_   _in_class_start_   data-group-name="_in_group_name_" data-group-type="table-td"></td>',
    'editTableTh': '<th>_in_tableTitle_</th>\n',
    'editTableTd': '<td data-group-name="_in_group_name_" data-group-type="table-td"></td>\n',
    'tableCodeTd': '<td _in_if_start_   _in_class_start_ class="select2-code-name" zdlb="_in_zdlb_">${table_object._in_tableContent_}</td>\n',
    'table': '<div class=\"dataTables_wrapper form-inline edit-element table-align-center\" data-assembly-id="_in_data_assembly_id_" data-order="_in_order_" data-wid="_in_wid_" id="_in_id_">\n' +
    '    <table class=\"table table-striped table-hover dataTable table-bordered table-order\">\n' +
    '        <thead>\n' +
    '        <tr>_in_table_thead_</tr>\n' +
    '        </thead>\n' +
    '' +
    '        <tbody items=\"${_in_items_}\" var=\"table_object\">\n' +
    '            <tr id=\"tr_${table_object._in_checkbox_id_}\" onclick=\"_in_checkbox_url_\">_in_table_tbody_</tr>\n' +
    '        </tbody>\n' +
    '    </table>\n' +
    '</div>\n',
    'editTable': '<div class=\"dataTables_wrapper edit-element edit-table-body\" data-assembly-id="_in_data_assembly_id_" data-order="_in_order_" data-wid="_in_wid_" id="_in_id_" data-max-length="_in_maxDatalength_">\n' +
    '<a class="btn btn-sm btn-success mr5 edit-table-operation" onclick="_in_functionName_(this)">新增 <i class="fa fa-plus"></i></a>' +
    //'<a class="btn btn-sm btn-success mr5" onclick="tool.removeDateForEditTable(this)">删除 <i class="fa fa-times"></i></a>' +
    '    <table class="table table-striped table-hover dataTable table-bordered table-align-center">\n' +
    '        <thead>\n' +
    '        <tr>_in_table_thead_</tr>\n' +
    '        </thead>\n' +
    '        <tbody items="${_in_items_}" var="table_object" varStatus="sta">\n' +
    '            <tr>_in_table_tbody_</tr>\n' +
    '        </tbody>\n' +
    '    </table>\n' +
    '<script>_in_function_</script>' +
    '</div>\n',
    'import': '<script>\n' +
    '$(function(){\n' +
    '    tool.initFileUpload(\"#_in_name_upload\",null,null,true,\"_file_type_\",\"_file_size_\",null,function(file, data, response){\n' +
    'data=data.replace(\"\\\\\",\"\");\n' +
    'data=data.replace(\"\\\\\",\"/\");\n' +
    'data = eval(\"(\"+data+\")\");\n' +
    ' $(\"#_in_name__name\").val(data.fileold);\n' +
    ' $(\"#_in_name__font a\").html(data.fileold);\n' +
    '        $(\"#_in_name__path\").val(data.filePath);\n' +
    '},null,null,\'_in_name__queue\');\n' +
    '});\n</script>\n' +
    '<input type=\"file\"   data-filelength=\"_file_length_\" id=\"_in_name_upload\" >\n' +
    '<input type=\"hidden\" name=\"_in_name_.path\" id=\"_in_name__path\" value=\"${object._in_name_.path}\" />\n' +
    '<input type=\"hidden\" name=\"_in_name_.name\" id=\"_in_name__name\" value=\"${object._in_name_.name}\" />\n' +
    '<input type=\"hidden\" name=\"_in_name_.oldPath\" id=\"_in_name__oldPath\" value=\"${object._in_name_.oldPath}\" /> \n' +
    '<input type=\"hidden\" name=\"_in_name_\" id=\"_in_id_\" value=\"${object._in_name_.oldPath}\" filesize=\"_file_size_\" filetype=\"_file_type_\"/> \n' +
    '<font id="_in_name__font"><a onclick="tool.downloadfile($(\'#_in_name__path\').val())">${object._in_name_.name}</a></font>\n' +
    '<div id="_in_name__queue"></div>\n',
    'importimg': '<div class="col-xs-12 edit-element" title=\"_in_title_\" data-assembly-id="_in_data_assembly_id_" data-order="_in_order_" data-wid="_in_wid_">\n' +
    '<script>\n' +
    '$(function(){\n' +
    '    tool.initFileUpload(\"#_in_name_upload\",null,null,true,\"*.jpg;*.png;*.gif\",1,null,function(file, data, response){\n' +
    'data=data.replace(\"\\\\\",\"\");\n' +
    'data=data.replace(\"\\\\\",\"/\");\n' +
    'data = eval(\"(\"+data+\")\");\n' +
    ' $(\"#_file_name_\").val(data.fileold);\n' +
    ' $(\"#_in_name__img\").attr(\"src\",\"<%=basePath%>/photoshow.jsp?path="+data.filePath);\n' +
    '        $("#_in_name__name").val(data.fileold);\n' +
    '        $(\"#_in_name__path\").val(data.filePath);\n' +
    '    }   \n' +
    ',null,\'_file_length_\',\'_in_name__queue\',\"选择图片\");\n' +
    '});\n</script>\n' +
    '<div><img id=\"_in_name__img\" onclick="tool.previewImage(this)" src=\"<%=basePath%>/photoshow.jsp?path=${object._in_name_.path}\" width="_file_width_" height="_file_height_" onerror="this.src=\'<%=basePath%>/resources/images/noimgs.png\';" width=\"_file_width_\" alt=\"_file_alt_\"/></div>\n' +
    '<input type=\"file\"   data-filelength=\"_file_length_\" id=\"_in_name_upload\" >\n' +
    '<input type=\"hidden\" name=\"_in_name_.path\" id=\"_in_name__path\" value=\"${object._in_name_.path}\" />\n' +
    '<input type=\"hidden\" name=\"_in_name_.name\" id=\"_in_name__name\" value=\"${object._in_name_.name}\" />\n' +
    '<input type=\"hidden\" name=\"_in_name_.oldPath\" id=\"_in_id_\" value=\"${object._in_name_.oldPath}\" /> \n' +
    '<div id="_in_name__queue"></div>\n',
    'navTabs': '<div class="tabbable edit-element" data-assembly-id="_in_data_assembly_id_" data-order="_in_order_" data-wid="_in_wid_"><ul class="nav nav-tabs">_in_tabbale_header_</ul><div class="tab-content">_in_tabbale_content_</div></div>',
    'navTabsHeaderActive': '<li class="active"><a href="#_in_content_id_" data-toggle="tab">_in_tabbale_name</a></li>',
    'navTabsHeader': '<li><a href="#_in_content_id_" data-toggle="tab">_in_tabbale_name</a></li>',
    'staticNavTabsContentActive': '<div class="tab-pane fade in active" id="_in_content_id_"><form role="form" class="form-horizontal" data-action="_in_nav_tabs_url_"><div class="row" data-group-name=\"静态Tab页:_in_tabbale_name\"></div></form></div>',
    'staticNavTabsContent': '<div class="tab-pane fade" id="_in_content_id_"><form role="form" class="form-horizontal" data-action="_in_nav_tabs_url_"><div class="row" data-group-name=\"静态Tab页:_in_tabbale_name\"></div></form></div>',
    'navTabsContentActive': '<div class="tab-pane fade in active" data-nav-url="_in_nav_tabs_url_" id="_in_content_id_"></div>',
    'navTabsContent': '<div class="tab-pane fade" data-nav-url="_in_nav_tabs_url_" id="_in_content_id_"></div>',
    'alertInfo': '<div class="alert _in_color_ pt5 pb5 edit-element alert-his" data-his="_in_is_his_"  data-assembly-id="_in_data_assembly_id_" data-order="_in_order_" data-wid="_in_wid_" data-style="_in_color_">_label_box_</div>',
    'modal': '',
    'modalStatic': '',
    'ueditor': gridTemple.grid_header_1 + '<input type="hidden" data-id="_in_id_" data-name="_in_name_" data-val=\'_in_value_\'><script id=\"_in_id_\" name=\"_in_name_\" type=\"text/plain\">${_in_value_}</script>	' + gridTemple.grid_footer,
    'ueditorjs': '//ueditor-_in_id_-start系统生成代码请不要删除\n' +
    'var ue__in_id_ = UE.getEditor(\"_in_id_\",{\n' +
    '		autoHeightEnabled: false,\n' +
    '		initialFrameHeight: 420,\n' +
    '		elementPathEnabled: false,\n' +
    '		initialFrameWidth: \'100%\'\n' +
    '	});\n' +
    '//_in_id_-end',
    'filesUpload': "<div class=\"row file-upload-content\">\n" +
    "    <div class=\"col-sm-6\">\n" +
    "        <table class=\"table table-striped table-hover dataTable table-bordered\" data-list=\"_in_items_\">\n" +
    "            <thead>\n" +
    "            <tr>\n" +
    "                <th>附件名称</th>\n" +
    "                <th width=\"80\" class=\"tc\">操作</th>\n" +
    "            </tr>\n" +
    "            </thead>\n" +
    "            <tbody items=\"${object._in_items_}\" var=\"table_object\" varStatus=\"sta\">\n" +
    "                <tr data-index=\"${sta.index}\"><td><input name=\"_in_items_[${sta.index}].name\" value=\"${table_object.name}\" hidden=\"\"><input name=\"_in_items_[${sta.index}].path\" value=\"${table_object.path}\" hidden=\"\"><i data-file-name=\"${table_object.name}\" class=\"fa \"></i> ${table_object.name}</td><td class=\"tc\"><a class=\"btn btn-xs btn-blue tooltips\" data-placement=\"top\" data-original-title=\"删除\" onclick=\"tool.deleteFileRow(this,'${table_object.path}')\" href=\"javascript:void(0)\"><i class=\"fa fa-times\"></i></a> <a class=\"btn btn-xs btn-blue tooltips\" data-placement=\"top\" data-original-title=\"下载\" onclick=\"tool.downloadfile('${table_object.path}')\" href=\"javascript:void(0)\"><i class=\"fa fa-download\"></i></a></td></tr>" +
    "            </tbody>\n" +
    "        </table>\n" +
    "    </div>\n" +
    "    <div class=\"col-sm-6\">\n" +
    "        <div class=\"row\">\n" +
    "            <div class=\"l mt5 pl15 col-xs-12\">\n" +
    "                <input type=\"file\" id=\"_in_id_\" data-filetype=\"_file_type_\" data-filelength=\"_file_length_\" data-filesize=\"_file_size_\">\n" +
    "            </div>\n" +
    "            <div class=\"col-xs-12\">\n" +
    "                <div id=\"_in_id_-attac\" data-filesize=\"_file_size_\"></div>\n" +
    "            </div>\n" +
    "        </div>\n" +
    "    </div>\n" +
    "</div>" +
    "<script>\n" +
    "    $(document).ready(function () {\n" +
    "        tool.initFileUpload('#_in_id_', null, null, true, '_file_type_', '_file_size_', function (file) {\n" +
    "        }, function (file, data, response) {\n" +
    "            if($('#_in_id_').parents('.file-upload-content').find('table tbody').find('tr').length < Number($('#_in_id_').parents('.file-upload-content').find('#_in_id_-attac').attr('data-filesize'))){\n" +
    "                tool.addUploadAttachmentRow($.parseJSON(data),$('#_in_id_').parents('.file-upload-content'));\n" +
    "            }else{\n" +
    "                tool.alertWarning('上传失败','最多允许上传' + Number($('#_in_id_').parents('.file-upload-content').find('#_in_id_-attac').attr('data-filesize')) + '个文件!')\n" +
    "            }" +
    "        },function (){\n" +
    "             " +
    "        },'_file_length_','_in_id_-attac','选择文件',function (file){\n" +
    "            var file_up = this;\n" +
    "            if($('#_in_id_').parents('.file-upload-content').find('table tbody').find('tr').length >= Number($('#_in_id_').parents('.file-upload-content').find('#_in_id_-attac').attr('data-filesize'))){\n" +
    "                file_up.cancelUpload(file.id);\n" +
    "                $('#' + file.id).remove();\n" +
    "                tool.alertWarning('上传失败','最多允许上传' + Number($('#_in_id_').parents('.file-upload-content').find('#_in_id_-attac').attr('data-filesize')) + '个文件!')\n" +
    "            }" +
    "        });\n" +
    "    });\n" +
    "</script>",
    'imagesUpload': "<div class=\"row file-upload-content\">\n" +
    "    <div class=\"col-sm-6\">\n" +
    "        <table class=\"table table-striped table-hover dataTable table-bordered\" data-list=\"_in_items_\">\n" +
    "            <thead>\n" +
    "            <tr>\n" +
    "                <th>图片预览</th>\n" +
    "                <th width=\"80\" class=\"tc\">操作</th>\n" +
    "            </tr>\n" +
    "            </thead>\n" +
    "            <tbody items=\"${object._in_items_}\" var=\"table_object\" varStatus=\"sta\">\n" +
    "                <tr data-index=\"${sta.index}\"><td><input name=\"_in_items_[${sta.index}].name\" value=\"${table_object.name}\" hidden=\"\"><input name=\"_in_items_[${sta.index}].path\" value=\"${table_object.path}\" hidden=\"\">" +
    "<img onclick=\"tool.previewImage(this)\" class=\"thumbnail\" src=\"<%=basePath%>/photoshow.jsp?path=${table_object.path}\"></td><td class=\"tc\"><a class=\"btn btn-xs btn-blue tooltips\" data-placement=\"top\" data-original-title=\"删除\" onclick=\"tool.deleteFileRow(this,'${table_object.path}')\" href=\"javascript:void(0)\"><i class=\"fa fa-times\"></i></a> <a class=\"btn btn-xs btn-blue tooltips\" data-placement=\"top\" data-original-title=\"下载\" onclick=\"tool.downloadfile('${table_object.path}')\" href=\"javascript:void(0)\"><i class=\"fa fa-download\"></i></a></td></tr>" +
    "            </tbody>\n" +
    "        </table>\n" +
    "    </div>\n" +
    "    <div class=\"col-sm-6\">\n" +
    "        <div class=\"row\">\n" +
    "            <div class=\"l mt5 pl15 col-xs-12\">\n" +
    "                <input type=\"file\" id=\"_in_id_\" data-filelength=\"_file_length_\" data-filesize=\"_file_size_\">\n" +
    "            </div>\n" +
    "            <div class=\"col-xs-12\">\n" +
    "                <div id=\"_in_id_-img\" data-filesize=\"_file_size_\"></div>\n" +
    "            </div>\n" +
    "        </div>\n" +
    "    </div>\n" +
    "</div>" +
    "<script>\n" +
    "    $(document).ready(function () {\n" +
    "        tool.initFileUpload('#_in_id_', null, null, true, '*.bmp;*.jpg;*.jpeg;*.png;*.gif;', '_file_size_', function (file) {\n" +
    "        }, function (file, data, response) {\n" +
    "            if($('#_in_id_').parents('.file-upload-content').find('table tbody').find('tr').length < Number($('#_in_id_').parents('.file-upload-content').find('#_in_id_-img').attr('data-filesize'))){" +
    "            tool.addUploadImageRow($.parseJSON(data),$('#_in_id_').parents('.file-upload-content'));\n" +
    "            }else{" +
    "                tool.alertWarning('上传失败','最多允许上传' + Number($('#_in_id_').parents('.file-upload-content').find('#_in_id_-img').attr('data-filesize')) + '张图片!')" +
    "            }" +
    "        },function (){\n" +
    "        },'_file_length_','_in_id_-img','选择文件',function (file){\n" +
    "            var file_up = this;\n" +
    "            if($('#_in_id_').parents('.file-upload-content').find('table tbody').find('tr').length >= Number($('#_in_id_').parents('.file-upload-content').find('#_in_id_-img').attr('data-filesize'))){\n" +
    "                file_up.cancelUpload(file.id);\n" +
    "                $('#' + file.id).remove();\n" +
    "                tool.alertWarning('上传失败','最多允许上传' + Number($('#_in_id_').parents('.file-upload-content').find('#_in_id_-img').attr('data-filesize')) + '张图片!')\n" +
    "            }" +
    "        });\n" +
    "    });\n" +
    "</script>",
    'videoUpload': "<div class=\"row file-upload-content\">\n" +
    "    <div class=\"col-sm-6\">\n" +
    "        <table class=\"table table-striped table-hover dataTable table-bordered\" data-list=\"_in_items_\">\n" +
    "            <thead>\n" +
    "            <tr>\n" +
    "                <th>视频预览</th>\n" +
    "                <th width=\"80\" class=\"tc\">操作</th>\n" +
    "            </tr>\n" +
    "            </thead>\n" +
    "            <tbody items=\"${_in_items_}\" var=\"table_object\" varStatus=\"sta\">\n" +
    "                <tr data-index=\"${sta.index}\">" +
    "                    <td>" +
    "                        <input name=\"_in_items_[${sta.index}].name\" value=\"${table_object.name}\" hidden=\"\">" +
    "                        <input name=\"_in_items_[${sta.index}].path\" value=\"${table_object.path}\" hidden=\"\">" +
    "                        <input name=\"_in_items_[${sta.index}].preview\" value=\"${table_object.preview}\" hidden=\"\">" +
    "                        <img onclick=\"tool.previewVideo('${table_object.url}')\" class=\"thumbnail\" src=\"<%=basePath%>/photoshow.jsp?path=${table_object.preview}\">" +
    "                    </td>" +
    "                    <td class=\"tc\">" +
    "                        <a class=\"btn btn-xs btn-blue tooltips\" data-placement=\"top\" data-original-title=\"删除\" onclick=\"tool.deleteFileRow(this,'${table_object.path}')\" href=\"javascript:void(0)\"><i class=\"fa fa-times\"></i></a>" +
    "                        <a class=\"btn btn-xs btn-blue tooltips\" data-placement=\"top\" data-original-title=\"下载\" onclick=\"tool.downloadfile('${table_object.path}')\" href=\"javascript:void(0)\"><i class=\"fa fa-download\"></i></a>" +
    "                    </td></tr>" +
    "            </tbody>\n" +
    "        </table>\n" +
    "    </div>\n" +
    "    <div class=\"col-sm-6\">\n" +
    "        <div class=\"row\">\n" +
    "            <div class=\"l mt5 pl15 col-xs-12\">\n" +
    "                <input type=\"file\" id=\"_in_id_\" data-filelength=\"_file_length_\" data-filesize=\"_file_size_\">\n" +
    "            </div>\n" +
    "            <div class=\"col-xs-12\">\n" +
    "                <div id=\"_in_id_-img\" data-filesize=\"_file_size_\"></div>\n" +
    "            </div>\n" +
    "        </div>\n" +
    "    </div>\n" +
    "</div>" +
    "<script>\n" +
    "    $(document).ready(function () {\n" +
    "        tool.initFileUpload('#_in_id_', null, null, true, '*.mp4;', '_file_size_', function (file) {\n" +
    "        }, function (file, data, response) {\n" +
    "            if($('#_in_id_').parents('.file-upload-content').find('table tbody').find('tr').length < Number($('#_in_id_').parents('.file-upload-content').find('#_in_id_-img').attr('data-filesize'))){" +
    "            tool.addUploadVideoRow($.parseJSON(data),$('#_in_id_').parents('.file-upload-content'));\n" +
    "            }else{" +
    "                tool.alertWarning('上传失败','最多允许上传' + Number($('#_in_id_').parents('.file-upload-content').find('#_in_id_-img').attr('data-filesize')) + '段视频!')" +
    "            }" +
    "        },function (){\n" +
    "        },'_file_length_','_in_id_-img','选择文件',function (file){\n" +
    "            var file_up = this;\n" +
    "            if($('#_in_id_').parents('.file-upload-content').find('table tbody').find('tr').length >= Number($('#_in_id_').parents('.file-upload-content').find('#_in_id_-img').attr('data-filesize'))){\n" +
    "                file_up.cancelUpload(file.id);\n" +
    "                $('#' + file.id).remove();\n" +
    "                tool.alertWarning('上传失败','最多允许上传' + Number($('#_in_id_').parents('.file-upload-content').find('#_in_id_-img').attr('data-filesize')) + '段视频!')\n" +
    "            }" +
    "        });\n" +
    "    });\n" +
    "</script>",
    'wizard': "<form action=\"#\" role=\"form\" class=\"smart-wizard form-horizontal edit-element\" id=\"_in_id_-form\" data-finish-fun=\"_in_finish_fun_\" data-assembly-id=\"_in_data_assembly_id_\" data-order=\"_in_order_\" data-wid=\"_in_wid_\">\n" +
    "    <div id=\"_in_id_\" class=\"swMain\">\n" +
    "        <ul class=\"step-ul\">\n" +
    "            _in_wizard_step_\n" +
    "        </ul>\n" +
    "        _in_wizard_progress_bar_\n" +
    "        _in_wizard_body_\n" +
    "    </div>\n" +
    "<script>\n" +
    "    var _in_wizard_object_ = {\n" +
    "        wizardContent: $('#_in_id_'),\n" +
    "        wizardForm: $('#_in_id_-form'),\n" +
    "        numberOfSteps: 0,\n" +
    "        initWizard: function () {\n" +
    "            _in_wizard_object_.numberOfSteps = _in_wizard_object_.wizardContent.find('.step-ul > li').length;" +
    "            _in_wizard_object_.wizardContent.smartWizard({\n" +
    "                selected: 0,\n" +
    "                keyNavigation: false,\n" +
    "                onLeaveStep: _in_wizard_object_.leaveAStepCallback,\n" +
    "                onShowStep: _in_wizard_object_.onShowStep,\n" +
    "            });\n" +
    "            _in_wizard_object_.animateBar();\n" +
    "            _in_wizard_object_.wizardContent.find('#step-1, #step-2, #step-3, #step-4').validationEngine({\n" +
    "                showOneMessage: true\n" +
    "            });\n" +
    "        },\n" +
    "        //动画滚动条\n" +
    "        animateBar: function (val) {\n" +
    "            if ((typeof val == 'undefined') || val == \"\") {\n" +
    "                val = 1;\n" +
    "            }\n" +
    "            var valueNow = Math.floor(100 / _in_wizard_object_.numberOfSteps * val);\n" +
    "            $('.step-bar').css('width', valueNow + '%');\n" +
    "        },\n" +
    "        /**\n" +
    "         * 对当前显示出的步棸初始化\n" +
    "         */\n" +
    "        onShowStep: function (obj, context) {\n" +
    "            //循环输出即将显示回调函数\n" +
    "            var $content = _in_wizard_object_.wizardContent.find('.wizard-step:eq(' + (context.toStep - 1) + ')');\n" +
    "            _in_onShowStep_fun_\n" +
    "            if (context.toStep == _in_wizard_object_.numberOfSteps) {\n" +
    "                $('.anchor').children(\"li:nth-child(\" + context.toStep + \")\").children(\"a\").removeClass('wait');\n" +
    "            }\n" +
    "            //下一步\n" +
    "            $(\".next-step\").unbind(\"click\").click(function (e) {\n" +
    "                e.preventDefault();\n" +
    "                _in_wizard_object_.wizardContent.smartWizard(\"goForward\");\n" +
    "            });\n" +
    "            //上一步\n" +
    "            $(\".back-step\").unbind(\"click\").click(function (e) {\n" +
    "                e.preventDefault();\n" +
    "                _in_wizard_object_.wizardContent.smartWizard(\"goBackward\");\n" +
    "            });\n" +
    "            //完成\n" +
    "            $(\".finish-step\").unbind(\"click\").click(function (e) {\n" +
    "                e.preventDefault();\n" +
    "                _in_wizard_object_.onFinish(obj, context);\n" +
    "            });\n" +
    "        },\n" +
    "        leaveAStepCallback: function (obj, context) {\n" +
    "            return _in_wizard_object_.validateSteps(context.fromStep, context.toStep);\n" +
    "        },\n" +
    "        /**\n" +
    "         * 点击完成\n" +
    "         */\n" +
    "        onFinish: function (obj, context) {\n" +
    "            if (_in_wizard_object_.validateAllSteps()) {\n" +
    "                _in_finish_fun_;\n" +
    "                $('.anchor').children(\"li\").last().children(\"a\").removeClass('wait').removeClass('selected').addClass('done').children('.stepNumber').addClass('animated tada');\n" +
    "            }else{\n" +
    "                console.log('表单验证失败!');\n" +
    "            }\n" +
    "        },\n" +
    "        /**\n" +
    "         * 验证当前步,判断是否可以下一步\n" +
    "         * @param stepnumber 当前步\n" +
    "         * @param nextstep 下一步\n" +
    "         * @returns {boolean}\n" +
    "         */\n" +
    "        validateSteps: function (stepnumber, nextstep) {\n" +
    "            //循环输出验证是否允许下一步回调函数\n" +
    "            var $content = _in_wizard_object_.wizardContent.find('.wizard-step:eq(' + (stepnumber - 1) + ')');\n" +
    "            _in_validateSteps_fun_\n" +
    "            return _in_wizard_object_.changeAnchor(stepnumber, nextstep);\n" +
    "        },\n" +
    "        /**\n" +
    "         * 更新进度条\n" +
    "         * @param stepnumber 当前步\n" +
    "         * @param nextstep 下一步\n" +
    "         */\n" +
    "        changeAnchor: function (stepnumber, nextstep) {\n" +
    "            if (_in_wizard_object_.numberOfSteps >= nextstep && nextstep > stepnumber) {\n" +
    "                if (tool.validationElement(_in_wizard_object_.wizardContent.find('.wizard-step:eq(' + (stepnumber - 1) + ')').find('input,select'))) { // 验证表单\n" +
    "                    for (var i = stepnumber; i <= nextstep; i++) {\n" +
    "                        $('.anchor').children(\"li:nth-child(\" + i + \")\").not(\"li:nth-child(\" + nextstep + \")\").children(\"a\").removeClass('wait').addClass('done').children('.stepNumber').addClass('animated tada');\n" +
    "                    }\n" +
    "                    _in_wizard_object_.animateBar(nextstep);\n" +
    "                    return true;\n" +
    "                } else {\n" +
    "                    return false;\n" +
    "                }\n" +
    "            } else if (nextstep < stepnumber) {\n" +
    "                for (i = nextstep; i <= stepnumber; i++) {\n" +
    "                    $('.anchor').children(\"li:nth-child(\" + i + \")\").children(\"a\").addClass('wait').children('.stepNumber').removeClass('animated tada');\n" +
    "                }\n" +
    "                _in_wizard_object_.animateBar(nextstep);\n" +
    "                return true;\n" +
    "            }\n" +
    "        },\n" +
    "        /**\n" +
    "         * 判断是否全部验证通过\n" +
    "         * @returns {boolean}\n" +
    "         */\n" +
    "        validateAllSteps: function () {\n" +
    "            var isStepValid = true;\n" +
    "            return isStepValid;\n" +
    "        }\n" +
    "    }\n" +
    "    $(document).ready(function () {\n" +
    "        _in_wizard_object_.initWizard();\n" +
    "    });\n" +
    "</script>\n" +
    "</form>\n",
    'wizardProgressBar': "<div class=\"progress progress-xs transparent-black no-radius active\">\n" +
    "    <div aria-valuemax=\"100\" aria-valuemin=\"0\" role=\"progressbar\"\n" +
    "         class=\"progress-bar partition-green step-bar\">\n" +
    "        <span class=\"sr-only\"> 0% Complete (success)</span>\n" +
    "    </div>\n" +
    "</div>",
    'wizardStep': "<li>\n" +
    "    <a href=\"#_in_wizard_stepId_\">\n" +
    "        <div class=\"stepNumber\">_in_wizard_stepNumber_</div>\n" +
    "        <span class=\"stepDesc\">\n" +
    "            _in_wizard_step_ <br/>\n" +
    "            <small>_in_wizard_step_ _in_wizard_title_</small>\n" +
    "        </span>\n" +
    "    </a>\n" +
    "</li>",
    'wizardFirstContent': "<div id=\"_in_wizard_stepId_\" class=\"wizard-step\" data-validateSteps=\"_in_validateSteps_\" data-showStep=\"_in_showStep_\">\n" +
    "    <h3 class=\"StepTitle\">_in_wizard_step_ _in_wizard_title_</h3>\n" +
    "    <div class=\"row m0\" data-group-name=\"向导式表单:_in_wizard_title_\"></div>" +
    "    <div class=\"row m0\">\n" +
    "        <div class=\"col-xs-12\" data-order=\"0\">\n" +
    "            <div class=\"form-group\">\n" +
    "                <div class=\"col-sm-2 col-sm-offset-8\">\n" +
    "                    <button type=\"button\" class=\"btn btn-blue next-step btn-block\">\n" +
    "                        下一步 <i class=\"fa fa-arrow-circle-right\"></i>\n" +
    "                    </button>\n" +
    "                </div>\n" +
    "            </div>\n" +
    "        </div>\n" +
    "    </div>\n" +
    "</div>",
    'wizardContent': "<div id=\"_in_wizard_stepId_\" class=\"wizard-step\" data-validateSteps=\"_in_validateSteps_\" data-showStep=\"_in_showStep_\">\n" +
    "    <h3 class=\"StepTitle\">_in_wizard_step_ _in_wizard_title_</h3>\n" +
    "    <div class=\"row m0\" data-group-name=\"向导式表单:_in_wizard_title_\"></div>" +
    "    <div class=\"row m0\">\n" +
    "        <div class=\"col-xs-12\" data-order=\"0\">\n" +
    "            <div class=\"col-sm-2 col-sm-offset-3\">\n" +
    "                <button class=\"btn btn-light-grey back-step btn-block\">\n" +
    "                    <i class=\"fa fa-circle-arrow-left\"></i> 上一步\n" +
    "                </button>\n" +
    "            </div>\n" +
    "            <div class=\"col-sm-2 col-sm-offset-3\">\n" +
    "                <button type=\"button\" class=\"btn btn-blue next-step btn-block\">\n" +
    "                    下一步 <i class=\"fa fa-arrow-circle-right\"></i>\n" +
    "                </button>\n" +
    "            </div>\n" +
    "        </div>\n" +
    "    </div>" +
    "</div>",
    'wizardLastContent': "<div id=\"_in_wizard_stepId_\" class=\"wizard-step\" data-validateSteps=\"_in_validateSteps_\" data-showStep=\"_in_showStep_\">\n" +
    "    <h3 class=\"StepTitle\">_in_wizard_step_ _in_wizard_title_</h3>\n" +
    "    <div class=\"row m0\" data-group-name=\"向导式表单:_in_wizard_title_\"></div>" +
    "    <div class=\"row m0\">\n" +
    "        <div class=\"col-xs-12\" data-order=\"0\">\n" +
    "            <div class=\"form-group\">\n" +
    "                <div class=\"col-sm-2 col-sm-offset-8\">\n" +
    "                    <button type=\"button\" class=\"btn btn-success finish-step btn-block\">\n" +
    "                        完成 <i class=\"fa fa-arrow-circle-right\"></i>\n" +
    "                    </button>\n" +
    "                </div>\n" +
    "            </div>\n" +
    "        </div>\n" +
    "    </div>" +
    "</div>",
    "idcard": "<div class=\"row\">\n" +
    "    <div class=\"col-sm-6\">\n" +
    "        <div class=\"idcard-upload\">\n" +
    "            <input type=\"file\" id=\"_in_idcard_posivtive_\">\n" +
    "            <input id=\"_in_idcard_posivtiveInputId_\" name=\"_in_idcard_posivtiveInputName_\" value=\"${object._in_idcard_posivtiveInputName_}\" hidden>\n" +
    "        </div>\n" +
    "        <div class=\"id-card\">\n" +
    "            <i class=\"fa fa-circle-o-notch fa-spin\"></i>\n" +
    "            <c:if test=\"${object._in_idcard_posivtiveInputName_ ==null || object._in_idcard_posivtiveInputName_ == ''}\">\n" +
    "                <img src=\"<%=mainProject%>/resources/images/id-positive.png\">\n" +
    "            </c:if>\n" +
    "            <c:if test=\"${object._in_idcard_posivtiveInputName_ !=null && object._in_idcard_posivtiveInputName_ != ''}\">\n" +
    "                <img src=\"<%=basePath%>/photoshow.jsp?path=${object._in_idcard_posivtiveInputName_}\">\n" +
    "            </c:if>\n" +
    "        </div>\n" +
    "    </div>\n" +
    "    <div class=\"col-sm-6\">\n" +
    "        <div class=\"idcard-upload\">\n" +
    "            <input type=\"file\" id=\"_in_idcard_other_\">\n" +
    "            <input id=\"_in_idcard_otherInputId_\" name=\"_in_idcard_otherInputName_\" value=\"${object._in_idcard_otherInputName_}\" hidden>\n" +
    "        </div>\n" +
    "        <div class=\"id-card\">\n" +
    "            <i class=\"fa fa-circle-o-notch fa-spin\"></i>\n" +
    "            <c:if test=\"${object._in_idcard_otherInputName_ ==null || object._in_idcard_otherInputName_ == ''}\">\n" +
    "                <img src=\"<%=mainProject%>/resources/images/id-the-other-sideid.png\">\n" +
    "            </c:if>\n" +
    "            <c:if test=\"${object._in_idcard_otherInputName_ !=null && object._in_idcard_otherInputName_ != ''}\">\n" +
    "                <img src=\"<%=basePath%>/photoshow.jsp?path=${object._in_idcard_otherInputName_}\">\n" +
    "            </c:if>\n" +
    "        </div>\n" +
    "    </div>\n" +
    "</div>\n" +
    "<script>\n" +
    "    $(document).ready(function () {\n" +
    "        tool.initFileUploadByConfig({\n" +
    "            'selector': '#_in_idcard_posivtive_',\n" +
    "            'fileTypeExts': '*.bmp;*.jpg;*.jpeg;*.png;',\n" +
    "            'queueSizeLimit': 1,\n" +
    "            'fileSizeLimit': '1MB',\n" +
    "            'buttonText': '选择照片 <i class=\\\"fa fa-plus\\\"></i>',\n" +
    "            'auto': true,\n" +
    "            'onSelect': function () {\n" +
    "                $('#_in_idcard_posivtive_').parent().next().addClass('wait');\n" +
    "            },\n" +
    "            'onUploadSuccess': function (file, data, response) {\n" +
    "                data = $.parseJSON(data);\n" +
    "                $('#_in_idcard_posivtive_').parent().next().removeClass('wait');\n" +
    "                $('#_in_idcard_posivtive_').parent().next().find('img').attr('src', nodePath + '/photoshow.jsp?path=' + data.filePath);\n" +
    "                $('#_in_idcard_posivtiveInputId_').val(data.filePath);\n" +
    "            }\n" +
    "        });\n" +
    "        tool.initFileUploadByConfig({\n" +
    "            'selector': '#_in_idcard_other_',\n" +
    "            'fileTypeExts': '*.bmp;*.jpg;*.jpeg;*.png;',\n" +
    "            'queueSizeLimit': 1,\n" +
    "            'fileSizeLimit': '1MB',\n" +
    "            'buttonText': '选择照片 <i class=\\\"fa fa-plus\\\"></i>',\n" +
    "            'auto': true,\n" +
    "            'onSelect': function () {\n" +
    "                $('#_in_idcard_other_').parent().next().addClass('wait');\n" +
    "            },\n" +
    "            'onUploadSuccess': function (file, data, response) {\n" +
    "                data = $.parseJSON(data);\n" +
    "                $('#_in_idcard_other_').parent().next().removeClass('wait');\n" +
    "                $('#_in_idcard_other_').parent().next().find('img').attr('src', nodePath + '/photoshow.jsp?path=' + data.filePath);\n" +
    "                $('#_in_idcard_otherInputId_').val(data.filePath);\n" +
    "            }\n" +
    "        });\n" +
    "    });\n" +
    "</script>\n",
    "croppre": "<div class=\"modal fade\" id=\"avatar-modal\" aria-hidden=\"true\" aria-labelledby=\"avatar-modal-label\" role=\"dialog\" tabindex=\"-1\">\n" +
    "    <div class=\"modal-dialog avatar-modal\">\n" +
    "        <div class=\"modal-content\">\n" +
    "            <div class=\"avatar-form form-horizontal\" method=\"post\">\n" +
    "                <input type=\"hidden\" class=\"avatar-data\" name=\"avatar_data\">\n" +
    "                <div class=\"modal-header\">\n" +
    "                    <button type=\"button\" class=\"close\" data-dismiss=\"modal\">&times;</button>\n" +
    "                    <h4 class=\"modal-title\" id=\"avatar-modal-label\">上传图片</h4>\n" +
    "                </div>\n" +
    "                <div class=\"modal-body\">\n" +
    "                    <div class=\"avatar-body\">\n" +
    "                        <!-- Upload image and data -->\n" +
    "                        <div class=\"avatar-upload\">\n" +
    "                            <div class=\"form-group\">\n" +
    "                                <label class=\"col-sm-2 control-label\">\n" +
    "                                    选择文件:\n" +
    "                                </label>\n" +
    "                                <div class=\"col-sm-10\">\n" +
    "                                    <input type=\"file\" class=\"avatar-input\" id=\"avatarInput\" name=\"avatar_file\">\n" +
    "                                </div>\n" +
    "                            </div>\n" +
    "                            <div class=\"alert alert-danger avatar-alert alert-dismissable hide\"></div>\n" +
    "                        </div>\n" +
    "                        <!-- Crop and preview -->\n" +
    "                        <div class=\"row\">\n" +
    "                            <div class=\"col-md-12\">\n" +
    "                                <div class=\"avatar-preview preview-lg hide\"></div>\n" +
    "                                <div class=\"avatar-preview preview-md hide\"></div>\n" +
    "                                <div class=\"avatar-preview preview-sm hide\"></div>\n" +
    "                            </div>\n" +
    "                            <div class=\"col-md-12\">\n" +
    "                                <div class=\"avatar-wrapper\"></div>\n" +
    "                            </div>\n" +
    "                        </div>\n" +
    "                        <div class=\"row avatar-btns\">\n" +
    "                            <div class=\"col-md-9\">\n" +
    "                                <div class=\"btn-group\">\n" +
    "                                    <button type=\"button\" class=\"btn btn-sm btn-primary\" data-method=\"rotate\" data-option=\"-90\" title=\"向左旋转90°\"><i data-method=\"rotate\" data-option=\"-90\" class=\"fa fa-rotate-left\"></i></button>\n" +
    "                                    <button type=\"button\" class=\"btn btn-sm btn-primary\" data-method=\"rotate\" data-option=\"-15\" title=\"向左旋转15°\">-15°</button>\n" +
    "                                    <button type=\"button\" class=\"btn btn-sm btn-primary\" data-method=\"rotate\" data-option=\"-30\" title=\"向左旋转30°\">-30°</button>\n" +
    "                                    <button type=\"button\" class=\"btn btn-sm btn-primary\" data-method=\"rotate\" data-option=\"-45\" title=\"向左旋转45°\">-45°</button>\n" +
    "                                </div>\n" +
    "                                <div class=\"btn-group\">\n" +
    "                                    <button type=\"button\" class=\"btn btn-sm btn-primary\" data-method=\"rotate\" data-option=\"90\" title=\"向右旋转90°\"><i data-method=\"rotate\" data-option=\"90\" class=\"fa fa-rotate-right\"></i></button>\n" +
    "                                    <button type=\"button\" class=\"btn btn-sm btn-primary\" data-method=\"rotate\" data-option=\"15\" title=\"向右旋转15°\">15°</button>\n" +
    "                                    <button type=\"button\" class=\"btn btn-sm btn-primary\" data-method=\"rotate\" data-option=\"30\" title=\"向右旋转30°\">30°</button>\n" +
    "                                    <button type=\"button\" class=\"btn btn-sm btn-primary\" data-method=\"rotate\" data-option=\"45\" title=\"向右旋转45°\">45°</button>\n" +
    "                                </div>\n" +
    "                            </div>\n" +
    "                            <div class=\"col-md-3\">\n" +
    "                                <button type=\"button\" class=\"btn btn-sm btn-primary btn-block avatar-save\">\n" +
    "                                    确定\n" +
    "                                </button>\n" +
    "                            </div>\n" +
    "                        </div>\n" +
    "                    </div>\n" +
    "                </div>\n" +
    "                <script type=\"text/javascript\">\n" +
    "                    $(document).ready(function () {\n" +
    "                        new Crop.CropAvatar($('#_in_croppre_id_'),_in_callback_);\n" +
    "                    });\n" +
    "                </script>\n" +
    "            </div>\n" +
    "        </div>\n" +
    "    </div>\n" +
    "</div>\n" +
    "<div id=\"_in_croppre_id_\" data-aspectRatio=\"_in_croppre_aspectRatio_\" data-callback=\"_in_callback_\" data-val=\"_in_value_\">\n" +
    "    <div class=\"avatar-view\">\n" +
    "        <c:if test=\"${_in_value_ == null || _in_value_ == '' }\">\n" +
    "            <img src=\"<%=mainProject%>/resources/images/no-cover-image.jpg\">\n" +
    "        </c:if>\n" +
    "        <c:if test=\"${_in_value_ != null && _in_value_ != '' }\">\n" +
    "            <img src=\"${_in_value_}\">\n" +
    "        </c:if>\n" +
    "    </div>\n" +
    "    <!-- Loading state -->\n" +
    "    <div class=\"loading\" aria-label=\"Loading\" role=\"img\" tabindex=\"-1\"></div>\n" +
    "</div>",
    'staticimg': '<img type="text" width="_file_width_" height="_file_height_" placeholder="_in_placeholder_"  id="_in_id_" name="_in_name_" src="_in_src_">\n',
    "ztree": "<ul data-setting=\"_in_setting_\" data-callback=\"_in_callback_\" data-url=\"_in_ajax_url_\" id=\"_in_ztree_id_\" class=\"ztree\"></ul>\n" +
    "<script>\n" +
    "    $(document).ready(function () {\n" +
    "        $.ajax({\n" +
    "            url: tool.initParams(_in_ajax_url_),\n" +
    "            type: 'get',\n" +
    "            dataType: 'json',\n" +
    "            error: function (XMLHttpRequest, textStatus, errorThrown) {\n" +
    "                console.error('ztree数据加载失败...');\n" +
    "            },\n" +
    "            success: function (data) {\n" +
    "                if (data != null) {\n" +
    "                    var treeObj = $.fn.zTree.init($(\"#_in_ztree_id_\"), _in_setting_, data);\n" +
    "                    _in_callback_(treeObj);\n" +
    "                }else{\n" +
    "                    console.warn('ztree数据返回空...');\n" +
    "                }\n" +
    "            }\n" +
    "        });\n" +
    "    });\n" +
    "</script>",
    'RatyStar': "<p id=\"_in_id_\" score-val=\'_scoreval_\' style='margin-top:5px;'align=\"center\" data-score=\"${object._in_id_}\" placeholder=\"_in_placeholder_\" ></p>\n " +
    "<script>\n" +
    "  $(document).ready(function() {" +
    "$('#_in_id_').raty({score: " +
    "function() {" +
    "var scoreval=_scoreval_;" +
    "if($(this).attr('data-score')!=null && $(this).attr('data-score')!=''){" +
    "scoreval=$(this).attr('data-score');" +
    "}" +
    "return scoreval; }" +
    ",path:'<%=basePath%>/resources/plugins/jQuery-Raty/lib/img'" +
    ",scoreName: '_in_id_'" +
    ",half:true" +
    ",size:24" +
    ",starHalf:'star-half-big.png'" +
    ",starOff:'star-off-big.png'" +
    ",starOn:'star-on-big.png'});" +
    "});" +
    "</script>",
    'textareaForEditTable': '<div  data-wid="_in_wid_" data-assembly-id="_in_data_assembly_id_"  class="edit-element"><input onclick="mtextarea(this)" type="text" placeholder="_in_placeholder_" _is_onlyread_ class="form-control _in_validate_" id="_in_id_" name="_in_name_" value="${table_object._in_value_}">'+
    '</div>',
    'importjsp': '<div data-order="_in_order_"  data-wid="_in_wid_" data-assembly-id="_in_data_assembly_id_" class="edit-element"><%@include file="_in_jsp_path_"%></div>',
    'chart': "<div class=\"chart edit-element\" data-assembly-id=\"_in_data_assembly_id_\" data-order=\"_in_order_\" data-wid=\"_in_wid_\" data-data=\"_in_ajax_data_\" data-url=\"_in_ajax_url_\">" +
    "<div id=\"_in_id_\"></div>\n" +
    "<script>\n" +
    "    $(function () {\n" +
    "        $.ajax({\n" +
    "            url: tool.initParams(_in_ajax_url_),\n" +
    "            cache: false,\n" +
    "            type: \"get\",\n" +
    "            data: \"_in_ajax_data_\",\n" +
    "            dataType: \"json\",\n" +
    "            error: function (XMLHttpRequest, textStatus, errorThrown) {\n" +
    "                console.log('图表数据加载失败...')\n" +
    "            },\n" +
    "            success: function (data) {\n" +
    "                data.selector = '#_in_id_';\n" +
    "                tool.initchart(data);\n" +
    "            }\n" +
    "        });\n" +
    "    });\n" +
    "</script></div>",
    'importExcel':'<div id="_in_id_" class="layout _in_width_" data-group-name="_in_group_name_" data-order="_in_order_" data-wid="_in_wid_" data-assembly-id="_in_data_assembly_id_">_in_excel_html</div>',
    'excelInput':'<input type="text" id="_in_id_" name="_in_name_" value="${_in_value_}">'
}

var assembly = [
    {
        'assemblyName': '列表页头部',
        'style': [
            {
                'styleName': '默认',
                'showElements': '',
                'template': '<%@include file="../../common/list-header.jsp" %>'
            }
        ]
    }, {
        'assemblyName': '列表页底部',
        'style': [
            {
                'styleName': '默认',
                'showElements': '',
                'template': '<%@include file="../../common/list-buttom.jsp" %>'
            }
        ]
    }, {
        'assemblyName': '详情页头部',
        'style': [
            {
                'styleName': '默认',
                'showElements': '',
                'template': '<%@include file="../../common/input-header.jsp" %>'
            }
        ]
    }, {
        'assemblyName': '详情页底部',
        'style': [
            {
                'styleName': '默认',
                'showElements': '',
                'template': '<%@include file="../../common/input-buttom.jsp" %>'
            }
        ]
    }, {
        'assemblyName': '普通布局',
        'style': [
            {
                'styleName': '默认',
                'showElements': '.group-genus, .group-name, .order, .width, .element-id ',
                'template': '<div id="_in_id_" class="layout _in_width_" data-group-name="_in_group_name_" data-order="_in_order_" data-wid="_in_wid_" data-assembly-id="_in_data_assembly_id_"></div>'
            }
        ]
    }, {
        'assemblyName': 'input数据分组',
        'style': [
            {
                'styleName': '默认',
                'showElements': '.group-genus, .group-name, .order, .element-id, .tit-remind',
                'template': '<div id="_in_id_" data-group-name="_in_group_name_" tit-remind="_tit_remind_" data-order="_in_order_" class="layout _in_width_" data-wid="_in_wid_" data-assembly-id="_in_data_assembly_id_">\n' +
                '    <div class="panel input-panel">\n' +
                '        <div class="panel-heading"><h4 class="panel-title">_in_group_name_<font style=\"color:red;font-size:12px;font-weight:bold;\">_tit_remind_</font></h4><div class="panel-tools"><a class="btn btn-xs btn-link panel-collapse collapses"><i class="fa fa-chevron-down"></i></a></div></div>\n' +
                '        <div class="panel-body"></div>\n' +
                '    </div>\n</div>'
            }
        ]
    }, {
        'assemblyName': 'panel',
        'style': [
            {
                'styleName': '默认',
                'showElements': '.group-genus, .group-name, .order, .width, .element-id, .title',
                'template': '<div id="_in_id_" data-group-name="_in_group_name_" data-order="_in_order_" class="layout _in_width_" data-wid="_in_wid_" data-assembly-id="_in_data_assembly_id_">\n' +
                '    <div class="panel">\n' +
                '        <div class="panel-heading"><h4 class="panel-title">_in_title_</h4></div>\n' +
                '        <div class="panel-body"></div>\n' +
                '    </div>\n</div>'
            }
        ]
    }, {
        'assemblyName': '表格',
        'style': [
            {
                'styleName': '默认',
                'showElements': '.group-genus, .order, .element-id, .items, .checkbox-id, .checkbox-url, .table-config',
                'template': elementTemple.table
            }
        ]
    }, {
        'assemblyName': '输入框',
        'style': [
            {
                'styleName': '一行一列',
                'showElements': '.style, .group-genus, .order, .element-id, .element-name, .title, .element-value,.defaultvalue, .validate,.is-onlyread, .placeholder, .more-query-config, .data-custom-class ,.is-Showclear',
                'template': gridTemple.grid_header_1 + elementTemple.input + gridTemple.grid_footer

            },
            {
                'styleName': '一行二列',
                'showElements': '.style, .group-genus, .order, .element-id, .element-name, .title, .element-value,.defaultvalue,  .validate, .is-onlyread, .placeholder, .more-query-config, .data-custom-class',
                'template': gridTemple.grid_header_2 + elementTemple.input + gridTemple.grid_footer
            },
            {
                'styleName': '一行三列',
                'showElements': '.style, .group-genus, .order, .element-id, .element-name, .title, .element-value,.defaultvalue,  .validate, .is-onlyread, .placeholder, .more-query-config, .data-custom-class',
                'template': gridTemple.grid_header_3 + elementTemple.input + gridTemple.grid_footer
            }
        ]
    }, {
        'assemblyName': '日期插件',
        'style': [
            {
                'styleName': '一行一列',
                'showElements': '.style, .group-genus, .order, .element-id, .element-name, .title, .element-value,.defaultvalue,  .validate, .format, .more-query-config, .min-date, .max-date, .data-custom-class',
                'template': gridTemple.grid_header_1 + elementTemple.datetimepicker + gridTemple.grid_footer
            },
            {
                'styleName': '一行二列',
                'showElements': '.style, .group-genus, .order, .element-id, .element-name, .title, .element-value,.defaultvalue,  .validate, .format, .more-query-config, .min-date, .max-date, .data-custom-class',
                'template': gridTemple.grid_header_2 + elementTemple.datetimepicker + gridTemple.grid_footer
            },
            {
                'styleName': '一行三列',
                'showElements': '.style, .group-genus, .order, .element-id, .element-name, .title, .element-value,.defaultvalue,  .validate, .format, .more-query-config, .min-date, .max-date, .data-custom-class',
                'template': gridTemple.grid_header_3 + elementTemple.datetimepicker + gridTemple.grid_footer
            }
        ]
    }, {
        'assemblyName': '隐藏文本框',
        'style': [
            {
                'styleName': '默认',
                'showElements': ' .element-id, .element-name,.element-value',
                'template': '<input title="隐藏文本框" type="hidden"class="edit-element edit-hidden" data-assembly-id="_in_data_assembly_id_" data-wid="_in_wid_"id="_in_id_" name="_in_name_" value="${_in_value_}"/>\n'
            }
        ]
    }, {
        'assemblyName': '字典下拉',
        'style': [
            {
                'styleName': '一行一列',
                'showElements': '.style, .group-genus, .order, .element-id, .element-name, .title, .element-value,.defaultvalue, .validate, .zdlb, .is-onlyread, .more-query-config, .is-ShowSearchBox, .data-custom-class',
                'template': gridTemple.grid_header_1 + elementTemple.codeSelect + gridTemple.grid_footer,
                'templatedisabled': gridTemple.grid_header_1 + elementTemple.codeSelect + elementTemple.inputselecthidden + gridTemple.grid_footer
            },
            {
                'styleName': '一行二列',
                'showElements': '.style, .group-genus, .order, .element-id, .element-name, .title, .element-value,.defaultvalue, .validate, .zdlb, .is-onlyread, .more-query-config, .is-ShowSearchBox, .data-custom-class',
                'template': gridTemple.grid_header_2 + elementTemple.codeSelect + gridTemple.grid_footer,
                'templatedisabled': gridTemple.grid_header_2 + elementTemple.codeSelect + elementTemple.inputselecthidden + gridTemple.grid_footer
            },
            {
                'styleName': '一行三列',
                'showElements': '.style, .group-genus, .order, .element-id, .element-name, .title, .element-value,.defaultvalue, .validate, .zdlb, .is-onlyread, .more-query-config, .is-ShowSearchBox, .data-custom-class',
                'template': gridTemple.grid_header_3 + elementTemple.codeSelect + gridTemple.grid_footer,
                'templatedisabled': gridTemple.grid_header_3 + elementTemple.codeSelect + elementTemple.inputselecthidden + gridTemple.grid_footer
            }
        ]
    }, {
        'assemblyName': '后台返回list下拉',
        'style': [
            {
                'styleName': '一行一列',
                'showElements': '.style, .group-genus, .order, .element-id, .element-name, .title, .element-value,.defaultvalue, .validate, .items, .list-key, .list-value, .is-onlyread, .more-query-config, .is-ShowSearchBox, .data-custom-class',
                'template': gridTemple.grid_header_1 + elementTemple.listSelect + gridTemple.grid_footer,
                'templatedisabled': gridTemple.grid_header_1 + elementTemple.listSelect + elementTemple.inputselecthidden + gridTemple.grid_footer
            },
            {
                'styleName': '一行二列',
                'showElements': '.style, .group-genus, .order, .element-id, .element-name, .title, .element-value,.defaultvalue, .validate, .items, .list-key, .list-value, .is-onlyread, .more-query-config, .is-ShowSearchBox, .data-custom-class',
                'template': gridTemple.grid_header_2 + elementTemple.listSelect + gridTemple.grid_footer,
                'templatedisabled': gridTemple.grid_header_2 + elementTemple.listSelect + elementTemple.inputselecthidden + gridTemple.grid_footer
            },
            {
                'styleName': '一行三列',
                'showElements': '.style, .group-genus, .order, .element-id, .element-name, .title, .element-value,.defaultvalue, .validate, .items, .list-key, .list-value, .is-onlyread, .more-query-config, .is-ShowSearchBox, .data-custom-class',
                'template': gridTemple.grid_header_3 + elementTemple.listSelect + gridTemple.grid_footer,
                'templatedisabled': gridTemple.grid_header_3 + elementTemple.listSelect + elementTemple.inputselecthidden + gridTemple.grid_footer
            }
        ]
    }, {
        'assemblyName': '指定表以及字段下拉',
        'style': [
            {
                'styleName': '一行一列',
                'showElements': '.style, .group-genus, .order, .element-id, .element-name, .title, .element-value,.defaultvalue, .validate, .table-name, .select-key, .select-text, .field-up-id, .field-up-val, .file-query, .query-val, .data-childselect, .is-onlyread, .more-query-config, .data-cur-val, .data-order-field, .data-order-type, .is-ShowSearchBox, .data-custom-class, .otherQuery',
                'template': gridTemple.grid_header_1 + elementTemple.tableSelect + gridTemple.grid_footer,
                'templatedisabled': gridTemple.grid_header_1 + elementTemple.tableSelect + elementTemple.inputselecthidden + gridTemple.grid_footer
            },
            {
                'styleName': '一行二列',
                'showElements': '.style, .group-genus, .order, .element-id, .element-name, .title, .element-value,.defaultvalue, .validate, .table-name, .select-key, .select-text, .field-up-id, .field-up-val, .file-query, .query-val, .data-childselect, .is-onlyread, .more-query-config, .data-cur-val, .data-order-field, .data-order-type, .is-ShowSearchBox, .data-custom-class',
                'template': gridTemple.grid_header_2 + elementTemple.tableSelect + gridTemple.grid_footer,
                'templatedisabled': gridTemple.grid_header_2 + elementTemple.tableSelect + elementTemple.inputselecthidden + gridTemple.grid_footer
            },
            {
                'styleName': '一行三列',
                'showElements': '.style, .group-genus, .order, .element-id, .element-name, .title, .element-value,.defaultvalue, .validate, .table-name, .select-key, .select-text, .field-up-id, .field-up-val, .file-query, .query-val, .data-childselect, .is-onlyread, .more-query-config, .data-cur-val, .data-order-field, .data-order-type, .is-ShowSearchBox, .data-custom-class',
                'template': gridTemple.grid_header_3 + elementTemple.tableSelect + gridTemple.grid_footer,
                'templatedisabled': gridTemple.grid_header_3 + elementTemple.tableSelect + elementTemple.inputselecthidden + gridTemple.grid_footer
            }
        ]
    }, {
        'assemblyName': 'ajax下拉',
        'style': [
            {
                'styleName': '一行一列',
                'showElements': '.style, .group-genus, .order, .element-id, .element-name, .title, .element-value,.defaultvalue, .validate, .url, .is-onlyread, .more-query-config, .data-custom-class',
                'template': gridTemple.grid_header_1 + elementTemple.ajaxSelect + gridTemple.grid_footer,
                'templatedisabled': gridTemple.grid_header_1 + elementTemple.ajaxSelect + elementTemple.inputselecthidden + gridTemple.grid_footer
            },
            {
                'styleName': '一行二列',
                'showElements': '.style, .group-genus, .order, .element-id, .element-name, .title, .element-value,.defaultvalue, .validate, .url, .is-onlyread, .more-query-config, .data-custom-class',
                'template': gridTemple.grid_header_2 + elementTemple.ajaxSelect + gridTemple.grid_footer,
                'templatedisabled': gridTemple.grid_header_2 + elementTemple.ajaxSelect + elementTemple.inputselecthidden + gridTemple.grid_footer
            },
            {
                'styleName': '一行三列',
                'showElements': '.style, .group-genus, .order, .element-id, .element-name, .title, .element-value,.defaultvalue, .validate, .url, .is-onlyread, .more-query-config, .data-custom-class',
                'template': gridTemple.grid_header_3 + elementTemple.ajaxSelect + gridTemple.grid_footer,
                'templatedisabled': gridTemple.grid_header_3 + elementTemple.ajaxSelect + elementTemple.inputselecthidden + gridTemple.grid_footer
            }
        ]
    }, {
        'assemblyName': '带搜索的ajax下拉',
        'style': [
            {
                'styleName': '一行一列',
                'showElements': '.style, .group-genus, .order, .element-id, .element-name, .title, .element-value,.defaultvalue, .validate, .url, .default-text, .more-query-config, .data-custom-class',
                'template': gridTemple.grid_header_1 + elementTemple.searchSelect + gridTemple.grid_footer
            },
            {
                'styleName': '一行二列',
                'showElements': '.style, .group-genus, .order, .element-id, .element-name, .title, .element-value,.defaultvalue, .validate, .url, .default-text, .more-query-config, .data-custom-class',
                'template': gridTemple.grid_header_2 + elementTemple.searchSelect + gridTemple.grid_footer
            },
            {
                'styleName': '一行三列',
                'showElements': '.style, .group-genus, .order, .element-id, .element-name, .title, .element-value,.defaultvalue, .validate, .url, .default-text, .more-query-config, .data-custom-class',
                'template': gridTemple.grid_header_3 + elementTemple.searchSelect + gridTemple.grid_footer
            }
        ]
    }, {
        'assemblyName': '后台返回list多选框',
        'style': [
            {
                'styleName': '一行一列',
                'showElements': '.style, .group-genus, .order, .element-name, .title, .element-value, .validate,.defaultvalue, .is-onlyread,.is-checekAll, .items, .list-key, .list-value, .data-custom-class',
                'template': gridTemple.grid_header_1 + elementTemple.listCheckbox + gridTemple.grid_footer,
                'templatedisabled': gridTemple.grid_header_1 + elementTemple.listCheckbox + elementTemple.inputcheckhidden + gridTemple.grid_footer
            },
            {
                'styleName': '一行二列',
                'showElements': '.style, .group-genus, .order, .element-name, .title, .element-value, .validate,.defaultvalue, .is-onlyread,.is-checekAll, .items, .list-key, .list-value, .data-custom-class',
                'template': gridTemple.grid_header_2 + elementTemple.listCheckbox + gridTemple.grid_footerr,
                'templatedisabled': gridTemple.grid_header_2 + elementTemple.listCheckbox + elementTemple.inputcheckhidden + gridTemple.grid_footer
            },
            {
                'styleName': '一行三列',
                'showElements': '.style, .group-genus, .order, .element-name, .title, .element-value, .validate,.defaultvalue, .is-onlyread,.is-checekAll, .items, .list-key, .list-value, .data-custom-class',
                'template': gridTemple.grid_header_3 + elementTemple.listCheckbox + gridTemple.grid_footerr,
                'templatedisabled': gridTemple.grid_header_3 + elementTemple.listCheckbox + elementTemple.inputcheckhidden + gridTemple.grid_footer
            }
        ]
    }, {
        'assemblyName': '后台返回list单选框',
        'style': [
            {
                'styleName': '一行一列',
                'showElements': '.style, .group-genus, .order, .element-name, .title, .element-value, .validate, .is-onlyread, .items, .list-key, .list-value, .data-custom-class',
                'template': gridTemple.grid_header_1 + elementTemple.listRadio + gridTemple.grid_footer,
                'templatedisabled': gridTemple.grid_header_1 + elementTemple.listRadio + elementTemple.inputcheckhidden + gridTemple.grid_footer
            },
            {
                'styleName': '一行二列',
                'showElements': '.style, .group-genus, .order, .element-name, .title, .element-value, .validate, .is-onlyread, .items, .list-key, .list-value, .data-custom-class',
                'template': gridTemple.grid_header_2 + elementTemple.listRadio + gridTemple.grid_footer,
                'templatedisabled': gridTemple.grid_header_2 + elementTemple.listRadio + elementTemple.inputcheckhidden + gridTemple.grid_footer
            },
            {
                'styleName': '一行三列',
                'showElements': '.style, .group-genus, .order, .element-name, .title, .element-value, .validate, .is-onlyread, .items, .list-key, .list-value, .data-custom-class',
                'template': gridTemple.grid_header_3 + elementTemple.listRadio + gridTemple.grid_footer,
                'templatedisabled': gridTemple.grid_header_3 + elementTemple.listRadio + elementTemple.inputcheckhidden + gridTemple.grid_footer
            }
        ]
    }, {
        'assemblyName': '按钮',
        'style': [
            {
                'styleName': '默认',
                'showElements': '.group-genus, .order, .element-id, .title, .icon, .event-click, .btn-size, .btn-style, .ssyhqx, .group-jurisdiction, .data-custom-class',
                'template': elementTemple.button
            }
        ]
    }, {
        'assemblyName': '增加',
        'style': [
            {
                'styleName': '默认',
                'showElements': '.group-genus, .order, .element-id, .title, .icon, .event-click, .btn-size, .btn-style, .ssyhqx, .group-jurisdiction, .data-custom-class',
                'template': elementTemple.button
            }
        ]
    }, {
        'assemblyName': '删除',
        'style': [
            {
                'styleName': '默认',
                'showElements': '.group-genus, .order, .element-id, .title, .icon, .event-click, .btn-size, .btn-style, .ssyhqx, .group-jurisdiction, .data-custom-class',
                'template': elementTemple.button
            }
        ]
    }, {
        'assemblyName': '修改',
        'style': [
            {
                'styleName': '默认',
                'showElements': '.group-genus, .order, .element-id, .title, .icon, .event-click, .btn-size, .btn-style, .ssyhqx, .group-jurisdiction, .data-custom-class',
                'template': elementTemple.button
            }
        ]
    }, {
        'assemblyName': '保存',
        'style': [
            {
                'styleName': '默认',
                'showElements': '.group-genus, .order, .element-id, .title, .icon, .event-click, .btn-size, .btn-style, .ssyhqx, .group-jurisdiction, .data-custom-class',
                'template': elementTemple.button
            }
        ]
    }, {
        'assemblyName': '上报',
        'style': [
            {
                'styleName': '默认',
                'showElements': '.group-genus, .order, .element-id, .title, .icon, .event-click, .btn-size, .btn-style, .ssyhqx, .group-jurisdiction, .data-custom-class',
                'template': elementTemple.button
            }
        ]
    }, {
        'assemblyName': '审核通过',
        'style': [
            {
                'styleName': '默认',
                'showElements': '.group-genus, .order, .element-id, .title, .icon, .event-click, .btn-size, .btn-style, .ssyhqx, .group-jurisdiction, .data-custom-class',
                'template': elementTemple.button
            }
        ]
    }, {
        'assemblyName': '审核退回',
        'style': [
            {
                'styleName': '默认',
                'showElements': '.group-genus, .order, .element-id, .title, .icon, .event-click, .btn-size, .btn-style, .ssyhqx, .group-jurisdiction, .data-custom-class',
                'template': elementTemple.button
            }
        ]
    }, {
        'assemblyName': '审核通过并上报',
        'style': [
            {
                'styleName': '默认',
                'showElements': '.group-genus, .order, .element-id, .title, .icon, .event-click, .btn-size, .btn-style, .ssyhqx, .group-jurisdiction, .data-custom-class',
                'template': elementTemple.button
            }
        ]
    }, {
        'assemblyName': '取消（将数据退回到草稿状态）',
        'style': [
            {
                'styleName': '默认',
                'showElements': '.group-genus, .order, .element-id, .title, .icon, .event-click, .btn-size, .btn-style, .ssyhqx, .group-jurisdiction, .data-custom-class',
                'template': elementTemple.button
            }
        ]
    }, {
        'assemblyName': '导出',
        'style': [
            {
                'styleName': '默认',
                'showElements': '.group-genus, .order, .element-id, .title, .icon, .event-click, .btn-size, .btn-style, .ssyhqx, .group-jurisdiction, .data-custom-class',
                'template': elementTemple.button
            }
        ]
    }, {
        'assemblyName': '打印报表',
        'style': [
            {
                'styleName': '默认',
                'showElements': '.group-genus, .order, .element-id, .title, .icon, .event-click, .btn-size, .btn-style, .ssyhqx, .group-jurisdiction, .data-custom-class',
                'template': elementTemple.button
            }
        ]
    }, {
        'assemblyName': '查询',
        'style': [
            {
                'styleName': '默认',
                'showElements': '.group-genus, .order, .element-id, .title, .icon, .event-click, .btn-size, .btn-style, .data-custom-class',
                'template': elementTemple.button
            }
        ]
    }, {
        'assemblyName': '重置',
        'style': [
            {
                'styleName': '默认',
                'showElements': '.group-genus, .order, .element-id, .title, .icon, .event-click, .btn-size, .btn-style, .data-custom-class',
                'template': elementTemple.button
            }
        ]
    }, {
        'assemblyName': '导入',
        'style': [
            {
                'styleName': '导入',
                'showElements': '.group-genus, .order, .element-id, .title, .icon, .event-click, .btn-size, .btn-style, .ssyhqx, .group-jurisdiction, .data-custom-class',
                'template': elementTemple.button
            }
        ]
    }, {
        'assemblyName': '作废',
        'style': [
            {
                'styleName': '作废',
                'showElements': '.group-genus, .order, .element-id, .title, .icon, .event-click, .btn-size, .btn-style, .ssyhqx, .group-jurisdiction, .data-custom-class',
                'template': elementTemple.button
            }
        ]
    }, {
        'assemblyName': '34',
        'style': [
            {
                'styleName': '暂存',
                'showElements': '.group-genus, .order, .element-id, .title, .icon, .event-click, .btn-size, .btn-style, .ssyhqx, .group-jurisdiction, .data-custom-class',
                'template': elementTemple.button
            }
        ]
    }, {
        'assemblyName': '35',
        'style': [
            {
                'styleName': '默认',
                'showElements': '',
                'template': ''
            }
        ]
    }, {
        'assemblyName': '条件分组',
        'style': [
            {
                'styleName': '默认',
                'showElements': '.group-genus, .group-name, .order, .if-test ',
                'template': '<junducif class="layout" data-group-name="_in_group_name_" data-order="_in_order_" data-wid="_in_wid_" data-assembly-id="_in_data_assembly_id_" test="${_if_test}"></junducif>'
            }
        ]
    }, {
        'assemblyName': '分页条数',
        'style': [
            {
                'styleName': '默认',
                'showElements': '.group-genus, .order ',
                'template': '<div class="btn-group pull-right edit-element" data-assembly-id="_in_data_assembly_id_" data-order="_in_order_" data-wid="_in_wid_">\n<%@include file="../../common/other/page-size.jsp" %>\n</div>'
            }
        ]
    }, {
        'assemblyName': '分页',
        'style': [
            {
                'styleName': '默认',
                'showElements': '.group-genus,  .order',
                'template': '<div class="edit-element" title="分页" data-assembly-id="_in_data_assembly_id_" data-order="_in_order_" data-wid="_in_wid_"><input type="hidden" name="currentPageno" value="${pager.currentPageno}" id="yspager_currentPageno"/>\n' +
                '<input type="hidden" name="eachPageRows" value="${pager.eachPageRows}" id="eachPageRows"/>\n' +
                '<div class="row mt-10" style="margin-top:1%">\n' +
                '<tags:pagination paginationSize="${pager.eachPageRows}" page="${pager}"></tags:pagination>\n' +
                '</div></div>'
            }
        ]
    }, {
        'assemblyName': 'list模板',
        'style': [
            {
                'styleName': '模板-1',
                'showElements': '.style',
                'template': "<div class=\"row data-group\" data-order=\"100\">\n" +
                "    <div id=\"\" class=\"layout col-xs-12\" data-group-name=\"查询区域\" data-order=\"100\" data-wid=\"Cri3815\" data-assembly-id=\"4\">\n" +
                "<div class=\"row data-group\" data-order=\"100\">\n" +
                "<div id=\"\" class=\"layout col-xs-9\" data-group-name=\"查询区域条件区域\" data-order=\"100\" data-wid=\"iuC8210\" data-assembly-id=\"4\">\n" +
                "        <div class=\"col-xxxl-3 col-md-4 col-sm-6 col-xs-12 nopadding edit-element\" data-assembly-id=\"8\" data-order=\"100\"\n" +
                "             data-wid=\"pED5294\">\n" +
                "            <div class=\"form-group\">\n" +
                "                <label title=\"身份证号\" class=\"col-sm-3 control-label ell nopadding\" for=\"sfzh\">身份证号：</label>\n" +
                "                <div class=\"col-sm-9\">\n" +
                "                    <input type=\"text\" class=\"form-control \" id=\"sfzh\" name=\"sfzh\" value=\"${object.sfzh}\">\n" +
                "                </div>\n" +
                "            </div>\n" +
                "        </div>\n" +
                "\n" +
                "        <div class=\"col-xxxl-3 col-md-4 col-sm-6 col-xs-12 nopadding edit-element\" data-assembly-id=\"11\" data-order=\"55\"\n" +
                "             data-wid=\"bcC7958\">\n" +
                "            <div class=\"form-group\">\n" +
                "                <label title=\"性别\" class=\"col-sm-3 control-label ell nopadding\" for=\"xb\">性别：</label>\n" +
                "                <div class=\"col-sm-9\">\n" +
                "                    <select class=\"form-control select2-code \" zdlb=\"xb\" id=\"xb\" name=\"xb\"\n" +
                "                            value=\"${object.xb}\"></select>\n" +
                "                </div>\n" +
                "            </div>\n" +
                "        </div>\n</div>\n" +
                "<div id=\"\" class=\"layout col-xs-3\" data-group-name=\"查询区域按钮区域\" data-order=\"50\" data-wid=\"yCr296\" data-assembly-id=\"4\">\n" +
                "        <button id=\"searchbtn\" data-assembly-id=\"30\" data-order=\"3\" data-wid=\"ABe1326\" type=\"button\"\n" +
                "                data-btn-size=\"btn btn-sm\" data-btn-class=\"btn-info\" class=\"btn btn-sm btn-info edit-element\"\n" +
                "                onclick=\"tool.doSearch(this)\"> 查询 <i class=\"fa fa-search\"></i></button>\n" +
                "        <button id=\"resetbtn\" data-assembly-id=\"31\" data-order=\"2\" data-wid=\"bQP7712\" type=\"button\"\n" +
                "                data-btn-size=\"btn btn-sm\" data-btn-class=\"btn-info\" class=\"btn btn-sm btn-info edit-element\"\n" +
                "                onclick=\"tool.resetForm(this)\"> 重置 <i class=\"fa fa-reply\"></i></button>\n" +
                "    </div>\n</div>\n" +
                "</div>\n</div>\n" +
                "<div class=\"row data-group\" data-order=\"80\">\n" +
                "    <div id=\"\" class=\"layout col-xs-12\" data-group-name=\"按钮区域\" data-order=\"80\" data-wid=\"FHV5066\" data-assembly-id=\"4\">\n" +
                "        <button id=\"newbtn\" data-assembly-id=\"19\" data-order=\"100\" data-wid=\"SMh8545\" type=\"button\"\n" +
                "                data-btn-size=\"btn btn-sm\" data-btn-class=\"btn-success\" class=\"btn btn-sm btn-success edit-element\"\n" +
                "                onclick=\"tool.addData(this)\"> 新增 <i class=\"fa fa-plus\"></i></button>\n" +
                "        <button id=\"removebtn\" data-assembly-id=\"20\" data-order=\"95\" data-wid=\"sRh8512\" type=\"button\"\n" +
                "                data-btn-size=\"btn btn-sm\" data-btn-class=\"btn-success\" class=\"btn btn-sm btn-success edit-element\"\n" +
                "                onclick=\"tool.doRemove(this)\"> 删除 <i class=\"fa fa-times\"></i></button>\n" +
                "        <button id=\"editbtn\" data-assembly-id=\"21\" data-order=\"90\" data-wid=\"YiM9384\" type=\"button\"\n" +
                "                data-btn-size=\"btn btn-sm\" data-btn-class=\"btn-success\" class=\"btn btn-sm btn-success edit-element\"\n" +
                "                onclick=\"tool.editData(this)\"> 修改 <i class=\"fa fa-edit\"></i></button>\n" +
                "        <div class=\"btn-group pull-right edit-element\" data-assembly-id=\"37\" data-order=\"1\" data-wid=\"QdD768\">\n" +
                "            <%@include file=\"../../common/other/page-size.jsp\" %>\n" +
                "        </div>\n" +
                "    </div>\n" +
                "</div>\n" +
                "\n" +
                "\n" +
                "<div class=\"dataTables_wrapper form-inline edit-element\" data-assembly-id=\"7\" data-order=\"10\" data-wid=\"qJW8199\"\n" +
                "     id=\"table\">\n" +
                "    <table class=\"table table-striped table-hover dataTable table-bordered table-order\">\n" +
                "        <thead>\n" +
                "        <tr>\n" +
                "            <th class=\"center w20\">\n" +
                "                <div class=\"checkbox-table\">\n" +
                "                    <label>\n" +
                "                        <input type=\"checkbox\" class=\"grey selectall\">\n" +
                "                    </label>\n" +
                "                </div>\n" +
                "            </th>\n" +
                "            <th data-order-name=\"nj\">年级</th>\n" +
                "            <th data-order-name=\"sfzh\">身份证号</th>\n" +
                "            <th data-order-name=\"xb\">性别</th>\n" +
                "        </tr>\n" +
                "        </thead>\n" +
                "        <tbody items=\"${resultData}\" var=\"table_object\">\n" +
                "        <tr id=\"tr_${table_object.wid}\">\n" +
                "            <td class=\"center w20\">\n" +
                "                <div class=\"checkbox-table\">\n" +
                "                    <label>\n" +
                "                        <input type=\"checkbox\" name=\"selectNode\" class=\"grey foocheck\" id=\"${table_object.wid}\"\n" +
                "                               value=\"${table_object.wid}\">\n" +
                "                    </label>\n" +
                "                </div>\n" +
                "            </td>\n" +
                "            <td>${table_object.nj}</td>\n" +
                "            <td><a onclick=\"tool.openSubviewByForm(this,'<%=basePath%>/s/system/test/input/${table_object.wid}')\"\n" +
                "                   href=\"javascript:void(0)\">${table_object.sfzh}</a></td>\n" +
                "            <td class=\"select2-code-name\" zdlb=\"xb\">${table_object.xb}</td>\n" +
                "        </tr>\n" +
                "        </tbody>\n" +
                "    </table>\n" +
                "</div>\n" +
                "<div class=\"row data-group\" data-order=\"0\">\n" +
                "    <div id=\"\" class=\"layout col-xs-12\" data-group-name=\"分页\" data-order=\"0\" data-wid=\"aPF6749\" data-assembly-id=\"4\">\n" +
                "        <div class=\"edit-element\" data-assembly-id=\"38\" data-order=\"1\" data-wid=\"VQO5064\">\n" +
                "            <input type=\"hidden\" name=\"pager.currentPageno\" value=\"${pager.currentPageno}\" id=\"yspager_currentPageno\">\n" +
                "            <input type=\"hidden\" name=\"pager.eachPageRows\" value=\"${pager.eachPageRows}\" id=\"eachPageRows\">\n" +
                "            <div class=\"row mt-10\" style=\"margin-top:1%\">\n" +
                "                <tags:pagination paginationsize=\"${pager.eachPageRows}\" page=\"${pager}\"></tags:pagination>\n" +
                "            </div>\n" +
                "        </div>\n" +
                "    </div>\n" +
                "</div>"
            }
        ]
    }, {
        'assemblyName': '文件上传',
        'style': [
            {
                'styleName': '一行一列',
                'showElements': '.style, .group-genus, .order, .element-id, .element-name, .title, .file-size, .file-type, .data-custom-class',
                'template': gridTemple.grid_header_1 + elementTemple.import + gridTemple.grid_footer

            },
            {
                'styleName': '一行二列',
                'showElements': '.style, .group-genus, .order, .element-id, .element-name, .title, .file-size, .file-type, .data-custom-class',
                'template': gridTemple.grid_header_2 + elementTemple.import + gridTemple.grid_footer
            },
            {
                'styleName': '一行三列',
                'showElements': '.style, .group-genus, .order, .element-id, .element-name, .title, .file-size, .file-type, .data-custom-class',
                'template': gridTemple.grid_header_3 + elementTemple.import + gridTemple.grid_footer
            }
        ]
    }, {
        'assemblyName': '可编辑表格',
        'style': [
            {
                'styleName': '默认',
                'showElements': '.group-genus, .order, .element-id, .table-config-edit, .items, .maxDatalength',
                'template': elementTemple.editTable
            }
        ]
    }, {
        'assemblyName': '图片上传',
        'style': [
            {
                'styleName': '默认',
                'showElements': ' .group-genus, .order, .element-id, .element-name, .title,.file-length, .file-width, .file-height, .file-alt ',
                'template': elementTemple.importimg

            }
        ]
    }, {
        'assemblyName': '输入文本',
        'style': [
            {
                'styleName': '默认',
                'showElements': ' .group-genus, .order, .label-box, .in-wb-color',
                'template': '<label class="edit-element" data-assembly-id="_in_data_assembly_id_" data-order="_in_order_" data-wid="_in_wid_" style=\"color:_in_wb_color_\" color=\"_in_wb_color_\">_label_box_</label>'

            }
        ]
    }, {
        'assemblyName': 'input操作记录',
        'style': [
            {
                'styleName': '默认',
                'showElements': '.group-genus, .order, .lcbm, .element-value',
                'template': '<div id="" value="_in_value_" lcbm="_in_lcbm_" data-order="_in_order_" class="row edit-element " data-wid="_in_wid_" data-assembly-id="_in_data_assembly_id_"><div class="col-xs-12">\n' +
                '    <div class="panel input-panel">\n' +
                '        <div class="panel-heading"><h4 class="panel-title">操作记录</h4></div>\n' +
                '        <div class="panel-body">' +
                '<div  id="log_tool">' +
                '<script>$(document).ready(function(){tool.getlog_htm(\'_in_lcbm_\',\'${_in_value_}\',\'log_tool\');});</script>' +
                '</div></div></div></div>\n' +
                '    </div>\n'
            }
        ]
    }, {
        'assemblyName': '文本域',
        'style': [
            {
                'styleName': '一行一列',
                'showElements': '.style, .group-genus, .order, .element-id, .element-name, .title, .element-value,.defaultvalue,  .validate, .is-onlyread, .placeholder, .data-custom-class',
                'template': gridTemple.grid_header_1 + elementTemple.textarea + gridTemple.grid_footer

            },
            {
                'styleName': '一行二列',
                'showElements': '.style, .group-genus, .order, .element-id, .element-name, .title, .element-value,.defaultvalue,  .validate, .is-onlyread, .placeholder, .data-custom-class',
                'template': gridTemple.grid_header_2 + elementTemple.textarea + gridTemple.grid_footer
            },
            {
                'styleName': '一行三列',
                'showElements': '.style, .group-genus, .order, .element-id, .element-name, .title, .element-value,.defaultvalue,  .validate, .is-onlyread, .placeholder, .data-custom-class',
                'template': gridTemple.grid_header_3 + elementTemple.textarea + gridTemple.grid_footer
            }
        ]
    }, {
        'assemblyName': '线条',
        'style': [
            {
                'styleName': '默认',
                'showElements': '.group-genus, .order, .data-custom-class',
                'template': gridTemple.grid_header_4 + '<hr class="dividing-line"/>\n' + gridTemple.grid_footer
            }
        ]
    }, {
        'assemblyName': '输入框',
        'style': [
            {
                'styleName': '默认',
                'showElements': '.group-genus, .element-name, .validate,.defaultvalue, .is-onlyread, .placeholder',
                'template': elementTemple.inputForEditTable
            }
        ]
    }, {
        'assemblyName': '时间插件',
        'style': [
            {
                'styleName': '默认',
                'showElements': '.group-genus, .element-name, .validate,.defaultvalue, .format,.min-date, .max-date',
                'template': elementTemple.datetimepickerForEditTable
            }
        ]
    }, {
        'assemblyName': '字典下拉',
        'style': [
            {
                'styleName': '默认',
                'showElements': '.group-genus, .element-name, .validate,.defaultvalue, .zdlb, .is-onlyread, .isShowSearchBox',
                'template': elementTemple.codeSelectForEditTable
            }
        ]
    }, {
        'assemblyName': '指定表以及字段下拉',
        'style': [
            {
                'styleName': '默认',
                'showElements': '.group-genus, .element-name, .element-value,.defaultvalue, .validate, .table-name, .select-key, .select-text, .field-up-id, .field-up-val, .file-query, .query-val, .data-childselect, .is-onlyread, .more-query-config, .data-cur-val, .data-order-field, .data-order-type, .otherQuery',
                'template': elementTemple.tableSelectForEditTable
            }
        ]
    }, {
        'assemblyName': 'ajax下拉',
        'style': [
            {
                'styleName': '默认',
                'showElements': '.group-genus, .element-name, .validate,.defaultvalue, .is-onlyread',
                'template': elementTemple.ajaxSelectForEditTable
            }
        ]
    }, {
        'assemblyName': 'Tab页',
        'style': [
            {
                'styleName': '默认',
                'showElements': '.group-genus, .order, .nav-tabs-config',
                'template': elementTemple.navTabs
            }
        ]
    }, {
        'assemblyName': 'List汇总信息',
        'style': [
            {
                'styleName': '默认',
                'showElements': '.group-genus, .order, .label-box, .in-color, .is-his',
                'template': elementTemple.alertInfo
            }
        ]
    }, {
        'assemblyName': 'input按钮分组',
        'style': [
            {
                'styleName': '默认',
                'showElements': '.group-genus, .group-name, .order, .element-id ',
                'template': '<div id="_in_id_" class="layout frame-btn-group animated" data-group-name="_in_group_name_" data-order="_in_order_" data-wid="_in_wid_" data-assembly-id="_in_data_assembly_id_"></div>'
            }
        ]
    }, {
        'assemblyName': '打开指定url模态框',
        'style': [
            {
                'styleName': '默认',
                'showElements': '.group-genus, .order, .element-id, .title, .icon, .btn-size, .btn-style, .url, .ssyhqx, .group-jurisdiction, .iframe, .data-custom-class',
                'template': elementTemple.modalButton
            }
        ]
    }, {
        'assemblyName': '粘贴代码',
        'style': [
            {
                'styleName': '默认',
                'showElements': '.group-genus',
                'template': ''
            }
        ]
    }, {
        'assemblyName': '模态框',
        'style': [
            {
                'styleName': '默认',
                'showElements': '.group-name, .element-id, .modal-title',
                'template': '<div id="_in_id_" class="layout modal-container col-xs-12" data-group-name="_in_group_name_" data-order="-1" data-wid="_in_wid_" data-assembly-id="_in_data_assembly_id_"></div>'
            }
        ]
    }, {
        'assemblyName': '自定义模态框',
        'style': [
            {
                'styleName': '默认',
                'showElements': '.group-name, .element-id, .modal-title, .modal-code',
                'template': '<div id="_in_id_" class="edit-element modal-container col-xs-12" data-group-name="_in_group_name_" data-order="-1" data-wid="_in_wid_" data-assembly-id="_in_data_assembly_id_">_in_modalCode_</div>'
            }
        ]
    }, {
        'assemblyName': '打开指定id模态框',
        'style': [
            {
                'styleName': '默认',
                'showElements': '.group-genus, .order, .element-id, .title, .icon, .btn-size, .btn-style, .modal-id, .ssyhqx, .modalTitle, .callback, .data-custom-class',
                'template': elementTemple.modalButtonEl
            }
        ]
    }, {
        'assemblyName': '文本编辑器',
        'style': [
            {
                'styleName': '默认',
                'showElements': '.group-genus, .order, .element-id, .element-name, .title, .element-value, .placeholder',
                'template': elementTemple.ueditor
            }
        ]
    }, {
        'assemblyName': '数据比对 > 输入框',
        'style': [
            {
                'styleName': '一行一列',
                'showElements': '.group-genus, .order, .element-id, .element-name, .title, .element-value, .validate, .placeholder, .dataComparison',
                'template': gridTemple.dataComparisonGridHeader + gridTemple.dataComparisonLable + gridTemple.dataComparison +
                gridTemple.dataComparisonInputHeader + elementTemple.input + gridTemple.dataComparisonInputFooter + gridTemple.dataComparisonGridFooterHR

            }
        ]
    }, {
        'assemblyName': '数据比对 > 文本域',
        'style': [
            {
                'styleName': '一行一列',
                'showElements': '.style, .group-genus, .order, .element-id, .element-name, .title, .element-value, .validate, .placeholder, .dataComparison',
                'template': gridTemple.dataComparisonGridHeader + gridTemple.dataComparisonLable + gridTemple.dataComparison +
                gridTemple.dataComparisonInputHeader + elementTemple.textarea + gridTemple.dataComparisonInputFooter + gridTemple.dataComparisonGridFooterHR

            }
        ]
    }, {
        'assemblyName': '数据比对 > 日期插件',
        'style': [
            {
                'styleName': '一行一列',
                'showElements': '.style, .group-genus, .order, .element-id, .element-name, .title, .element-value, .validate, .format, .dataComparison, .min-date, .max-date',
                'template': gridTemple.dataComparisonGridHeader + gridTemple.dataComparisonLable + gridTemple.dataComparison +
                gridTemple.dataComparisonInputHeader + elementTemple.datetimepicker + gridTemple.dataComparisonInputFooter + gridTemple.dataComparisonGridFooterHR
            }
        ]
    }, {
        'assemblyName': '数据比对 > 隐藏文本框',
        'style': [
            {
                'styleName': '默认',
                'showElements': ' .element-id, .element-name,.element-value, .dataComparison',
                'template': gridTemple.dataComparisonGridHeader + gridTemple.dataComparisonLable + gridTemple.dataComparison +
                gridTemple.dataComparisonInputHeader + '<input title="隐藏文本框" type="hidden"class="edit-element edit-hidden" data-assembly-id="_in_data_assembly_id_" data-wid="_in_wid_" id="_in_id_" name="_in_name_" value="${_in_value_}"/>' + gridTemple.dataComparisonInputFooter + gridTemple.dataComparisonGridFooter
            }
        ]
    }, {
        'assemblyName': '数据比对 > 字典下拉',
        'style': [
            {
                'styleName': '一行一列',
                'showElements': '.style, .group-genus, .order, .element-id, .element-name, .title, .element-value, .validate, .zdlb, .dataComparison',
                'template': gridTemple.dataComparisonGridHeader + gridTemple.dataComparisonLable + gridTemple.dataComparison +
                gridTemple.dataComparisonInputHeader + elementTemple.codeSelect + gridTemple.dataComparisonInputFooter + gridTemple.dataComparisonGridFooterHR
            }
        ]
    }, {
        'assemblyName': '数据比对 > 后台返回list下拉',
        'style': [
            {
                'styleName': '一行一列',
                'showElements': '.style, .group-genus, .order, .element-id, .element-name, .title, .element-value, .validate, .items, .list-key, .list-value, .dataComparison',
                'template': gridTemple.dataComparisonGridHeader + gridTemple.dataComparisonLable + gridTemple.dataComparison +
                gridTemple.dataComparisonInputHeader + elementTemple.codeSelect + gridTemple.dataComparisonInputFooter + gridTemple.dataComparisonGridFooterHR
            }
        ]
    }, {
        'assemblyName': '数据比对 > 指定表以及字段下拉',
        'style': [
            {
                'styleName': '一行一列',
                'showElements': '.style, .group-genus, .order, .element-id, .element-name, .title, .element-value, .validate, .table-name, .select-key, .select-text, .field-up-id, .field-up-val, .file-query, .query-val, .data-childselect, .dataComparison, .data-cur-val, .data-order-field, .data-order-type',
                'template': gridTemple.dataComparisonGridHeader + gridTemple.dataComparisonLable + gridTemple.dataComparison +
                gridTemple.dataComparisonInputHeader + elementTemple.tableSelect + gridTemple.dataComparisonInputFooter + gridTemple.dataComparisonGridFooterHR
            }
        ]
    }, {
        'assemblyName': '数据比对 > ajax下拉',
        'style': [
            {
                'styleName': '一行一列',
                'showElements': '.style, .group-genus, .order, .element-id, .element-name, .title, .element-value, .validate, .url, .dataComparison',
                'template': gridTemple.dataComparisonGridHeader + gridTemple.dataComparisonLable + gridTemple.dataComparison +
                gridTemple.dataComparisonInputHeader + elementTemple.ajaxSelect + gridTemple.dataComparisonInputFooter + gridTemple.dataComparisonGridFooterHR
            }
        ]
    }, {
        'assemblyName': '数据比对 > 带搜索的ajax下拉',
        'style': [
            {
                'styleName': '一行一列',
                'showElements': '.style, .group-genus, .order, .element-id, .element-name, .title, .element-value, .validate, .url, .default-text, .dataComparison',
                'template': gridTemple.dataComparisonGridHeader + gridTemple.dataComparisonLable + gridTemple.dataComparison +
                gridTemple.dataComparisonInputHeader + elementTemple.searchSelect + gridTemple.dataComparisonInputFooter + gridTemple.dataComparisonGridFooterHR
            }
        ]
    }, {
        'assemblyName': '数据比对 > 后台返回list多选框',
        'style': [
            {
                'styleName': '一行一列',
                'showElements': '.style, .group-genus, .order, .element-name, .title, .element-value, .validate, .items, .list-key, .list-value, .dataComparison',
                'template': gridTemple.dataComparisonGridHeader + gridTemple.dataComparisonLable + gridTemple.dataComparison +
                gridTemple.dataComparisonInputHeader + elementTemple.listCheckbox + gridTemple.dataComparisonInputFooter + gridTemple.dataComparisonGridFooterHR
            }
        ]
    }, {
        'assemblyName': '数据比对 > 后台返回list单选框',
        'style': [
            {
                'styleName': '一行一列',
                'showElements': '.style, .group-genus, .order, .element-name, .title, .element-value, .validate, .items, .list-key, .list-value, .dataComparison',
                'template': gridTemple.dataComparisonGridHeader + gridTemple.dataComparisonLable + gridTemple.dataComparison +
                gridTemple.dataComparisonInputHeader + elementTemple.listRadio + gridTemple.dataComparisonInputFooter + gridTemple.dataComparisonGridFooterHR
            }
        ]
    }, {
        'assemblyName': '多图片上传',
        'style': [
            {
                'styleName': '一行一列',
                'showElements': '.group-genus, .order, .items, .title, .file-length, .file-size, .data-custom-class',
                'template': gridTemple.grid_header_1 + elementTemple.imagesUpload + gridTemple.grid_footer
            }
        ]
    }, {
        'assemblyName': '多附件上传',
        'style': [
            {
                'styleName': '一行一列',
                'showElements': '.group-genus, .order, .items, .title, .file-type, .file-length, .file-size, .data-custom-class',
                'template': gridTemple.grid_header_1 + elementTemple.filesUpload + gridTemple.grid_footer
            }
        ]
    }, {
        'assemblyName': '向导式表单',
        'style': [
            {
                'styleName': '向导式表单',
                'showElements': '.style, .group-genus, .order, .element-id, .wizard-config, .finish-fun',
                'template': elementTemple.wizard
            }
        ]
    }, {
        'assemblyName': '静态Tab页',
        'style': [
            {
                'styleName': '向导式表单',
                'showElements': '.group-genus, .order, .static-nav-tabs-config',
                'template': elementTemple.navTabs
            }
        ]
    }, {
        'assemblyName': '数字范围',
        'style': [
            {
                'styleName': '一行一列',
                'showElements': '.style, .group-genus, .order, .element-id, .element-name, .title, .element-value, .validate,.is-onlyread, .placeholder, .more-query-config, .data-custom-class',
                'template': gridTemple.grid_header_1 + elementTemple.inputRange + gridTemple.grid_footer
            },
            {
                'styleName': '一行二列',
                'showElements': '.style, .group-genus, .order, .element-id, .element-name, .title, .element-value, .validate,.is-onlyread, .placeholder, .more-query-config, .data-custom-class',
                'template': gridTemple.grid_header_2 + elementTemple.inputRange + gridTemple.grid_footer
            },
            {
                'styleName': '一行三列',
                'showElements': '.style, .group-genus, .order, .element-id, .element-name, .title, .element-value, .validate,.is-onlyread, .placeholder, .more-query-config, .data-custom-class',
                'template': gridTemple.grid_header_3 + elementTemple.inputRange + gridTemple.grid_footer
            }
        ]
    }, {
        'assemblyName': '日期范围',
        'style': [
            {
                'styleName': '一行一列',
                'showElements': '.style, .group-genus, .order, .element-id, .element-name, .title, .element-value, .validate, .format, .more-query-config, .data-custom-class',
                'template': gridTemple.grid_header_1 + elementTemple.datetimepickerRange + gridTemple.grid_footer
            },
            {
                'styleName': '一行二列',
                'showElements': '.style, .group-genus, .order, .element-id, .element-name, .title, .element-value, .validate, .format, .more-query-config, .data-custom-class',
                'template': gridTemple.grid_header_2 + elementTemple.datetimepickerRange + gridTemple.grid_footer
            },
            {
                'styleName': '一行三列',
                'showElements': '.style, .group-genus, .order, .element-id, .element-name, .title, .element-value, .validate, .format, .more-query-config, .data-custom-class',
                'template': gridTemple.grid_header_3 + elementTemple.datetimepickerRange + gridTemple.grid_footer
            }

        ]
    }, {
        'assemblyName': '显示更多查询条件',
        'style': [
            {
                'styleName': '默认',
                'showElements': '.group-genus, .order, .element-id, .title, .icon, .event-click, .btn-size, .btn-style, .data-custom-class',
                'template': elementTemple.button
            }
        ]
    }, {
        'assemblyName': '身份证上传',
        'style': [
            {
                'styleName': '一行一列',
                'showElements': '.style, .group-genus, .order, .title, .idcard-posivtive, .idcard-other, .data-custom-class',
                'template': gridTemple.grid_header_1 + elementTemple.idcard + gridTemple.grid_footer,
            },
            {
                'styleName': '一行二列',
                'showElements': '.style, .group-genus, .order, .title, .idcard-posivtive, .idcard-other, .data-custom-class',
                'template': gridTemple.grid_header_2 + elementTemple.idcard + gridTemple.grid_footer
            },
            {
                'styleName': '一行三列',
                'showElements': '.style, .group-genus, .order, .title, .idcard-posivtive, .idcard-other, .data-custom-class',
                'template': gridTemple.grid_header_3 + elementTemple.idcard + gridTemple.grid_footer
            }
        ]
    }, {
        'assemblyName': '多视频上传',
        'style': [
            {
                'styleName': '一行一列',
                'showElements': '.group-genus, .order, .items, .title, .file-length, .file-size, .data-custom-class',
                'template': gridTemple.grid_header_1 + elementTemple.videoUpload + gridTemple.grid_footer
            }
        ]
    }, {
        'assemblyName': '显示文本',
        'style': [
            {
                'styleName': '一行一列',
                'showElements': '.style, .group-genus, .order, .title, .element-value, .data-custom-class',
                'template': gridTemple.grid_header_1 + elementTemple.text + gridTemple.grid_footer

            },
            {
                'styleName': '一行二列',
                'showElements': '.style, .group-genus, .order, .title, .element-value, .data-custom-class',
                'template': gridTemple.grid_header_2 + elementTemple.text + gridTemple.grid_footer
            },
            {
                'styleName': '一行三列',
                'showElements': '.style, .group-genus, .order, .title, .element-value, .data-custom-class',
                'template': gridTemple.grid_header_3 + elementTemple.text + gridTemple.grid_footer
            }
        ]
    }, {
        'assemblyName': '图片截取上传',
        'style': [
            {
                'styleName': '一行一列',
                'showElements': '.style, .group-genus, .order, .title, .element-value, .aspectRatio, .callback, .data-custom-class',
                'template': gridTemple.grid_header_1 + elementTemple.croppre + gridTemple.grid_footer

            },
            {
                'styleName': '一行二列',
                'showElements': '.style, .group-genus, .order, .title, .element-value, .aspectRatio, .callback, .data-custom-class',
                'template': gridTemple.grid_header_2 + elementTemple.croppre + gridTemple.grid_footer
            },
            {
                'styleName': '一行三列',
                'showElements': '.style, .group-genus, .order, .title, .element-value, .aspectRatio, .callback, .data-custom-class',
                'template': gridTemple.grid_header_3 + elementTemple.croppre + gridTemple.grid_footer
            }, {
                'styleName': '无栅格',
                'showElements': '.style, .group-genus, .order, .title, .element-value, .aspectRatio, .callback',
                'template': '<div class="edit-element corppre-default" data-assembly-id="_in_data_assembly_id_" data-order="_in_order_" data-wid="_in_wid_">' + elementTemple.croppre + '</div>'

            }
        ]
    }, {
        'assemblyName': '静态图片',
        'style': [
            {
                'styleName': '一行一列',
                'showElements': '.style, .group-genus, .order, .element-id,.file-width, .file-height, .element-name, .src',
                'template': '<div class="col-xs-12 edit-element" data-assembly-id="_in_data_assembly_id_" data-order="_in_order_" data-wid="_in_wid_">'
                + elementTemple.staticimg + '</div>'

            },
            {
                'styleName': '一行二列',
                'showElements': '.style, .group-genus, .order, .element-id,.file-width, .file-height, .element-name, .src',
                'template': '<div class="col-xs-12 edit-element" data-assembly-id="_in_data_assembly_id_" data-order="_in_order_" data-wid="_in_wid_">'
                + elementTemple.staticimg + '</div>'
            },
            {
                'styleName': '一行三列',
                'showElements': '.style, .group-genus, .order, .element-id,.file-width, .file-height, .element-name, .src',
                'template': '<div class="col-xs-12 edit-element" data-assembly-id="_in_data_assembly_id_" data-order="_in_order_" data-wid="_in_wid_">'
                + elementTemple.staticimg + '</div>'
            }
        ]
    }, {
        'assemblyName': 'ztree',
        'style': [
            {
                'styleName': '默认',
                'showElements': '.group-genus, .order, .callback, .setting, .ajax-url',
                'template': '<div class="edit-element" data-assembly-id="_in_data_assembly_id_" data-order="_in_order_" data-wid="_in_wid_">'
                + elementTemple.ztree + '</div>'

            }
        ]
    }, {
        'assemblyName': '星级评分',
        'style': [
            {
                'styleName': '一行一列',
                'showElements': '.style,.group-genus,.order,.title,.element-id, .data-custom-class,.ratyCount',
                'template': gridTemple.grid_header_1 + elementTemple.RatyStar + gridTemple.grid_footer
            },
            {
                'styleName': '一行二列',
                'showElements': '.style,.group-genus,.order,.title,.element-id, .data-custom-class,.ratyCount',
                'template': gridTemple.grid_header_2 + elementTemple.RatyStar + gridTemple.grid_footer
            },
            {
                'styleName': '一行三列',
                'showElements': '.style,.group-genus,.order,.title,.element-id, .data-custom-class,.ratyCount',
                'template': gridTemple.grid_header_3 + elementTemple.RatyStar + gridTemple.grid_footer
            }
        ]
    }, {
        'assemblyName': '文本域',
        'style': [
            {
                'styleName': '默认',
                'showElements': '.group-genus, .element-name, .validate, .is-onlyread, .placeholder',
                'template': elementTemple.textareaForEditTable
            }
        ]
    }, {
        'assemblyName': '导入jsp页面',
        'style': [
            {
                'styleName': '默认',
                'showElements': '.group-genus, .jsppath ,.order',
                'template': elementTemple.importjsp
            }
        ]
    }, {
        'assemblyName': '图表',
        'style': [
            {
                'styleName': '默认',
                'showElements': '.group-genus, .order, .ajax-url, .ajax-data, .element-id',
                'template': elementTemple.chart
            }
        ]
    },{
        'assemblyName': '导入Excel页面',
        'style': [
            {
                'styleName': '默认',
                'showElements': '.group-genus, .group-name, .order, .width, .element-id,.excel ',
                'template':elementTemple.importExcel
            }
        ]
    },{
        'assemblyName': 'Excel输入框',
        'style': [
            {
                'styleName': '默认',
                'showElements': ' .group-genus,.element-id,.order, .element-name,.element-value',
                'template':elementTemple.excelInput
            }
        ]
    },{
        'assemblyName': '存为书签',
        'style': [
            {
                'styleName': '默认',
                'showElements': '.group-genus, .order, .element-id, .title, .icon, .event-click, .btn-size, .btn-style, .data-custom-class',
                'template': elementTemple.button
            }
        ]
    },{
    	 'assemblyName': '按钮下拉',
         'style': [
             {
                 'styleName': '默认',
                 'showElements': '.group-genus, .order, .element-id, .title, .event-click, .btn-size, .btn-style,.select-btn-item',
                 'template': elementTemple.selectbutton
             }
         ]
    },{
        'assemblyName': '后台返回list下拉多选',
        'style': [
            {
                'styleName': '一行一列',
                'showElements': '.style, .group-genus, .order, .element-id, .element-name, .title, .element-value,.defaultvalue, .validate, .items, .list-key, .list-value, .is-onlyread, .more-query-config, .is-ShowSearchBox, .data-custom-class',
                'template': gridTemple.grid_header_1 + elementTemple.listSelect + gridTemple.grid_footer,
                'templatedisabled': gridTemple.grid_header_1 + elementTemple.listSelect + elementTemple.inputselecthidden + gridTemple.grid_footer
            },
            {
                'styleName': '一行二列',
                'showElements': '.style, .group-genus, .order, .element-id, .element-name, .title, .element-value,.defaultvalue, .validate, .items, .list-key, .list-value, .is-onlyread, .more-query-config, .is-ShowSearchBox, .data-custom-class',
                'template': gridTemple.grid_header_2 + elementTemple.listSelect + gridTemple.grid_footer,
                'templatedisabled': gridTemple.grid_header_2 + elementTemple.listSelect + elementTemple.inputselecthidden + gridTemple.grid_footer
            },
            {
                'styleName': '一行三列',
                'showElements': '.style, .group-genus, .order, .element-id, .element-name, .title, .element-value,.defaultvalue, .validate, .items, .list-key, .list-value, .is-onlyread, .more-query-config, .is-ShowSearchBox, .data-custom-class',
                'template': gridTemple.grid_header_3 + elementTemple.listSelect + gridTemple.grid_footer,
                'templatedisabled': gridTemple.grid_header_3 + elementTemple.listSelect + elementTemple.inputselecthidden + gridTemple.grid_footer
            }
        ]
    }
]