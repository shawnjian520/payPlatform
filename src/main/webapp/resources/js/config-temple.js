/**
 * Created by tengchong on 16/5/5.
 * 注: 所有元素按照降序排列
 */
/**
 * 获取页面
 * @returns string
 */
function getCode() {
    if (subPage.code != null && subPage.code != '') {
        return subPage.code;
    } else if (subPage.codeMirror != null) {
        return subPage.codeMirror.getValue();
    } else return '';
}
/**
 * 设置代码
 * @param newCode 新代码
 */
function setCode(newCode) {
    subPage.code = newCode;
    newCode = newCode.replaceAll('jundukeji', 'select');
    newCode = newCode.replaceAll('junducif', 'c:if');
    if (subPage.codeMirror != null) {
        subPage.codeMirror.setValue(newCode);
    }
    $('#preview').html(newCode);
    $('#preview').find('button,a').removeAttr('onclick');
}
/**
 * 获取配置信息
 * @returns {{}}
 */
function getConfig(index) {
    var object = {};
    object.index = index;
    object.maxCount = getMaxCount();
    object.excelhtml = getVal("#excelhtml");
    object.ratyCount = getVal("#ratyCount");
    object.style = getVal('#style');
    object.groupGenus = getVal('#group-genus');
    object.groupName = getVal('#group-name');
    object.title = getVal('#title');
    object.order = getVal('#order');
    object.class = getVal('#class');
    object.id = getVal('#element-id');
    if (index == '73' || index == '72' || index == '80') {
        object.id = getNewElementId();
    }
    if (object.id == '' || object.id == null) {
        object.id = getVal('#element-id-1');
    }
    object.name = getVal('#element-name');
    object.method = getVal('#method');
    object.value = getVal('#element-value');
    object.defaultvalue = getVal('#element-defaultvalue');
    object.type = getVal('#element-type');
    object.tableName = getVal('#table-name');
    object.selectKey = getVal('#select-key');
    object.selectText = getVal('#select-text');
    object.fieldUpId = getVal('#field-up-id');
    object.fieldUpVal = getVal('#field-up-val');
    object.fileQuery = getVal('#file-query');
    object.queryVal = getVal('#query-val');
    object.dataChildselect = getVal('#data-childselect');
    object.selectList = getVal('#select-list');
    object.listKey = getVal('#list-key');
    object.listValue = getVal('#list-value');
    object.format = getVal('#format');
    object.zdlb = getVal('#zdlb');
    object.width = getVal('#width');
    object.items = getVal('#items');
    object.list_key = getVal('#list-key');
    object.list_value = getVal('#list-value');
    object.table_name = getVal('#table-name');
    object.select_key = getVal('#select-key');
    object.select_text = getVal('#select-text');
    object.field_up_id = getVal('#field-up-id');
    object.field_up_val = getVal('#field-up-val');
    object.file_query = getVal('#file-query');
    object.query_val = getVal('#query-val');
    object.data_childselect = getVal('#data-childselect');
    object.url = getVal('#url');
    object.src = getVal('#src');
    object.default_text = getVal('#default-text');
    object.icon = getVal('#icon');
    object.event_click = getVal('#event-click');
    object.btn_style = getVal('#btn-style');
    object.btn_size = getVal('#btn-size');
    object.if_test = getVal('#if-test');
    object.checkbox_id = getVal('#checkbox-id');
    object.checkbox_url = getVal('#checkbox-url');
    object.file_size = getVal('#file-size');
    object.file_length = getVal('#file-length');
  /*  object.file_type = getVal('#file-type');*/
    object.file_type=getFileType();
    object.file_name = getVal('#file-name');
    object.file_value = getVal('#file-value');
    object.file_width = getVal('#file-width');
    object.file_height = getVal('#file-height');
    object.file_alt = getVal('#file-alt');
    object.label_box = getVal('#label-box');
    object.in_color = getVal('#in-color');
    object.in_wb_color = getVal('#in-wb-color');
    object.tit_remind = getVal('#tit-remind');
    object.placeholder = getVal('#placeholder');
    object.is_onlyread = getVal('#is-onlyread');
    object.is_showSearchBox = getVal('#is-ShowSearchBox');
    object.is_Showclear = getVal('#is-Showclear');
    object.ssyhqx = getVal('#ssyhqx');
    object.jsppath = getVal('#jsppath');
    object.modalTitle = getVal('#modalTitle');
    object.modalId = getVal('#modal-id');
    object.modalCode = getVal('#modal-code');
    object.callback = getVal('#callback');
    object.moreQuery = getVal('#more-query');
    object.dataComparison = getVal('#dataComparison');
    object.finishFun = getVal('#finish-fun');
    object.idcardPosivtive = getVal('#idcard-posivtive');
    object.idcardOther = getVal('#idcard-other');
    object.aspectRatio = getVal('#aspectRatio');
    object.setting = getVal('#setting');
    object.ajaxUrl = getVal('#ajax-url');
    object.ajaxData = getVal('#ajax-data');
    object.curVal = getVal('#data-cur-val');
    object.orderField = getVal('#data-order-field');
    object.orderType = getVal('#data-order-type');
    object.groupJurisdiction = getVal('#group-jurisdiction');
    object.maxDate = getVal('#max-date');
    object.minDate = getVal('#min-date');
    object.iframe = getVal('#iframe');
    object.isHis = getVal('#is-his');
    object.maxDatalength = getVal('#maxDatalength');
    object.otherQuery = getVal('#otherQuery');
    object.customClass = getVal('#data-custom-class');
    object.ischecekAll=getVal('#is-checekAll');
    if (object.ischecekAll=='checkAll') {
    	object.ischecekAll='  <label data-items="${_in_items_}" data-text="_in_list_value_" data-value="_in_value_" class="checkbox-inline"><input type="checkbox" name="" class="grey checkAll">全选 </label>\n';
	}else{
		object.ischecekAll='';
	}
    if (object.ssyhqx == null) {
        object.ssyhqx = '';
    }
    if (object.groupJurisdiction == null) {
        object.groupJurisdictions = '';
    }
    if (object.is_showSearchBox == 'true') {
        object.is_showSearchBox = 'data-show-searchbox="true"';
    } else {
        object.is_showSearchBox = '';
    }
    if (object.is_Showclear == 'true') {
        object.is_Showclear = 'true';
    } else {
        object.is_Showclear = 'false';
    }
    

    if (object.is_onlyread == 'readonly') {
        if (index == '11' || index == '12' || index == '13' || index == '14' || index == '16' || index == '17')
            object.is_onlyread = 'disabled="disabled"';
        else
            object.is_onlyread = 'readonly="readonly"';
    }
    object.lcbm = getVal('#lcbm');
    if (object.is_onlyread == 'readonly') {
        if (index == '11' || index == '12' || index == '13' || index == '14' || index == '16' || index == '17')
            object.is_onlyread = 'disabled="disabled"';
        else
            object.is_onlyread = 'readonly="readonly"';
    }
    object.validate = getValidate();
    if (object.validate != null && object.validate != '' && object.validate.indexOf('required') != -1) {
        object.required = "required";
    } else {
        object.required = "";
    }
    object.groupType = $('[data-group-name="' + object.groupGenus + '"]').attr('data-group-type');
    //console.log('容器类型' + object.groupType);
    if (object.groupType == 'table-td') {//如果所选分组是可编辑表格中的td
        object.items = $('[data-group-name="' + object.groupGenus + '"]').parents('tbody').attr('items');
        object.items = object.items.replaceAll('[$]{', '').replaceAll('}', '')
        object.value = object.name;
        object.name = object.items + '[${sta.index}].' + object.name;
        object.id = object.name;
        // console.log(object.name);
    }
    if (object.is_onlyread == 'disabled="disabled"' && (index == '11' || index == '12' || index == '13' || index == '14' || index == '16' || index == '17')) {
        object.template = ass_object.style[object.style].templatedisabled;
    } else {
        object.template = ass_object.style[object.style].template;
    }
    return object;
}

function getSelectBtnConfig(){
	var object=[];
	  var configs = getParentElement('#select-btn-item').find('.form-group');
	  if (configs.length > 0) {
		  for (var i = 0; i < configs.length; i++) {
		  var temp={};
		  temp.btntitle=$(configs[i]).find('.selectbtn-title').val();
		  if(temp.btntitle!= null && temp.btntitle != ''){
			 temp.btnmethod= $(configs[i]).find('.selectbtn-method').val();
		  }
		  object[i] = temp;
	  }
	  }
	  return object;
}

/**
 * 获取表格配置
 * @returns {Array}
 */
function getTableConfig() {
    var object = [];
    var configs = getParentElement('#table-config').find('.form-group');
    if (configs.length > 0) {
        for (var i = 0; i < configs.length; i++) {
            var temp = {};
            temp.tableTitle = $(configs[i]).find('.table-title').val();
            if (temp.tableTitle != null && temp.tableTitle != '') {
                temp.tableSubTitle = $(configs[i]).find('.table-subtitle').val();
                temp.tableContent = $(configs[i]).find('.table-content').val();
                temp.tableContentLength = $(configs[i]).find('.table-content-length').val();
                temp.tableLinkPath = $(configs[i]).find('.link-path').val();
                temp.tableZdlb = $(configs[i]).find('.table-zdlb').val();
                temp.tableEvent = $(configs[i]).find('.table-event').val();
                temp.tableInput = $(configs[i]).find('[name="table-input"]:checked').val();
                temp.tableif = $(configs[i]).find('.table-if').val();
                temp.tableGroup = $(configs[i]).find('.table-group').val();
                temp.tableclass = $(configs[i]).find('.table-class').val();

                try {
                    temp.order = Number($(configs[i]).find('.table-order').val());
                } catch (e) {
                    temp.order = 0;
                }
                object[i] = temp;
            }
        }
    }
    return orderList(object);
}




/**
 * 获取表格是否有二级标题
 * @returns {Array}
 */
function getTableHasSubTitle(tableConfig) {
    for (var i = 0; i < tableConfig.length; i++) {
        if (tableConfig[i].tableSubTitle != null && tableConfig[i].tableSubTitle != '') {
            return true;
        }
    }

    return false;
}
/**
 * 获取可编辑表格配置
 * @returns {Array}
 */
function getNavTabsConfig() {
    var object = [];
    var configs = getParentElement('.nav-tabs-config').find('.form-group');
    if (configs.length > 0) {
        for (var i = 0; i < configs.length; i++) {
            var temp = {};
            temp.navTabsTitle = $(configs[i]).find('.nav-tabs-title').val();
            temp.navTabsUrl = $(configs[i]).find('.nav-tabs-url').val();
            try {
                temp.order = Number($(configs[i]).find('.nav-tabs-order').val());
            } catch (e) {
                temp.order = 0;
            }
            if (temp.navTabsTitle != null && temp.navTabsTitle != '') {
                object[i] = temp;
            }
        }
    }
    return orderList(object);
}
/**
 * 获取表格操作按钮
 * @returns {Array}
 */
function getTableButtonConfig() {
    var object = [];
    var configs = getParentElement('#button-config').find('.form-group');
    if (configs.length > 0) {
        for (var i = 0; i < configs.length; i++) {
            var temp = {};
            temp.content = $(configs[i]).find('.btn-content').val();
            temp.title = $(configs[i]).find('.btn-title').val();
            temp.style = $(configs[i]).find('.table-btn-style').val();
            temp.event = $(configs[i]).find('.btn-event').val();
            temp.tabName = $(configs[i]).find('.btn-tab-name').val();
            try {
                temp.order = Number($(configs[i]).find('.btn-orderr').val());
            } catch (e) {
                temp.order = 0;
            }
            if (temp.title != null && temp.title != '') {
                object[i] = temp;
            }
        }
    }
    return orderList(object);
}
/**
 * 获取可编辑表格配置
 * @returns {Array}
 */
function getEditTableConfig() {
    var object = [];
    var configs = getParentElement('.table-config-edit').find('.form-group');
    if (configs.length > 0) {
        for (var i = 0; i < configs.length; i++) {
            var temp = {};
            temp.tableTitle = $(configs[i]).find('.table-title').val();
            temp.tableElement = $(configs[i]).find('.table-element').val();
            try {
                temp.order = Number($(configs[i]).find('.table-order').val());
            } catch (e) {
                temp.order = 0;
            }
            if (temp.tableTitle != null && temp.tableTitle != '') {
                object[i] = temp;
            }

        }
    }
    return orderList(object);
}
/**
 * 获取静态Tab页配置
 * @returns {Array}
 */
function getStaticNavConfig() {
    var object = [];
    var configs = getParentElement('.static-nav-tabs-config').find('.form-group');
    if (configs.length > 0) {
        for (var i = 0; i < configs.length; i++) {
            var temp = {};
            var temp = {};
            temp.navTabsTitle = $(configs[i]).find('.nav-tabs-title').val();
            temp.navTabsUrl = $(configs[i]).find('.nav-tabs-url').val();
            temp.code = $(configs[i]).find('.nav-tabs-code').val();
            try {
                temp.order = Number($(configs[i]).find('.nav-tabs-order').val());
            } catch (e) {
                temp.order = 0;
            }
            if (temp.navTabsTitle != null && temp.navTabsTitle != '') {
                object[i] = temp;
            }
        }
    }
    return orderList(object);
}
/**
 * 获取向导式表单配置
 * @returns {Array}
 */
function getWizardConfig() {
    var object = [];
    var configs = getParentElement('.wizard-config').find('.form-group');
    if (configs.length > 0) {
        for (var i = 0; i < configs.length; i++) {
            var temp = {};
            temp.title = $(configs[i]).find('.wizard-title').val();
            if (temp.title != null && temp.title != '') {
                temp.validateSteps = $(configs[i]).find('.wizard-validateSteps-fun').val();
                temp.showStep = $(configs[i]).find('.wizard-showStep-fun').val();
                temp.code = $(configs[i]).find('.wizard-code').val();
                try {
                    temp.order = Number($(configs[i]).find('.wizard-order').val());
                } catch (e) {
                    temp.order = 0;
                }
                object[i] = temp;
            }
        }
    }
    return orderList(object);
}
/**
 * 根据排序值排序数组
 * @param object
 * @returns {Array}
 */
function orderList(object) {
    //根据排序值排序
    var temp = object;
    object = [];
    var length = temp.length;
    var maxOrderConfigIndex = 0; //最大配置在数组中下标
    var maxOrder = 0;
    for (var i = 0; i < length; i++) {
        maxOrderConfigIndex = 0;
        maxOrder = 0;
        for (var j = 0; j < temp.length; j++) {
            if (temp[j].order > maxOrder) {
                maxOrder = temp[j].order;
                maxOrderConfigIndex = j;
            }
        }
        object[i] = temp[maxOrderConfigIndex];
        temp.remove(maxOrderConfigIndex);
        //console.log('最大排序: ' + maxOrder + ' 剩余configs.length' + temp.length);
    }
    return object;

}

Array.prototype.remove = function (dx) {
    if (isNaN(dx) || dx > this.length) {
        return false;
    }
    for (var i = 0, n = 0; i < this.length; i++) {
        if (this[i] != this[dx]) {
            this[n++] = this[i]
        }
    }
    this.length -= 1
}
/**
 * 替换基本信息
 * @param temple 模板
 * @param config 配置信息
 * return temple
 */
function replaceBasicInformation(temple, config, index, datawid) {
    // debugger;
    if (index == '16' || index == '17') { //如果单选/多选,移除for
        temple = temple.replaceAll('for="_in_id_"', '');
    }
    temple = temple.replaceAll('_textarea_count_', config.maxCount);
    temple=temple.replaceAll('_is_checkAll',config.ischecekAll);
    temple = temple.replaceAll('_in_id_', config.id);
    if(config.ratyCount==null||config.ratyCount==''){
    	temple = temple.replaceAll('_scoreval_',0);
    }else{
    	temple = temple.replaceAll('_scoreval_', config.ratyCount);
    }
    if(index=='12'){
    	temple=temple.replaceAll('_select_type_', "select2-auto");
    	temple=temple.replaceAll('_slect_m_', "");
    }
    if(index=='93'){
    	temple=temple.replaceAll('_select_type_', "selectpicker");
    	temple=temple.replaceAll('_slect_m_', "multiple");
    }
    
    temple = temple.replaceAll('_in_defaultvalue_', config.defaultvalue);
    temple = temple.replaceAll('_in_name_', config.name);
    temple = temple.replaceAll('_in_src_', config.src);
    temple = temple.replaceAll('_in_data_assembly_id_', index);
    temple = temple.replaceAll('_in_excel_html', config.excelhtml);
    temple = temple.replaceAll('_in_class_', config.class);
    temple = temple.replaceAll('_in_group_name_', config.groupName);
    temple = temple.replaceAll('_in_order_', config.order);
    temple = temple.replaceAll('_in_title_', config.title);
    temple = temple.replaceAll('_in_method_', config.method);
    temple = temple.replaceAll('_in_value_', config.value);
    temple = temple.replaceAll('_in_format_', config.format);
    temple = temple.replaceAll('_in_validate_', config.validate);
    temple = temple.replaceAll('_in_width_', config.width);
    temple = temple.replaceAll('_in_zdlb_', config.zdlb);
    temple = temple.replaceAll('_in_wid_', datawid);
    temple = temple.replaceAll('_if_test', config.if_test);
    temple = temple.replaceAll('_tit_remind_', config.tit_remind);
    temple = temple.replaceAll('_is_onlyread_', config.is_onlyread);
    temple = temple.replaceAll('_data-show-searchbox_', config.is_showSearchBox);
    if(config.is_Showclear=='false'){
    	 temple = temple.replaceAll('fa fa-times-circle',"");
    }
    temple = temple.replaceAll('_in_lcbm_', config.lcbm);
    temple = temple.replaceAll('_in_required_', config.required);
    temple = temple.replaceAll('_in_placeholder_', config.placeholder);
    temple = temple.replaceAll('_in_jsp_path_', config.jsppath);
    temple = temple.replaceAll('_in_ssyhqx_', config.ssyhqx);
    //后台返回list下拉
    temple = temple.replaceAll('_in_items_', config.items);
    temple = temple.replaceAll('_in_list_key_', config.list_key);
    temple = temple.replaceAll('_in_list_value_', config.list_value);
    //指定表以及字段下拉
    temple = temple.replaceAll('_in_table_name_', config.table_name);
    temple = temple.replaceAll('_in_select_key_', config.select_key);
    temple = temple.replaceAll('_in_select_text_', config.select_text);
    temple = temple.replaceAll('_in_field_up_id_', config.field_up_id);
    temple = temple.replaceAll('_in_field_up_val_', config.field_up_val);
    temple = temple.replaceAll('_in_file_query_', config.file_query);
    temple = temple.replaceAll('_in_query_val_', config.query_val);
    temple = temple.replaceAll('_in_data_childselect_', config.data_childselect);
    temple = temple.replaceAll('_in_data_cur_val_', config.curVal);
    //ajax-select
    temple = temple.replaceAll('_in_select_url_', config.url);
    //智能下拉
    temple = temple.replaceAll('_in_default_text_', config.default_text);
    //按钮
    temple = temple.replaceAll('_in_btn_class_', config.btn_style);
    temple = temple.replaceAll('_in_iframe_', config.iframe);
    temple = temple.replaceAll('_in_btn_size_', config.btn_size);
    temple = temple.replaceAll('_in_onclick_', config.event_click);
    temple = temple.replaceAll('_in_icon_class_', config.icon);
    temple = temple.replaceAll('_in_checkbox_id_', config.checkbox_id);
    if (config.checkbox_url != '') temple = temple.replaceAll('_in_checkbox_url_', 'tool.loadFormByTr(this,\'<%=basePath %>/s/' + config.checkbox_url + '\')');
    else temple = temple.replaceAll('_in_checkbox_url_', '');

    //文件上传
    temple = temple.replaceAll('_file_type_', config.file_type);
    temple = temple.replaceAll('_file_size_', config.file_size);
    temple = temple.replaceAll('_file_length_', config.file_length);
    temple = temple.replaceAll('_file_name_', config.file_name);
    temple = temple.replaceAll('_file_value_', config.file_value);
    temple = temple.replaceAll('_file_width_', config.file_width);
    temple = temple.replaceAll('_file_alt_', config.file_alt);
    //模态框
    temple = temple.replaceAll('_in_modal_title_', config.modalTitle);
    temple = temple.replaceAll('_in_modal_id_', config.modalId);
    //输入文本
    temple = temple.replaceAll('_label_box_', config.label_box);
    temple = temple.replaceAll('_in_color_', config.in_color);
    temple = temple.replaceAll('_in_wb_color_', config.in_wb_color);
    temple = temple.replaceAll('_in_modalCode_', config.modalCode);
    temple = temple.replaceAll('_in_callback_', config.callback);
    temple = temple.replaceAll('_in_finish_fun_', config.finishFun);
    temple = temple.replaceAll('_in_data_order_field_', config.orderField);
    temple = temple.replaceAll('_in_data_order_type_', config.orderType);
    temple = temple.replaceAll('_in_group_jurisdiction_', config.groupJurisdiction);
    temple = temple.replaceAll('_file_height_', config.file_height);
    temple = temple.replaceAll('_in_is_his_', config.isHis);
    temple = temple.replaceAll('_in_custom_class_', config.customClass);
    temple = temple.replaceAll('_in_maxDatalength_', config.maxDatalength);
    temple = temple.replaceAll('_in_otherQuery_', config.otherQuery);

    if (!isBlank(config.moreQuery)) {
        temple = $(temple).addClass('more-query').prop('outerHTML');
    }
    if (index == '82') {
        temple = temple.replaceAll('_in_croppre_aspectRatio_', config.aspectRatio);
        temple = temple.replaceAll('_in_croppre_id_', getNewElementId());
    }
    if (index == '79') {
        temple = temple.replaceAll('_in_idcard_posivtiveInputName_', config.idcardPosivtive);
        temple = temple.replaceAll('_in_idcard_otherInputName_', config.idcardOther);
        temple = temple.replaceAll('_in_idcard_posivtive_', getNewElementId());
        temple = temple.replaceAll('_in_idcard_posivtiveInputId_', getNewElementId());
        temple = temple.replaceAll('_in_idcard_other_', getNewElementId());
        temple = temple.replaceAll('_in_idcard_otherInputId_', getNewElementId());
    }
    if (index == '84') {
        temple = temple.replaceAll('_in_ajax_url_', config.ajaxUrl);
        temple = temple.replaceAll('_in_setting_', config.setting);
        temple = temple.replaceAll('_in_ztree_id_', getNewElementId());
    }
    if (index == '88') {
        temple = temple.replaceAll('_in_ajax_url_', config.ajaxUrl);
        temple = temple.replaceAll('_in_ajax_data_', config.ajaxData);
    }
    temple = temple.replaceAll('_in_data_maxDate_', config.maxDate);
    temple = temple.replaceAll('_in_data_minDate_', config.minDate);
    
    
    //下拉按钮组
    if(index=='92'){
    	var selectbtnConfig=getSelectBtnConfig();
    	var temp='';
    	if(selectbtnConfig.length>0){
    		  for (var i = 0; i < selectbtnConfig.length; i++) {
    			  if(!isBlank(selectbtnConfig[i].btntitle)&&!isBlank(selectbtnConfig[i].btnmethod)){
    				  temp+='<li><a href="javascript:void('+selectbtnConfig[i].btnmethod+')" >'+selectbtnConfig[i].btntitle+'</a></li>'
    			  }
    		  }
    	}
    	temple=temple.replaceAll("_itemsbutton_",temp);
    }
    
    //表格
    if (index == '7') {
        var tableConfig = getTableConfig();
        var buttonConfig = getTableButtonConfig();
        var hasSubTitle = getTableHasSubTitle(tableConfig);
        var needCheckbox = (config.checkbox_id != null && config.checkbox_id != '');
        var tableThead = '';
        var tableSubThead = '';
        var tableTbody = '';
        if (needCheckbox) {
            tableThead += elementTemple.tableCheckboxAll;
        }
        if (tableConfig.length > 0) {
            for (var i = 0; i < tableConfig.length; i++) {
                if (tableConfig[i].tableContent.indexOf('<c:if') > -1) {
                    if (!isBlank(tableConfig[i].tableclass)) {
                        tableThead += elementTemple.tableOrderTh.replaceAll('_in_tableTitle_', tableConfig[i].tableTitle).replaceAll('_in_tableContent_', '').replaceAll("_in_class_start_", "class='" + tableConfig[i].tableclass + "'").replaceAll("select2-code-name", "");
                    } else {
                        tableThead += elementTemple.tableOrderTh.replaceAll('_in_tableTitle_', tableConfig[i].tableTitle).replaceAll('_in_tableContent_', '').replaceAll("_in_class_start_", "");
                    }
                } else {
                    if (!isBlank(tableConfig[i].tableclass)) {
                        tableThead += elementTemple.tableOrderTh.replaceAll('_in_tableTitle_', tableConfig[i].tableTitle).replaceAll('_in_tableContent_', tableConfig[i].tableContent).replaceAll("_in_class_start_", "class='" + tableConfig[i].tableclass + "'").replaceAll("select2-code-name", "");
                    } else {
                        tableThead += elementTemple.tableOrderTh.replaceAll('_in_tableTitle_', tableConfig[i].tableTitle).replaceAll('_in_tableContent_', tableConfig[i].tableContent).replaceAll("_in_class_start_", "");
                    }
                }
                if (!isBlank(tableConfig[i].tableclass)) {
                    tableSubThead += elementTemple.tableOrderTh.replaceAll('_in_tableTitle_', tableConfig[i].tableSubTitle).replaceAll('_in_tableContent_', tableConfig[i].tableContent).replaceAll("_in_class_start_", "class='" + tableConfig[i].tableclass + "'").replaceAll("select2-code-name", "");
                } else {
                    tableSubThead += elementTemple.tableOrderTh.replaceAll('_in_tableTitle_', tableConfig[i].tableSubTitle).replaceAll('_in_tableContent_', tableConfig[i].tableContent).replaceAll("_in_class_start_", "");
                }
                if (i==0) {
                	if (tableSubThead.indexOf("class")==-1) {
                		tableThead=tableThead.replaceAll("_in_float_","class=\"fixcooloumn-padding\"");
					}else{
						tableThead=tableThead.replaceAll("_in_float_","");
					}
				}else{
					tableThead=tableThead.replaceAll("_in_float_","");
				}
                
                if (i == 0 && needCheckbox) {
                    if (config.checkbox_id.indexOf(',') > -1) {//多个值
                        var checks = config.checkbox_id.split(',');
                        var _temp = '';
                        for (var n = 0; n < checks.length; n++) {
                            _temp += '${table_object.' + checks[n] + '}_';
                        }
                        _temp = _temp.substr(0, _temp.length - 1);
                        tableTbody += elementTemple.tableCheckbox.replaceAll('_in_checkbox_id_', _temp).replaceAll('_in_checkbox_values_', config.checkbox_id);
                    } else {
                        tableTbody += elementTemple.tableCheckbox.replaceAll('_in_checkbox_id_', '${table_object.' + config.checkbox_id + '}').replaceAll('_in_checkbox_values_', config.checkbox_id);
                    }
                }
                var temp = '';
                var tempif = '';

                if (!isBlank(tableConfig[i].tableLinkPath)) {//链接
                    if (!isBlank(tableConfig[i].tableif)) {
                        tempif = elementTemple.tableLinkTd.replaceAll("_in_if_start_", "hide='" + tableConfig[i].tableif + "'");
                    } else {
                        tempif = elementTemple.tableLinkTd.replaceAll("_in_if_start_", "");
                    }
                    if (!isBlank(tableConfig[i].tableclass)) {
                        tempif = tempif.replaceAll("_in_class_start_", "class='" + tableConfig[i].tableclass + "'");
                    } else {
                        tempif = tempif.replaceAll("_in_class_start_", "");
                    }
                    temp = tempif.replaceAll('_in_tableLinkPath_', tableConfig[i].tableLinkPath);
                } else if (!isBlank(tableConfig[i].tableInput)) {//input
                    if (!isBlank(tableConfig[i].tableif)) {
                        tempif = elementTemple.tableInputTd.replaceAll("_in_if_start_", "hide='" + tableConfig[i].tableif + "'");
                    } else {
                        tempif = elementTemple.tableInputTd.replaceAll("_in_if_start_", "");
                    }
                    if (!isBlank(tableConfig[i].tableclass)) {
                        tempif = tempif.replaceAll("_in_class_start_", "class='" + tableConfig[i].tableclass + "'");
                    } else {
                        tempif = tempif.replaceAll("_in_class_start_", "");
                    }
                    temp = tempif.replaceAll('_in_event_', tableConfig[i].tableEvent);
                } else if (!isBlank(tableConfig[i].tableEvent)) {//点击事件
                    if (!isBlank(tableConfig[i].tableif)) {
                        tempif = elementTemple.tableEventTd.replaceAll("_in_if_start_", "hide='" + tableConfig[i].tableif + "'");
                    } else {
                        tempif = elementTemple.tableEventTd.replaceAll("_in_if_start_", "");
                    }
                    if (!isBlank(tableConfig[i].tableclass)) {
                        tempif = tempif.replaceAll("_in_class_start_", "class='" + tableConfig[i].tableclass + "'");
                    } else {
                        tempif = tempif.replaceAll("_in_class_st	art_", "");
                    }
                    temp = tempif.replaceAll('_in_event_', tableConfig[i].tableEvent);
                } else if (!isBlank(tableConfig[i].tableZdlb)) {//字典
                    if (!isBlank(tableConfig[i].tableif)) {
                        tempif = elementTemple.tableCodeTd.replaceAll("_in_if_start_", "hide='" + tableConfig[i].tableif + "'");
                    } else {
                        tempif = elementTemple.tableCodeTd.replaceAll("_in_if_start_", "");
                    }
                    if (!isBlank(tableConfig[i].tableclass)) {
                        tempif = tempif.replaceAll("_in_class_start_", "class='" + tableConfig[i].tableclass + "'");
                    } else {
                        tempif = tempif.replaceAll("_in_class_start_", "");
                    }
                    temp = tempif.replaceAll('_in_zdlb_', tableConfig[i].tableZdlb);
                } else if (!isBlank(tableConfig[i].tableGroup)) {
                    if (!isBlank(tableConfig[i].tableif)) {
                        tempif = elementTemple.tableGroupTd.replaceAll("_in_if_start_", "hide='" + tableConfig[i].tableif + "'");
                    } else {
                        tempif = elementTemple.tableGroupTd.replaceAll("_in_if_start_", "");
                    }
                    if (!isBlank(tableConfig[i].tableclass)) {
                        tempif = tempif.replaceAll("_in_class_start_", "class='" + tableConfig[i].tableclass + "'");
                    } else {
                        tempif = tempif.replaceAll("_in_class_start_", "");
                    }
                    temp = tempif.replaceAll('_in_group_name_', tableConfig[i].tableGroup);
                } else {
                    if (!isBlank(tableConfig[i].tableif)){
                        tempif = elementTemple.tableTd.replaceAll("_in_if_start_", "hide='"+tableConfig[i].tableif+"'");
                    }else{
                        tempif = elementTemple.tableTd.replaceAll("_in_if_start_", "");
                    }
                    if(!isBlank(tableConfig[i].tableclass)){
                        tempif=tempif.replaceAll("_in_class_start_","class='"+tableConfig[i].tableclass+"'");
                    }else{
                        tempif=tempif.replaceAll("_in_class_start_","");
                    }
                    temp = tempif;
                }
                if (tableConfig[i].tableContent.indexOf('<c:if') > -1) {
                    temp = temp.replace('${table_object._in_tableContent_}', tableConfig[i].tableContent);
                } else {
                    temp = temp.replaceAll('_in_tableContent_', tableConfig[i].tableContent);
                }
                //文字截取
                temp = temp.replaceAll('_in_ellLength_',tableConfig[i].tableContentLength);
                if (i==0) {
                	if(temp.indexOf("class")==-1 ||temp.indexOf("input")!=-1)
                	{
                		temp=temp.replaceAll("_in_float_","class=\"fixcooloumn-padding\"");
                	}else{
                		temp=temp.replaceAll("_in_float_","");
                	}
				}else{
					temp=temp.replaceAll("_in_float_","");
				}
                tableTbody += temp;
                
            }
        }
        //判断是否加操作列
        if (buttonConfig != null && buttonConfig.length > 0) {
            tableThead += '<th>操作</th>';
            tableTbody += '<td data-element-type="auto-add">';
            // console.log(buttonConfig.length);
            for (var i = 0; i < buttonConfig.length; i++) {
                tableTbody += elementTemple.tableButton.replaceAll('_in_btn_size_', 'btn-xs').replaceAll('_in_btn_style_', buttonConfig[i].style).replaceAll('_in_original_title_', buttonConfig[i].title).replaceAll('_in_tabName_', buttonConfig[i].tabName).replaceAll('_in_onclick_', buttonConfig[i].event).replaceAll('_in_content_', buttonConfig[i].content);
            }
            tableTbody += '</td>';
        }
        temple = temple.replaceAll('_in_table_thead_', tableThead).replaceAll('_in_table_tbody_', tableTbody);
        if (hasSubTitle) {
            var $oldCode = $('<div>' + temple + '</div>');
            if (needCheckbox) {
                $oldCode.find('tr').find('th:first').attr('rowspan', "2");
            }
            $oldCode.find('tr:first').after('<tr>' + tableSubThead + '</tr>');
            var colspan = 1;
            var z = 0;
            var j = 0;
            $oldCode.find('tr:first').find('th').each(function (i) {
                if (needCheckbox && i == 0) {
                    return;
                }
                if (colspan == 1) {
                    var ttest = $(this).html();
                    $oldCode.find('tr:first').find('th:gt(' + (i - j) + ')').each(function () {
                        if (ttest == $(this).html()) {
                            colspan++;
                        }
                    });
                    if (colspan == 1) {
                        $(this).attr('rowspan', "2");
                        $oldCode.find('tr').eq(1).find('th').eq(0 + z).remove();
                    } else {
                        $(this).attr('colspan', colspan);
                        z++;
                    }
                } else {
                    $(this).remove();
                    z++;
                    j++
                    colspan--;
                }
            });
            temple = $oldCode.html();
            temple=temple.replaceAll("fixcooloumn-padding","").replaceAll("fixcooloumn","");
        }
    }
    if (index == '41') {
        var tableConfig = getEditTableConfig();
        var needCheckbox = (config.checkbox_id != null && config.checkbox_id != '');
        var tableThead = '';
        var tableTbody = '';
        if (needCheckbox) {
            tableThead += elementTemple.tableCheckboxAll;
        }
        if (tableConfig.length > 0) {
            for (var i = 0; i < tableConfig.length; i++) {
                tableThead += elementTemple.editTableTh.replaceAll('_in_tableTitle_', tableConfig[i].tableTitle).replaceAll('_in_tableContent_', tableConfig[i].tableContent);
                //tableThead += elementTemple.tableTh.replaceAll('_in_tableTitle_',tableConfig[i].tableTitle);
                //if (i == 0 && needCheckbox) {
                //    tableTbody += elementTemple.tableCheckbox.replaceAll('_in_checkbox_id_', config.checkbox_id);
                //}
                if (i == 0) {
                    tableTbody += '<td class="hide"><input name="' + config.items + '[${sta.index}].wid" value="${table_object.wid}"></td>';
                }
                tableTbody += elementTemple.editTableTd.replaceAll('_in_group_name_', '可编辑表格(id-' + config.id + '): ' + tableConfig[i].tableTitle + ' ');
            }
            tableThead += '<th class="edit-table-operation" width="150px">操作</th>';
            tableTbody += '<td class="edit-table-operation"><a class="btn btn-sm btn-danger delete-table-config" href="javascript:void(0)" onclick="tool.removeDateForEditTable(this)"><i class="fa fa-times fa fa-white"></i> </a>' +
                ' <a class="btn btn-sm btn-danger delete-table-config" href="javascript:void(0)" onclick="tool.upDateForEditTable(this)"><i class="fa fa-arrow-up fa fa-white"></i> </a>' +
                ' <a class="btn btn-sm btn-danger delete-table-config" href="javascript:void(0)" onclick="tool.downDateForEditTable(this)"><i class="fa fa-arrow-down fa fa-white"></i> </a></td>';
        }
        //_in_function_
        var functionName = getNewElementId();
        var _function = 'function ' + functionName + '(el){\n';
        _function += 'var $el = $(el); var $table = $el.parents(".dataTables_wrapper").find("table");';
        _function += '$table.append(\'<tr>' + tableTbody.replaceAll('\n', '') + '</tr>\')}';
        temple = temple.replaceAll('_in_table_thead_', tableThead).replaceAll('_in_table_tbody_', tableTbody).replaceAll('_in_function_', _function).replaceAll('_in_functionName_', functionName);
    }
    if (index == '74') {
        var config = getWizardConfig();
        /**
         * 插件,顶部进度,进度条,表单主体,表单插件对象,插件id
         * @type {string}
         */
        var wizardStep = '', wizardProgressBar = elementTemple.wizardProgressBar, wizardBody = '', wizardObject = getNewElementId(),
            id = getNewElementId(), onShowStepFun = '', validateStepsFun = '', wizardStepId = '', _temp = '';
        var wizardStepNumber = 1;
        var $_temp;
        if (config.length > 0) {
            for (var i = 0; i < config.length; i++) {
                wizardStepId = getNewElementId();
                wizardStepNumber = (i + 1);
                if (i == 0) {
                    _temp = elementTemple.wizardFirstContent.replaceAll('_in_wizard_title_', config[i].title).replaceAll('_in_wizard_step_', '第' + (i + 1) + '步').replaceAll('_in_wizard_stepId_', wizardStepId).replaceAll('_in_validateSteps_', config[i].validateSteps).replaceAll('_in_showStep_', config[i].showStep);
                } else if (i == config.length - 1) {
                    _temp = elementTemple.wizardLastContent.replaceAll('_in_wizard_title_', config[i].title).replaceAll('_in_wizard_step_', '第' + (i + 1) + '步').replaceAll('_in_wizard_stepId_', wizardStepId).replaceAll('_in_validateSteps_', config[i].validateSteps).replaceAll('_in_showStep_', config[i].showStep);
                } else {
                    _temp = elementTemple.wizardContent.replaceAll('_in_wizard_title_', config[i].title).replaceAll('_in_wizard_step_', '第' + (i + 1) + '步').replaceAll('_in_wizard_stepId_', wizardStepId).replaceAll('_in_validateSteps_', config[i].validateSteps).replaceAll('_in_showStep_', config[i].showStep);
                }
                if (!isBlank(config[i].code)) {
                    $_temp = $(_temp);
                    $_temp.find('[data-group-name]').html(config[i].code);
                    _temp = $_temp.prop('outerHTML');
                }
                wizardBody += _temp;
                wizardStep += elementTemple.wizardStep.replaceAll('_in_wizard_title_', config[i].title).replaceAll('_in_wizard_step_', '第' + (i + 1) + '步').replaceAll('_in_wizard_stepNumber_', wizardStepNumber).replaceAll('_in_wizard_stepId_', wizardStepId);
                if (!isBlank(config[i].showStep)) {
                    onShowStepFun += 'if (context.toStep == ' + (i + 1) + ') {' + config[i].showStep + ';}\n';
                }
                if (!isBlank(config[i].validateSteps)) {
                    validateStepsFun += 'if (stepnumber == ' + (i + 1) + ') {' + config[i].validateSteps + ';}\n';
                }
            }
            temple = temple.replaceAll('_in_wizard_object_', wizardObject).replaceAll('_in_wizard_progress_bar_', wizardProgressBar).replaceAll('_in_wizard_body_', wizardBody).replaceAll('_in_onShowStep_fun_', onShowStepFun).replaceAll('_in_validateSteps_fun_', validateStepsFun).replaceAll('_in_wizard_step_', wizardStep);
        } else {
            return '';
        }

    }
    if (index == '52') {
        var config = getNavTabsConfig();
        var head = '', content = '', navId = '';
        if (config.length > 0) {
            for (var i = 0; i < config.length; i++) {
                navId = getNewElementId();
                if (i == 0) {
                    head += elementTemple.navTabsHeaderActive.replaceAll('_in_content_id_', navId).replaceAll('_in_tabbale_name', config[i].navTabsTitle);
                    content += elementTemple.navTabsContentActive.replaceAll('_in_content_id_', navId).replaceAll('_in_nav_tabs_url_', config[i].navTabsUrl);
                } else {
                    head += elementTemple.navTabsHeader.replaceAll('_in_content_id_', navId).replaceAll('_in_tabbale_name', config[i].navTabsTitle);
                    content += elementTemple.navTabsContent.replaceAll('_in_content_id_', navId).replaceAll('_in_nav_tabs_url_', config[i].navTabsUrl);
                }
            }
            temple = temple.replaceAll('_in_tabbale_header_', head).replaceAll('_in_tabbale_content_', content);
        }
    }
    if (index == '75') {
        var config = getStaticNavConfig();
        var head = '', content = '', navId = '', _temp = '';
        var $_temp;
        if (config.length > 0) {
            for (var i = 0; i < config.length; i++) {
                navId = getNewElementId();
                if (i == 0) {
                    head += elementTemple.navTabsHeaderActive.replaceAll('_in_content_id_', navId).replaceAll('_in_tabbale_name', config[i].navTabsTitle);
                    _temp = elementTemple.staticNavTabsContentActive.replaceAll('_in_content_id_', navId).replaceAll('_in_nav_tabs_url_', config[i].navTabsUrl).replaceAll('_in_tabbale_name', config[i].navTabsTitle);
                } else {
                    head += elementTemple.navTabsHeader.replaceAll('_in_content_id_', navId).replaceAll('_in_tabbale_name', config[i].navTabsTitle);
                    _temp = elementTemple.staticNavTabsContent.replaceAll('_in_content_id_', navId).replaceAll('_in_nav_tabs_url_', config[i].navTabsUrl).replaceAll('_in_tabbale_name', config[i].navTabsTitle);
                }

                if (!isBlank(config[i].code)) {
                    $_temp = $(_temp);
                    $_temp.find('[data-group-name]').html(config[i].code);
                    _temp = $_temp.prop('outerHTML');
                }
                content += _temp;
            }
            temple = temple.replaceAll('_in_tabbale_header_', head).replaceAll('_in_tabbale_content_', content);
        }
    }
    if (index == '60') {
        //isuedit
        var oldCode = getCode();
        if (oldCode != null && oldCode != '') {
            if (subPage.jscode != null && subPage.jscode != '') {
                var $oldCode = $('<div>' + oldCode + '</div>');
                var a = subPage.jscode;
                while (a.indexOf('//ueditor-') != -1) {
                    var id = a.substring(a.indexOf('//ueditor-') + 10);
                    id = id.substring(0, id.indexOf('start') - 1);
                    if (id == subPage.selectid) {
                        var jscode_p = subPage.jscode.substring(0, subPage.jscode.indexOf('//ueditor-' + id + '-start'));
                        var jscode_n = subPage.jscode.substring(subPage.jscode.indexOf('//ueditor-' + id + '-start') + 20);
                        jscode_n = jscode_n.substring(jscode_n.indexOf('//' + id + '-end') + ('//' + id + '-end').length);
                        subPage.jscode = jscode_p + jscode_n;
                        if (subPage.codeMirrorJs != null) {
                            subPage.codeMirrorJs.setValue(subPage.jscode);
                        }
                    }
                    a = a.substring(a.indexOf('//ueditor-') + 10);
                }
            }
        }

        var js = elementTemple.ueditorjs.replaceAll('_in_id_', config.id);
        subPage.jscode += "\n" + js;
        if (subPage.codeMirrorJs != null) {
            subPage.codeMirrorJs.setValue(subPage.codeMirrorJs.getValue() + "\n" + js);
        }
    }
    if (index == '61' || index == '62' || index == '63' || index == '64' || index == '65' || index == '66' || index == '67' ||
        index == '68' || index == '69' || index == '70' || index == '71') {//数据比对部分
        //截掉第一个.前面的字符
        temple = temple.replaceAll('_in_valueData_comparison_', config.dataComparison);
    }
    if (index=='81') {
    	console.log(temple);
    	temple = temple.replaceAll('for=""', '');
	}
    return temple;

}

/**
 * 获取input,select内容
 * @param selector 选择器
 * @returns {*|jQuery}
 */
function getVal(selector) {
    if (tabModel) {
        return getParentElement(selector).val();
    } else {
        return $(selector).val();
    }
}

/**
 * 显示参数控件
 * @param showElement jquery选择器
 */
function showConfig(showElement) {
    getParentElement('.col-xxxl-3, .validate, .table-config, .table-config-edit, .nav-tabs-config, .modal-code, .wizard-config, .static-nav-tabs-config, .select-btn-item').addClass('hide');
    //console.log(showElement);
    getParentElement(showElement).removeClass('hide');
}

/**
 * 删除引入公用jsp
 * @param el
 */
function removeCommonJsp(el) {
    var $el = $(el);
    if ($el.attr('data-common-type') == 'header') {
        subPage.headerCommonJsp = '';
    }
    if ($el.attr('data-common-type') == 'buttom') {
        subPage.buttomCommonJsp = '';
    }
    $el.parent().remove();
}

/**
 * 拓展javascript string 方法
 * @param reallyDo
 * @param replaceWith
 * @param ignoreCase
 * @returns {string}
 */
String.prototype.replaceAll = function (reallyDo, replaceWith, ignoreCase) {
    if (!RegExp.prototype.isPrototypeOf(reallyDo)) {
        return this.replace(new RegExp(reallyDo, (ignoreCase ? "gi" : "g")), replaceWith);
    } else {
        return this.replace(reallyDo, replaceWith);
    }
}
/**
 * 初始化配置界面下拉插件
 */
function initConfigSelect(index) {
    var styles = ass_object.style;
    var styleElement = getParentElement('#style');
    styleElement.change(function () {
        var style = ass_object.style[$(this).val()];
        showConfig(style.showElements);
    });
    //加载类型下拉
    styleElement.html('');
    if (styles != null && styles.length > 0) {
        for (var i = 0; i < styles.length; i++) {
            styleElement.append('<option value="' + i + '">' + styles[i].styleName + '</option>');
        }
        styleElement.change();
    }
    //加载所属分组下拉
    var code = getCode();
    var group = $('<div>' + code + '</div>').find('[data-group-name]');
    var groupGenus = getParentElement('#group-genus');
    groupGenus.html('');
    if (index >= 47 && index <= 51 || index == 86) {
        if (group.length > 0) {
            for (var i = 0; i < group.length; i++) {
                if ($(group[i]).attr('data-group-type') == 'table-td') {
                    groupGenus.append('<option value="' + $(group[i]).attr('data-group-name') + '">' + $(group[i]).attr('data-group-name') + '</option>');
                }
            }
        }
    } else {
        groupGenus.append('<option value="">无上级</option>');
        if (group.length > 0) {
            for (var i = 0; i < group.length; i++) {
                if ($(group[i]).attr('data-group-type') != 'table-td') {
                    groupGenus.append('<option value="' + $(group[i]).attr('data-group-name') + '">' + $(group[i]).attr('data-group-name') + '</option>');
                }
            }
        }
    }
    if (index == 59) {
        var modalList = $('<div>' + code + '</div>').find('.modal-container');
        var modalId = getParentElement('#modal-id');
        for (var i = 0; i < modalList.length; i++) {
            if (i == 0) {
                modalId.append('<option value="' + $(modalList[i]).attr('id') + '">' + $(modalList[i]).attr('data-group-name') + '</option>');
            } else {
                modalId.append('<option value="' + $(modalList[i]).attr('id') + '" checked>' + $(modalList[i]).attr('data-group-name') + '</option>');
            }

        }
    }
    getParentElement('#icon-btn').attr('href', tool.initParams(getParentElement('#icon-btn').attr('href')));
    initSelectBySelector('.my-modal .select2-delay-init');
    initvalidationEngine('.my-modal .form-horizontal');
    //绑定table-config事件
    getParentElement('#table-config .add-table-config').click(function () {
        var temple = elementTemple.tableConfig;
        temple = temple.replaceAll('_in_table_config_index_', '第' + (getParentElement('#table-config .form-group').length + 1) + '列');
        getParentElement('#table-config').append(temple).find('.delete-table-config').off('click').click(function () {
            $(this).parents('.form-group').remove();
        });

        getParentElement('#table-config').find('.show-row-config').off('click').click(function () {
            $div = $(this).parents(".col-sm-11").next(".table-hide");
            if ($div.is(":visible") == false) {
                $div.show();
            } else {
                $div.hide();
            }
        });

    });

    getParentElement('#table-config .show-row-config').click(function () {
        $div = $(this).parents(".col-sm-11").next(".table-hide");
        if ($div.is(":visible") == false) {
            $div.show();
        } else {
            $div.hide();
        }

    });
    getParentElement('a[edit-table-row]').click(function () {
        opendialog('47', null, this, 2);
    })

    getParentElement('#button-config .add-table-button-config').click(function () {
        var temple = elementTemple.tableButtonConfig;
        var container = '#button-config';
        temple = temple.replaceAll('_in_table_config_index_', '第' + (getParentElement(container + ' .form-group').length + 1) + '列');
        getParentElement(container).append(temple).find('.delete-table-config').off('click').click(function () {
            $(this).parents('.form-group').remove();
        });
        initSelectBySelector('.my-modal .table-btn-style');
    });
    getParentElement('#table-config-edit .add-table-config').click(function () {
        var temple = elementTemple.editTableConfig;
        temple = temple.replaceAll('_in_table_config_index_', '第' + (getParentElement('#table-config-edit .form-group').length + 1) + '列');
        getParentElement('#table-config-edit').append(temple).find('.delete-table-config').off('click').click(function () {
            $(this).parents('.form-group').remove();
        });
    });
    getParentElement('#select-btn-item .add-selectbtn-config').click(function () {
        var temple = elementTemple.seletbuttonConfig;
        temple = temple.replaceAll('_in_selectbtn_config_index_', '按钮' + (getParentElement('#select-btn-item .form-group').length + 1));
        getParentElement('#select-btn-item').append(temple).find('.delete-selectbtn-config').off('click').click(function () {
            $(this).parents('.form-group').remove();
        });
    });
    
    
    getParentElement('#nav-tabs-config .add-table-config').click(function () {
        var temple = elementTemple.navTabsConfig;
        temple = temple.replaceAll('_in_table_config_index_', '第' + (getParentElement('#nav-tabs-config .form-group').length + 1) + '页');
        getParentElement('#nav-tabs-config').append(temple).find('.delete-table-config').off('click').click(function () {
            $(this).parents('.form-group').remove();
        });
    });
    getParentElement('#wizard-config .add-wizard-config').click(function () {
        var temple = elementTemple.wizardConfig;
        temple = temple.replaceAll('_in_table_config_index_', '第' + (getParentElement('#wizard-config .form-group').length + 1) + '步');
        getParentElement('#wizard-config').append(temple).find('.delete-table-config').off('click').click(function () {
            $(this).parents('.form-group').remove();
        });
    });
    getParentElement('#static-nav-tabs-config .add-table-config').click(function () {
        var temple = elementTemple.staticNav;
        temple = temple.replaceAll('_in_table_config_index_', '第' + (getParentElement('#static-nav-tabs-config .form-group').length + 1) + '页');
        getParentElement('#static-nav-tabs-config').append(temple).find('.delete-table-config').off('click').click(function () {
            $(this).parents('.form-group').remove();
        });
    });
    $('.my-modal', document).removeAttr('tabindex');
    // setTimeout('initModal()',1000);
}
function initModal() {
    $('.my-modal', document).parents('.bootbox').removeAttr('tabindex');
}
function getParentElement(selector) {
    return $('.my-modal', document).find(selector);
}
/**
 /**
 * 切换到编辑布局界面
 */
function editLayout() {
    $('.layout').addClass('layout-active').click(function () {

    });
    $('.layout').each(function () {
        var upGroup = $(this).parents('div[data-group-name]');
        if (upGroup == null || upGroup.length == 0) {
            $(this).attr({
                'title': '上级分组：无\n上级分组排序：无\n分组名称：' + $(this).attr('data-group-name') + '\n分组排序：' + $(this).attr('data-order')
            });
        } else {
            $(this).attr({
                'title': '上级分组：' + upGroup.attr('data-group-name') +
                '\n上级分组排序：' + upGroup.attr('data-order') +
                '\n分组名称：' + $(this).attr('data-group-name') +
                '\n分组排序：' + $(this).attr('data-order')
            });
        }
    })
}

/**
 * 切换到编辑元素界面
 */
function editElement() {
    setCode(getCode());
}

/**
 * 根据排序值排序代码
 * @param oldCode 旧代码
 * @param config 修改的代码
 * @returns {string} 新代码
 */
function orderElement(oldCode, config) {
    var newCode = '';
    var groups = $(oldCode);
    var isAdd = false;
    if (groups.length > 0) {
        for (var i = 0; i < groups.length; i++) {
            var order = Number($(groups[i]).attr('data-order'));
            if (!isNaN(order)) {
                if (config.order >= Number($(groups[i]).attr('data-order'))) {//如果新增组排序值大于等于历史列表最大排序
                    if (!isAdd) {
                        newCode += config.template + '\n' + groups[i].outerHTML;
                        isAdd = true;
                    } else {
                        newCode += groups[i].outerHTML;
                    }
                } else {
                    newCode += groups[i].outerHTML;
                }
            } else {
                if (groups[i].nodeName == '#text') {
                    newCode += groups[i].textContent;
                } else {
                    newCode += groups[i].outerHTML;
                }
            }
        }
    }
    if (!isAdd) {
        newCode += '\n' + config.template;
    }
    return newCode;
}

/**
 * 获取随机数
 * @returns {*}
 */
function getNewElementId() {
    var temp = tool.randomString(7);
    return temp;  //+ (Math.floor(Math.random() * 10000))
}