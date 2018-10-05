var subPagepro = {
    demo: null,
    basePath: '',
    isline: false,
    isnode: false,
    left: 0,
    top: 0,
    type: '',
    addData: function (el) {
        $('#tab1').addClass('hide');
        subPagepro.isline = true;
        subPagepro.isnode = false;
        subPagepro.showwrt();
        $('#newinput').find('.form-group').find('input').val('');
        $('#newinput').find('.form-group').find('select').val('').trigger("change");
        $('#form0').addClass('hide');
        $('#form1').removeClass('hide');
        $('#form2').addClass('hide');
    },
    save: function () {
        if (subPagepro.isnode)  subPagepro.savenode();
        else if (!subPagepro.isline) subPagepro.saveData_group();
        else subPagepro.saveData();
    },
    remove: function () {
        tool.alertConfirm('确定要删除该节点吗？', '删除的数据将无法恢复，请核实后再操作！', function () {
            if (!subPagepro.isline) subPagepro.removeData_group();
            else subPagepro.removeData();
        });

    },
    saveData: function (el) {
        if ($('#form1').validationEngine('validate')) {
            if ($('#groupFs').val() == $('#groupJs').val()) {
                tool.alertWarning('开始和当前节点不能一样');
                return false;
            }
            tool.openloading(null, '保存中...');
            $.post(tool.initParams(subPagepro.basePath + '/s/biz/process/savepro'), $('#form1').serialize(), function (data) {
                data = eval("(" + data + ")");
                if (data.res) {
                    tool.alertSuccess(data.msg);
                    if ($('#wid').val() == '') {
                        $('#groupFs').append('<option value="' + data.data.groupJs + '">' + $('#groupJs').find('option[value="' + data.data.groupJs + '"]').html() + '</option>');
                    }
                    subPagepro.initpro();
                } else {
                    tool.alertWarning(data.msg);
                }
                tool.closeloading();
            });
        }
    },

    saveData_group: function (el) {
        if ($('#form2').validationEngine('validate')) {
            tool.openloading(null, '保存中...');
            $.post(tool.initParams(subPagepro.basePath + '/s/biz/process/savepro_group'), $('#form2').serialize(), function (data) {
                data = eval("(" + data + ")");
                if (data.res) {
                    //$('#wid').val(data.data.wid);
                    subPagepro.initpro();
                }
                tool.alertSuccess(data.msg);
                tool.closeloading();
            });
        }
    },
    editData: function (groupJs) {
        subPagepro.isline = false;
        subPagepro.isnode = false;
        groupJs = groupJs.split('_')[1];
        var lcid = $('#lcid').val();
        $.post(tool.initParams(subPagepro.basePath + '/s/biz/process/getpro_group'), {
            'groupJs': groupJs,
            'lcid': lcid
        }, function (data) {
            data = eval("(" + data + ")");
            if (data.res) {
            	if ($(data.data_users).length > 0) {
            		var htm = '<select name="userid" id="userid"><option value=""></option>';
            		$(data.data_users).each(function (i) {
            			if(data.data[0].userid==data.data_users[i].id)
            				htm += '<option selected="selected" value="'+data.data_users[i].id+'">'+data.data_users[i].caption+'</option>';
            			else
            				htm += '<option value="'+data.data_users[i].id+'">'+data.data_users[i].caption+'</option>';
            		});
            		htm += '</select>';
            		$('#userid_div').parent().removeClass('hide');
            		$('#userid_div').html(htm);
            		initSelect($('#userid'));
            	}else{
            		$('#userid_div').html('');
            		$('#userid_div').parent().addClass('hide');
            	}
                if ($(data.data).length > 1) {
                    var htm = '';
                    $(data.data).each(function (i) {
                        htm += '<label class="radio-inline"><input ztWcl="' + data.data[i].ztWcl + '" ' +
                            ' ztShtg="' + data.data[i].ztShtg + '"' +
                            ' wid="' + data.data[i].wid + '"' +
                            ' ztZf="' + data.data[i].ztZf + '"' +
                            ' ztShh="' + data.data[i].ztShh + '"' +
                            ' auto_th="' + data.data[i].auto_th + '"' +
                            ' auto_sb="' + data.data[i].auto_sb + '"' +
                            ' jdzt="' + data.data[i].jdzt + '"' +
                            ' ztShth="' + data.data[i].ztShth + '"' +
                            ' list_url="' + data.data[i].list_url + '"' +
                            ' param="' + data.data[i].param + '"' +
                            ' glzd="' + data.data[i].glzd + '"' +
                            ' groupFs="' + data.data[i].groupFs + '"' +
                            ' type="radio" name="tab2" class="mgr tab2" value="' + i + '"/>' + data.data[i].groupname + '</label><br/> ';
                    });
                    $('#tab2').find('div').html(htm);
                    $('#tab2').find('input[name*="tab2"][value="0"]').prop("checked", true);
                    // tool.initiCheck($('.tab2'));
                    $('#tab2').removeClass('hide');
                    $('input[name*="tab2"]').click(function() {
                        if (this.checked) {
                            $('#wid2').val($(this).attr('wid'));
                            $('#ztWcl').val($(this).attr('ztWcl')).trigger("change");
                            $('#ztShtg').val($(this).attr('ztShtg')).trigger("change");
                            $('#ztZf').val($(this).attr('ztZf')).trigger("change");
                            $('#ztShh').val($(this).attr('ztShh')).trigger("change");
                            $('#ztShth').val($(this).attr('ztShth')).trigger("change");
                            $('input[name*="auto_th"][value="' + $(this).attr('auto_th') + '"]').prop("checked", true);
                            $('input[name*="auto_sb"][value="' + $(this).attr('auto_sb') + '"]').prop("checked", true);
                            $('input[name*="jdzt"][value="' + $(this).attr('jdzt') + '"]').prop("checked", true);
                            $('#list_url').val($(this).attr('list_url'));
                            $('#glzd').val($(this).attr('glzd'));
                            $('#param').val($(this).attr('param'));
                            if ($(this).attr('groupFs') == null || $(this).attr('groupFs') == '') {
                                $('#ztZf').parent().prev('label').html('取消状态：');
                            } else {
                                $('#ztZf').parent().prev('label').html('作废状态：');
                            }
                        }
                    });
                    // $('input[name*="tab2"]').on('ifChecked', function (event) {});
                } else {
                    $('#tab2').addClass('hide');
                }

                subPagepro.showwrt();
                $('#wid2').val(data.data[0].wid);
                $('#ztWcl').val(data.data[0].ztWcl).trigger("change");
                $('#ztShtg').val(data.data[0].ztShtg).trigger("change");
                $('#ztZf').val(data.data[0].ztZf).trigger("change");
                $('#ztShh').val(data.data[0].ztShh).trigger("change");
                $('input[name*="auto_th"][value="' + data.data[0].auto_th + '"]').prop("checked", true);
                $('input[name*="auto_sb"][value="' + data.data[0].auto_sb + '"]').prop("checked", true);
                $('input[name*="jdzt"][value="' + data.data[0].jdzt + '"]').prop("checked", true);
                $('#ztShth').val(data.data[0].ztShth).trigger("change");
                $('#list_url').val(data.data[0].list_url);
                $('#param').val(data.data[0].param);
                $('#glzd').val(data.data[0].glzd);
                $('#form0').addClass('hide');
                $('#form1').addClass('hide');
                $('#form2').removeClass('hide');
                if (data.data[0].groupFs == null || data.data[0].groupFs == '') {
                    $('#ztZf').parent().prev('label').html('取消状态：');
                    $('#list_url2').parent().parent().css('display', '');
                } else {
                    $('#ztZf').parent().prev('label').html('作废状态：');
                    $('#list_url2').parent().parent().css('display', 'none');
                }
            } else {
                tool.alertWarning(data.msg);
            }
        });
    },
    editData_line: function (wid) {
        subPagepro.isline = true;
        subPagepro.isnode = false;
        wid = wid.split('_')[1];
        $.post(tool.initParams(subPagepro.basePath + '/s/biz/process/getpro'), {'wid': wid}, function (data) {
            data = eval("(" + data + ")");

            if (data.res) {
                if ($(data.data).length > 1) {
                    var htm = '';
                    $(data.data).each(function (i) {
                        htm += '<label class="radio-inline"><input groupJs="' + data.data[i].groupJs + '" ' +
                            ' groupFs="' + data.data[i].groupFs + '"' +
                            ' wid="' + data.data[i].wid + '"' +
                            ' type="radio" name="tab1" class="mgr tab1" value="' + i + '"/>' + data.data[i].groupname + '</label><br/> ';
                    });
                    $('#tab1').find('div').html(htm);
                    $('#tab1').find('input[name*="tab1"][value="0"]').prop("checked", true);
                    // tool.initiCheck($('.tab1'));
                    $('#tab1').removeClass('hide');
                    $('input[name*="tab1"]').click(function() {
                        if (this.checked) {
                            $('#wid').val($(this).attr('wid'));
                            $('#groupJs').val($(this).attr('groupJs')).trigger("change");
                            $('#groupFs').val($(this).attr('groupFs')).trigger("change");
                        }
                    });
                } else {
                    $('#tab1').addClass('hide');
                }
                subPagepro.showwrt();
                $('#wid').val(data.data[0].wid);
                $('#groupJs').val(data.data[0].groupJs).trigger("change");
                $('#groupFs').val(data.data[0].groupFs).trigger("change");
                $('#form0').addClass('hide');
                $('#form1').removeClass('hide');
                $('#form2').addClass('hide');
            } else {
                tool.alertWarning(data.msg);
            }
        });
    },
    removeData: function (el) {
        var wid = $('#wid').val();
        tool.openloading(null, '删除中...');
        $.post(tool.initParams(subPagepro.basePath + '/s/biz/process/removepro'), {'wid': wid}, function (data) {
            data = eval('(' + data + ')');
            if (data.res) {
                subPagepro.initpro();
            } else {
                tool.alertWarning(data.msg);
            }
            tool.closeloading();
        });
    },
    removeData_group: function (el) {
        var wid = $('#wid2').val();
        tool.openloading(null, '删除中...');
        $.post(tool.initParams(subPagepro.basePath + '/s/biz/process/removepro_group'), {'wid': wid}, function (data) {
            data = eval('(' + data + ')');
            if (data.res) {
                subPagepro.initpro();
            } else {
                tool.alertWarning(data.msg);
            }
            tool.closeloading();
        });
    },
    initpro: function () {
        var nr_height = height - 50;
        if (nr_height < 450) nr_height = 450;
        $.post(tool.initParams(subPagepro.basePath + '/s/biz/process/initlct'), {'wid': $('#lcid').val()}, function (data) {
            $("#demo").html('');
            subPagepro.demo = $.createGooFlow($("#demo"), property);
            subPagepro.demo.setNodeRemarks(remark);
            subPagepro.demo.loadData(eval("(" + data + ")"));
            $('#draw_demo').parent().css({'height': nr_height, 'width': width - 65});
            $('#draw_demo').css({'height': nr_height, 'width': width - 65});
            $('.GooFlow_work').css({'width': width - 44, 'margin': '0'});
            subPagepro.closewrt();
        });

    },
    move: function (id, left, top) {
        var lcid = $('#lcid').val();
        $.post(tool.initParams(subPagepro.basePath + '/s/biz/process/savemove'), {
            'groupJs': id,
            'left': left,
            'top': top,
            'lcid': lcid
        }, function (data) {

        });
    },
    editnode: function (left, top, type) {
        subPagepro.isnode = true;
        subPagepro.showwrt();
        $('#form0').removeClass('hide');
        $('#form1').addClass('hide');
        $('#form2').addClass('hide');
        subPagepro.left = left;
        subPagepro.top = top;
        subPagepro.type = type;
    },
    savenode: function () {
        var lcid = $('#lcid').val();
        var groupJs = $('#groupJs0').val();
        var groupFs = null;
        if (subPagepro.type.indexOf('task') != -1) groupFs = 'new';
        tool.openloading(null, '生成中...');
        $.post(tool.initParams(subPagepro.basePath + '/s/biz/process/savenode'), {
            'groupFs': groupFs,
            'groupJs': groupJs,
            'left': subPagepro.left,
            'top': subPagepro.top,
            'lcid': lcid
        }, function (data) {
            data = eval("(" + data + ")");
            if (data.res) {
                subPagepro.initpro();
            } else {
                tool.alertWarning(data.msg);
            }
            tool.closeloading();
        });
    },
    saveline: function (groupFs, groupJs) {
        var lcid = $('#lcid').val();
        tool.openloading(null, '生成中...');
        $.post(tool.initParams(subPagepro.basePath + '/s/biz/process/saveline'), {
            'groupFs': groupFs,
            'groupJs': groupJs,
            'lcid': lcid
        }, function (data) {
            data = eval("(" + data + ")");
            if (data.res) {
                subPagepro.initpro();
            } else {
                tool.alertWarning(data.msg);
            }
            tool.closeloading();
        });
    },
    closewrt: function () {
        $('.wrt').addClass('hide');
        $('.GooFlow_head').find('.ico_save').parent().addClass('hide');
        $('.GooFlow_head').find('.ico_close').parent().addClass('hide');
        $('.GooFlow_head').find('.ico_cancel').parent().addClass('hide');
    },
    showwrt: function () {
        $('.wrt').removeClass('hide');
        $('.GooFlow_head').find('.ico_save').parent().removeClass('hide');
        if (isadmin) $('.GooFlow_head').find('.ico_close').parent().removeClass('hide');
        $('.GooFlow_head').find('.ico_cancel').parent().removeClass('hide');
    }
};