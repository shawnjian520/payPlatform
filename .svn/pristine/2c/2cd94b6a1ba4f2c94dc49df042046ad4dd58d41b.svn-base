var CONTENT_TYPE = {
    ".avi": "video/x-msvideo",
    ".bmp": "image/bmp",
    ".doc": "application/msword",
    ".docx": "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
    ".flv": "video/x-flv",
    ".gif": "image/gif",
    ".html": "text/html",
    ".jpe": "image/jpeg",
    ".jpeg": "image/jpeg",
    ".jpg": "image/jpeg",
    ".mkv": "video/x-matroska",
    ".mov": "video/quicktime",
    ".mp3": "audio/mpeg",
    ".mp4": "video/mp4",
    ".png": "image/png",
    ".ppt": "application/vnd.ms-powerpoint",
    ".psd": "image/vnd.adobe.photoshop",
    ".xls": "application/vnd.ms-excel",
    ".xlsx": "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
    ".xsl": "application/xml"
};
if (tool == null || tool == '') {
    window.tool = {};
}
/**
 * 封装jquery.ajax方法
 * @param config
 * 拓展属性如下
 * config.waitSelector 打开等待遮罩选择器
 * config.needAlert 失败时是否使用系统tool.alertWarning弹出data.msg提示;
 * 当不需要提示时可以自定义config.fail(data)方法自定义错误提示
 */
tool.ajax = function (config) {
    if (!isBlank(config)) {
        if (!isBlank(config.waitSelector)) {
            tool.openWait(config.waitSelector);
        }
        $.ajax({
            async: config.async,
            url: config.url.indexOf('jdds') > -1 ? config.url : tool.initParams(config.url),
            cache: false,
            data: config.data,
            async: config.async,
            type: isBlank(config.type) ? 'post' : config.type,
            dataType: isBlank(config.dataType) ? 'json' : config.type,
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                tool.closeWait(config.waitSelector);
                tool.ajaxError(XMLHttpRequest, textStatus, errorThrown);
            },
            success: function (data) {
                tool.closeWait(config.waitSelector);
                if (data.res) {
                    config.success(data);
                } else {
                    if (config.needAlert == null || config.needAlert) {
                        tool.alertWarning('失败', data.msg);
                    } else {
                        console.warn(data.msg);
                        if (isFunction(config.fail)) {
                            config.fail(data);
                        }
                    }
                }
            }
        });
    } else {
        console.warn('tool.ajax方法不允许传入空参数');
    }
}
/**
 * 打开等待遮罩
 * @param selector
 */
tool.openWait = function (selector) {
    if (!isBlank(selector)) {
        var $el = $(selector);
        if ($el.length > 0) {
            tool.openWaitByJqueryElement($el);
        }
    }
}
/**
 * 打开等待遮罩
 * @param $el
 */
tool.openWaitByJqueryElement = function ($el) {
    $el.block({
        overlayCSS: {
            backgroundColor: '#fff'
        },
        message: '<i class="fa fa-spinner fa-spin"></i>',
        css: {
            border: 'none',
            color: '#333',
            background: 'none'
        }
    });
}

/**
 * 打开等待遮罩
 * @param selector
 */
tool.closeWait = function (selector) {
    if (!isBlank(selector)) {
        var $el = $(selector);
        if ($el.length > 0) {
            $el.unblock();
        }
    }
}

tool.openTipWindowByConfig = function (config) {
    var id = getNewElementId();
    var _html = '<div id="' + id + '" class="panel panel-white pt10 notifications hide"><div class="panel-body"><div class="row"><div class="col-xs-12">' +
        '<i class="fa fa-times close"></i><i class="icon fa ' + config.icon + '"></i>' +
        '<h2 class="title">' + config.title + '</h2><p class="content">' + config.content + '</p>' +
        '</div></div></div></div>';
    var $panel = $('body').append(_html).find('#' + id);
    $panel.removeClass('hide').removeClass(config.animateIn + ' animated').addClass(config.animateIn + ' animated').one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function () {
        $(this).removeClass(config.animateIn + ' animated');
    });
    $panel.find('i.close').click(function () {
        $panel.removeClass(config.animateOut + ' animated').addClass(config.animateOut + ' animated').one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function () {
            $(this).removeClass(config.animateOut + ' animated').addClass('hide');
            $panel.remove();
        });
        ;
    });
};
/**
 * 初始化页面属性
 */
tool.runInit = function () {
    var $body = $('body');
    if (/MSIE (\d+\.\d+);/.test(navigator.userAgent)) {
        var ieversion = new Number(RegExp.$1);
        if (ieversion <= 8) {
            isIE8 = true;
            $body.addClass('isIE8');
        } else if (ieversion == 9) {
            isIE9 = true;
            $body.addClass('isIE9');
        }
    }
    // Detection for Mobile Device
    if (/Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent)) {
        isMobile = true;
        $body.addClass('isMobile');
    }
};
/**
 * 通过点击tr在form下面加载新list
 */
tool.loadFormByTr = function (el, url, type) {
    var form_element = $(el).parents('.form-horizontal');
    if (type == '1') form_element = $(el).parents('.form-horizontal-tr');
    var el = form_element.parents(".panel");
    if (el.length != 0) {
        el.block({
            overlayCSS: {
                backgroundColor: '#fff'
            },
            message: '<i class="fa fa-spinner fa-spin"></i>',
            css: {
                border: 'none',
                color: '#333',
                background: 'none'
            }
        });
    }
    var data = '';
    if (form_element.attr('data-action') == url) {
        data = form_element.serialize()
    }
    $.ajax({
        url: tool.initParams(url),
        cache: false,
        type: "post",
        data: data,
        dataType: "html",
        timeout: 1000 * 15,
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            tool.ajaxError(XMLHttpRequest, textStatus, errorThrown);
        },
        success: function (data) {
            el.unblock();
            var htm = '<form method="post" class="form-horizontal-tr">' +
                '<input type="hidden" id="orderType" name="orderType" value="${orderType}">' +
                '<input type="hidden" id="orderField" name="orderField" value="${orderField}">' + data + '</form>';
            var this_element = null;
            if (form_element.attr('data-action') == url) {
                form_element.html(htm);
                this_element = form_element;
            } else {
                if (form_element.next('.form-horizontal-tr').html() != undefined) {
                    form_element.next('.form-horizontal-tr').html(htm);
                } else {
                    form_element.after(htm);
                }

                this_element = form_element.next('.form-horizontal-tr');
            }
            Main.initList(this_element.find("table tbody"));
            this_element.attr("data-action", url);
            initselectcode();
            if (url.indexOf("action") < 0) {//spring mvc
                this_element.find("#yspager_currentPageno").attr("name", "currentPageno");
                this_element.find("#eachPageRows").attr("name", "eachPageRows");
            }
            this_element.find("ul[class*='pagination']").find('a').each(function () {
                $(this).attr("data-current-page-no-tr", $(this).attr("data-current-page-no"));
                $(this).removeAttr("data-current-page-no");
                $(this).unbind('click');
            });
            this_element.find("ul[class*='pagination']").find('a[data-current-page-no-tr]').click(function () {
                var form_element = $(this).parents(".form-horizontal-tr");
                form_element.find("#yspager_currentPageno").val($(this).attr("data-current-page-no-tr"));
                tool.loadFormByTr(this, url, '1');
            });
        }
    });
};
/**
 * 重置查询条件
 * @param el 重置按钮 | 不可为空
 */
tool.resetForm = function (el) {
    $(el).parents('.form-horizontal').find("input:visible,select:visible").not(':disabled').not('[type="checkbox"]').not('[readonly]').not("table input").val("");
    $(el).parents('.form-horizontal').find("select:visible").not(':disabled').not('[readonly]').not('[type="checkbox"]').trigger("change");
},
    tool.initvalidationEngine = function (selector) {
        try {
            $(selector).validationEngine({
                showOneMessage: true
            });
        } catch (e) {
            console.warn(selector + '绑定表单验证失败');
        }

    };
tool.getlog = function (el, lcbm, wid) {
    $.post(tool.initParams(tool.procee + 's/system/ajaxProcess/getLog'), {
        'lcbm': lcbm, 'wid': wid
    }, function (data) {
        if (tool.iserror(data)) {
            return false;
        }
        $('#logmodel').remove();
        $('#log_main_btn').remove();
        var htm = '<div class="modal fade" id="logmodel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="width: 90%;left: 5%;">' +
            '<div class="modal-dialog" role="document">' +
            '<div class="modal-content">' +
            '<div class="modal-header">' +
            '<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>' +
            ' <h4 class="modal-title" id="myModalLabel">操作记录</h4>' +
            '</div>' +
            '<div class="modal-body">' +
            data.log +
            '</div>' +
            '<div class="modal-footer">' +
            ' <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>' +
            '</div>' +
            '</div>' +
            ' </div>' +
            '</div><button id="log_main_btn" type="button" class="btn btn-primary" style="display: none;" data-toggle="modal" data-target="#logmodel">' +
            '日志' +
            '</button>';
        $(el).parents('.form-horizontal').append(htm);
        $('#log_main_btn').click();
    });
};
tool.getlog_htm = function (lcbm, wid, id) {
    $.post(tool.initParams(tool.procee + 's/system/ajaxProcess/getLog'), {
        'lcbm': lcbm, 'wid': wid
    }, function (data) {
        if (tool.iserror(data)) {
            return false;
        }
        $('#' + id).html(data.log);
    });
};
tool.showlog_all = function (el, wid, lcbm) {
    tool.openview(el, basePath + '/s/system/process/alllog/' + wid + '/' + lcbm, '查看更多操作记录');
};
/**
 * 是否为错误页面
 * @param data
 * @returns {boolean}
 */
tool.iserror = function (data) {
    if (typeof data == 'object' || data.substring(0, 1) == '{' || data.substring(0, 1) == '[') {
        return false;
    }
    if ($(data).find('#error-message').length > 0) {
        tool.alertError('错误!', $(data).find('#error-message').html());
        return true;
    } else if ($(data).find('#logout-error').length > 0) {
        tool.alertLogin();
        return true;
    } else if ($(data).find('#logout-error-other-login').length > 0) {
        tool.alertLogin('您的账号正在其他设备登录！当前自动退出。');
        return true;
    } else if ($(data).find('#error-info-404').length > 0) {
        tool.alertError('错误!', '网络繁忙，请稍后重试~');
        return true;
    }
    return false;
};
/**
 * 根据权限,控制按钮隐藏显示
 */
tool.initBtnShow = function () {
    $('body').find('button.btn,a.btn').each(function () {
        var $el = $(this);
        var userJurisdiction = $el.attr('ssyhqx');
        var groupJurisdiction = $el.attr('data-group-jurisdiction');
        var userJuris = tool.authenticationAuthority(tool.usertype, userJurisdiction);
        var groupJuris = tool.authenticationAuthority(tool.group, groupJurisdiction);
        /**
         * 以下情况会将按钮删除
         * 1.用户验证未通过/用户组未设置
         * 2.用户未设置/用户组验证未通过
         * 3.用户验证未通过/用户组验证未通过
         */
        if ((!userJuris && (isBlank(groupJurisdiction) || groupJurisdiction == 'null')) ||
            (!groupJuris && (isBlank(userJurisdiction) || userJurisdiction == 'null')) ||
            !groupJuris && !userJuris) {
            $(this).remove();
        }
    });
};
/**
 * 检查浏览器是否支持html5上传
 * @returns {boolean}
 */
tool.supportHtml5 = function () {
    if (/MSIE (\d+\.\d+);/.test(navigator.userAgent)) {
        var ieversion = new Number(RegExp.$1);
        if (ieversion == 8 || ieversion == 9) {
            isIE8 = true;
            return false;
        } else {
            return true;
        }
    } else {
        return true;
    }
};
/**
 * 设置页面只读
 * 1.隐藏所有按钮
 * @param $el 只读区域
 */
tool.setReadonly = function ($el) {
    $el.find('.btn').addClass('hide');
};
/**
 * 显示提示窗口
 * @param title 标题
 * @param content 内容
 * @param animate 动画效果
 */
tool.openTipWindow = function (icon, title, content, animate) {
    var config = {};
    if (isBlank(animate)) {
        animate = 'fadeInDown'
    }
    if (isBlank(icon)) {//默认为提示图标
        config.icon = 'fa-lightbulb-o';
    } else {
        config.icon = icon;
    }
    config.title = title;
    config.content = content;
    config.animateIn = animate;
    config.animateOut = animate.replace('In', 'Out');
    tool.openTipWindowByConfig(config);
};
/**
 * 验证用户是否有按钮操作权限
 * @param userRights 用户操作权限 sample -- 1,2,3
 * @param btnRights 按钮权限 sample 1,2
 */
tool.authenticationAuthority = function (userRights, btnRights) {
    if (!isBlank(userRights)) {
        if (isBlank(btnRights) || btnRights == 'null') {
            return true;
        } else {
            userRights = userRights.split(',');
            btnRights = btnRights.split(',');
            for (var i = 0; i < btnRights.length; i++) {
                for (var j = 0; j < userRights.length; j++) {
                    if (btnRights[i].trim() == userRights[j].trim()) {
                        return true;
                    }
                }
            }
            return false;
        }
    } else {
        return true;
    }
};
/**
 * 根据选择器初始化自动高度textarea
 * @param selector
 */
tool.initAutosize = function (selector) {
    var $els = $(selector);
    if ($els.length > 0) {
        $els.autosize();
    }
};
/**
 * 初始化富文本编辑器
 * @param selector
 */
tool.initSummerNoteBySelector = function (selector) {
    tool.initSummerNote($(selector));
};
/**
 * 初始化富文本编辑器
 * @param $els
 */
tool.initSummerNote = function ($els) {
    $els.each(function () {
        var _thisNote = $(this);
        _thisNote.summernote({
            height: 300,
            tabsize: 2,
            lang: 'zh-CN',
            oninit: function () {
                if (_thisNote.code() == "" || _thisNote.code().replace(/(<([^>]+)>)/ig, "") == "") {
                    _thisNote.code(_thisNote.attr("placeholder"));
                }
            },
            onfocus: function () {
                if (_thisNote.code() == _thisNote.attr("placeholder")) {
                    _thisNote.code("");
                }
            },
            onblur: function () {
                if (_thisNote.code() == "" || _thisNote.code().replace(/(<([^>]+)>)/ig, "") == "") {
                    _thisNote.code(_thisNote.attr("placeholder"));
                }
            }
        });
    });
};
/**
 * data:{"wid":ids,"zcd":"true"}
 * bbname:t_gx_gjjxj_sqb.cpt
 * frpath:'<%=ClientUtil.getString("fr.path") %>'
 */
tool.print = function (frpath, bbname, data) {
    var url = frpath + "?reportlet=/" + bbname;
    FR.doHyperlinkByPost(url, data, 'REPORT');
};
/**
 * 选择字段
 * @param json([[\'id1\',\'字段1\'],[\'id2\',\'字段2\'],[\'id3\',\'字段3\'],[\'id4\',\'字段4\'],[\'id5\',\'字段5\']])
 */
tool.choseParam = function (json) {
    tool.openModal({
        'remote': tool.initParams(tool.procee + 's/system/chose/list'),
        'data': 'json=' + json
    }, '80%', false);
};
/**
 * 回调
 * @param param([\'id1\',\'id3\',\'id5\'])
 */
tool.choseParamBack = function (param) {
    $('div[role="dialog"]').modal('hide');
    //下面的方法请在页面重写
    page.choseParamBack(param);
};
/**
 * 关闭当前tab页
 */
tool.closeCurrentTab = function () {
    var href = window.location.href;
    href = href.substr(href.indexOf('/s/'), href.length);
    href = href.substr(0, href.indexOf('?'));
    $btn = $('[data-id*="' + href + '"].J_menuTab', parent.document).find('i.fa-times-circle, i.fa-times');
    if ($btn.length > 0) {
        $btn.click();
    }
};
/**
 * 刷新指定tab
 */
tool.reloadTab = function (url) {
    $('[data-id*="' + url + '"].J_menuTab', parent.document).dblclick();
};
/**
 * 刷新当前页面
 */
tool.reload = function () {
    location.reload();
};
/**
 * 禁用可编辑表格编辑功能
 */
tool.disableEditTable = function () {
    $('.edit-table-body .edit-table-operation').addClass('hide');
};
/**
 * 启用可编辑表格编辑功能
 */
tool.enableEditTable = function () {
    $('.edit-table-body .edit-table-operation').removeClass('hide');
};

tool.validationElement = function ($elements) {
    var flag = true;
    $elements.each(function () {
        if (!$(this).validationEngine('validate')) {
            flag = false;
            return false;
        }
    });
    return flag;
};
/**
 * 下载文件
 * @param path
 */
tool.downloadfile = function (path) {
    if (window.top != window.self) {
        window.parent.tool.downloadfile(path);
    } else {
        $('#iframedownload').attr('src', basePath + '/filedownload.jsp?path=' + path.replaceAll('\\\\', '\/'));
    }
};
/**
 * 加密url，返回带加密串的新url
 * @param url
 * @returns {*}
 */
tool.initParams = function (url) {
    if (url == undefined) {
        return url;
    }
    $.ajax({
        type: "post",
        url: basePath + '/s/geturl',
        data: "url=" + url.replaceAll('&', 'jdand') + "&userloginid=" + tool.userloginid,
        async: false,
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            if (textStatus == "timeout") {
                tool.alertWarning('请求超时!', '请稍后重试!');
            } else {
                tool.alertError(XMLHttpRequest.responseText);
            }
        },
        success: function (data) {
            if (url.indexOf('?') != -1) {
                url = url + '&jddes=' + data;
            } else {
                url = url + '?jddes=' + data;
            }
        }
    });
    return url;
};
/**
 * 设置按钮为等待ajax响应状态,并禁止点击事件
 * @param $el 按钮 | jquery对象
 */
tool.setWaitForResponseStatus = function ($el) {
    tool.waitForResponseStatusBtn = $el;
    $el.attr('disabled', 'disabled').attr('data-text', $el.html()).html('<i class="fa fa-circle-o-notch fa-spin"></i> 处理中...');
    if ($el[0].nodeName == "A") {
        $el.attr('data-click', $el.attr('onclick')).attr('onclick', '');
    }
    var _i = $el.find('i');
    if (_i.length > 0) {
        _i.attr('data-btn-icon', _i.attr('class'));
        _i.attr('class', 'fa fa-circle-o-notch fa-spin');
    }
};
/**
 * 移除按钮等待ajax响应状态,并恢复点击事件
 * @param $el 按钮 | jquery对象
 */
tool.removeWaitForResponseStatus = function () {
    if (tool.waitForResponseStatusBtn != null && tool.waitForResponseStatusBtn.length > 0) {
        tool.waitForResponseStatusBtn.removeAttr('disabled', 'disabled').html(tool.waitForResponseStatusBtn.attr('data-text'));
        if (tool.waitForResponseStatusBtn[0].nodeName == "A") {
            tool.waitForResponseStatusBtn.attr('onclick', tool.waitForResponseStatusBtn.attr('data-click'));
        }
        var _i = tool.waitForResponseStatusBtn.find('i');
        if (_i.length > 0) {
            _i.attr('class', _i.attr('data-btn-icon'));
        }
        tool.waitForResponseStatusBtn = null;
    }
};
/**
 * 显示等待提示
 */
tool.showWaitTip = function () {
    $('.modal-backdrop, .wait-tip').removeClass('hide');
};
tool.setWaitTip = function () {
    $('.wait-tip .panel-body').html('<i class="fa fa-circle-o-notch fa-spin"></i> 数据量大,请耐心等待...');
};
/**
 * 隐藏等待提示
 */
tool.hideWaitTip = function () {
    $('.modal-backdrop, .wait-tip').addClass('hide');
    $('.wait-tip .panel-body').html('<i class="fa fa-circle-o-notch fa-spin"></i> 数据加载中,请稍候...');
};
tool.isNotEmpty = function (val) {
    return !tool.isEmpty(val);
};
tool.isEmpty = function (val) {
    if ((val == null || typeof(val) == "undefined") || (typeof(val) == "string" && val == "" && val != "undefined")) {
        return true;
    } else {
        return false;
    }
};
tool.isDebug = function () {
    if (tool.isNotEmpty(tool.configDebug) && tool.configDebug == "true") {
        return true;
    } else {
        return false;
    }
};
tool.getControllerUrl = function (url) {
    if (url.indexOf("/s/system") > 0) {
        url = url.substring(0, url.indexOf('/s/') + 10) + url.substring(url.indexOf('/s/') + 10).substring(0, url.substring(url.indexOf('/s/') + 10).indexOf("/"));
    } else if (url.indexOf("/s/id") > 0) {
        url = url.substring(0, url.indexOf('/s/') + 6) + url.substring(url.indexOf('/s/') + 6).substring(0, url.substring(url.indexOf('/s/') + 6).indexOf("/"));
    } else {
        url = url.substring(0, url.indexOf('/s/') + 7) + url.substring(url.indexOf('/s/') + 7).substring(0, url.substring(url.indexOf('/s/') + 7).indexOf("/"));
    }
    return url;
};
/**
 * 删除全部数据
 * @param el
 * @param data
 */
tool.deleteAllData = function (el, data) {
    var form_element = $(el).parents('.form-horizontal');
    var url = form_element.attr("data-action");
    if (url.indexOf("action") < 0) {
        url = url.substr(0, url.lastIndexOf("/")) + "/removeAll";
    } else {
        url = url.substr(0, url.indexOf("-")) + "-deleteAllData.action";
    }
    $.ajax({
        url: tool.initParams(url),
        type: "post",
        data: data,
        dataType: "json",
        timeout: 1000 * 60,
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            tool.ajaxError(XMLHttpRequest, textStatus, errorThrown);
        },
        success: function (data) {
            tool.removeWaitForResponseStatus();
            data = eval(data);
            if (data.res) {
                tool.doSearch(el);
            } else {
                setTimeout('tool.alertError("操作失败!","' + data.msg + '")', 100);
            }
        }
    });
};
/**
 * 删除数据
 * @param $form 表单对象 | 不可为空
 * @param ajax_data 参数 | 不可为空 | 示例 字符串或者json
 * @param callback 回调函数
 */
tool.deleteData = function ($form, ajax_data, callback) {
    var url = $form.attr("data-action");
    url = tool.getControllerUrl(url);
    url = url + "/remove";

    $.ajax({
        url: tool.initParams(url),
        type: "post",
        data: ajax_data,
        dataType: "json",
        timeout: 1000 * 5,
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            tool.ajaxError(XMLHttpRequest, textStatus, errorThrown);
        },
        success: function (data) {
            tool.removeWaitForResponseStatus();
            data = eval(data);
            if (data.res || data.oper_res) {
                var $delTr = $("#tr_" + ajax_data.wid.replace(/,/g, ',#tr_'));
                $delTr.find(".btn").css("border-color", "#fff");
                $delTr.addClass("isdelete").find("td").css({"background-color": "#FF3300"}).fadeOut(1000, function () {
                    $(this).remove();
                });
                if (isFunction(callback)) {
                    callback();
                }
            } else {
                var msg = '';
                if ("msg" in data.data) {
                    msg = data.msg;
                } else {
                    msg = data.oper_msg;
                }
                setTimeout('tool.alertError("操作失败!","' + msg + '")', 100);
            }
        }
    });
};
/**
 * 删除 For 可编辑表格
 * @param el 按钮 this
 */
tool.removeDateForEditTable = function (el) {
    $(el).parents('tr').remove();
};
/**
 * 清除input数据
 * @param el
 */
tool.clearinput = function (el) {
    if ($(el).prev().attr("readonly") != 'readonly') {
        $(el).prev().val("");
        $(el).hide();
    }
};
/**
 * 文本域输入方法。
 */
tool.checkMaxInput = function (obj, maxLen) {
    if (obj == null || obj == undefined || obj == "") {
        return;
    }
    if (maxLen == null || maxLen == undefined || maxLen == "-1") {
        $(obj).next().next().remove();
    }
    var strResult;
    var $obj = $(obj);
    var newid = $obj.attr("id") + "msg";
    if (obj.value.length > maxLen) {
        obj.value = obj.value.substring(0, maxLen);
    } else {
        $("#" + newid).html(obj.value.length)
    }
};
tool.upDateForEditTable = function (el) {
    var f = $(el).parents('tbody').find('tr:first').find('input:first').attr('name');
    if (f == $(el).parents('tr').find('input:first').attr('name')) {
        return false;
    }
    var index = $(el).parents('tr').find('input:first').attr('name');
    index = index.substring(index.indexOf('[') + 1, index.indexOf(']'));

    var p_index = $(el).parents('tr').prev('tr').find('input:first').attr('name');
    p_index = p_index.substring(p_index.indexOf('[') + 1, p_index.indexOf(']'));
    $(el).parents('tr').prev('tr').find('input,select').each(function () {
        $(this).attr('name', $(this).attr('name').replace('[' + p_index + ']', '[' + index + ']'));
        $(this).attr('id', $(this).attr('name'));
    });

    $(el).parents('tr').find('input,select').each(function () {
        $(this).attr('name', $(this).attr('name').replace('[' + index + ']', '[' + p_index + ']'));
        $(this).attr('id', $(this).attr('name'));
    });
    var t_htm = $(el).parents('tr').prop('outerHTML');

    $(el).parents('tr').prev('tr').before(t_htm);
    $(el).parents('tr').prev('tr').prev('tr').find('input').each(function (i) {
        $(this).val($(el).parents('tr').find('input').eq(i).val());
    });
    $(el).parents('tr').prev('tr').prev('tr').find('select').each(function (i) {
        $(this).val($(el).parents('tr').find('select').eq(i).val());
    });
    tool.removeDateForEditTable(el);
};
tool.downDateForEditTable = function (el) {
    var f = $(el).parents('tbody').find('tr:last').find('input:first').attr('name');
    if (f == $(el).parents('tr').find('input:first').attr('name')) {
        return false;
    }
    var index = $(el).parents('tr').find('input:first').attr('name');
    index = index.substring(index.indexOf('[') + 1, index.indexOf(']'));

    var n_index = $(el).parents('tr').next('tr:first').find('input:first').attr('name');
    n_index = n_index.substring(n_index.indexOf('[') + 1, n_index.indexOf(']'));
    $(el).parents('tr').next('tr:first').find('input,select').each(function () {
        $(this).attr('name', $(this).attr('name').replace('[' + n_index + ']', '[' + index + ']'));
        $(this).attr('id', $(this).attr('name'));
    });

    $(el).parents('tr').find('input,select').each(function () {
        $(this).attr('name', $(this).attr('name').replace('[' + index + ']', '[' + n_index + ']'));
        $(this).attr('id', $(this).attr('name'));
    });
    var t_htm = $(el).parents('tr').prop('outerHTML');

    $(el).parents('tr').next('tr:first').after(t_htm);
    $(el).parents('tr').next('tr:first').next('tr:first').find('input').each(function (i) {
        $(this).val($(el).parents('tr').find('input').eq(i).val());
    });
    $(el).parents('tr').next('tr:first').next('tr:first').find('select').each(function (i) {
        $(this).val($(el).parents('tr').find('select').eq(i).val());
    });
    tool.removeDateForEditTable(el);
};
/**
 * 随即产生指定长度字符串
 * @param len
 * @returns {string}
 */
tool.randomString = function (len) {
    len = len || 32;
    var $chars = 'ABCDEFGHJKMINOPQRSTUVWXYZabcdefhijkminopqrstuwxyz';
    var maxPos = $chars.length;
    var pwd = '';
    for (var i = 0; i < len; i++) {
        pwd += $chars.charAt(Math.floor(Math.random() * maxPos));
    }
    return pwd;
};
/**
 * 文件拓展名(Extension)转Content-Type(Mime-Type)
 * @param extensions
 */
tool.extensionToContentTypes = function (extensions) {
    extensions = extensions.split(';');
    var contentType = [];
    var temp = null;
    for (var i = 0; i < extensions.length; i++) {
        temp = CONTENT_TYPE[extensions[i].replace('*', '')];
        if (isNotBlank(temp)) {
            contentType.push(temp);
        }
    }
    return contentType;
};
/**
 * 文件拓展名(Extension)转Content-Type(Mime-Type)
 * @param extension
 */
tool.extensionToContentType = function (extension) {
    return CONTENT_TYPE[extension];
};
/**
 * 触发开始上传
 * @param $el
 */
tool.startUpload = function ($el) {
    if (!tool.supportHtml5()) {//IE8/9不支持html5方式上传,需要用flash
        $el.uploadify('upload', '*');
    } else {
        $el.uploadifive('upload');
    }
};
tool.has_flash = function () {
    var isIE = !-[1,];
    if (isIE) {
        try {
            return !!new ActiveXObject('ShockwaveFlash.ShockwaveFlash');
        }
        catch (e) {
        }
    } else {
        try {
            return !!navigator.plugins['Shockwave Flash'];
        }
        catch (e) {
        }
    }
    return false;
};
/**
 * 保存
 * @param el form中的一个对象 (this)
 */
tool.submit_save = function (el) {
    tool.saveData(el);
};
/**
 * 查询
 * @param el form中的一个对象 (this)
 * @param callback 回调函数
 */
tool.super_doSearch = function (el, parm, callback) {
    tool.doSearch(el, parm, callback);
};
/**
 * 修改
 * @param el form中的一个对象 (this)
 */
tool.doModify = function (el) {
    tool.editData(el);
};
/**
 * 重置
 * @param el form中的一个对象 (this)
 */
tool.super_reset = function (el) {
    tool.resetForm(el);
};
/**
 * 做List查询条件保存
 * @param el
 * @param parm
 * @param callback
 */
tool.doSaveSearch = function (el, parm, callback) {
    var $form = $(el).parents('.form-horizontal');
    var url = tool.procee + "s/ajax/saveSearchData";
    var dataurl = $($form).attr("data-action");
    var sqwid = dataurl.substring(dataurl.indexOf("system") + 4, dataurl.indexOf("?jddes"));
    var fromdata = $form.serialize();
    $.ajax({
        url: tool.initParams(url),
        cache: false,
        type: "post",
        data: {"fromdata": fromdata, "sqwid": sqwid},
        dataType: "html",
        timeout: 1000 * 30,
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            tool.ajaxError(XMLHttpRequest, textStatus, errorThrown);
        },
        success: function (data) {
            data = eval("(" + data + ")");

            if (data.res) {
                setTimeout('tool.alertSuccess("' + data.msg + '")', 100);

            } else {
                setTimeout('tool.alertError("操作失败!","' + data.msg + '")', 100);
            }
        }
    });
};
/**
 * 初始化表格排序
 * 注: 需要排序的表格中请在class上添加table-order
 */
tool.initOrderTables = function () {
    $(".table-order").each(function () {
        tool.initOrderTable($(this));
    });
};
/**
 * 初始化表格排序功能
 * @param $table 表格对象
 */
tool.initOrderTable = function ($table) {
    $table.find("thead tr th[data-order-name]").each(function () {
        if ($(this).attr("data-is-init") == "1") {

        } else {
            $(this).attr("data-is-init", "1");
            $(this).addClass("poi");
            $(this).off("click").click(function () {
                var order_type = $(this).attr("data-order-type");
                if (isBlank(order_type)) {
                    order_type = "desc";
                }
                if (order_type == "asc") {
                    order_type = "desc";
                } else if (order_type == "desc") {
                    order_type = "asc";
                }
                var form_element = $(this).parents('.form-horizontal');
                form_element.find("#orderField").val($(this).attr("data-order-name"));
                form_element.find("#orderType").val(order_type);
                tool.submitForm(form_element);
            });
        }
    });
    //标记排序状态
    $table.find("th[data-order-name]").addClass('sort-null').attr('title', '点击标题排序');
    var _order = $('#orderField').val();
    var _orderType = $('#orderType').val();
    var order_icon;
    if (!isBlank(_order)) {//如果排序信息不为空
        var $th = $table.find('thead tr th[data-order-name="' + _order + '"]');
        if (_orderType == "asc") {
            order_icon = 'sort-asc';
        } else if (_orderType == "desc") {
            order_icon = 'sort-desc';
        }
        $th.attr("data-order-type", _orderType);
        $th.addClass(order_icon).removeClass('sort-null');
    }
};
/**
 * 根据当前form生成子窗口容器ID,并打开窗口
 * @param el form 表单内对象 | 不可为空
 * @param url url | 不可为空
 * @param check_issave 关闭页面时是否检测已经保存 | 可为空 | 默认不检测
 * @param need_res 关闭打开页面后是否刷新本页面 | 可为空 默认不刷新
 */
tool.openSubviewByForm = function (el, url, check_issave, need_res, id, name) {
    if (id == null || id == '') {
        id = new Date().getTime();
    }
    tool.openSubview(url, id, tool.getTabName(el, name), check_issave);
};
/**
 * 打开子窗口
 * @param url url | 不可为空
 * @param id tab页id
 * @param name 页面标题
 * @param showLoading 是否显示loading
 */
tool.openSubview = function (url, id, name, showLoading) {
    if (name == null || name == '') {
        name = '新建标签页';
    }
    if (id == null || id == '') {
        id = new Date().getTime();
    }
    window.parent.addTab(url, id, name, true, showLoading);
};
/**
 * 用于查询条件超过2行时,显示隐藏多余的查询条件
 * 注:需要在需要隐藏/显示的元素上添加class 'more-query'
 * @param el 显示更多查询条件按钮 | 不可为空
 */
tool.showAllQueryTeam = function (el) {
    if ($(el).attr("data-state") == "open") {
        $(el).parents('.form-horizontal').find(".more-query").addClass("dn");
        $(el).removeAttr("data-state");
        $(el).html("更多 <i class=\"fa fa-angle-down\"></i>");
    } else {
        $(el).parents('.form-horizontal').find(".more-query").removeClass("dn");
        $(el).attr("data-state", "open");
        $(el).html("收起 <i class=\"fa fa-angle-up\"></i>");
        $('.form-horizontal .control-label').each(function () {
            var $el = $(this);
            if ($el.height() > 25) {
                $el.addClass('wrap').removeClass('ell');
            }
        });
    }
};
tool.ajaxError = function (XMLHttpRequest, textStatus, errorThrown, backdrop) {
    tool.removeWaitForResponseStatus();
    if (backdrop != null) backdrop.remove();
    if (textStatus == "timeout") {
        setTimeout("tool.alertError('请求超时!', '请稍后重试!')", 100);
    } else {
        if ($(XMLHttpRequest.responseText).find('#error-message').length > 0) {
            setTimeout("tool.alertError('错误!', '" + $(XMLHttpRequest.responseText).find('#error-message').html() + "');", 100);
        } else if ($(XMLHttpRequest.responseText).find('#logout-error').length > 0) {
            setTimeout("tool.alertLogin();", 100);
        } else if ($(XMLHttpRequest.responseText).find('#logout-error-other-login').length > 0) {
            setTimeout("tool.alertLogin('您的账号正在其他设备登录！当前自动退出。');", 100);
        } else if ($(XMLHttpRequest.responseText).find('#error-info-404').length > 0) {
            setTimeout("tool.alertWarning('操作失败', '" + $(XMLHttpRequest.responseText).find('#error-info-404').html() + "');", 100);
        } else {
            setTimeout("tool.alertError('" + XMLHttpRequest.responseText + "');", 100);
        }
    }
};
tool.alertLogin = function (info) {
    if (info == null) {
        info = '由于您长时间未进行操作,您的登录信息已过期';
    }
    if (window.top != window.self) {
        window.parent.tool.alertLogin(info);
    } else {
        swal({
            title: '重新登录',
            text: info,
            type: "error"
        }, function () {
            logOut();
        });
    }
};
tool.alert = function (obj) {
    if (window.top != window.self) {
        window.parent.tool.alert(obj);
    } else {
        swal(obj);
    }
};
tool.alertInfo = function (txt, sub_txt) {
    if (window.top != window.self) {
        window.parent.tool.alertInfo(youdao(txt), youdao(sub_txt));
    } else {
        swal(youdao(txt), youdao(sub_txt), "info");
    }
};
tool.alertSuccess = function (txt, sub_txt) {
    if (window.top != window.self) {
        window.parent.tool.alertSuccess(youdao(txt), youdao(sub_txt));
    } else {
        swal(youdao(txt), youdao(sub_txt), "success");
    }
};
tool.alertSuccess_lc = function (txt, sub_txt) {
    if (window.top != window.self) {
        window.parent.tool.alertSuccess_lc(youdao(txt), youdao(sub_txt), subPage);
    } else {
        swal({
                title: txt, text: sub_txt, type: "success",
                closeOnConfirm: true,
                closeOnCancel: false
            }, function () {
                subPage.lc_callback();
            }
        );
    }
};
tool.alertError = function (txt, sub_txt) {
    if (window.top != window.self) {
        window.parent.tool.alertError(youdao(txt), youdao(sub_txt), "error");
    } else {
        swal(youdao(txt), youdao(sub_txt), "error");
    }
};
tool.alertWarning = function (txt, sub_txt) {
    if (window.top != window.self) {
        window.parent.tool.alertWarning(youdao(txt), youdao(sub_txt), "warning");
    } else {
        swal(youdao(txt), youdao(sub_txt), "warning");
    }
};
tool.alertConfirm = function (txt, sub_txt, callback, callback2) {
    if (window.top != window.self) {
        window.parent.tool.alertConfirm(youdao(txt), youdao(sub_txt), callback, callback2);
    } else {
        swal({
            title: txt,
            text: sub_txt,
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "确定",
            closeOnConfirm: false
        }, function (isConfirm) {
            if (!isIE8) {
                swal.close();
            }
            if (isConfirm) {
                callback();
            } else {
                if (callback2 != null && callback2 != "") {
                    callback2();
                }
            }
        });
    }
};
/**
 * 获取标签页名称
 * @param el
 * @param name
 */
tool.getTabName = function (el, name) {
    if (name == null || name == '') {
        if (!isBlank($(el).attr('data-tab-name'))) {
            name = $(el).attr('data-tab-name');
        } else {
            name = tool.delHtmlTag($(el).html());
            if (isBlank(name)) {
                name = '新建标签页';
            }
        }
    }
    name = trim(name);
    // if (name.length > 9) {
    //     name = name.substr(0, 8) + '...';
    // }
    return name;
};
tool.delHtmlTag = function (str) {
    return str.replace(/<[^>]+>/g, "");//去掉所有的html标记
};
tool.openloading = function ($el, tit) {
    if (window.top != window.self) {
        window.parent.tool.openloading($el, tit);
    } else {
        if (isIE8) {
            if ($el == null || $el == '') $el = $('body');
            if (tit == null || tit == '') tit = 'Loading';
            $el.block({
                overlayCSS: {
                    backgroundColor: '#fff'
                },
                message: '<i class="fa fa-spinner fa-spin"></i>' + tit,
                css: {
                    border: 'none',
                    color: '#333',
                    background: 'none'
                }
            });
        } else {
            if (tit == null || tit == '') {
                tit = '';
            }
            $('#loader-wrapper h4').html(tit);
            $('body').removeClass('loaded');
        }
    }
};
tool.closeloading = function ($el) {
    if (window.top != window.self) {
        window.parent.tool.closeloading($el);
    } else {
        if (isIE8) {
            if ($el == null || $el == '') $el = $('body');
            $el.unblock();
        } else {
            $('body').addClass('loaded');
        }
    }
};
tool.getTop = function (e) {
    var offset = e.offsetTop;
    if (e.offsetParent != null) offset += tool.getTop(e.offsetParent);
    return offset;
};
/**
 * * 获取所选数据
 * @param form_element 表单(jquery对象) | 不可为空
 * @returns {string} 选中数据的id | 示例 1,2,3,4
 */
tool.getChoseData = function (form_element) {
    var selectNode = form_element.find('input[name="selectNode"]:checked');
    var ids = '';
    if (!isBlank(selectNode)) {
        for (var i = 0; i < selectNode.length; i++) {
            ids += $(selectNode[i]).val() + ',';
        }
        ids = ids.substr(0, ids.length - 1);
    }
    return ids;
};
/**
 * 获取当前form中指定名称的checkbox选中列表
 * @param name checkbox名称 | 不可为空
 * @param el 按钮 | 不可为空
 * @returns {string} 选中数据的id | 示例 1,2,3,4
 */
tool.CropCheckBoxValueAsString = function (name, el) {
    var form_element = $(el).parents('.form-horizontal');
    var selectNode = form_element.find("input[name='" + name + "']:checked");
    var ids = "";
    if (!isBlank(selectNode)) {
        for (var i = 0; i < selectNode.length; i++) {
            ids += $(selectNode[i]).val() + ",";
        }
        ids = ids.substr(0, ids.length - 1);
    }
    return ids;
};
tool.youdaoLanguage = function (txt) {
    try {
        if (cookielang == "en") {
            $.ajax(
                {
                    type: 'post',
                    url: tool.procee + 's/ajax/getyoudaovalue?txt=' + encodeURI(encodeURI(txt)),
                    dataType: 'text',
                    async: false,
                    success: function (data) {
                        txt = data;
                    },
                    error: function () {
                        console.log('fail');
                    }
                }
            );
        }
    } catch (e) {
        // TODO: handle exception
    }

    return txt;
};
/**
 * 初始化日期插件
 * @param selector
 */
tool.initDatetimepickerBySelector = function (selector) {
    tool.initDatetimepicker($(selector));
};
/**
 * 初始化日期插件
 * @param $els
 */
tool.initDatetimepicker = function ($els) {
    if ($els.length > 0) {
        $els.each(function () {
            var el = $(this);
            var config = {};
            config.val = el.val();
            config.format = el.attr("data-format");
            config.minDate = el.attr("data-minDate");
            config.maxDate = el.attr("data-maxDate");
            if (isBlank(config.minDate)) {
                config.minDate = null;
            }
            if (isBlank(config.maxDate)) {
                config.maxDate = null;
            }
            config.minDateElement = el.attr("data-min-date-element");
            config.maxDateElement = el.attr("data-max-date-element");
            if (isBlank(config.format)) {
                config.format = "YYYY-MM-DD";
            }
            config.$maxDateElement = $('#' + config.maxDateElement);
            config.$minDateElement = $('#' + config.minDateElement);

            //如果设置了最大时间
            if (config.maxDateElement != null && config.maxDateElement != '' &&
                config.$maxDateElement.length > 0 && config.$maxDateElement.attr('data-element-type') == 'datetimepicker') {
                el.datetimepicker({
                    format: config.format
                });
                el.on("dp.change", function (e) {
                    config.$maxDateElement.data("DateTimePicker").minDate(e.date);
                });

            } else {
                var _config = {format: config.format};
                if (isNotBlank(config.minDate)) {
                    _config.minDate = config.minDate;
                }
                if (isNotBlank(config.maxDate)) {
                    _config.maxDate = config.maxDate;
                }
                el.datetimepicker(_config);
            }

            //如果设置了最小时间
            if (config.minDateElement != null && config.minDateElement != '' &&
                config.$minDateElement.length > 0 && config.$minDateElement.attr('data-element-type') == 'datetimepicker') {
                el.datetimepicker({
                    format: config.format,
                    useCurrent: false
                });
                el.on("dp.change", function (e) {
                    config.$minDateElement.data("DateTimePicker").maxDate(e.date);
                });
            } else {
                var _config = {format: config.format};
                if (isNotBlank(config.minDate)) {
                    _config.minDate = config.minDate;
                }
                if (isNotBlank(config.maxDate)) {
                    _config.maxDate = config.maxDate;
                }
                el.datetimepicker(_config);
            }
            if (isBlank(config.val)) {
                el.val('');
            }
        });
    }

};
/**
 * 初始化下拉插件
 * @param selector
 */
tool.initSelectBySelector = function (selector) {
    tool.initSelect($(selector));
};
/**
 * 初始化下拉插件
 * @param $els
 */
tool.initSelect = function ($els) {
    if ($els.length > 0) {
        $els.each(function () {
            var el = $(this);
            if (!isBlank(el.attr("data-table-name"))) {
                var table_name = el.attr("data-table-name"); //表名
                var field_id = el.attr("data-field-id"); //select>value
                var field_text = el.attr("data-field-name");//select>text
                var up_file_id = el.attr("data-field-up-id"); //上级过滤字段名
                var up_file_val = el.attr("data-file-up-val"); //上级过滤字段值 仅需填写第一个
                var data_field_query = el.attr("data-file-query"); //过滤字段名
                var data_field_val = el.attr("data-query-val"); //过滤字段值
                if (isBlank(up_file_val)) up_file_val = "";
                if (isBlank(data_field_val)) data_field_val = "";
                //如果table_name 为 t_sys_code 字典表 field_id field_text up_file_id up_file_val data_field_query 可为空,将自动设置默认值
                if (table_name == "t_sys_code" || table_name == "v_sys_code") {
                    if (isBlank(field_id) && isBlank(field_text) && isBlank(up_file_id) && isBlank(up_file_val) && isBlank(data_field_query)) {
                        field_id = "zdbm";
                        field_text = "zdmc";
                        // up_file_id = "";
                        // up_file_val = "";
                        // data_field_query = "zdlb";
                    }
                }
                if (table_name == "t_sys_depart") {
                    if (isBlank(field_id) && isBlank(field_text) && isBlank(up_file_id)) {
                        field_id = "departid";
                        field_text = "departname";
                        // up_file_id = "updepartid";
                    }
                }
                var data = {
                    "table_name": table_name,
                    "field_id": field_id,
                    "field_text": field_text,
                    "up_file_id": up_file_id,
                    "up_file_val": encodeURI(up_file_val),
                    "data_field_query": data_field_query,
                    "data_field_val": encodeURI(data_field_val),
                    "cur_val": el.attr('data-cur-val'),
                    "order_field": el.attr('data-order-field'),
                    "order_type": el.attr('data-order-type'),
                    "otherQuery": el.attr('data-other-query')
                };
                if (isBlank(el.attr("data-childselect"))) {//不是级联
                    loadSelectOption(basePath + "/s/ajax/getDataForSelect", data, el);
                } else {
                    el.attr('dont-init', 'true');
                    el.on("change", function () {//当级联下拉 改变时,重新加载子下拉框
                        var chlid_select = $(el.attr("data-childselect"));
                        while (chlid_select.length != 0) {//重置所有子下拉
                            chlid_select.html("<option value=''>&nbsp;</option>");
                            initSelect(chlid_select);
                            chlid_select = $(chlid_select.attr("data-childselect"));
                        }
                        var child_object = $(el.attr("data-childselect"));
                        var up_val = child_object.attr('data-cur-val');
                        if (isBlank(up_val)) {
                            up_val = el.val();
                        } else {
                            up_val = el.find("option:selected").attr('data-val');
                        }
                        loadSelectOption(basePath + "/s/ajax/getDataForSelect", {
                            "table_name": child_object.attr("data-table-name"),
                            "field_id": child_object.attr("data-field-id"),
                            "field_text": child_object.attr("data-field-name"),
                            "up_file_id": child_object.attr("data-field-up-id"),
                            "data_field_query": child_object.attr("data-file-query"),
                            "data_field_val": child_object.attr("data-query-val"),
                            "order_field": child_object.attr('data-order-field'),
                            "order_type": child_object.attr('data-order-type'),
                            "cur_val": child_object.attr('data-cur-val'),
                            "up_file_val": up_val,
                            "otherQuery": el.attr('data-other-query')
                        }, child_object);
                    });
                    if (!el.attr("data-noauto-init")) {
                        loadSelectOption(basePath + "/s/ajax/getDataForSelect", data, el);
                    } else {
                        initSelect(el);
                    }
                }
            } else if (!isBlank(el.attr("data-select-url"))) {
                loadSelectOption(el.attr("data-select-url"), null, el);
            } else {
                initSelect(el);
            }
        });
    }
};
/**
 * 初始化下拉插件(搜索)
 * @param selector
 */
tool.initSearchSelectBySelector = function (selector) {
    tool.initSearchSelect($(selector));
};
/**
 * 初始化下拉插件(搜索)
 * @param $els
 */
tool.initSearchSelect = function ($els) {
    if ($els.length > 0) {
        $els.each(function () {
            var url = $(this).attr("data-select-url");
            url = tool.initParams(url);
            $(this).select2({
                language: "zh-CN",
                theme: "bootstrap",
                width: '100%',
                ajax: {
                    url: url,
                    type: 'post',
                    dataType: 'json',
                    delay: 250,
                    data: function (params) {
                        return {
                            q: encodeURI(params.term)
                        };
                    },
                    processResults: function (data) {
                        return {
                            results: eval(data)
                        };
                    },
                    transport: function (params, success, failure) {
                        var $request = $.ajax(params);

                        $request.then(success);
                        $request.fail(failure);

                        return $request;
                    },
                    cache: true
                },
                escapeMarkup: function (markup) {
                    return markup;
                }, // let our custom formatter work
                minimumInputLength: 1
            });
        });
    }
};
/**
 * 初始化bootstrap-select
 * @param selector
 */
tool.initBootstrapSelectBySelector = function (selector) {
    tool.initBootstrapSelect($(selector));
};
/**
 * 初始化bootstrap-select
 * @param $els
 */
tool.initBootstrapSelect = function ($els) {
    if ($els.length > 0) {
        $els.each(function () {
            var el = $(this);
            if (!isBlank(el.attr("data-table-name"))) {
                var table_name = el.attr("data-table-name"); //表名
                var field_id = el.attr("data-field-id"); //select>value
                var field_text = el.attr("data-field-name");//select>text
                var up_file_id = el.attr("data-field-up-id"); //上级过滤字段名
                var up_file_val = el.attr("data-file-up-val"); //上级过滤字段值 仅需填写第一个
                var data_field_query = el.attr("data-file-query"); //过滤字段名
                var data_field_val = el.attr("data-query-val"); //过滤字段值
                if (isBlank(up_file_val)) up_file_val = "";
                if (isBlank(data_field_val)) data_field_val = "";
                //如果table_name 为 t_sys_code 字典表 field_id field_text up_file_id up_file_val data_field_query 可为空,将自动设置默认值
                if (table_name == "t_sys_code" || table_name == "v_sys_code") {
                    if (isBlank(field_id) && isBlank(field_text) && isBlank(up_file_id) && isBlank(up_file_val) && isBlank(data_field_query)) {
                        field_id = "zdbm";
                        field_text = "zdmc";
                    }
                }
                if (table_name == "t_sys_depart") {
                    if (isBlank(field_id) && isBlank(field_text) && isBlank(up_file_id)) {
                        field_id = "departid";
                        field_text = "departname";
                    }
                }
                var data = {
                    "table_name": table_name,
                    "field_id": field_id,
                    "field_text": field_text,
                    "up_file_id": up_file_id,
                    "up_file_val": encodeURI(up_file_val),
                    "data_field_query": data_field_query,
                    "data_field_val": encodeURI(data_field_val),
                    "cur_val": el.attr('data-cur-val'),
                    "order_field": el.attr('data-order-field'),
                    "order_type": el.attr('data-order-type'),
                    "otherQuery": el.attr('data-other-query')
                };
                if (isBlank(el.attr("data-childselect"))) {//不是级联
                    loadSelectOption(basePath + "/s/ajax/getDataForSelect", data, el, false);
                    el.selectpicker();
                }
            } else if (!isBlank(el.attr("data-select-url"))) {
                loadSelectOption(el.attr("data-select-url"), null, el, false);
                el.selectpicker();
            } else {
                el.selectpicker();
            }
        });
    }
};
/**
 * 初始化文件上传
 * @param object
 */
tool.initFileUploadByConfig = function (object) {
    //按钮样式
    if (isBlank(object.buttonClass)) {
        object.buttonClass = 'btn btn-sm btn-info';
    }
    //按钮文字
    if (isBlank(object.buttonText)) {
        object.buttonText = '选择文件 <i class=\"fa fa-plus\"></i>';
    }
    //大小限制
    if (isBlank(object.fileSizeLimit)) {
        object.fileSizeLimit = '20MB';
    }
    object.removeCompleted = true;
    //是否自动上传
    if (isBlank(object.auto)) object.auto_upload = false;
    if (!tool.supportHtml5()) {//IE8/9不支持html5方式上传,需要用flash
        if (isBlank(object.uploader)) object.uploader = basePath + "/fileUpload";
        object.swf = basePath + '/resources/plugins/uploadify/uploadify.swf';
        if (isBlank(object.fileTypeDesc)) {
            object.fileTypeDesc = '支持的格式：';
        }
        if (isBlank(object.onSelectError)) {
            object.onSelectError = function (file, errorCode, errorMsg) {
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
        }
        if (isBlank(object.onFallback)) {
            object.onFallback = function () {
                swal({
                    title: "缺少Flash插件",
                    type: 'warning',
                    text: "您未安装Flash控件，无法上传文件！请使用Chrome/Firefox/IE10+浏览器，或<a target='_blank' href='https://get.adobe.com/flashplayer/?loc=cn'>点此</a>安装FLASH控件重启浏览器后重试。",
                    html: true,
                    showConfirmButton: false
                });
            }
        }
        try {
            if (!isBlank(object.selector)) {
                $(object.selector).uploadify(object);
            }
        } catch (e) {
            console.log(e);
        }
    } else {
        //服务器处理url
        if (isBlank(object.uploader)) {
            object.uploadScript = basePath + "/fileUpload";
        } else {
            object.uploadScript = object.uploader;
        }
        //即将上传
        object.onUpload = object.onUploadStart;
        //上传完毕
        object.onUploadComplete = object.onUploadSuccess;
        if (isNotBlank(object.fileTypeExts)) {
            object.fileType = tool.extensionToContentTypes(object.fileTypeExts);
        }
        if (isBlank(object.onFallback)) {
            object.onFallback = function () {
                // tool.alertWarning("您未安装FLASH控件，无法上传文件！请安装FLASH控件后再试。");
            }
        }

        try {
            if (!isBlank(object.selector)) {
                $(object.selector).uploadifive(object);
            }
        } catch (e) {
            console.log(e);
        }
    }
};
tool.initPageHeight = function (el) {
    var mainheight = $(el).contents().find('body').height();
    $(el).height(mainheight * 0.8);
};
/**
 * 获取字符串,如果是undefined 返回 ""
 * @param str
 * @returns {*}
 */
tool.getString = function (str) {
    if (isBlank(str)) {
        str = "";
    }
    return str;
};
tool.initFileIcon = function () {
    $('i[data-file-name]').each(function () {
        $(this).addClass(tool.getFieIcon($(this).attr('data-file-name')))
    });
};
/**
 * 固定表头/列
 * @param selector 选择器
 * @param config 配置
 */
tool.fixerTableBySelector = function (selector, config) {
    tool.fixerTable($(selector), config);
}
/**
 * 固定表头/列
 * @param $el jquery对象
 * @param config 配置
 */
tool.fixerTable = function ($el, config) {
    var $parent = $el.parent();
    if ($parent.hasClass('fixer')) {
        // //获取表格高度,更改容器高度
        // $parent.css({
        //     height: $el.height() + 10
        // });
        try {
            //如果配置为空,则取table[data-col]
            if (config == null) {
                if ($el.attr('data-left') != null && $el.attr('data-left') != '') {
                    config = {
                        left: $el.attr('data-left')
                    }
                }
            }
            $el.tableHeadFixer(config);
        } catch (e) {
            console.warn('固定表头 > 方法tableHeadFixer不存在,请检查是否引入tableHeadFixer.js');
        }
    } else {
        console.warn('固定表头 > 未找到父元素.fixer');
    }
}
/**
 * 根据文件名获取文件字体库图标
 * @param filename
 * @returns {string}
 */
tool.getFileIcon = function (filename) {
    var temp = filename.substr(filename.indexOf('.') + 1, filename.length);
    temp = temp.toLowerCase();
    if (temp == 'txt') {//文本
        return 'fa-file-text-o';
    } else if (temp == 'zip' || temp == 'rar') {//压缩文件
        return 'fa-file-zip-o';
    } else if (temp == 'mp3' || temp == 'aac' || temp == 'wav' || temp == 'wma' || temp == 'cda' || temp == 'flac' || temp == 'm4a' || temp == 'mid' ||
        temp == 'mka' || temp == 'mp2' || temp == 'mpa' || temp == 'mpc' || temp == 'ape' || temp == 'ofe' || temp == 'ofr' || temp == 'ogg' || temp == 'r4' ||
        temp == 'wv' || temp == 'tta' || temp == 'ac3' || temp == 'dts') {//音频
        return 'fa-file-audio-o';
    } else if (temp == 'avi' || temp == 'asf' || temp == 'wmv' || temp == 'avs' || temp == 'flv' || temp == 'mkv' || temp == 'mov' || temp == '3gp' ||
        temp == 'mp4' || temp == 'mpeg' || temp == 'dat' || temp == 'ogm' || temp == 'vob' || temp == 'rm' || temp == 'rmvb' || temp == 'ts' || temp == 'tp' ||
        temp == 'ifo' || temp == 'nsv') {//视频
        return 'fa-file-movie-o';
        //BMP、JPG、JPEG、PNG、GIF
    } else if (temp == 'bmp' || temp == 'jpg' || temp == 'jpeg' || temp == 'png' || temp == 'gif') {//图片
        return 'fa-file-image-o';
    } else if (temp == 'xml') {
        return 'fa-file-excel-o';
    } else if (temp == 'pdf') {
        return 'fa-file-pdf-o';
    } else if (temp == 'docx' || temp == 'doc' || temp == 'dot' || temp == 'docm') {
        return 'fa-file-word-o';
    } else if (temp == 'xlsx' || temp == 'xls') {
        return 'fa-file-excel-o';
    } else if (temp == 'pptx' || temp == 'ppt' || temp == 'pot') {
        return 'fa-file-powerpoint-o';
    } else if (temp == 'java' || temp == 'css' || temp == 'js' || temp == 'html' || temp == 'php') {
        return 'fa-file-code-o';
    } else {
        return 'fa-file';
    }
};
/**
 * 获取指定长度的字符串
 * @param str 原字符串
 * @param length 长度
 * @param suffix 后缀
 */
tool.getSpecifiedLengthString = function (str, length, suffix) {
    if (str != null && str != '') {
        if (str.length > length) {
            str = str.substring(0, length) + suffix;
        }
    }
    return str;
}
subPage = {
    /**
     * 子页面关闭回调函数
     * 如需要,请在页面重写,每次子页面关闭将重置
     */
    closeCallback: function () {
    },
    /**
     * 保存之后的回调函数
     * @param data 保存结果
     * @param $form_element 表单对象
     */
    save_callback: function (data, $form_element) {
    },
    lc_callback: function (el, data) {

    }
};
var codes = new Map();

function initselectcode(e) {
    //数据字典
    if (isBlank(e)) {
        e = $(document);
    }
    e.find('select[class*="select2-code"]').each(function () {
        if ($(this).attr('isload') != 'true') {
            var val = $(this).attr('value');
            var htm = codes.get($(this).attr('zdlb') + '_code_html', val, 'option');
            $(this).html('<option value="">请选择</option>' + htm);
            $(this).change();
            $(this).attr('isload', 'true');
            initSelect($(this));
        }
    });

    //解析select值显示
    $('.select2-code-name, .code-name').each(function () {
        var val = $(this).html().replace(' ', '');
        var objname = codes.get_name($(this).attr('zdlb') + '_code_html', val);
        $(this).html(objname).removeClass('select2-code-name').removeClass('code-name');
    });
}

//根据上级查下级
function code_subtype(subtype, tt) {
    if ($(tt).val() == '') {
        $('#' + subtype).html('<option value=""></option>');
    } else {
        var htm = codes.get_auto($(tt).attr('zdlb') + '_code_html', $('#' + subtype).attr('value'), $(tt).val(), 'option');
        $('#' + subtype).html('<option value=""></option>' + htm);
        $('#' + subtype).change();
    }

}

//封装Map对象
function Map() {
    var struct = function (key, id, value) {
        this.key = key;
        this.id = id;
        this.value = value;
    }

    var put = function (key, id, value) {
        for (var i = 0; i < this.arr.length; i++) {
            if (this.arr[i].key === key) {
                this.arr[i].id = id;
                this.arr[i].value = value;
                return;
            }
        }
        this.arr[this.arr.length] = new struct(key, id, value);
    }

    //获取一个数据字典的所有数据  并放到标签【tag】中
    var get = function (key, val, tag) {
        var htm = '';
        for (var i = 0; i < this.arr.length; i++) {
            if (this.arr[i].key.indexOf(key) == 0) {
                if (val == this.arr[i].id) htm += '<' + tag + ' value="' + this.arr[i].id + '" selected="selected">' + this.arr[i].value + '</' + tag + '>';
                else htm += '<' + tag + ' value="' + this.arr[i].id + '">' + this.arr[i].value + '</' + tag + '>';
            }
        }
        return htm;
    }
    /**
     * 根据字典类别获取字典列表
     * @param zdlb 字典类别
     * @returns {Array} 数组
     */
    var getSysCodeByZdlb = function (zdlb) {
        var sysCode = [];
        for (var i = 0; i < this.arr.length; i++) {
            if (this.arr[i].key.indexOf(zdlb) == 0) {
                sysCode.push(this.arr[i]);
            }
        }
        return sysCode;
    }

    //获取一个数据字典的值以【auto】开头的所有数据  并放到标签【tag】中
    var get_auto = function (key, val, auto, tag) {
        var htm = '';
        for (var i = 0; i < this.arr.length; i++) {
            if (this.arr[i].key.indexOf(key) == 0 && this.arr[i].id.indexOf(auto) == 0) {
                if (val == this.arr[i].id) htm += '<' + tag + ' value="' + this.arr[i].id + '" selected="selected">' + this.arr[i].value + '</' + tag + '>';
                else htm += '<' + tag + ' value="' + this.arr[i].id + '">' + this.arr[i].value + '</' + tag + '>';
            }
        }
        return htm;
    }

    //将字典值【val】转换成name
    var get_names = function (key, val) {
        var a = '';
        for (var i = 0; i < this.arr.length; i++) {
            if (this.arr[i].key.indexOf(key) == 0 && val.indexOf(',' + this.arr[i].id + ',') != -1) {
                a += this.arr[i].value + ',';
            }
        }
        return a;
    }

    //将字典值【val】转换成name
    var get_name = function (key, val) {
        var a = '';
        for (var i = 0; i < this.arr.length; i++) {
            if (this.arr[i].key.indexOf(key) == 0 && val == this.arr[i].id) {
                a = this.arr[i].value;
                break;
            }
        }
        return a;
    }

    var get_name_key = function (key) {
        var a = '';
        for (var i = 0; i < this.arr.length; i++) {
            if (this.arr[i].key == key) {
                a = this.arr[i].value;
                break;
            }
        }
        return a;
    }
    var get_id_key = function (key) {
        var a = '';
        for (var i = 0; i < this.arr.length; i++) {
            if (this.arr[i].key == key) {
                a = this.arr[i].id;
                break;
            }
        }
        return a;
    }

    var remove = function (key) {
        var v;
        for (var i = 0; i < this.arr.length; i++) {
            v = this.arr.pop();
            if (v.key === key) {
                continue;
            }
            this.arr.unshift(v);
        }
    }

    var getsize = function (key) {
        var a = 0;
        for (var i = 0; i < this.arr.length; i++) {
            if (this.arr[i].key.indexOf(key) == 0) {
                a++;
            }
        }
        return a;
    }
    var getkey = function () {
        var a = '';
        for (var i = 0; i < this.arr.length; i++) {
            var key = this.arr[i].key;
            key = key.substring(0, key.indexOf('_code_html'));
            if (a.indexOf(key) == -1) {
                a += key + ',';
            }
        }
        return a;
    }
    var getallkey = function () {
        var a = new Array();
        for (var i = 0; i < this.arr.length; i++) {
            a[i] = this.arr[i].key;
        }
        return a;
    }

    var size = function () {
        return this.arr.length;
    }

    var isEmpty = function () {
        return this.arr.length <= 0;
    }

    this.arr = new Array();
    this.get = get;
    this.get_auto = get_auto;
    this.get_name = get_name;
    this.get_names = get_names;
    this.getkey = getkey;
    this.get_name_key = get_name_key;
    this.get_id_key = get_id_key;
    this.getallkey = getallkey;
    this.getsize = getsize;
    this.put = put;
    this.remove = remove;
    this.size = size;
    this.isEmpty = isEmpty;
    this.getSysCodeByZdlb = getSysCodeByZdlb;
}

function isFunction(fn) {
    return Object.prototype.toString.call(fn) === '[object Function]';
}