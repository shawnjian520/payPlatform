<%@page import="com.jd.system.util.LoginUtil" %>
<%@ page language="java" pageEncoding="UTF-8" %> 
<%@include file="../../common/input-header.jsp" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<div class="col-md-10 col-md-offset-1">
    <div class="panel panel-white">
        <div class="panel-heading">
            <h4 class="panel-title" data-localize="frame_xtgl.mmxg_mmxg">密码修改</h4>
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
            <form class="form-horizontal" data-action="<%=basePath%>s/id/idUser/savePwd">
                <input type="hidden" id="is_change" value="0">
                <input type="hidden" id="userid" name="userid" value="${object.userid}">
                <input type="hidden" id="lastlogin" name="lastlogin" value="${object.lastlogin}">
                <div class="form-group">
                    <label class="control-label col-sm-3">
                        <font data-localize="frame_xtgl.mmxg_yhm"><b>用户名</b></font>：
                    </label>

                    <span class="control-value col-sm-9">
                        ${object.userloginid }
                    </span>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-3">
                        <font data-localize="frame_xtgl.mmxg_mm"><b>原密码</b></font>：
                    </label>

                    <div class="col-sm-4">
                        <input type="text" id="oldpwd" name="oldpwd" class="form-control validate[required]">
                        <span class="symbol required"></span>
                    </div>
                    <span class="help-inline col-sm-5"> <i class="fa fa-info-circle"></i> 输入您正在使用的密码，用于确认您的身份！ </span>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-3">
                        <font data-localize="frame_xtgl.mmxg_mm"><b>新密码</b></font>：
                    </label>

                    <div class="col-sm-4">
                        <input type="password" id="userpwd" name="userpwd" title="至少要包含数字，英文，特殊字符中的两种，长度6到20位!"
                               class="form-control validate[required,minSize[6],maxSize[20],method[subPage.equalpwd('userpwd')]">
                        <span class="symbol required"></span>
                    </div>
                    <span class="help-inline col-sm-5"> <i class="fa fa-info-circle"></i> 输入您要修改的新密码！ </span>
                </div>

                <div class="form-group">
                    <label class="control-label col-sm-3"></label>
                    <div class="col-sm-9">
                        <div id="tips">
                            <span></span><span></span><span></span><span></span>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-sm-3">
                        <font data-localize="frame_xtgl.mmxg_cxsrmm"><b>确认新密码</b></font>：
                    </label>

                    <div class="col-sm-4">
                        <input type="password" id="reuserpwd" title="至少要包含数字，英文，特殊字符中的两种，长度6到20位!"
                               class="form-control validate[required,minSize[6],maxSize[20],method[subPage.equalpwd('reuserpwd')]]">
                        <span class="symbol required"></span>
                    </div>
                    <span class="help-inline col-sm-5"> <i class="fa fa-info-circle"></i> 请再输入一次新的密码用于确认！ </span>
                </div>
                <div class="form-group">
                    <div class="col-sm-12 frame-btn-group">
                        <button class="btn btn-sm btn-success" type="button" onclick="subPage.saveUserInfo(this)">
                            <font data-localize="frame_button.save">保存</font> <i class="fa fa-check"></i>
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <%@include file="../../common/input-bottom.jsp" %>
    <script>
        var deltitle = '';
        var errtip = '';
        function getCookie(name)//取cookies函数
        {
            var arr = document.cookie.match(new RegExp("(^| )" + name + "=([^;]*)(;|$)"));
            if (arr != null) return unescape(arr[2]);
            return null;
        }
        var cookielang = getCookie("jdLanguage");
        if (cookielang == "en") {
            deltitle = 'Passwords are not consistent';
            errtip = 'Operation failed, please try again!';
        } else {
            deltitle = '2次输入密码不一致';
            errtip = '操作失败,请重试!';
        }
        subPage = {
            equalpwd: function (id) {
                if (checkStrong(document.getElementById(id).value) < 2) {
                    return "密码强度过低，至少要包含数字，英文，特殊字符中的两种，长度6到20位!";
                }
                var userpwd = $('#userpwd').val();
                var reuserpwd = $('#reuserpwd').val();
                if (userpwd != null && userpwd != '' && reuserpwd != null && reuserpwd != '' && userpwd != reuserpwd) {
                    return deltitle;
                }
                if (userpwd == reuserpwd) {
                    if (id == 'userpwd' && $('#reuserpwd').parent().find('div').hasClass('formError')) {
                        $('#reuserpwd').parent().find('div.formError').remove();
                    } else if ($('#userpwd').parent().find('div').hasClass('formError')) {
                        $('#userpwd').parent().find('div.formError').remove();
                    }
                }
                return '';
            },
            saveUserInfo: function (el) {
                var form_element = $(el).parents(".form-horizontal");
                if (form_element.validationEngine('validate')) {
                    $.ajax({
                        url: tool.initParams(form_element.attr("data-action")),
                        cache: false,
                        type: "post",
                        data: form_element.serialize(),
                        timeout: 1000 * 10,
                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                            tool.alertWarning(errtip);
                        },
                        success: function (data) {
                            data = eval('(' + data + ')');
                            if (data.res) {
                                tool.alertSuccess(data.msg);
                                parent.closePass();
                            } else {
                                tool.alertWarning(data.msg);
                            }
                        }
                    });
                }
            }
        }


        $(document).ready(function () {
            var pwd = '${object.userpwd}';
            if (pwd != null && pwd != '') {
                parent.document.getElementById('pwd').value = pwd;
            }
            var oTips = document.getElementById("tips");
            var oInput = document.getElementById("userpwd");
            var aSpan = oTips.getElementsByTagName("span");
            var aStr = ["弱", "中", "强", "非常好"];
            var i = 0;
            oInput.onkeyup = oInput.onfocus = oInput.onblur = function () {
                var index = checkStrong(this.value);
                //this.className = index ? "form-control " : "form-control ";
                oTips.className = "s" + index;
                for (i = 0; i < aSpan.length; i++)
                    aSpan[i].className = aSpan[i].innerHTML = "";
                if (index == 4) {
                    index && (aSpan[index - 1].className = "active", aSpan[index - 1].innerHTML = aStr[index - 1]);
                    index && (aSpan[index - 2].className = "active", aSpan[index - 2].innerHTML = aStr[index - 2]);
                    index && (aSpan[index - 3].className = "active", aSpan[index - 3].innerHTML = aStr[index - 3]);
                    index && (aSpan[index - 4].className = "active", aSpan[index - 4].innerHTML = aStr[index - 4]);
                } else if (index == 3) {
                    index && (aSpan[index - 1].className = "active", aSpan[index - 1].innerHTML = aStr[index - 1]);
                    index && (aSpan[index - 2].className = "active", aSpan[index - 2].innerHTML = aStr[index - 2]);
                    index && (aSpan[index - 3].className = "active", aSpan[index - 3].innerHTML = aStr[index - 3]);
                } else if (index == 2) {
                    index && (aSpan[index - 1].className = "active", aSpan[index - 1].innerHTML = aStr[index - 1]);
                    index && (aSpan[index - 2].className = "active", aSpan[index - 2].innerHTML = aStr[index - 2]);
                } else if (index == 1) {
                    index && (aSpan[index - 1].className = "active", aSpan[index - 1].innerHTML = aStr[index - 1]);
                }
            };
        });

        function checkStrong(sValue) {
            var modes = 0;
            if (sValue.length == 0)
                return 0;
            if (sValue.length < 6)
                return 1;
            if (/\d/.test(sValue))
                modes++;
            //数字
            if (/[a-z]/.test(sValue))
                modes++;
            //小写
            if (/[A-Z]/.test(sValue))
                modes++;
            //大写
            if (/\W/.test(sValue))
                modes++;
            //特殊字符
            switch (modes) {
                case 1:
                    return 1;
                    break;
                case 2:
                    return 2;
                case 3:
                case 4:
                    return sValue.length < 12 ? 3 : 4;
                    break;
            }
        }

    </script>
    <style type="text/css">
        #tips {
            float: left;
        }

        #tips span {
            float: left;
            width: 50px;
            height: 30px;
            color: #fff;
            overflow: hidden;
            background: #ccc;
            margin-right: 3px;
            line-height: 30px;
            text-align: center;
        }

        #tips.s1 .active {
            background: #f30;
        }

        #tips.s2 .active {
            background: #fc0;
        }

        #tips.s3 .active {
            background: #cc0;
        }

        #tips.s4 .active {
            background: #090;
        }
    </style>
</div>
