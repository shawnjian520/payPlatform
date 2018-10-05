var basePath = "";
var returnURL = "";
var compnent_list = new Array("userloginid", "userPawd", "postButton");

/**
 * 防止服务器重启导致JSESSIONID不同
 */
function loadlogin() {
    $('#login').attr('src', basePath + 'photoshow.jsp');
    setTimeout('loadlogin()', 10000);
}
$(function () {
    setTimeout('loadlogin()', 10000);
});
/**
 * ajax登录
 * 1.查询部门信息
 * 2.多个部门提供用户选择,单个直接调用登录
 */
function ajaxLogin() {
    hideErrorInfo();
    $('#login').attr('src', basePath + 'photoshow.jsp');
    var act = $('#act').val();
    var userloginid = $('#userloginid').val();
    var userpwd = $('#userpwd').val();
    if (userloginid == null || userloginid == '') {
        showErrorInfo('用户名不能为空');
        return false;
    }
    if (userpwd == null || userpwd == '') {
        showErrorInfo('密码不能为空');
        return false;
    }
    $('.errorHandler').addClass('hide');
    try {
        if (cookielang != "" && cookielang != null) {
            if (cookielang == "zh") {
                $('#loginbutton').html('<i class="fa fa-circle-o-notch fa-spin"></i> 登录中...');
            }
            if (cookielang == "en") {
                $('#loginbutton').html('<i class="fa fa-circle-o-notch fa-spin"></i> Loading...');
            }

        } else {
            $('#loginbutton').html('<i class="fa fa-circle-o-notch fa-spin"></i> 登录中...');
        }
    } catch (e) {
        $('#loginbutton').html('<i class="fa fa-circle-o-notch fa-spin"></i> 登录中...');
    }

    userloginid = userloginid.replace(/\s+/, '');
    $.ajax({
        url: basePath + '/s/ajax/getuserdepart',
        cache: false,
        type: "post",
        data: 'userloginid=' + userloginid,
        dataType: "json",
        timeout: 1000 * 30,
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            showErrorInfo('网络连接异常！请刷新页面重试。');
        },
        success: function (data) {
            if (data == undefined) {
                showErrorInfo('网络连接异常！请刷新页面重试。');
            } else if (data.length == 0) {
                login_suc();
            } else if (data.length == 1) {
                login_suc();
            } else {
                inithtm(data);
            }
        }
    });
}
/**
 * 执行登录
 * @param userid 用户id
 * @param tag
 */
function login_suc(userid, tag) {
    if (tag == null) tag = false;
    $('#chose-depart-fieldset').addClass('hide');
    $('#login-fieldset').removeClass('hide');
    var userloginid = document.getElementById("userloginid").value;
    userloginid = userloginid.replace(/\s+/, '');
    var userpwd = document.getElementById("userpwd").value;
    var act = $('#act').val();
    var table = $('#table').val();
    if (act == null || act == '') act = 'login';
    var u_v_i_c = '';
    var value = $("#ddlSomoveLanguage").children('option:selected').val();
    if (document.getElementById("yzm")) u_v_i_c = document.getElementById("yzm").value;
    else u_v_i_c = MathRand();
    $.post(basePath + 'identity/ajaxlogin.action', {
        'act': act,
        'userloginid': userloginid,
        'userpwd': encrypt(userpwd, u_v_i_c),
        'tsysUser.userid': userid,
        'u_v_i_c': u_v_i_c,
        'table': table,
        'language': value
    }, function (data) {
        var jsonarray = eval("(" + data + ")");
        var obj = jsonarray;
        if (obj.msg == 'success') {//成功登录
            var returl = $('#returl').val();
            if (returl == null || returl == '') {
                returl = window.location.href.replace('?out=1', '');
            }
            if (returl.indexOf('#') != -1) {
                returl = returl.substring(0, returl.indexOf('#'));
            }
            window.location.href = returl;
        } else {
            if (!tag && obj.msg == '用户名或密码不正确！') {
                login_suc(userid, true);
            } else {
                errortit(obj);
                changeyzm();
            }
        }
    });
}
/**
 * 显示提示信息
 * @param txt 显示文字
 */
function showErrorInfo(txt) {
    $('.alert-danger').html(txt).fadeIn();
}
/**
 * 隐藏提示信息
 */
function hideErrorInfo() {
    $('.alert-danger').fadeOut();
}
/**
 * 返回上层
 */
function backLogin(){
    $('#loginbutton').html('登录');
    $('#login-input').show();
    $('#login-role').hide();
}
function MathRand() {
    var Num = "";
    for (var i = 0; i < 4; i++) {
        Num += Math.floor(Math.random() * 10);
    }
    return Num;
}
function changeyzm() {
    $('#img_u_v_i_c').attr('src', basePath + '/generateImage/u_v_i_c?aaa=' + new Date());
}
eval(function (p, a, c, k, e, r) {
    e = function (c) {
        return c.toString(36)
    };
    if ('0'.replace(0, e) == 0) {
        while (c--)r[e(c)] = k[c];
        k = [function (e) {
            return r[e] || e
        }];
        e = function () {
            return '[679im-w]'
        };
        c = 1
    }
    ;
    while (c--)if (k[c]) p = p.replace(new RegExp('\\b' + e(c) + '\\b', 'g'), k[c]);
    return p
}('function encrypt(g,f){p(f==null||f.7<=0){q g}6 l="";s(6 c=0;c<f.7;c++){l+=f.t(c).i()}6 h=9.u(l.7/5);6 b=n(l.m(h)+l.m(h*2)+l.m(h*3)+l.m(h*4)+l.m(h*5));6 a=9.ceil(f.7/2);6 j=9.pow(2,31)-1;p(b<2){q g}6 d=9.round(9.random()*1000000000)%100000000;l+=d;v(l.7>r){l=(n(l.w(0,r))+n(l.w(r,l.7))).i()}l=(b*l+a)%j;6 e="";6 k="";s(6 c=0;c<g.7;c++){e=n(g.t(c)^9.u((l/j)*255));p(e<o){k+="0"+e.i(o)}else{k+=e.i(o)}l=(b*l+a)%j}d=d.i(o);v(d.7<8){d="0"+d}k+=d;q k}', [], 33, '||||||var|length||Math|||||||||toString||||charAt|parseInt|16|if|return|10|for|charCodeAt|floor|while|substring'.split('|'), 0, {}))