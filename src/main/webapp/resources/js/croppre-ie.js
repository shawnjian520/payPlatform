var cropzoom = null;
var filePath = null;
var config = {
    width: 360,
    height: 360,
    bgColor: '#fcfcfc',
    enableRotation: false,
    enableZoom: true,
    zoomSteps: 10,
    rotationSteps: 10,
    selector: {
        w: 100,
        h: 150,
        aspectRatio: true,
        showPositionsOnDrag: false,
        showDimetionsOnDrag: false,
        centered: false,
        borderColor: 'blue',
        borderColorHover: 'red'
    },
    image: {
        width: 0,
        height: 0,
        minZoom: 100,
        maxZoom: 150
    }
}
var $avatarPreview = null;
var aspectRatio = 1;
var Crop = {
    $cropper: null,
    CropAvatar: function ($element, fun) {
        this.callback = fun;
        this.$container = $element;
        aspectRatio = this.$container.attr('data-aspectRatio');
        this.$avatarView = this.$container.find('.avatar-view');
        this.$avatar = this.$avatarView.find('img');
        this.$avatarModal = $('#avatar-modal');
        this.$loading = this.$container.find('.loading');
        this.$avatarForm = this.$avatarModal.find('.avatar-form');
        this.$avatarData = this.$avatarForm.find('.avatar-data');
        this.$avatarUpload = this.$avatarForm.find('.avatar-upload');
        this.$avatarInput = this.$avatarForm.find('.avatar-input');
        this.$avatarSave = this.$avatarForm.find('.avatar-save');
        this.$avatarBtns = this.$avatarForm.find('.avatar-btns,.aspect-ratio-btns');
        this.$avatarWrapper = this.$avatarModal.find('.avatar-wrapper');
        this.$avatarPreview = this.$avatarModal.find('.avatar-preview');
        $avatarPreview = this.$avatarWrapper;
        this.init();
    }
};
Crop.CropAvatar.prototype = {
    init: function () {
        var _cro = this;
        tool.initFileUploadByConfig({
            auto: true,
            selector: '.avatar-input',
            fileTypeExts: '*.jpg;*.png;*.bmp',
            queueSizeLimit: 1,
            uploader: basePath + '/servlet/croppreUpload',
            queueID: 'upload-queue',
            onSelect: function (queue) {

            },
            onUploadSuccess: function (file, data) {
                data = $.parseJSON(data);
                filePath = data.filePath;
                config.image.source = 'http://192.168.0.145:9080/pros' + data.url;
                config.image.width = data.width;
                config.image.height = data.height;
                $avatarPreview = $avatarPreview.html('<div class="auto"></div>').find('div');
                cropzoom = $avatarPreview.cropzoom(config);
                cropzoom.setSelector(45, 45, 100, 100 * aspectRatio, true);
                _cro.$avatarSave.click(function () {
                    cropzoom.send(basePath + '/croppre', 'POST', {
                        path: filePath,
                        type: 'cropzoom'
                    }, function (data) {
                        _cro.$avatar.attr('src', basePath + data.url);
                        _cro.$avatarModal.modal('hide');
                    });
                });
            }
        });
        this.initModal();
        this.addListener();
    },

    addListener: function () {
        this.$avatarView.on('click', $.proxy(this.click, this));
        this.$avatarInput.on('change', $.proxy(this.change, this));
    },

    initModal: function () {
        // this.$avatarModal.modal({
        //     show: false
        // });
    },

    click: function () {
        var _cropper = this;
        this.$avatarModal.modal('show').on('shown.bs.modal', function (e) {
            _cropper.url = _cropper.$avatar.attr('src') + '?date=' + new Date().getTime();
            _cropper.startCropper();
        });
    },

    isImageFile: function (file) {
        if (file.type) {
            return /^image\/\w+$/.test(file.type);
        } else {
            return /\.(jpg|jpeg|png|gif)$/.test(file);
        }
    },
    startCropper: function () {

    }
};
// 更新：
// 05.27: 1、保证回调执行顺序：error > ready > load；2、回调函数this指向img本身
// 04-02: 1、增加图片完全加载后的回调 2、提高性能

/**
 * 图片头数据加载就绪事件 - 更快获取图片尺寸
 * @version    2011.05.27
 * @see        http://blog.phpdr.net/js-get-image-size.html
 * @param    {String}    图片路径
 * @param    {Function}    尺寸就绪
 * @param    {Function}    加载完毕 (可选)
 * @param    {Function}    加载错误 (可选)
 * @example imgReady('http://www.google.com.hk/intl/zh-CN/images/logo_cn.png', function () {
		alert('size ready: width=' + this.width + '; height=' + this.height);
	});
 */
var imgReady = (function () {
    var list = [], intervalId = null,

        // 用来执行队列
        tick = function () {
            var i = 0;
            for (; i < list.length; i++) {
                list[i].end ? list.splice(i--, 1) : list[i]();
            }
            ;
            !list.length && stop();
        },

        // 停止所有定时器队列
        stop = function () {
            clearInterval(intervalId);
            intervalId = null;
        };

    return function (url, ready, load, error) {
        var onready, width, height, newWidth, newHeight, img = new Image();

        img.src = url;

        // 如果图片被缓存，则直接返回缓存数据
        if (img.complete) {
            ready.call(img);
            load && load.call(img);
            return;
        }
        ;

        width = img.width;
        height = img.height;

        // 加载错误后的事件
        img.onerror = function () {
            error && error.call(img);
            onready.end = true;
            img = img.onload = img.onerror = null;
        };

        // 图片尺寸就绪
        onready = function () {
            newWidth = img.width;
            newHeight = img.height;
            if (newWidth !== width || newHeight !== height ||
                // 如果图片已经在其他地方加载可使用面积检测
                newWidth * newHeight > 1024
            ) {
                ready.call(img);
                onready.end = true;
            }
            ;
        };
        onready();

        // 完全加载完毕的事件
        img.onload = function () {
            // onload在定时器时间差范围内可能比onready快
            // 这里进行检查并保证onready优先执行
            !onready.end && onready();

            load && load.call(img);

            // IE gif动画会循环执行onload，置空onload即可
            img = img.onload = img.onerror = null;
        };

        // 加入队列中定期执行
        if (!onready.end) {
            list.push(onready);
            // 无论何时只允许出现一个定时器，减少浏览器性能损耗
            if (intervalId === null) intervalId = setInterval(tick, 40);
        }
        ;
    };
})();