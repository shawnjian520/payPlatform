var isIE8 = false,
    isIE9 = false,
    inner = $('.main-wrapper > .inner'),
    supportTransition = true,
    closedbar = $('.closedbar'),
    isMobile = false,
    isIEMobile = false,
    $body = $('body'),
    $windowWidth,
    $windowHeight,
    subViews = $('.subviews'),
    sideLeft = $('#pageslide-left'),
    sideRight = $('#pageslide-right'),
    mainNavigation = $('.main-navigation'),
    sidebarWidth = sideLeft.outerWidth(true),
    topBar = $('.topbar'),
    mainContainer = $('.main-container'),
    mainContent = $('.main-content'),
    footer = $('.main-wrapper > footer');
var thisSlider, actualItemWidth, newItemWidth, activeAnimation = false, hoverSideBar = false;
var debug = true;
var selectmenu = '';
var navTimeOut = null;
// Debounce Function
(function ($, sr) {
    'use strict';
    // debouncing function from John Hann
    // http://unscriptable.com/index.php/2009/03/20/debouncing-javascript-methods/
    var debounce = function (func, threshold, execAsap) {
        var timeout;
        return function debounced() {
            var obj = this, args = arguments;

            function delayed() {
                if (!execAsap)
                    func.apply(obj, args);
                timeout = null;
            };

            if (timeout)
                clearTimeout(timeout);
            else if (execAsap)
                func.apply(obj, args);

            timeout = setTimeout(delayed, threshold || 100);
        };
    };
    // smartresize
    jQuery.fn[sr] = function (fn) {
        return fn ? this.on('resize', debounce(fn)) : this.trigger(sr);
    };

})(jQuery, 'espressoResize');

//Main Function
var Main = function () {
    'use strict';
    //function to init app

    var runInit = function () {
        // Detection for IE Version
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
        ;
        // Detection for CSS Transitions Support
        var thisBody = document.body || document.documentElement, thisStyle = thisBody.style;
        supportTransition = thisStyle.transition !== undefined || thisStyle.WebkitTransition !== undefined || thisStyle.MozTransition !== undefined || thisStyle.MsTransition !== undefined || thisStyle.OTransition !== undefined;
        // active perfectScrollbar only in desktop devices
        if ($body.hasClass('isMobile') == false && mainNavigation.length) {
            mainNavigation.perfectScrollbar({
                wheelSpeed: 50,
                minScrollbarLength: 20,
                suppressScrollX: true
            });
            $('.right-wrapper').perfectScrollbar({
                wheelSpeed: 50,
                minScrollbarLength: 20,
                suppressScrollX: true
            });

        }
        // clones the horizontal menu and inserts it into left sidebar for mobile devices
        if ($('#horizontal-menu').length) {
            if ($('.main-navigation-menu').length) {
                $('#horizontal-menu').find('.nav').clone().removeClass('nav navbar-nav').addClass('main-navigation-menu core-menu').find('li.dropdown').removeClass('dropdown').find('a').removeClass('dropdown-toggle').removeAttr('data-toggle').end().end().find('ul.dropdown-menu').removeClass('dropdown-menu').addClass('sub-menu').end().addClass('hidden-md hidden-lg').insertBefore('.main-navigation-menu');
            } else if ($('.user-profile').length) {
                $('#horizontal-menu').find('.nav').clone().removeClass('nav navbar-nav').addClass('main-navigation-menu core-menu').find('li.dropdown').removeClass('dropdown').find('a').removeClass('dropdown-toggle').removeAttr('data-toggle').end().end().find('ul.dropdown-menu').removeClass('dropdown-menu').addClass('sub-menu').end().addClass('hidden-md hidden-lg').insertAfter('.user-profile');
            } else {
                $('#horizontal-menu').find('.nav').clone().removeClass('nav navbar-nav').addClass('main-navigation-menu core-menu').find('li.dropdown').removeClass('dropdown').find('a').removeClass('dropdown-toggle').removeAttr('data-toggle').end().end().find('ul.dropdown-menu').removeClass('dropdown-menu').addClass('sub-menu').end().addClass('hidden-md hidden-lg').prependTo('.main-navigation');
            }

        }

        // set blockUI options
        if ($.blockUI) {
            $.blockUI.defaults.css.border = 'none';
            $.blockUI.defaults.css.padding = '20px 5px';
            $.blockUI.defaults.css.width = '20%';
            $.blockUI.defaults.css.left = '40%';
            $.blockUI.defaults.overlayCSS.backgroundColor = '#DDDDDD';
        }

        // Add Fade Animation to Dropdown
        $('.dropdown').on('show.bs.dropdown', function (e) {
            $(this).find('.dropdown-menu').first().stop(true, true).fadeIn(300);
        });
        $('.dropdown').on('hide.bs.dropdown', function (e) {
            $(this).find('.dropdown-menu').first().stop(true, true).fadeOut(300);
        });

        // change closebar height when footer appear
        if ($.fn.appear) {
            if (isMobile == false) {
                footer.appear();
                footer.on('appear', function (event, $all_appeared_elements) {

                    closedbar.css({
                        bottom: (footer.outerHeight(true) + 1) + 'px'
                    });
                });
                footer.on('disappear', function (event, $all_disappeared_elements) {

                    closedbar.css({
                        bottom: 1 + 'px'
                    });
                });
            }
        }

    };
    //function to get viewport/window size (width and height)
    var viewport = function () {
        var e = window, a = 'inner';
        if (!('innerWidth' in window )) {
            a = 'client';
            e = document.documentElement || document.body;
        }
        return {
            width: e[a + 'Width'],
            height: e[a + 'Height']
        };
    };
    //当用户点击除searchbox, pageslide-left and pageslide-right区域外位置,关闭 searchbox, pageslide-left and pageslide-right
    var documentEvents = function () {
        $('html').click(function (e) {
            if (!e.isDefaultPrevented()) {
                if ($('.search-box').is(':visible')) {
                    $('.search-box').velocity({
                        scale: 0.9,
                        opacity: 0
                    }, 400, 'easeInBack', function () {
                        $(this).hide();
                    });
                }

                if ($body.hasClass('right-sidebar-open') && !hoverSideBar && !isMobile) {
                    $('.sb-toggle-right').trigger('click');
                } else if ($body.hasClass('sidebar-mobile-open') && !hoverSideBar && !isMobile) {
                    $('header .sb-toggle-left').trigger('click');
                }
            }
        });
        if (isMobile) {
            $('html').swipe({
                swipeLeft: function (event, direction, distance, duration, fingerCount) {
                    if ($body.hasClass('sidebar-mobile-open')) {
                        $('header .sb-toggle-left').trigger('click');
                    }
                },
                swipeRight: function (event, direction, distance, duration, fingerCount) {
                    if ($body.hasClass('right-sidebar-open')) {
                        $('.sb-toggle-right').trigger('click');
                    }
                }
            });
        }

    };

    // 获取窗口宽度&高度 并重新调整页面内容
    var runElementsPosition = function () {
        $windowWidth = viewport().width;
        $windowHeight = viewport().height;
        runContainerHeight();
    };
    //根据创库宽度&高度调整页面内容
    var runContainerHeight = function () {
        if (subViews.is(':visible')) {
            $('.main-container').css({
                'max-height': $windowHeight - topBar.outerHeight(true),
                'min-height': $windowHeight - topBar.outerHeight(true)
            });
        }
        if ($('#slidingbar-area').is(':visible')) {
            $('#slidingbar-area').css({
                'max-height': $windowHeight
            });
        }
        if ($windowWidth > 991) {
            mainNavigation.css({
                height: $windowHeight - topBar.outerHeight(true) - $('.slide-tools').outerHeight(true) - 40
            });
            $('.navbar-content').css({
                height: $windowHeight - topBar.outerHeight(true)
            });
        } else {
            mainNavigation.css({
                height: $windowHeight - $('.slide-tools').outerHeight(true) - 40
            });
            $('.navbar-content').css({
                height: $windowHeight
            });
        }

        $('.right-wrapper').css({
            height: $windowHeight
        });

        if ($body.hasClass('isMobile') == false && mainNavigation.length) {
            mainNavigation.perfectScrollbar('update');
            $('.right-wrapper').perfectScrollbar('update');
        }
        //如果不是tabModels才用设置
        if (!tabModel) {
            if ($('#horizontal-menu').length) {
                mainContent.css({
                    'min-height': $windowHeight - topBar.outerHeight(true) - $('#horizontal-menu').outerHeight(true) - footer.outerHeight(true)
                });
            } else {
                mainContent.css({
                    'min-height': $windowHeight - topBar.outerHeight(true) - footer.outerHeight(true)
                });
            }
        }
        if (subViews.is(':visible')) {
            subViews.css({
                height: $windowHeight - topBar.outerHeight(true) - $('.toolbar').outerHeight(true)
            });
        }

    };
    //页面提示
    var runAnimatedElements = function () {
        if ($('.tooltip-notification').length) {
            setTimeout(function () {
                $('.tooltip-notification').removeClass('hide');
                $('.tooltip-notification').addClass('animated fadeIn');
            }, 5000);
            setTimeout(function () {
                $('.tooltip-notification').velocity({
                    opacity: 0
                }, 300, 'ease', function () {
                    $(this).removeClass('animated bounceIn').addClass('hide');
                });
            }, 8000);
        }

        if ($('.notifications-count').length) {
            setTimeout(function () {
                $('.notifications-count').removeClass('hide');
                $('.notifications-count').addClass('animated bounceIn');
            }, 10000);
        }
    };
    //初始化tooltips
    var runTooltips = function () {
        if ($('.tooltips').length) {
            $('.tooltips').tooltip();
        }
    };
    //初始化popovers
    var runPopovers = function () {
        if ($('.popovers').length) {
            $('.popovers').popover();
        }
    };
    // 点击编辑,转到指定tab
    var runShowTab = function (e) {
        if ($('.show-tab').length) {
            $('.show-tab').on('click', function (e) {
                e.preventDefault();
                var tabToShow = $(this).attr('href');
                if ($(tabToShow).length) {
                    $('a[href="' + tabToShow + '"]').tab('show');
                }
            });
        }
        ;
        if (getParameterByName('tabId').length) {
            $('a[href="#' + getParameterByName('tabId') + '"]').tab('show');
        }
    };
    // 初始化panel-scroll
    var runPanelScroll = function () {
        if ($(".panel-scroll").length && $body.hasClass("isMobile") == false) {
            $(".panel-scroll").each(function () {
                $(this).css('height', $(this).css('height'));
            });
            $('.panel-scroll').perfectScrollbar({
                wheelSpeed: 50,
                minScrollbarLength: 20,
                suppressScrollX: true
            });
        }
    };
    //panel tools工具栏
    var runModuleTools = function () {
        // 全屏
        $('body').off("click", ".panel-expand").on('click', '.panel-expand', function (e) {
            e.preventDefault();
            $('.panel-tools > a, .panel-tools .dropdown').hide();

            if ($('.full-white-backdrop').length == 0) {
                $body.append('<div class="full-white-backdrop"></div>');
            }
            var backdrop = $('.full-white-backdrop');
            var wbox = $(this).parent().parents('.panel');
            wbox.attr('style', '');
            if (wbox.hasClass('panel-full-screen')) {
                backdrop.fadeIn(200, function () {
                    $('.panel-tools > .tmp-tool').remove();
                    $('.panel-tools > a, .panel-tools .dropdown').show();
                    wbox.removeClass('panel-full-screen');
                    if (wbox.parents(".subviews").length > 0) {
                        wbox.parents(".subviews").css("position", "absolute");
                    }
                    backdrop.fadeOut(200, function () {
                        backdrop.remove();
                        $(window).trigger('resize');
                    });
                });
            } else {

                backdrop.fadeIn(200, function () {

                    $('.panel-tools').append("<a class='panel-expand tmp-tool' href='#'><i class='fa fa-compress'></i></a>");
                    backdrop.fadeOut(200, function () {
                        backdrop.hide();
                    });
                    if (wbox.parents(".subviews").length > 0) {
                        wbox.parents(".subviews").css("position", "static");
                    }
                    wbox.addClass('panel-full-screen').css({
                        'max-height': $windowHeight,
                        'overflow': 'auto'
                    });
                    $(window).trigger('resize');
                });
            }
        });
        //点击 panel 关闭
        $('body').off("click", ".panel-close").on('click', '.panel-close', function (e) {
            $(this).parents(".panel").fadeOut();
            e.preventDefault();
        });
        //点击 panel 刷新
        $('body').off("click", ".panel-refresh").on('click', '.panel-refresh', function (e) {
            var el = $(this).parents(".panel").find(".form-horizontal");
            tool.submitForm(el);

        });
        //点击 panel 缩放
        $('body').off("click", ".panel-collapse").on('click', '.panel-collapse', function (e) {
            e.preventDefault();
            var el = $(this);
            var bodyPanel = jQuery(this).parent().closest(".panel").children(".panel-body");
            if ($(this).hasClass("collapses")) {
                bodyPanel.slideUp(200, function () {
                    el.addClass("expand").removeClass("collapses").children("span").text("还原").end().children("i").addClass("fa-rotate-180");
                });
            } else {
                bodyPanel.slideDown(200, function () {
                    el.addClass("collapses").removeClass("expand").children("span").text("收起").end().children("i").removeClass("fa-rotate-180");
                });
            }
        });
    };

    var isshowtd = function () {
        $("td[hide]").each(function () {
            var trindex = '';
            var str = $(this).attr("hide");
            var strs = str.split("=");
            if (strs[0] == strs[1]) {
                trindex = $(this).parents("tr").find("td").index($(this));
                $(this).hide();
                if (trindex != null && trindex != '') {
                    $("table th:eq(" + trindex + ")").hide();
                }
            }
        });
    }

    //导航菜单
    var runNavigationMenu = function () {
        if ($("body").hasClass("single-page") == false) {
            $('.main-navigation-menu > li.active').addClass('open');
            $('.main-navigation-menu > li a').on('click', function () {
                if ($(this).parent().children('ul').hasClass('sub-menu') && ((!$body.hasClass('navigation-small') || $windowWidth < 767) || !$(this).parent().parent().hasClass('main-navigation-menu'))) {
                    if (!$(this).parent().hasClass('open')) {
                        $(this).parent().addClass('open');
                        $(this).parent().parent().children('li.open').not($(this).parent()).not($('.main-navigation-menu > li.active')).removeClass('open').children('ul').slideUp(200);
                        $(this).parent().children('ul').slideDown(200, function () {
                            if (mainNavigation.height() > $(".main-navigation-menu").outerHeight()) {
                                mainNavigation.scrollTo($(this).parent("li"), 300, {
                                    onAfter: function () {
                                        if ($body.hasClass("isMobile") == false) {
                                            mainNavigation.perfectScrollbar('update');
                                        }
                                    }
                                });
                            } else {
                                mainNavigation.scrollTo($(this).parent("li"), 300, {
                                    onAfter: function () {
                                        if ($body.hasClass("isMobile") == false) {
                                            mainNavigation.perfectScrollbar('update');
                                        }
                                    }
                                });
                            }
                        });
                    } else {
                        if (!$(this).parent().hasClass('active')) {
                            $(this).parent().parent().children('li.open').not($('.main-navigation-menu > li.active')).removeClass('open').children('ul').slideUp(200, function () {
                                if (mainNavigation.height() > $(".main-navigation-menu").outerHeight()) {
                                    mainNavigation.scrollTo(0, 300, {
                                        onAfter: function () {
                                            if ($body.hasClass("isMobile") == false) {
                                                mainNavigation.perfectScrollbar('update');
                                            }
                                        }
                                    });
                                } else {
                                    mainNavigation.scrollTo($(this).parent("li").closest("ul").children("li:eq(0)"), 300, {
                                        onAfter: function () {
                                            if ($body.hasClass("isMobile") == false) {
                                                mainNavigation.perfectScrollbar('update');
                                            }
                                        }
                                    });
                                }
                            });
                        } else {
                            $(this).parent().parent().children('li.open').removeClass('open').children('ul').slideUp(200, function () {
                                if (mainNavigation.height() > $(".main-navigation-menu").outerHeight()) {
                                    mainNavigation.scrollTo(0, 300, {
                                        onAfter: function () {
                                            if ($body.hasClass("isMobile") == false) {
                                                mainNavigation.perfectScrollbar('update');
                                            }
                                        }
                                    });
                                } else {
                                    mainNavigation.scrollTo($(this).parent("li"), 300, {
                                        onAfter: function () {
                                            if ($body.hasClass("isMobile") == false) {
                                                mainNavigation.perfectScrollbar('update');
                                            }
                                        }
                                    });
                                }
                            });
                        }
                    }
                } else {
                    $(this).parent().addClass('active');
                }
            });
        } else {
            var title, subTitle, url, ajaxContainer = $("#ajax-content");
            var start = $('.main-navigation-menu li.start');
            if (start.length) {
                start.addClass("active");
                if (start.closest('ul').hasClass('sub-menu')) {
                    start.closest('ul').parent('li').addClass('active open');
                }
                url = start.children("a").attr("href");
                title = start.children("a").children("span").html();
                subTitle = start.children("a").children("span").attr("data-sub-title");
                if (!tabModel) {
                    //清空上个页面的 页面&函数&变量
                    page = {};
                    subPage = {
                        closeCallback: function () {
                        },
                        save_callback: function (data, $form_element) {
                        }
                    }
                    $(".subview-box").remove();
                    ajaxLoader(url, ajaxContainer, title, subTitle);
                }
            }

            $('.main-navigation-menu > li.active').addClass('open');
            $('.main-navigation-menu > li a').on('click', function (e) {
                e.preventDefault();
                var $this = $(this);
                if ($this.parent().children('ul').hasClass('sub-menu') && (!$('body').hasClass('navigation-small') || !$this.parent().parent().hasClass('main-navigation-menu'))) {
                    if (!$this.parent().hasClass('open')) {
                        $this.parent().addClass('open');
                        $this.parent().parent().children('li.open').not($this.parent()).not($('.main-navigation-menu > li.active')).removeClass('open').children('ul').slideUp(200);
                        $this.parent().children('ul').slideDown(200, function () {
                            runContainerHeight();
                        });
                    } else {
                        if (!$this.parent().hasClass('active')) {
                            $this.parent().parent().children('li.open').not($('.main-navigation-menu > li.active')).removeClass('open').children('ul').slideUp(200, function () {
                                runContainerHeight();
                            });
                        } else {
                            $this.parent().parent().children('li.open').removeClass('open').children('ul').slideUp(200, function () {
                                runContainerHeight();
                            });
                        }
                    }
                } else {
                    $('.main-navigation-menu ul.sub-menu li').removeClass('active');
                    $this.parent().addClass('active');
                    var closestUl = $this.parent('li').closest('ul');
                    if (closestUl.hasClass('main-navigation-menu')) {
                        $('.main-navigation-menu > li.active').removeClass('active').removeClass('open').children('ul').slideUp(200);
                        $this.parents('li').addClass('active');
                    } else if (!closestUl.parent('li').hasClass('active') && !closestUl.parent('li').closest('ul').hasClass('sub-menu')) {
                        $('.main-navigation-menu > li.active').removeClass('active').removeClass('open').children('ul').slideUp(200);
                        $this.parent('li').closest('ul').parent('li').addClass('active');
                    } else {
                        if (!$body.hasClass("sidebar-close")) {
                            if (closestUl.parent('li').closest('ul').hasClass('sub-menu')) {
                                if (!closestUl.parents('li.open').hasClass('active')) {
                                    $('.main-navigation-menu > li.active').removeClass('active').removeClass('open').children('ul').slideUp(200);
                                    closestUl.parents('li.open').addClass('active');
                                }
                                closestUl.parents('li.open').each(function () {
                                    if (!$(this).hasClass('active')) {
                                        $(this).addClass('active');
                                    }
                                });
                            }
                        }
                    }
                    url = $(this).attr("href");
                    title = $(this).children("span").html();
                    subTitle = $(this).children("span").attr("data-sub-title");
                    if (!tabModel) {
                        //清空上个页面的 页面&函数&变量
                        page = {};
                        subPage = {
                            closeCallback: function () {
                            },
                            save_callback: function (data, $form_element) {
                            }
                        }
                        $(".subview-box").remove();
                        subview_id = [];
                        $('#menuid_manage').val($(this).attr('menuid'));
                        if (!tabModel) {
                            ajaxLoader(url, ajaxContainer, title, subTitle);
                        }
                    }
                }
            });
        }
    };
    /**
     * 异步加载页面到容器
     * @param url 地址
     * @param element 容器
     * @param title 标题
     * @param subTitle 子标题
     */
    var ajaxLoader = function (url, element, title, subTitle) {
        $(".close-subviews").click();

        element.removeClass("shake");
        var backdrop = $('.ajax-white-backdrop');

        $(".main-container").append('<div class="ajax-white-backdrop"></div>');
        backdrop.show();

        if ($body.hasClass("sidebar-mobile-open")) {
            var configAnimation, extendOptions, globalOptions = {
                duration: 200,
                easing: "ease",
                mobileHA: true,
                progress: function () {
                    activeAnimation = true;
                }
            };
            extendOptions = {
                complete: function () {
                    inner.attr('style', '').removeClass("inner-transform");
                    // remove inner-transform (hardware acceleration) for restore z-index
                    $body.removeClass("sidebar-mobile-open");
                    loadPage(url, element, title, subTitle);
                    activeAnimation = false;
                }
            };
            configAnimation = $.extend({}, extendOptions, globalOptions);

            inner.velocity({
                translateZ: 0,
                translateX: [-sidebarWidth, 0]
            }, configAnimation);
        } else {
            loadPage(url, element, title, subTitle);
        }
        /**
         * 异步加载页面到容器
         * @param url 地址
         * @param element 容器
         * @param title 标题
         * @param subTitle 子标题
         * @param data 传入的数据
         */
        function loadPage(url, element, title, subTitle) {
            $.ajax({
                type: "GET",
                cache: false,
                url: tool.initParams(url),
                dataType: "html",
                success: function (data) {
                    backdrop.remove();
                    element.html('');
                    subview_id = [];
                    if (element[0].id == "ajax-content") {
                        //面包屑导航
                        if (stageMenu) {
                            element.html("<div class='row'><div class='col-md-12 mt-10'><ol class='breadcrumb m0'><li>" +
                                "<a href='javascript:Main.ajaxLoaderUrl(\"" + basePath + "/home.jsp\",null,\"首页\",\"\")'>首页</a></li><li class='active'>" + title + "</li></ol></div></div>");
                        } else {
                            $(".page-header").html("<a href='javascript:Main.ajaxLoaderUrl(\"" + basePath + "/id/idUser-personalCenter.action\",null,\"首页\",\"\")'>首页</a> >" + title);
                        }
                    }
                    selectmenu = title;
                    //页面内容
                    element.append(data);
                    Main.initList();
                    //将本页面url放到form的data-action中
                    if (element.find(".form-horizontal").length > 0) {
                        if (isBlank(element.find(".form-horizontal").attr("data-action"))) {
                            element.find(".form-horizontal").attr("data-action", url);
                        }
                        if (url.indexOf("action") < 0) {//spring mvc
                            element.find(".form-horizontal").find("#yspager_currentPageno").attr("name", "currentPageno");
                            element.find(".form-horizontal").find("#eachPageRows").attr("name", "eachPageRows");
                        }
                    }
                    element.addClass("fadeInUp").one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function () {
                        $(this).removeClass("fadeInUp");
                        if (element[0].id == "ajax-content") {

                        }
                    });

                },
                error: function (xhr, ajaxOptions, thrownError) {
                    backdrop.remove();
                    if (debug) {
                        element.html('<h4>无法加载请求的内容' + url + '</h4>').addClass("shake");
                    } else {
                        //显示404页面
                        //ajaxLoader("404.html",element,"404","您访问的页面未找到");
                    }

                }
            });
        };
    };
    // 将时间转换为 *分钟前 *小时前 等格式
    var runTimeStamp = function () {
        $(".timestamp").each(function () {
            var startOfPeriod = moment($(this).attr("title"));
            //noinspection JSUnresolvedFunction
            $(this).text(moment(startOfPeriod).fromNow());
        });
    };
    //初始化左/右滑块
    var runToggleSideBars = function () {
        var configAnimation, extendOptions, globalOptions = {
            duration: 150,
            easing: "ease",
            mobileHA: true,
            progress: function () {
                activeAnimation = true;
            }
        };
        $("#pageslide-left, #pageslide-right").on("mouseover", function (e) {
            hoverSideBar = true;
        }).on("mouseleave", function (e) {
            hoverSideBar = false;
        });

        $(".sb-toggle-left, .closedbar").on("click", function (e) {
            if (activeAnimation == false) {
                if ($windowWidth > 991) {
                    $body.removeClass("sidebar-mobile-open");
                    if ($body.hasClass("sidebar-close")) {
                        if ($body.hasClass("layout-boxed") || $body.hasClass("isMobile")) {
                            $body.removeClass('sidebar-close').removeClass('min-left-slide');
                            $(window).trigger('resize');
                        } else {
                            sideLeft.animate({
                                width: 220
                            });
                            extendOptions = {
                                complete: function () {
                                    $body.removeClass("sidebar-close").removeClass('min-left-slide');
                                    $(".main-container, #pageslide-left, #footer .footer-inner, #horizontal-menu .container, .closedbar").attr('style', '');
                                    $(window).trigger('resize');
                                    activeAnimation = false;
                                }
                            };
                            configAnimation = $.extend({}, extendOptions, globalOptions);
                            $(".main-container, footer .footer-inner, #horizontal-menu .container").velocity({
                                marginLeft: 220
                            }, configAnimation);

                        }
                    } else {
                        //菜单为收起状态
                        var hideMenu = null;
                        $('.main-navigation-menu .J_menuItem').click(function () {
                            if ($body.hasClass("sidebar-close")) {
                                $(this).parent('li').addClass('active');
                            }
                        });
                        $('.main-navigation-menu li');
                        $('.main-navigation-menu .sub-menu').attr('style', '');
                        $('.main-navigation-menu > li').off('mouseenter').mouseenter(function () {
                            if ($body.hasClass("sidebar-close")) {
                                $('.main-navigation-menu li').removeClass('open-sub-menu');
                                $('.main-navigation-menu .sub-menu').attr('style', '');
                                $(this).addClass('open-sub-menu').find('ul.sub-menu').css({
                                    top: $(this).offset().top - 8,
                                    left: 43
                                });
                                clearTimeout(navTimeOut);
                            }
                            $(this).children('.sub-menu').off('mouseenter').mouseenter(function () {
                                clearTimeout(navTimeOut);
                                $(this).off('mouseleave').mouseleave(function () {
                                    if ($body.hasClass("sidebar-close")) {
                                        navTimeOut = setTimeout(function () {
                                            hideMenu.removeClass('open-sub-menu');
                                            hideMenu.find('.sub-menu').attr('style', '');
                                        }, 100);
                                    }
                                })
                            })
                        });

                        $('.main-navigation-menu > li').off('mouseleave').mouseleave(function () {
                            if ($body.hasClass("sidebar-close")) {
                                hideMenu = $(this);
                                navTimeOut = setTimeout(function () {
                                    hideMenu.removeClass('open-sub-menu');
                                    hideMenu.find('.sub-menu').attr('style', '');
                                }, 100);
                            }
                        });

                        if ($body.hasClass("layout-boxed") || $body.hasClass("isMobile")) {
                            $body.addClass("sidebar-close").addClass('min-left-slide');
                            $(window).trigger('resize');
                        } else {
                            extendOptions = {
                                complete: function () {
                                    activeAnimation = false;
                                    $body.addClass("sidebar-close").addClass('min-left-slide');
                                    $(window).trigger('resize');
                                }
                            };
                            sideLeft.animate({
                                width: 44
                            });
                            configAnimation = $.extend({}, extendOptions, globalOptions);
                            $(".main-container, footer .footer-inner, #horizontal-menu .container").velocity({
                                marginLeft: 44
                            }, configAnimation);
                        }
                    }
                } else {
                    if ($body.hasClass("sidebar-mobile-open")) {
                        if (supportTransition) {
                            extendOptions = {
                                complete: function () {
                                    inner.attr('style', '').removeClass("inner-transform");
                                    // remove inner-transform (hardware acceleration) for restore z-index
                                    $body.removeClass("sidebar-mobile-open");
                                    activeAnimation = false;
                                }
                            };
                            configAnimation = $.extend({}, extendOptions, globalOptions);

                            inner.velocity({
                                translateZ: 0,
                                translateX: [-sidebarWidth, 0]
                            }, configAnimation);
                        } else {
                            $body.removeClass("sidebar-mobile-open");
                        }
                    } else {
                        if (supportTransition) {
                            inner.addClass("inner-transform");
                            // add inner-transform for hardware acceleration
                            extendOptions = {
                                complete: function () {
                                    inner.attr('style', '');
                                    $body.addClass("sidebar-mobile-open");
                                    activeAnimation = false;
                                }
                            };
                            configAnimation = $.extend({}, extendOptions, globalOptions);
                            inner.velocity({
                                translateZ: 0,
                                translateX: [sidebarWidth, 0]
                            }, configAnimation);
                        } else {
                            $body.addClass("sidebar-mobile-open");
                        }
                    }
                }
            }
            e.preventDefault();
        });
        $(".sb-toggle-right").on("click", function (e) {
            $body.removeClass('sidebar-close').removeClass('min-left-slide');
            if (activeAnimation == false) {
                if ($windowWidth > 991) {
                    $body.removeClass("sidebar-mobile-open");
                }
                if ($body.hasClass("right-sidebar-open")) {
                    if (supportTransition) {
                        extendOptions = {
                            complete: function () {
                                inner.attr('style', '').removeClass("inner-transform");
                                // remove inner-transform (hardware acceleration) for restore z-index
                                $body.removeClass("right-sidebar-open");
                                activeAnimation = false;
                            }
                        };
                        configAnimation = $.extend({}, extendOptions, globalOptions);
                        inner.velocity({
                            translateZ: 0,
                            translateX: [sidebarWidth, 0]
                        }, configAnimation);
                    } else {
                        $body.removeClass("right-sidebar-open");
                    }
                } else {
                    if (supportTransition) {
                        inner.addClass("inner-transform");
                        // add inner-transform for hardware acceleration
                        extendOptions = {
                            complete: function () {
                                inner.attr('style', '');
                                $body.addClass("right-sidebar-open");
                                activeAnimation = false;
                            }
                        };
                        configAnimation = $.extend({}, extendOptions, globalOptions);
                        inner.velocity({
                            translateZ: 0,
                            translateX: [-sidebarWidth, 0]
                        }, configAnimation);
                    } else {
                        $body.addClass("right-sidebar-open");
                    }
                }
            }
            e.preventDefault();
        });
    };
    // 绑定回到顶部按钮事件
    var runGoTop = function () {
        $('.go-top').off('click').on('click', function (e) {
            $("html, body").animate({
                scrollTop: 0
            }, "slow");

        });
    };
    //根据名字获取对象
    var getParameterByName = function (name) {
        name = name.replace(/[\[]/, "\\\[").replace(/[\]]/, "\\\]");
        var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"), results = regex.exec(location.search);
        return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
    };
    var initBootstrapSelect = function () {
        if ($.fn.selectpicker) {
            tool.initBootstrapSelectBySelector('.selectpicker');
        }
    };
    //设置用户已定义样式
    var runStyleSelector = function () {
        setColorScheme();
    };
    //设置主题
    var setColorScheme = function () {
        $('.icons-color a').on('click', function () {
            $('.icons-color .style-btn').each(function () {
                $(this).removeClass('active');
            });
            $(this).find('.style-btn').addClass('active');
            if ($('#skin_color').attr("rel") == "stylesheet/less") {
                $('#skin_color').next('style').remove();
                $('#skin_color').attr("rel", "stylesheet");

            }
            $('#skin_color').attr("href", basePath + "/resources/css/themes/theme-" + $(this).attr('id') + ".css");
        });
    };
    //保存主题设置
    var runSaveSetting = function () {
        $('.save_style').on('click', function () {
            $(this).html('保存中 <i class="fa fa-circle-o-notch fa-spin"></i>');
            var espressoSetting = new Object;
            espressoSetting.skinClass = $('#skin_color').attr('href');
            $.cookie("espresso-setting-2.0", JSON.stringify(espressoSetting), {expires: 365, path: '/'});
            $(this).removeClass('btn-primary').addClass('btn-success').html('保存成功 <i class="fa fa-check"></i>');
            setTimeout('$(".save_style").addClass("btn-primary").removeClass("btn-success").html("保存主题")', 1000 * 3);
        });
    };
    //加载用户主题设置
    var runCustomSetting = function () {
        if ($.cookie) {
            if ($.cookie("espresso-setting-2.0")) {
                var loadSetting = jQuery.parseJSON($.cookie("espresso-setting-2.0"));
                $('#skin_color').attr('href', loadSetting.skinClass);
                if ($('#style_selector').length) {
                    // $('#skin_color').attr('href', loadSetting.skinClass);
                    var i;
                    var temp = loadSetting.skinClass.substr(loadSetting.skinClass.indexOf('theme-') + 6, loadSetting.skinClass.length);
                    if (temp == 'default.css') {
                        i = 0;
                    } else {
                        i = Number(temp.substring(5, 6)) - 1;
                    }
                    $('.icons-color .style-btn').removeClass('active');
                    $('.icons-color .style-btn:eq(' + i + ')').addClass('active');
                }
                $body.addClass(loadSetting.bgStyle);
            } else {
                runDefaultSetting();
            }
        }
    };

    //主题 清空用户设置
    var runClearSetting = function () {
        $('.clear_style').on('click', function () {
            $.removeCookie("espresso-setting-2.0");
            $body.removeClass("layout-boxed header-default footer-fixed");
            sideLeft.removeClass('slide-default');
            $body[0].className = $body[0].className.replace(/\bbg_style_.*?\b/g, '');
            if ($('#skin_color').attr("rel") == "stylesheet/less") {
                $('#skin_color').next('style').remove();
                $('#skin_color').attr("rel", "stylesheet");
            }
            $('.icons-color img').first().trigger('click');
            runDefaultSetting();
        });
    };
    //主题 恢复默认选择
    var runDefaultSetting = function () {
        $('.boxed-patterns img').removeClass('active');
    };
    // 监听改变浏览器窗口大小事件
    var runWIndowResize = function (func, threshold, execAsap) {
        $(window).espressoResize(function () {
            runElementsPosition();
        });
    };
    //表格 - 全选
    var runCheckAll = function () {
        $('input[type="checkbox"].mgc.selectall').click(function () {
            if (this.checked) {
                $(this).closest("table").find(".foocheck").prop("checked", true);
            } else {
                $(this).closest("table").find(".foocheck").prop("checked", false);
            }
        });
    };

    //表格CheckBox悬浮 计算高度
    var runAutoHeight = function () {
        $("tr").each(function () {
            var b = $(this).children('td').eq(1).height();
            if (b != null) {
                if ($(this).find("td:first").hasClass('fixcooloumn')) {
                    $(this).find("td:first").height(b + 5);
                    if ($(this).find("td:first").height() == 26) {
                        $(this).find("td:first").css("padding-top", "7px");
                    } else if ($(this).find("td:first").height() > 24) {
                        $(this).find("td:first").css("padding-top", "12px");
                    }
                }
            }
        })
        $("input[type='text']").each(function () {
            if ($(this).val() == "" || $(this).val() == null) {
                if ($(this).next().hasClass("fa-times-circle")) {
                    $(this).next().hide();
                }
            }
            $(this).blur(function () {
                if ($(this).val() != "" && $(this).val() != null) {
                    $(this).next().show();
                }
            })
        })
    }

    //动画显示进度条
    var runAnimateProgressbar = function () {
        var progressBarDefaultsOptions = {
            transition_delay: 0
        };
        $('.progress .animate-progress-bar').each(function () {
            var configProgressBar = $.extend({}, progressBarDefaultsOptions, $(this).data("plugin-options"));
            if ($(this).is(':appeared') || isMobile) {
                $(this).progressbar(configProgressBar);
            } else {
                $(this).appear();
                $(this).on("appear", function (event, $all_appeared_elements) {
                    $(this).progressbar(configProgressBar);
                });
            }
        });
    };

    var runMsViewport = function () {
        if (navigator.userAgent.match(/IEMobile\/10\.0/)) {
            var msViewportStyle = document.createElement("style");
            msViewportStyle.appendChild(document.createTextNode("@-ms-viewport{width:auto!important}"));
            document.getElementsByTagName("head")[0].appendChild(msViewportStyle);
        }
    };
    /**
     * 分页
     */
    var initPaging = function () {
        $("[data-current-page-no]").off("click").click(function () {
            var form_element = $(this).parents(".form-horizontal");
            form_element.find("#yspager_currentPageno").val($(this).attr("data-current-page-no"));
            tool.submitForm(form_element);
        });
    }
    /**
     * 页大小
     */
    var initPageSize = function () {
        $("[data-page-size]").off("click").click(function () {
            var form_element = $(this).parents(".form-horizontal");
            form_element.find(".page-size").html($(this).attr("data-page-size") + " <i class=\"fa fa-angle-down\"></i>");
            form_element.find("#eachPageRows").val($(this).attr("data-page-size"));
            tool.submitForm(form_element);
        });
    }
    /**
     * 页面配置-全选
     * @param el
     * @param flag
     */
    var checkAll = function (el, flag) {
        var $el = $(el);
        if (flag) {
            $(el).parents('.form-group').find('input[type="checkbox"]').iCheck('check');
        } else {
            $(el).parents('.form-group').find('input[type="checkbox"]').iCheck('uncheck');
        }
    }
    /**
     * 自动初始化select2插件
     */
    var initSelect2 = function (e) {
        if (isBlank(e)) {
            e = $(document);
        }
        tool.initSelect(e.find(".select2-auto"));
    }
    var initSearch_Select = function (el) {
        if (isBlank(el)) {
            el = $(document);
        }
        tool.initSearchSelect(el.find("[data-element-type='searh-select']"));
    }
    var initDatetimepicker = function (e) {
        if (isBlank(e)) {
            e = $(document);
        }
        tool.initDatetimepicker(e.find("input[data-element-type='datetimepicker']"));
    }

    var initAutosize = function () {
        if ($("textarea.autosize").length > 0) {
            tool.initAutosize('textarea.autosize');
        }
    };
    var initSummerNote = function () {
        tool.initSummerNoteBySelector('.summernote');
    };
    var initnavTabs = function () {
        $('[data-nav-url]').each(function () {
            var $navContent = $(this);
            if($navContent.hasClass('is-load')){
                return ;
            }else{
                $navContent.addClass('is-load')
            }
            var url = nodePath + '/s/' + $navContent.attr('data-nav-url');
            $.ajax({
                url: tool.initParams(url),
                cache: false,
                type: "post",
                dataType: "html",
                timeout: 1000 * 15,
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    tool.alertError('请求超时!', '请稍后重试!');
                },
                success: function (data) {
                    $navContent.html($(data).find('.form-horizontal').prop('outerHTML'));
                    $navContent.find('.form-horizontal').each(function () {
                        var $form = $(this);
                        if (isBlank($form.attr("data-action"))) {
                            $form.attr("data-action", url);
                            //console.log($form.attr("data-action"));
                        }
                        $form.validationEngine({
                            showOneMessage: true
                        });
                        if (isBlank($form.attr('data-action'))) {
                            $form.attr('data-action', window.location.href);
                        }
                        if (window.location.href.indexOf("action") < 0) {//spring mvc
                            $form.find("#yspager_currentPageno").attr("name", "currentPageno");
                            $form.find("#eachPageRows").attr("name", "eachPageRows");
                        }
                    });

                    runTooltips();
                    runPopovers();
                    runCheckAll();
                    initPaging();
                    initPageSize();
                    initDatetimepicker();
                    tool.initOrderTables();
                    initSelect2();
                    initSearch_Select();
                    initselectcode();
                    runPanelScroll();
                    tool.initBtnShow();
                    try {
                        getUserChosoe();//模态框弹出后调用国际化
                    } catch (e) {
                    }
                }
            });
        });
    };
    var initBtnGroup = function () {
        var url = window.location.href;
        if (url.indexOf('s/system/sysJsp/configTemple') == -1) {
            var mainContentHeight = $('#content-main', window.parent.document).height();
            var $content = $('.tabModel-content');
            var bodyHeight = $content.outerHeight(true);
            var bodyWidth = $content.outerWidth(true);
            var frameBtnGroup = $('.frame-btn-group');
            frameBtnGroup.each(function () {
                var _frameBtnGroup = $(this);
                if (bodyWidth > 800) {//大屏下按钮居中
                    //计算按钮宽度
                    var btnWdith = 0;
                    _frameBtnGroup.find('.btn').each(function () {
                        btnWdith += $(this).outerWidth(true) + 6;
                    });
                    //如果不需要浮动,并且按钮在panel内(页面可能存在多个panel或者panel居中)
                    if (mainContentHeight > bodyHeight) {
                        bodyWidth = _frameBtnGroup.parents('.panel').outerWidth();
                    }
                    _frameBtnGroup.find('.btn:eq(0)').css('margin-left', (bodyWidth - btnWdith - 30) / 2);
                }

                if (mainContentHeight < bodyHeight) {
                    //添加返回顶部按钮
                    // _frameBtnGroup.append('<div class="pull-right pr15"><span class="go-top"><i class="fa fa-chevron-up"></i></span></div>');
                    var isFireFox = false;
                    if (getBrowserInfo()[0].indexOf('firefox') > -1) {
                        isFireFox = true;
                    }
                    $('.tabModel-content').one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function () {
                        if (!isFireFox) {
                            _frameBtnGroup.addClass('frame-btn-group-fixed').addClass("fadeInUp animated");
                            $content.css('padding-bottom', 50);
                            _frameBtnGroup.one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function () {
                                // runGoTop()
                            });
                        }
                    });
                    // console.log(isFireFox);
                    if (isFireFox) {
                        _frameBtnGroup.addClass('frame-btn-group-fixed').addClass("fadeInUp animated");
                        $content.css('padding-bottom', 50);
                        _frameBtnGroup.one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function () {
                            // runGoTop()
                        });
                    }
                }
            });
        }
    };
    var initFixerTable = function () {
        //检查是否有需要固定表头的表格
        if ($('.fixer').length > 0) {
            tool.fixerTable($('.fixer').find('table'));
        }
    }
    return {
        /**
         * 框架初始化
         */
        init: function () {
            runWIndowResize();
            runInit();
            runToggleSideBars();
            runStyleSelector();
            runElementsPosition();
            runNavigationMenu();
            // runGoTop();
            runModuleTools();
            runTooltips();
            runPopovers();
            runPanelScroll();
            runAnimatedElements();
            runShowTab();
            runSaveSetting();
            runCustomSetting();
            runCheckAll();
            runClearSetting();
            runAnimateProgressbar();
            runMsViewport();
            runTimeStamp();
            documentEvents();
            initUrl();
        },
        /**
         * 初始化页面
         * @param el
         */
        initList: function (el) {
            tool.runInit();
            runTooltips(el);
            runPopovers(el);
            runPanelScroll(el);
            runShowTab(el);
            runMsViewport(el);
            runTimeStamp(el);
            initPaging(el);
            initPageSize(el);
            initFixerTable();
            tool.initOrderTables(el);
            runCheckAll(el);
            isshowtd();
            initUrl();
            $('.more-query').addClass('dn');
            Main.initInput();
        },
        initInput: function () {
            tool.runInit();
            runCustomSetting();
            runModuleTools();
            runAutoHeight();
            initAutosize();
            initSummerNote();
            initBootstrapSelect();
            initDatetimepicker();
            initSelect2();
            initSearch_Select();
            initselectcode();
            initnavTabs();
            tool.initBtnShow();
            tool.initFileIcon();
            tool.initvalidationEngine('.form-horizontal');
            setTimeout('Main.initBtnGroup()', 100);
            initDefaultValue();
            tool.closeloading(null);
        },
        /**
         * 可编辑表格新增一行初始化元素
         * @param el
         */
        initEditTable: function (el) {
            if (el != null && el != '') {
                initSelect2(el);
                initSearch_Select(el);
                initDatetimepicker(el);
                initselectcode(el);
            }
        },
        ajaxLoaderUrl: function (url, element, title, subTitle) {
            if (element == null || element == "") {
                element = $("#ajax-content");
            }
            ajaxLoader(url, element, title, subTitle);
        },
        runNavigationMenu: function () {
            if (tabModel) {
                $(".J_menuItem").on("click", clickMenu);
            }
            runNavigationMenu();
        },
        initBtnGroup: function () {
            initBtnGroup();
        },
        initTabModel: function () {
            Main.initList();
        }
    };
}();
/**
 * 如果是子页面在父页面弹出modal,并且使用到select2,请使用此方式初始化,不可使用window.parent.initSelect($jqueryElement)会导致初始化的下拉出现在子页面
 * @param selector
 */
function initSelectBySelector(selector) {
    initSelect($(selector));
}
function initCheckBySelector(selector) {
    Main.initCheck($(selector));
}

function initvalidationEngine(selector) {
    $(selector).validationEngine({
        showOneMessage: true
    });
}
function validationEngine(selector) {
    return $(selector).validationEngine('validate');
}
/**
 * 判断传入参数是否空
 * @param str
 */
function isBlank(str) {
    if (str == null || str == "" || str == undefined) {
        return true;
    } else {
        return false;
    }
}
/**
 * 判断传入参数是否不为空
 * @param str
 */
function isNotBlank(str) {
    return !isBlank(str);
}
function trim(str) {
    return str.replace(/(^\s*)|(\s*$)/g, "");
}
function initUrl() {
    $('a').each(function (i) {
        if ($(this).attr('auto-init') != '0') {
            var tt = $(this);
            var url = $(this).attr('href');
            if (url != null && url.indexOf('#') != 0 && url.indexOf('jddes=') == -1 && url.indexOf('javascript:') == -1) {
                tt.attr('href', tool.initParams(url));
            }
        }
    });
    $('iframe').each(function () {
        var tt = $(this);
        var url = $(this).attr('loadsrc');
        if (url != null && url.indexOf('jddes=') == -1) {
            tt.attr('src', tool.initParams(url));
        }
    });
}
function initDefaultValue() {
    $('input,textarea').each(function () {
        var defaultvalue = $(this).attr('defaultvalue');
        if (defaultvalue != undefined && defaultvalue != 'undefined' && defaultvalue != null && defaultvalue != ''
            && ($('#wid').val() == null || $('#wid').val() == '')) {
            $(this).val(defaultvalue);
        }
    });
}
(function ($) {
    $.fn.serializeJson = function () {
        var serializeObj = {};
        $(this.serializeArray()).each(function () {
            serializeObj[this.name] = this.value;
        });
        return serializeObj;
    };
})(jQuery);

//计算传入元素的宽度总合
function f(l) {
    var k = 0;
    $(l).each(function () {
        k += $(this).outerWidth(true);
    });
    return k
}
/**
 * 将tab列表移动到当前激活tab
 * @param n tab
 */
function g(n) {
    var o = f($(n).prevAll());//查找当前tab之前所有的同辈元素的总宽度
    var q = f($(n).nextAll());//查找当前tab之后所有的同辈元素的总宽度
    var l = f($(".content-tabs").children().not(".J_menuTabs"));//查找tab工具栏中除nav.J_menuTabs以外的元素的总宽度
    var k = $(".content-tabs").outerWidth(true) - l;//tab工具栏总宽度 -
    var p = 0;
    if ($(".page-tabs-content").outerWidth() < k) {
        p = 0
    } else {
        if (q <= (k - $(n).outerWidth(true) - $(n).next().outerWidth(true))) {
            if ((k - $(n).next().outerWidth(true)) > q) {
                p = o;
                var m = n;
                while ((p - $(m).outerWidth()) > ($(".page-tabs-content").outerWidth() - k)) {
                    p -= $(m).prev().outerWidth();
                    m = $(m).prev()
                }
            }
        } else {
            if (o > (k - $(n).outerWidth(true) - $(n).prev().outerWidth(true))) {
                p = o - $(n).prev().outerWidth(true)
            }
        }
    }
    $(".page-tabs-content").animate({marginLeft: 0 - p + "px"}, "fast")
}

function a() {
    var o = Math.abs(parseInt($(".page-tabs-content").css("margin-left")));
    var l = f($(".content-tabs").children().not(".J_menuTabs"));
    var k = $(".content-tabs").outerWidth(true) - l;
    var p = 0;
    if ($(".page-tabs-content").width() < k) {
        return false
    } else {
        var m = $(".J_menuTab:first");
        var n = 0;
        while ((n + $(m).outerWidth(true)) <= o) {
            n += $(m).outerWidth(true);
            m = $(m).next()
        }
        n = 0;
        if (f($(m).prevAll()) > k) {
            while ((n + $(m).outerWidth(true)) < (k) && m.length > 0) {
                n += $(m).outerWidth(true);
                m = $(m).prev()
            }
            p = f($(m).prevAll())
        }
    }
    $(".page-tabs-content").animate({marginLeft: 0 - p + "px"}, "fast")
}

function b() {
    var o = Math.abs(parseInt($(".page-tabs-content").css("margin-left")));
    var l = f($(".content-tabs").children().not(".J_menuTabs"));
    var k = $(".content-tabs").outerWidth(true) - l;
    var p = 0;
    if ($(".page-tabs-content").width() < k) {
        return false
    } else {
        var m = $(".J_menuTab:first");
        var n = 0;
        while ((n + $(m).outerWidth(true)) <= o) {
            n += $(m).outerWidth(true);
            m = $(m).next()
        }
        n = 0;
        while ((n + $(m).outerWidth(true)) < (k) && m.length > 0) {
            n += $(m).outerWidth(true);
            m = $(m).next()
        }
        p = f($(m).prevAll());
        if (p > 0) {
            $(".page-tabs-content").animate({marginLeft: 0 - p + "px"}, "fast")
        }
    }
}

$(".J_menuItem").each(function (k) {
    if (!$(this).attr("data-index")) {
        $(this).attr("data-index", k)
    }
});
//菜单点击事件
function clickMenu() {
    //var o = "http://www.baidu.com";
    var url = $(this).attr("href");
    var id = $(this).data("index");
    var title = $.trim($(this).text());
    addTab(url, id, title);
}
/**
 *
 * @param url
 * @param id
 * @param title
 * @param showClose
 * @param showLoading
 * @returns {boolean}
 */
function addTab(url, id, title, showClose, showLoading) {
    var needOpen = true;
    if (url == undefined || $.trim(url).length == 0) {
        return false
    }
    if (url.indexOf('jdds=') == -1) {
        url = tool.initParams(url);
    }
    if (showClose == null) {
        showClose = true;
    }
    if (showLoading == null) {
        showLoading = true;
    }
    if (showLoading) {
        tool.openloading(null, null);
    }
    //检查是否已经打开
    $(".J_menuTab").each(function () {
        //如果要打开的菜单已经打开
        if ($(this).data("id") == url) {
            if (!$(this).hasClass("active")) {
                $(this).addClass("active").siblings(".J_menuTab").removeClass("active");
                g(this);
                $(".J_mainContent .J_iframe").each(function () {
                    if ($(this).data("id") == url) {
                        $(this).show().siblings(".J_iframe").hide();
                        return false
                    }
                })
            }
            $('#' + $(this).data('iframe-id')).attr('src', url);
            needOpen = false;
            return false;
        }
    });

    if (needOpen) {
        var display_title = title;
        if (display_title.length > 9) {
            display_title = display_title.substr(0, 8) + '...';
        }

        $(".J_menuTab").removeClass("active");
        $(".J_mainContent").find("iframe.J_iframe").hide()
        $(".J_mainContent").append('<iframe class="J_iframe" id="iframe' + id + '" name="iframe' + id + '" width="100%" height="100%" src="' + url + '" frameborder="0" data-id="' + url + '" seamless></iframe>');
        if (showClose) {
            $(".J_menuTabs .page-tabs-content").append('<a href="javascript:;" class="active J_menuTab" data-iframe-id="iframe' + id + '" data-id="' + url + '" title="' + title + '">' + display_title + ' <i class="fa fa-times"></i></a>');
        } else {
            $(".J_menuTabs .page-tabs-content").append('<a href="javascript:;" class="active J_menuTab" data-iframe-id="iframe' + id + '" data-id="' + url + '" title="' + title + '">' + display_title + '</a>');
        }

        g($(".J_menuTab.active"));
    }
    return false;
}
//绑定点击
$(".J_menuItem").on("click", clickMenu);

//关闭
function h() {
    var m = $(this).parents(".J_menuTab").data("id");
    var l = $(this).parents(".J_menuTab").width();
    if ($(this).parents(".J_menuTab").hasClass("active")) {
        if ($(this).parents(".J_menuTab").next(".J_menuTab").size()) {
            var k = $(this).parents(".J_menuTab").next(".J_menuTab:eq(0)").data("id");
            $(this).parents(".J_menuTab").next(".J_menuTab:eq(0)").addClass("active");
            $(".J_mainContent .J_iframe").each(function () {
                if ($(this).data("id") == k) {
                    $(this).show().siblings(".J_iframe").hide();
                    return false
                }
            });
            var n = parseInt($(".page-tabs-content").css("margin-left"));
            if (n < 0) {
                $(".page-tabs-content").animate({marginLeft: (n + l) + "px"}, "fast")
            }
            $(this).parents(".J_menuTab").remove();
            $(".J_mainContent .J_iframe").each(function () {
                if ($(this).data("id") == m) {
                    $(this).remove();
                    return false
                }
            })
        }
        //选中当前最后一个tab
        if ($(this).parents(".J_menuTab").prev(".J_menuTab").size()) {
            var k = $(this).parents(".J_menuTab").prev(".J_menuTab:last").data("id");
            var ifarame = $('.J_iframe[data-id="' + k + '"]');
            callback(ifarame);
            $(this).parents(".J_menuTab").prev(".J_menuTab:last").addClass("active");
            $(".J_mainContent .J_iframe").each(function () {
                if ($(this).data("id") == k) {
                    $(this).show().siblings(".J_iframe").hide();
                    return false
                }
            });
            $(this).parents(".J_menuTab").remove();
            $(".J_mainContent .J_iframe").each(function () {
                if ($(this).data("id") == m) {
                    $(this).remove();
                    return false
                }
            })
            var n = parseInt($(".page-tabs-content").css("margin-left"));
            if (n < 0) {
                $(".page-tabs-content").animate({marginLeft: (n + l) + "px"}, "fast")
            }
        }
    } else {
        $(this).parents(".J_menuTab").remove();
        $(".J_mainContent .J_iframe").each(function () {
            if ($(this).data("id") == m) {
                $(this).remove();
                return false
            }
        });
        g($(".J_menuTab.active"))
    }
    return false
}
$(".J_menuTabs").on("click", ".J_menuTab i", h);
//关闭其他
function i() {
    $(".page-tabs-content").children("[data-id]").not(":first").not(".active").each(function () {
        $('.J_iframe[data-id="' + $(this).data("id") + '"]').remove();
        $(this).remove()
    });
    $(".page-tabs-content").css("margin-left", "0")
}
//关闭其他
$(".J_tabCloseOther").on("click", i);
function j() {
    g($(".J_menuTab.active"))
}
//显示当前
$(".J_tabShowActive").on("click", j);
//点击工具栏 tab页
function clickMenuTab() {
    if (!$(this).hasClass("active")) {
        var k = $(this).data("id");
        $(".J_mainContent .J_iframe").each(function () {
            if ($(this).data("id") == k) {
                var ifarame = $('.J_iframe[data-id="' + $(this).data("id") + '"]');
                callback(ifarame);
                $(this).show().siblings(".J_iframe").hide();
                return false
            }
        });
        $(this).addClass("active").siblings(".J_menuTab").removeClass("active");
        g(this)

    }
}
function callback(ifarame) {
    console.log(ifarame);
    //检查是否需要刷新页面
    if (ifarame.length > 0) {
        try {
            if (ifarame[0].contentWindow.isRefresh()) {
                ifarame.attr('src', ifarame.attr("src"));
            }
            if (ifarame[0].contentWindow.isSubmitForm()) {
                var form_element = $($(ifarame[0].contentDocument).find('.form-horizontal')[0]);
                var $btn = form_element.find('[onclick="tool.doSearch(this)"], [onclick="tool.super_doSearch(this)"]');
                if ($btn.length > 0) {
                    $btn.click();
                } else {
                    ifarame[0].contentWindow.tool.submitForm(form_element);
                }
            }
            //调用初始化页面函数
            ifarame[0].contentWindow.initPage();
        } catch (e) {
        }
    }
}
$(".J_menuTabs").on("click", ".J_menuTab", clickMenuTab);
//双击事件
$(".J_menuTabs").on("dblclick", ".J_menuTab", function () {
    tool.openloading(null, null);
    var ifarame = $('.J_iframe[data-id="' + $(this).data("id") + '"]');
    ifarame.attr('src', ifarame.attr("src"));
});
//左右
$(".J_tabLeft").on("click", a);
$(".J_tabRight").on("click", b);
//关闭全部
$(".J_tabCloseAll").on("click", function () {
    var $pagetabsContent = $(".page-tabs-content");
    $pagetabsContent.children("[data-id]").not(":first").each(function () {
        $('.J_iframe[data-id="' + $(this).data("id") + '"]').remove();
        $(this).remove()
    });
    $pagetabsContent.children("[data-id]:first").each(function () {
        $('.J_iframe[data-id="' + $(this).data("id") + '"]').show();
        $(this).addClass("active")
    });
    $pagetabsContent.css("margin-left", "0")
})
function removeOpenSubMenuClass() {
    hideMenu.removeClass('open-sub-menu');
}

/**
 * 获取浏览器信息
 * @returns {Array|{index: number, input: string}}
 */
function getBrowserInfo() {
    var agent = navigator.userAgent.toLowerCase();
    var regStr_ie = /msie [\d.]+;/gi;
    var regStr_ff = /firefox\/[\d.]+/gi
    var regStr_chrome = /chrome\/[\d.]+/gi;
    var regStr_saf = /safari\/[\d.]+/gi;
    //IE
    if (agent.indexOf("msie") > 0) {
        return agent.match(regStr_ie);
    }

    //firefox
    if (agent.indexOf("firefox") > 0) {
        return agent.match(regStr_ff);
    }

    //Chrome
    if (agent.indexOf("chrome") > 0) {
        return agent.match(regStr_chrome);
    }

    //Safari
    if (agent.indexOf("safari") > 0 && agent.indexOf("chrome") < 0) {
        return agent.match(regStr_saf);
    }

}
(function ($) {
    $.fn.serializeJson = function () {
        var serializeObj = {};
        $(this.serializeArray()).each(function () {
            serializeObj[this.name] = this.value;
        });
        return serializeObj;
    };
})(jQuery);
window._console = window.console;//将原始console对象缓存
window.console = (function (orgConsole) {
    return {//构造的新console对象
        log: getConsoleFn("log"),
        debug: getConsoleFn("debug"),
        info: getConsoleFn("info"),
        warn: getConsoleFn("warn"),
        exception: getConsoleFn("exception"),
        assert: getConsoleFn("assert"),
        dir: getConsoleFn("dir"),
        dirxml: getConsoleFn("dirxml"),
        trace: getConsoleFn("trace"),
        group: getConsoleFn("group"),
        groupCollapsed: getConsoleFn("groupCollapsed"),
        groupEnd: getConsoleFn("groupEnd"),
        profile: getConsoleFn("profile"),
        profileEnd: getConsoleFn("profileEnd"),
        count: getConsoleFn("count"),
        clear: getConsoleFn("clear"),
        time: getConsoleFn("time"),
        timeEnd: getConsoleFn("timeEnd"),
        timeStamp: getConsoleFn("timeStamp"),
        table: getConsoleFn("table"),
        error: getConsoleFn("error"),
        memory: getConsoleFn("memory"),
        markTimeline: getConsoleFn("markTimeline"),
        timeline: getConsoleFn("timeline"),
        timelineEnd: getConsoleFn("timelineEnd")
    };
    function getConsoleFn(name) {
        return function actionConsole() {
            if (typeof (orgConsole) !== "object") return;
            if (typeof (orgConsole[name]) !== "function") return;//判断原始console对象中是否含有此方法，若没有则直接返回
            return orgConsole[name].apply(orgConsole, Array.prototype.slice.call(arguments));//调用原始函数
        };
    }
}(window._console));
/********************** String工具类***************/
//trim去掉字符串两边的指定字符,默去空格
String.prototype.trim = function (tag) {
    if (!tag) {
        tag = '\\s';
    } else {
        if (tag == '\\') {
            tag = '\\\\';
        } else if (tag == ',' || tag == '|' || tag == ';') {
            tag = '\\' + tag;
        } else {
            tag = '\\s';
        }
    }
    eval('var reg=/(^' + tag + '+)|(' + tag + '+$)/g;');
    return this.replace(reg, '');
};
//字符串截取后面加入...
String.prototype.interceptString = function (len) {
    if (this.length > len) {
        return this.substring(0, len) + "...";
    } else {
        return this;
    }
}
//将一个字符串用给定的字符变成数组
String.prototype.toArray = function (tag) {
    if (this.indexOf(tag) != -1) {
        return this.split(tag);
    } else {
        if (this != '') {
            return [this.toString()];
        } else {
            return [];
        }
    }
}
//只留下数字(0123456789)
String.prototype.toNumber = function () {
    return this.replace(/\D/g, "");
}
//保留中文
String.prototype.toCN = function () {
    var regEx = /[^\u4e00-\u9fa5\uf900-\ufa2d]/g;
    return this.replace(regEx, '');
}
//转成int
String.prototype.toInt = function () {
    var temp = this.replace(/\D/g, "");
    return isNaN(parseInt(temp)) ? this.toString() : parseInt(temp);
}
//是否是以XX开头
String.prototype.startsWith = function (tag) {
    return this.substring(0, tag.length) == tag;
}
//是否已XX结尾
String.prototype.endWith = function (tag) {
    return this.substring(this.length - tag.length) == tag;
}
//StringBuffer
var StringBuffer = function () {
    this._strs = new Array;
};
StringBuffer.prototype.append = function (str) {
    this._strs.push(str);
};
StringBuffer.prototype.toString = function () {
    return this._strs.join("");
};
String.prototype.replaceAll = function (s1, s2) {
    return this.replace(new RegExp(s1, "gm"), s2);
}
function isRefresh() {
    return false;
}
function isSubmitForm() {
    return false;
}
function isFunction(fn) {
    return Object.prototype.toString.call(fn) === '[object Function]';
}
/**
 * 获取随机数
 * @returns {*}
 */
function getNewElementId() {
    var temp = tool.randomString(3);
    return temp + (Math.floor(Math.random() * 10000));
}
/**
 * 初始化select2插件
 * @param el
 */
function initSelect(el) {
    var minimumResultsForSearch = Infinity;
    if (el.attr("data-show-searchbox")) {
        minimumResultsForSearch = 0;
    }
    var val = el.attr("data-val");
    if (isBlank(val)) {
        val = el.attr("data-value");
    }
    var defaultvalue = el.attr('defaultvalue');
    if (defaultvalue != undefined && defaultvalue != 'undefined' && defaultvalue != null && defaultvalue != ''
        && ($('#wid').val() == null || $('#wid').val() == '')) {
        val = defaultvalue;
    }
    if (!isBlank(val)) {
        el.val(val.split(","));
    }
    var childselect = el.attr("data-childselect");
    if (!isBlank(childselect)) {
        el.change();
    }
    var formatState = el.attr("data-format");
    if (!isBlank(formatState)) {
        formatState = new Function('data', formatState);
        el.select2({
            minimumResultsForSearch: minimumResultsForSearch,
            templateResult: formatState,
            templateSelection: formatState,
            theme: "bootstrap",
            width: '100%'
        });
    } else {
        el.select2({
            minimumResultsForSearch: minimumResultsForSearch,
            theme: "bootstrap",
            width: '100%'
        });
        // el.trigger("change");
    }
}
/**
 * 初始化语言
 */
function init_lanagure() {
    //var uulanguage = (navigator.language || navigator.browserLanguage).toLowerCase();
    try {
        if (parent.cookielang != "" && parent.cookielang != null) {
            if (parent.cookielang == "en") {
                $("[data-localize]").each(function () {
                    var attr = $.trim($(this).html());
                    $(this).attr("data-localize", attr);
                    $(this).html(valueforkey(attr, parent.jsonlanguage));
                })
                $('[placeholder]').each(function () {
                    var txt = valueforkey($(this).attr("placeholder"), parent.jsonlanguage);
                    $(this).attr("placeholder", txt);
                })
            }
        }
    } catch (e) {
        // TODO: handle exception
    }

}
function youdao(txt) {
    try {
        if (parent.cookielang == "en") {
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
}

function loadSelectOption(url, data, el, init) {
    if (el != null && el.length > 0) {
        if (init == null) {
            init = true;
        }
        var data_show_id = el.attr("data-show-id"); //是否显示编码
        $.ajax({
            url: tool.initParams(url),
            type: "post",
            data: data,
            dataType: "json",
            timeout: 1000 * 20,
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                if (textStatus == "timeout") {
                    el.html('').append("<option value=''>请求超时</option>");
                    console.error('加载id:' + el.context.id + ' > option超时.');
                } else {
                    console.error(el.context.id + '数据加载失败,请查看Network请求中返回信息.');
                }
                if (init) {
                    initSelect(el);
                }
                //如果加载失败,重新加载一次,如第二次还失败,则不再重新加载
                var retryCount = el.attr('data-retry-count');
                if ('1' != retryCount) {//加载次数不为1
                    el.attr('data-retry-count', '1');
                    setTimeout(loadSelectOption(url, data, el, init), 1000);
                }
            },
            success: function (data) {
                el.html('').append("<option value=''>&nbsp;</option>");
                if (data != null && data.res) {
                    data = data.data;
                    for (var i = 0; i < data.length; i++) {
                        if (data_show_id == '1')
                            el.append('<option data-val="' + data[i].curVal + '" value="' + data[i].id + '">' + data[i].text + '(' + data[i].id + ')</option>');
                        else
                            el.append('<option data-val="' + data[i].curVal + '" value="' + data[i].id + '">' + data[i].text + '</option>');
                    }
                } else {
                    console.error('加载id:' + el.context.id + ' > option时,发生' + data.msg + '异常...');
                }
                if (init) {
                    initSelect(el);
                }
            }
        });
    }
}