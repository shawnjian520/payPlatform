/**
 * 框架js,tool为系统变量,请勿在其他页面重新初始化
 * Created by tengchong on 15/7/21.
 */
/**
 * page 二级页面对象
 * subPage 三级页面对象
 * @type {{}}
 */
var page = {},
    subPage = {};
var subview_id = [];
/**
 * tool 工具对象
 * @type {{choseLeftStageMenu: string, choseTopStageMenu: string, leftStageMenuList: Array, menuList: Array, res_form: null, configDebug: boolean, userloginid: null, usertype: null, group: null, waitForResponseStatusBtn: null, fileUpload: null, procee: string, submitForm: tool.submitForm, openEntity: tool.openEntity, editData: tool.editData, editDataById: tool.editDataById, editDataByIdConfig: tool.editDataByIdConfig, addData: tool.addData, saveData: tool.saveData, doRemoveAll: tool.doRemoveAll, doRemove: tool.doRemove, deleteDataById: tool.deleteDataById, doSearch: tool.doSearch, initFileUpload: tool.initFileUpload, openModal: tool.openModal, openview: tool.openview, openReport: tool.openReport, report: tool.report, report_s: tool.report_s, report_all: tool.report_all, report_open: tool.report_open, report_open_input: tool.report_open_input, initbtnQx: tool.initbtnQx, initbtnQxBack: tool.initbtnQxBack, importData: tool.importData, exportData: tool.exportData, exportDataForDbf: tool.exportDataForDbf, exportDataByForm: tool.exportDataByForm, exportDataByFormForDbf: tool.exportDataByFormForDbf}}
 */
var tool = {
    choseLeftStageMenu: '1',
    choseTopStageMenu: '1',
    leftStageMenuList: [],
    menuList: [],
    res_form: null,
    configDebug: true,
    userloginid: null,//用户账户
    usertype: null,//用户操作权限
    group: null,//用户组
    waitForResponseStatusBtn: null,
    fileUpload: null,
    procee: '/project-declaration/',
    /**
     * * 提交表单 for search
     * @param form_element 要提交表单的对象 | 不可为空
     * @param parm 是否带入url参数
     * @param callback 回调函数
     */
    submitForm: function (form_element, parm, callback) {
        if (parm == null) {
            parm = true;
        }
        var el = form_element.parents(".panel");
        if (el.length != 0) {
            tool.openWaitByJqueryElement(el);
        }
        var url = form_element.attr("data-action");
        if (!parm && url.indexOf('?') > -1) {
            url = url.substring(0, url.indexOf('?'));
        }
        $.ajax({
            url: tool.initParams(url),
            cache: false,
            type: "post",
            data: form_element.serialize(),
            dataType: "html",
            timeout: 1000 * 30,
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                tool.ajaxError(XMLHttpRequest, textStatus, errorThrown);
            },
            success: function (data) {
                if (tool.iserror(data)) {
                    return false;
                }
                el.unblock();
                var $data = $(data);
                form_element.find('select').attr('data-val', '').attr('data-value', '');
                form_element.find("input[type='text'],input[type='hidden'],select").each(function (e) {
                    $(this).attr("exportData-val", $(this).val());
                });
                if (form_element.attr("data-action").indexOf("errorList") > -1) {
                    form_element.find(".dataTables_wrapper").html(data);
                } else {
                    //更新表格内容
                    form_element.find(".dataTables_wrapper").eq(0).html($data.find(".form-horizontal .dataTables_wrapper").eq(0).html());//刷新table > list
                    //更新分页信息
                    form_element.find(".page-info:eq(0)").html($data.find(".form-horizontal .page-info:eq(0)").html());
                    form_element.find(".page-info:eq(1)").html($data.find(".form-horizontal .page-info:eq(1)").html());
                }
                Main.initList(form_element.find("table"));
                initselectcode();
                init_lanagure();
                if (isFunction(callback)) {
                    callback();
                }
            }
        });

    },
    /**
     * 修改数据
     * @param el
     * @param id
     */
    openEntity: function (el, id) {
        tool.editDataById(el, id);
    },
    /**
     * 修改数据
     * @param el 修改按钮 | 不可为空 | 示例 this
     * @param manyChooseTtitle  多选时提示标题 | 可为空
     * @param manyChooseSubtitle 多选时提示子标题 | 可为空
     * @param noChooseTitle   未选时提示标题 | 可为空
     * @param noChooseSubtitle 未选时提示子标题 | 可为空
     */
    editData: function (el, manyChooseTtitle, manyChooseSubtitle, noChooseTitle, noChooseSubtitle) {
        var form_element = $(el).parents('.form-horizontal');
        tool.res_form = form_element;
        var ids = tool.getChoseData(form_element);
        if (!isBlank(ids)) {
            if (ids.split(",").length == 1) {
                tool.editDataById(el, ids);
            } else {
                if (manyChooseTtitle == "" || manyChooseTtitle == null || manyChooseSubtitle == "" || manyChooseSubtitle == null) {
                    tool.alertWarning('不支持批量修改,请勾选1条数据!', '请在下方列表中勾选一条要修改的数据');
                } else {
                    tool.alertWarning(manyChooseTtitle, manyChooseSubtitle);
                }
            }
        } else {
            if (noChooseTitle == "" || noChooseTitle == null || noChooseSubtitle == "" || noChooseSubtitle == null) {
                tool.alertWarning('请选择要修改的数据!', '请在下方列表中勾选一条要修改的数据');
            } else {
                tool.alertWarning(noChooseTitle, noChooseSubtitle);
            }
        }
    },
    /**
     * 根据id修改信息
     * @param el 链接 | 不可为空 | 示例 this
     * @param id 数据id | 不可为空
     * @param name 标签页名称
     */
    editDataById: function (el, id, name, params) {
        tool.editDataByIdConfig({
            el: el,
            id: id,
            name: name,
            params: params
        });
    },
    /**
     * 根据id修改信息
     * @param el 链接 | 不可为空 | 示例 this
     * @param id 数据id | 不可为空
     * @param name 标签页名称
     */
    editDataByIdConfig: function (obj) {
        var form_element = $(obj.el).parents('.form-horizontal');
        tool.res_form = form_element;
        var url = form_element.attr("data-action");
        url = tool.getControllerUrl(url);
        url = url + "/input/" + obj.id;
        if(url.indexOf('?') > -1){
            url += '&' + obj.params;
        }else{
            url += '?' + obj.params;
        }
        tool.openSubview(url, null, tool.getTabName(obj.el, obj.name), true);
    },
    /**
     * 新增数据 注:form中class中包含parameter的将会自动作为参数传到后台
     * @param el 必填 | 当前form中的一个元素
     * @param parameter 参数 | 可选
     */
    addData: function (el, parameter, name, lcsearch) {
        var form_element = $(el).parents('.form-horizontal');
        tool.res_form = form_element;
        var data = form_element.find('input[class*="parameter"],select[class*="parameter"]').serialize();
        var url = form_element.attr('data-action');
        url = tool.getControllerUrl(url);
        url = url + '/openCreate?time=' + new Date().getTime();

        if (parameter != null && parameter != '') {
            url += '&' + parameter;
        }
        if (lcsearch != null && lcsearch != '') {
            url += '&' + lcsearch;
        } else if (data != null && data != '') {
            url += '&' + data;
        }

        tool.openSubview(url, null, tool.getTabName(el, name), true);
    },
    /**
     * 保存数据
     * @param el 保存按钮 | 不可为空 | 示例 this
     * @param url 保存url | 可不指定
     * @param isAlert 是否弹出操作结果 默认弹出
     * @param isvalidate 是否验证 | 如不需要验证,传入true
     * @param callback 回调函数
     */
    saveData: function (el, url, isAlert, isvalidate, callback) {
        if (isAlert == null) {
            isAlert = true;
        }
        if (isvalidate == null) {
            isvalidate = false;
        }
        var form_element = $(el).parents('.form-horizontal');
        if (isvalidate || form_element.validationEngine('validate')) {
            //暂时禁止按钮点击事件
            tool.setWaitForResponseStatus($(el));
            //如果form中没有action
            if (isBlank(url)) {
                if (isBlank(form_element.attr("action"))) {
                    url = form_element.attr("data-action");
                    url = tool.getControllerUrl(url);
                    url = url + "/save";

                } else {
                    url = form_element.attr("action");
                }
            }
            $.ajax({
                url: tool.initParams(url),
                type: "post",
                data: form_element.serialize(),
                dataType: "json",
                timeout: 1000 * 60 * 2,
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    tool.ajaxError(XMLHttpRequest, textStatus, errorThrown);
                },
                success: function (data) {
                    tool.removeWaitForResponseStatus();
                    form_element.find("#is_change").val("0");
                    if (data.res || data.oper_res) {
                        if (isAlert) {
                            if(form_element.find("#wid").val() == null || form_element.find("#wid").val() == '' ||
                                form_element.find("#id").val() == null || form_element.find("#id").val() == ''){
                                setTimeout('tool.alertSuccess("操作成功","您新增的数据已保存!")', 100);
                            }else{
                                setTimeout('tool.alertSuccess("操作成功","您修改的数据已保存!")', 100);
                            }
                        }
                        //如果表单中有 wid 元素 并且 data 对象中有wid属性
                        if (!isBlank(data.data)) {
                            if ("wid" in data.data && form_element.find("#wid").length != 0) {
                                form_element.find("#wid").val(data.data.wid);
                            }
                            if ("id" in data.data && form_element.find("#id").length != 0) {
                                form_element.find("#id").val(data.data.id);
                            }
                        }
                    } else {
                        var msg = '';
                        if ("msg" in data){
                            msg = data.msg;
                        }else{
                            msg = data.oper_msg;
                        }
                        setTimeout('tool.alertError("操作失败!","' + msg + '")', 100);
                    }
                    if (isFunction(callback)) {
                        callback(data);
                    }
                }
            });
        }
    },
    /**
     * 删除全部数据
     * @param el
     */
    doRemoveAll: function (el) {
        var totalRows = $("#totalRows").val();
        tool.alertConfirm('确定要删除本次查询的' + totalRows + '条记录?', '删除后将无法恢复，请谨慎操作！', function () {
            tool.setWaitForResponseStatus($(el));
            var form_element = $(el).parents('.form-horizontal');
            var data = form_element.serialize();
            tool.deleteAllData(el, data);
        });
    },
    /**
     * 删除数据
     * @param el list删除按钮 | 不可为空
     * @param callback 回调函数
     * @param subtitle 副标题提示
     */
    doRemove: function (el, callback, subtitle) {
        var form_element = $(el).parents('.form-horizontal');
        var ids = tool.getChoseData(form_element);
        if (subtitle == null || subtitle == '') {
            subtitle = "删除后将无法恢复，请谨慎操作！";
        }
        if (!isBlank(ids)) {
            tool.alertConfirm('确定要删除勾选的数据吗?', subtitle, function () {
                tool.setWaitForResponseStatus($(el));
                tool.deleteData(form_element, {"wid": ids}, callback);
            })
        } else {
            tool.alertWarning('请选择要删除的数据!', '请在下方列表中勾选要删除的数据');
        }
    },
    /**
     * 根据id删除数据
     * @param el 删除按钮 | 不可为空 | 示例 this
     * @param id 要删除数据的id
     * @param callback 回调函数
     */
    deleteDataById: function (el, id, callback) {
        tool.deleteData($(el).parents('.form-horizontal'), {"wid": id}, callback);
    },
    /**
     * 查询
     * @param el 查询按钮
     * @param callback 回调函数
     */
    doSearch: function (el, parm, callback) {
        var $form = $(el).parents('.form-horizontal');
        var $currentPageno = $form.find('#yspager_currentPageno');
        if ($currentPageno.length > 0) {
            $currentPageno.val(1);
        }
        tool.submitForm($form, parm, callback);
    },
    /**
     * 初始化文件上传
     * @param el file element
     * @param url url
     * @param data 附加数据
     * @param auto_upload 是否自动上传
     * @param fileTypeExts 支持的格式
     * @param queueSizeLimit 上传文件数量限制
     * @param onSelect 选择文件事件
     * @param onUploadSuccess 文件上传成功事件
     * @param onQueueComplete 列队所有文件上传完毕
     * @param fileSizeLimit 上传文件大小限制
     * @param uploadfileQueue 上传列队显示容器
     * @param buttonText 上传按钮文字
     * @param onUploadStart 文件开始上传
     */
    initFileUpload: function (el, url, data, auto, fileTypeExts, queueSizeLimit, onSelect, onUploadSuccess,
                              onQueueComplete, fileSizeLimit, uploadfileQueue, buttonText, onUploadStart, buttonClass) {
        var config = {};
        config.auto = auto;
        if (isBlank(fileSizeLimit)) {
            config.fileSizeLimit = '20MB';
        } else {
            config.fileSizeLimit = fileSizeLimit;
        }
        if (!isBlank(uploadfileQueue)) {
            config.queueID = uploadfileQueue;
        }
        if (isBlank(buttonClass)) {
            config.buttonClass = 'btn btn-sm btn-info';
        } else {
            config.buttonClass = buttonClass;
        }
        if (isBlank(buttonText)) {
            config.buttonText = '选择文件 <i class=\"fa fa-plus\"></i>';
        } else {
            config.buttonText = buttonText;
        }
        config.selector = el;
        config.formData = data;
        config.onSelect = onSelect;
        config.onQueueComplete = onQueueComplete;
        config.removeCompleted = true;
        if (!tool.supportHtml5()) {//IE8/9不支持html5方式上传,需要用flash
            config.onUploadStart = onUploadStart;
            config.onUploadSuccess = onUploadSuccess;
            config.onUploadError = function (file, errorCode, errorMsg, errorString) {
                try {
                    subPage.onUploadError();
                } catch (ex) {
                }
            }
            config.onInit = function () {
                if (!tool.has_flash()) {
                    swal({
                        title: "缺少Flash插件",
                        type: 'warning',
                        text: "您未安装Flash控件，无法上传文件！请使用Chrome/Firefox/IE10+浏览器，或<a target='_blank' href='https://get.adobe.com/flashplayer/?loc=cn'>点此</a>安装FLASH控件重启浏览器后重试。",
                        html: true,
                        showConfirmButton: false
                    });
                }
            }
            if (isBlank(url)) {
                config.uploader = basePath + "/fileUpload";
            } else {
                config.uploader = url;
            }
            config.fileTypeDesc = '支持的格式：';
            config.fileTypeExts = fileTypeExts;
            config.width = 82;
            config.height = 30;
            config.swf = basePath + '/resources/plugins/uploadify/uploadify.swf';
            config.onSelectError = function (file, errorCode, errorMsg) {
                switch (errorCode) {
                    case -100:
                        tool.alertWarning("上传的文件数量已经超出系统限制！");
                        break;
                    case -110:
                        tool.alertWarning("文件大小超出系统限制的" + fileSizeLimit + "！");
                        break;
                    case -120:
                        tool.alertWarning("文件大小异常！");
                        break;
                    case -130:
                        tool.alertWarning("文件类型不正确！");
                        break;
                }
            }
            config.onFallback = function () {
                swal({
                    title: "缺少Flash插件",
                    type: 'warning',
                    text: "您未安装Flash控件，无法上传文件！请使用Chrome/Firefox/IE10+浏览器，或<a target='_blank' href='https://get.adobe.com/flashplayer/?loc=cn'>点此</a>安装FLASH控件重启浏览器后重试。",
                    html: true,
                    showConfirmButton: false
                });
            }
            try {
                if (!isBlank(config.selector)) {
                    $(config.selector).uploadify(config);
                }
            } catch (e) {
                console.log(e);
            }
        } else {
            //即将上传
            config.onUpload = onUploadStart;
            //上传完毕
            config.onUploadComplete = onUploadSuccess;
            if (isBlank(url)) {
                config.uploadScript = basePath + "/fileUpload";
            } else {
                config.uploadScript = url;
            }
            if (isNotBlank(fileTypeExts)) {
                fileTypeExts = tool.extensionToContentTypes(fileTypeExts);
            }
            config.fileType = fileTypeExts;
            config.onFallback = function () {
            }
            try {
                if (!isBlank(config.selector)) {
                    $(config.selector).uploadifive(config);
                }
            } catch (e) {
                console.log(e);
            }
        }
    },
    /**
     * 打开modal窗口
     * @param options
     * @modaltitle 模态框标题
     * @param width 宽度
     * * @param height 高度
     * @param callback 回调函数
     * @returns {string}
     */

    openModal: function (options, modaltitle, width, height, callback) {
        if (height == null || height == '') {
            height = $('.J_mainContent', window.parent.document).height() - 170;
        }
        if (width == "" || width == null) {
            width = "";
        }
        if (modaltitle == "" || modaltitle == null) {
            modaltitle = "&nbsp;";
        }
        if (options.remote.indexOf('jd=') == -1) {
            options.remote = tool.initParams(options.remote);
        }
        var modal_id = tool.randomString(15);
        var iframeid = tool.randomString(15);
        var html = '<div class="modal fade" id="' + modal_id + '" tabindex="-1" role="dialog" aria-hidden="true">' +
            '<div class="modal-dialog modal-lg" style="width:' + width + '">' +
            '<div class="modal-content">' +
            '<div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button><h4 class="modal-title">' + modaltitle + '</h4></div>' +
            '<div class="modal-body">';
        html += '<iframe id="' + iframeid + '" width="100%" height="' + height + '" frameborder="0" src="' + options.remote + '"></iframe>';
        html += '</div></div></div>';
        $('body').append(html);
        var $modal = $('#' + modal_id);
        $modal.modal({backdrop: 'static', keyboard: false}).modal('show').on('shown.bs.modal', function (e) {
            if (isFunction(callback)) {
                callback();
            }
            $modal.removeAttr('tabindex');
        }).on('hidden.bs.modal', function (e) {
            // 关闭时销毁
            $modal.remove();
        });
        return modal_id;
    },
    /**
     * 打开窗口
     * @param el form中的一个对象 (this)
     * @param url url
     * @param name 标签页名称
     * @param showLoading 是否显示loading框,默认显示
     */
    openview: function (el, url, name, showLoading) {
        tool.openSubview(url, null, tool.getTabName(el, name), showLoading);
    },
    /**
     * 打开报表
     * @param el this
     * @param url url
     * @param name 标签页名称
     */
    openReport: function (el, url, name) {
        tool.openSubview(url, null, tool.getTabName(el, name), false);
    },
    //审核数据调用方法
    report: function (el, ids, lcbm, type, glzd, con, json, thyj) {
        if (ids == null || ids == '') {
            var form_element = $(el).parents('.form-horizontal');
            var ids = tool.getChoseData(form_element);
            if (ids == null || ids == '') {
                tool.alertConfirm('未选中数据，是否确定操作所有数据?', '', function () {
                    $.post(tool.initParams(tool.procee + 's/biz/ajaxProcess/handle'), {
                        'handleids': 'allid', 'lcbm': lcbm, 'glzd': glzd, 'thyj': thyj,
                        'type': type, 'json': json, 'con': con
                    }, function (data) {
                        if (tool.iserror(data)) {
                            return false;
                        }
                        setTimeout('tool.alertSuccess_lc("' + data.jsonstr + '")', 100);
                        tool.submitForm($(el).parents('.form-horizontal'));
                    });
                });
                return false;
            }
        }
        $.post(tool.initParams(tool.procee + 's/biz/ajaxProcess/handle'), {
            'handleids': ids, 'lcbm': lcbm, 'glzd': glzd, 'json': json, 'thyj': thyj,
            'type': type, 'con': con
        }, function (data) {
            if (tool.iserror(data)) {
                return false;
            }
            setTimeout('tool.alertSuccess_lc("' + data.jsonstr + '")', 100);
            tool.submitForm($(el).parents('.form-horizontal'));
        });
    },
    //审核数据调用方法
    report_s: function (el, lcbm, type, glzd, con, json, thyj) {
        tool.report(el, null, lcbm, type, glzd, con, json, thyj);
    },
    /**
     * 审核全部数据调用方法
     * @param el 按钮对象 this
     * @param lcbm 流程名称
     * @param type 审核类型 AjaxProcessController中常量
     * @param glzd 关联字段
     */
    report_all: function (el, lcbm, type, glzd, con, json, thyj) {
        tool.report(el, 'allid', lcbm, type, glzd, con, json, thyj);
    },
    //填写审核意见时调用方法
    report_open: function (el, lcbm, type, glzd, con, json, isreq) {
        window.parent.tool.report_open(el, lcbm, type, glzd, con, json, isreq, tool);
    },
    //input页面填写审核意见时调用方法
    report_open_input: function (el, ids, lcbm, type, glzd, con, json, isreq) {
        window.parent.tool.report_open_input(el, ids, lcbm, type, glzd, con, json, isreq, tool);
    },
    initbtnQx: function (form_t, lcbm, nd, xq) {
        $.post(tool.initParams(tool.procee + 's/system/ajaxProcess/isstart'), {
            'nd': nd,
            'xq': xq,
            'lcbm': lcbm
        }, function (data) {
            if (tool.iserror(data)) {
                return false;
            }
            if (data.count == '0') {//没开启
                form_t.find('button,a').each(function () {
                    if ($(this).attr('ssyhqx') == '2' || $(this).attr('ssyhqx') == '3') {
                        $(this).remove();
                    }
                });
            }
        });
    },
    initbtnQxBack: function (form_t, lcbm, nd, xq, p) {
        $.post(tool.initParams(tool.procee + 's/system/ajaxProcess/isstart'), {
            'nd': nd,
            'xq': xq,
            'lcbm': lcbm
        }, function (data) {
            if (tool.iserror(data)) {
                return false;
            }
            if (data.count == '0') {//没开启
                p.btnBack();
            }
        });
    },
    /**
     * 打开导入页面t
     * @param el 导入按钮 | 不可为空
     * @param par 参数 | 一般传入导入模板id
     * @param tab页标题
     */
    importData: function (el, par, name) {
        tool.res_form = $(el).parents('.form-horizontal');
        var url = basePath + "/s/system/excelUserImport/openCreate?" + par;
        tool.openSubview(url, null, tool.getTabName(el, name), false);
    },
    /**
     * 在iframe中打开导出页面
     * @param par 地址+参数 | 不可为空
     */
    exportData: function (par, path) {
        if ((path == null || path == '') && nodePath != null && nodePath != '') path = nodePath;
        window.parent.tool.exportData(par, path, 'export2excel');
    },
    exportDataForDbf: function (par, path) {
        if ((path == null || path == '') && nodePath != null && nodePath != '') path = nodePath;
        window.parent.tool.exportData(par, path, 'export2dbf');
    },
    /**
     * 导出数据 (将导出按钮所在form表单数据作为参数通过url传入)
     * @param el this
     * @param par 参数
     * @param path url
     */
    exportDataByForm: function (el, par, path, is_dbf) {
        if ((path == null || path == '') && nodePath != null && nodePath != '') path = nodePath;
        var form_element = $(el).parents('.form-horizontal');
        var temp = '';
        var elList = form_element.find('input[type="text"],input[type="hidden"],select');
        elList.each(function () {
            var $el = $(this);
            temp += $el.attr('name') + '=' + $el.val() + '&';
        });
        if (elList.length > 0) {
            temp = temp.substr(0, temp.length - 1);
        }
        if (par.indexOf('?') > -1) {
            par = par + '&' + temp
        } else {
            par = par + '?' + temp
        }
        if (is_dbf) {
            tool.exportDataForDbf(par, path);
        } else {
            tool.exportData(par, path);
        }
    },
    /**
     * 导出数据 (将导出按钮所在form表单数据作为参数通过url传入)
     * @param el this
     * @param par 参数
     * @param path url
     */
    exportDataByFormForDbf: function (el, par, path) {
        tool.exportDataByForm(el, par, path, true);
    }
};