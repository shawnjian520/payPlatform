/**
 * 框架js,tool为系统变量,请勿在其他页面者重新初始化
 * Created by tengchong on 15/7/21.
 */
/**
 * page 二级页面对象,切换菜单将重新初始化
 * subPage 三级页面对象,切换菜单将重新初始化
 * @type {{}}
 */
var page = {},
    subPage = {};
var subview_id = [];
var jsonlanguagemain = null;
var cookielang = null;
/**
 * tool 工具对象
 * @type {{hideMenu: null, choseLeftStageMenu: string, choseTopStageMenu: string, leftStageMexnuList: Array, menuList: Array, res_form: null, configDebug: boolean, userloginid: null, usertype: null, waitForResponseStatusBtn: null, procee: string, exportData: tool.exportData, exportSuccess_time: number, exportSuccess_c: number, exportSuccess: tool.exportSuccess, exportDataForDbf: tool.exportDataForDbf, exportDataByForm: tool.exportDataByForm, openSubview: tool.openSubview, previewImage: tool.previewImage, previewImageUrl: tool.previewImageUrl, report: tool.report, report_s: tool.report_s, report_all: tool.report_all, report_open: tool.report_open, report_open_input: tool.report_open_input}}
 */
var tool = {
    hideMenu: null,
    choseLeftStageMenu: '1',
    choseTopStageMenu: '1',
    leftStageMenuList: [],
    res_form: null,
    configDebug: true,
    userloginid: null,
    usertype: null,//用户操作权限
    waitForResponseStatusBtn: null,
    procee: '/traffic/',
    /**
     * 在iframe中打开导出页面
     * @param par 地址+参数 | 不可为空
     */
    exportData: function (par, path, filep) {
    	if (path == null || path == '') path = basePath;
        tool.openloading(null, '下载中，请等待...');
        var nomodal=true;
        var jsp =par;
        if(par.indexOf('.jsp')!=-1){
        	 jsp = par.substring(0, par.indexOf('.jsp') + 4);
        	 nomodal=false;
        } 
        
        var tj = '';
        if (par.indexOf('?') != -1) {
            tj = par.substring(par.indexOf('?') + 1);
        }

        var form = $("<form>");        //定义一个form表单
        if (document.getElementById('exportDataForm')) {
            form = $('#exportDataForm');
        } else {
            $("body").append(form); //将表单放置在web中
        }
        form.attr("id", "exportDataForm");        //表单默认隐藏
        form.attr("style", "display:none");        //表单默认隐藏
        form.attr("method", "post");

        form.attr("action", path + "/"+filep+"/" + jsp);        //后台路径
        form.find('input').remove();
        var param = '';
        if (tj != '') {
            var tjarr = tj.split('&');
            for (var i = 0; i < tjarr.length; i++) {
                var op = tjarr[i].split('=');
                var input = $("<input>");        //定义agreementid的input
                input.attr("type", "hidden");        //默认隐藏
                input.attr("name", op[0].trim());
                input.attr("value", op[1].trim());
                form.append(input);
                if(param!='') param += "!@#";
                param += op[1].trim();
            }
        }
        $.post(basePath + '/s/ajax/getnownew', {'param':param}, function (data) {
            var inputnew = $("<input>");        //定义agreementid的input
            inputnew.attr("type", "hidden");        //默认隐藏
            inputnew.attr("name", "nownew");
            inputnew.attr("value", data);
            form.append(inputnew);
            form.submit();//表单提交
            tool.exportSuccess_time = 2000;
            tool.exportSuccess_c = 1;
            setTimeout('tool.exportSuccess(\'' + path + '\')', tool.exportSuccess_time);
        });
    },
    exportSuccess_time: 0,
    exportSuccess_c: 0,
    exportSuccess: function (path) {
        if (tool.exportSuccess_time < 10000) tool.exportSuccess_time += 1000;
        tool.exportSuccess_c += 1;
        if (tool.exportSuccess_c >= 50) {
            tool.closeloading(null);
            return false;
        }
        $.post(path + '/s/ajax/exportSuccess', {}, function (data) {
            if (data == 'true') {
                tool.closeloading(null);
            } else {
                setTimeout('tool.exportSuccess(\'' + path + '\')', tool.exportSuccess_time);
            }
        });

    },
    previewImage: function (el) {
        if (el == null || el == '') {
            $('.image-preview img').viewer();
        } else {
            $(el).viewer();
        }
    },
    previewImageUrl: function (url) {
        $('.image-preview').attr('src', url).viewer({
            navbar: false
        }).viewer('show');
    },
    report: function (el, ids, lcbm, type, glzd, con, json, thyj) {
        if (ids == null || ids == '') {
            var form_element = $(el).parents('.form-horizontal');
            var ids = tool.getChoseData(form_element);
            if (ids == null || ids == '') {
                tool.alertConfirm('未选中数据，是否操作所有数据！', '', function () {
                    $.post(tool.initParams(tool.procee + 's/system/ajaxProcess/handle'), {
                        'handleids': 'allid', 'lcbm': lcbm, 'glzd': glzd, 'thyj': thyj,
                        'type': type, 'json': json, 'con': con
                    }, function (data) {
                        setTimeout('tool.alertSuccess("' + data.jsonstr + '")', 100);
                        tool.submitForm($(el).parents('.form-horizontal'));
                        subPage.lc_callback(el, data);
                    });
                });
                return false;
            }
        }

        $.post(tool.initParams(tool.procee + 's/system/ajaxProcess/handle'), {
            'handleids': ids, 'lcbm': lcbm, 'glzd': glzd, 'thyj': thyj,
            'type': type, 'json': json, 'con': con
        }, function (data) {
            setTimeout('tool.alertSuccess("' + data.jsonstr + '")', 100);
            tool.submitForm($(el).parents('.form-horizontal'));
            subPage.lc_callback(el, data);
        });
    },
    report_s: function (el, lcbm, type, glzd, con, json, thyj) {
        tool.report(el, null, lcbm, type, glzd, con, json, thyj);
    },
    report_all: function (el, lcbm, type, glzd, con, json, thyj) {
        tool.report(el, 'allid', lcbm, type, glzd, con, json, thyj);
    },
    report_open: function (el, lcbm, type, glzd, con, json, isreq, tool_ch) {
        if (tool_ch == null) tool_ch = tool;
        swal({
                title: "填写审核意见!",
                text: "请在下面输入框中填写意见，之后点击确定按钮完成审核",
                type: "input",
                showCancelButton: true,
                closeOnConfirm: false,
                animation: "slide-from-top",
                inputPlaceholder: "审核意见"
            },
            function (inputValue) {
                if (inputValue === false) return false;
                if (inputValue === "" && isreq) {
                    swal.showInputError("请先填写意见!");
                    return false
                }
                if (json != null) json = json.replace('$thyj', inputValue);
                tool_ch.report(el, null, lcbm, type, glzd, con, json, inputValue);
            }
        );
    },
    report_open_input: function (el, ids, lcbm, type, glzd, con, json, isreq, tool_ch) {
        if (tool_ch == null) tool_ch = tool;
        swal({
                title: "填写审核意见!",
                text: "请在下面输入框中填写意见，之后点击确定按钮完成审核",
                type: "input",
                showCancelButton: true,
                closeOnConfirm: false,
                animation: "slide-from-top",
                inputPlaceholder: "审核意见"
            },
            function (inputValue) {
                if (inputValue === false) return false;
                if (inputValue === "" && isreq) {
                    swal.showInputError("请先填写意见!");
                    return false
                }
                if (json != null) json = json.replace('$thyj', inputValue);
                tool_ch.report(el, ids, lcbm, type, glzd, con, json, inputValue);
            }
        );
    }
}
/**
 * 初始化语言
 */
function init_lanagure() {
    //var uulanguage = (navigator.language || navigator.browserLanguage).toLowerCase();
    try {
        if (cookielang != "" && cookielang != null) {
            if (cookielang == "zh") {
                $("#ddlSomoveLanguage").val("zh");
                $("[data-localize]").localize("text", {pathPrefix: "lang", language: "zh"});
            }
            if (cookielang == "en") {
                $("#ddlSomoveLanguage").val("en");
                $("[data-localize]").localize("text", {pathPrefix: "lang", language: "en"});
            }
        } else {
            $("[data-localize]").localize("text", {pathPrefix: "lang", language: "zh"});
        }
    } catch (e) {
        // TODO: handle exception
        $("[data-localize]").localize("text", {pathPrefix: "lang", language: "zh"});
    }

}