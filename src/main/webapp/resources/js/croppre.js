/**
 * Created by tengchong on 15/10/23.
 */

var Crop = {
    $cropper: null,
    CropAvatar: function ($element,fun) {
        this.callback = fun;
        this.$container = $element;
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
        this.init();
    }
};
Crop.CropAvatar.prototype = {
    // constructor: CropAvatar,
    support: {
        fileList: !!$('<input type="file">').prop('files'),
        blobURLs: !!window.URL && URL.createObjectURL,
        formData: !!window.FormData
    },

    init: function () {
        try{
            this.support.datauri = this.support.fileList && this.support.blobURLs;

            if (!this.support.formData) {
                this.initIframe();
            }

            this.initTooltip();
            this.initModal();
            this.addListener();
        }catch (e){
            alert('图片截取仅支持在Chrome、Firefox、Safari、Opera、IE10+、或国产浏览器极速模式下使用,如需使用,请更换其他浏览器.');
        }
    },

    addListener: function () {
        this.$avatarView.on('click', $.proxy(this.click, this));
        this.$avatarInput.on('change', $.proxy(this.change, this));
        // this.$avatarForm.on('submit', $.proxy(this.submit, this));
        this.$avatarSave.on('click', $.proxy(this.submit, this));
        this.$avatarBtns.on('click', $.proxy(this.rotate, this));
    },

    initTooltip: function () {
        this.$avatarView.tooltip({
            placement: 'bottom'
        });
    },

    initModal: function () {
        this.$avatarModal.modal({
            show: false
        });
    },

    initPreview: function () {
        var url = this.$avatar.attr('src');
        this.$avatarPreview.html('<img src="' + url + '">');
    },

    click: function () {
        var _cropper = this;
        this.$avatarModal.modal('show').on('shown.bs.modal', function (e) {
            // do something...
            _cropper.url = _cropper.$avatar.attr('src') + '?date=' + new Date().getTime();
            _cropper.startCropper();
            Crop.$cropper = _cropper.$img;
        });
        this.initPreview();
    },

    change: function () {
        var files;
        var file;
        if (this.support.datauri) {
            files = this.$avatarInput.prop('files');
            if (files.length > 0) {
                file = files[0];
                if (this.isImageFile(file)) {
                    if (this.url) {
                        URL.revokeObjectURL(this.url);
                    }
                    this.url = URL.createObjectURL(file);
                    this.startCropper();
                }
            }
        } else {
            file = this.$avatarInput.val();
            if (this.isImageFile(file)) {
                this.syncUpload();
            }
        }
    },
    submit: function () {
        if (this.support.formData) {
            this.ajaxUpload();
            return false;
        }
    },
    rotate: function (e) {
        var data;
        if (this.active) {
            data = $(e.target).data();
            if (data.method) {
                this.$img.cropper(data.method, data.option);
            }
        }
    },

    isImageFile: function (file) {
        if (file.type) {
            return /^image\/\w+$/.test(file.type);
        } else {
            return /\.(jpg|jpeg|png|gif)$/.test(file);
        }
    },

    startCropper: function () {
        var _this = this;
        if (this.active) {
            this.$img.cropper('replace', this.url);
        } else {
            this.$img = $('<img src="' + this.url + '">');
            this.$avatarWrapper.empty().html(this.$img);
            this.$img.cropper({
                aspectRatio: _this.$container.attr('data-aspectRatio'),
                preview: this.$avatarPreview.selector,
                crop: function (e) {
                    var json = [
                        '{"x":' + e.x,
                        '"y":' + e.y,
                        '"height":' + e.height,
                        '"width":' + e.width,
                        '"rotate":' + e.rotate + '}'
                    ].join();
                    _this.$avatarData.val(json);
                }
            });
            this.active = true;
        }

        this.$avatarModal.one('hidden.bs.modal', function () {
            _this.$avatarPreview.empty();
            _this.stopCropper();
        });
    },

    stopCropper: function () {
        if (this.active) {
            this.$img.cropper('destroy');
            this.$img.remove();
            this.active = false;
        }
    },

    ajaxUpload: function () {
        var _this = this;
        var data = $.parseJSON(_this.$avatarData.val());
        var pic;
        if (data.width > 800 || data.height > 600) {
            pic = _this.$img.cropper("getCroppedCanvas", {
                width: 800,
                height: 600
            });
        } else {
            pic = _this.$img.cropper("getCroppedCanvas");
        }
        pic = pic.toDataURL("image/png");
        pic = pic.replace(/^data:image\/(png|jpg);base64,/, "");
        $.ajax({
            url: basePath + '/croppre',
            method: 'post',
            data: 'imageData=' + pic,
            processData: false,
            beforeSend: function () {
                _this.submitStart();
            },

            success: function (data) {
                _this.submitDone(data);
            },

            error: function (XMLHttpRequest, textStatus, errorThrown) {
                _this.submitFail(textStatus || errorThrown);
            },

            complete: function () {
                _this.submitEnd();
            }
        });
    },

    syncUpload: function () {
        this.$avatarSave.click();
    },

    submitStart: function () {
        this.$loading.fadeIn();
    },

    submitDone: function (data) {
        var _this = this;
        if ($.isPlainObject(data) && data.state === 200) {
            if (data.url) {
                this.url = basePath + data.url;
                _this.callback(data);
//                    $('#cover').val(nodePath + data.result);

                if (this.support.datauri || this.uploaded) {
                    this.uploaded = false;
                    this.cropDone();
                } else {
                    this.uploaded = true;
                    this.startCropper();
                }

                this.$avatarInput.val('');
            } else if (data.message) {
                this.alert(data.message);
            }
        } else {
            this.alert('上传失败,请重试!');
        }
    },

    submitFail: function (msg) {
        this.alert(msg);
    },

    submitEnd: function () {
        this.$loading.fadeOut();
    },

    cropDone: function () {
        this.$avatarForm.find('.alert').remove();
        // this.$avatarForm.get(0).reset();
        this.$avatar.attr('src', this.url);
        this.stopCropper();
        this.$avatarModal.modal('hide');
    },

    alert: function (msg) {
        var $alert = [
            '<div class="alert alert-danger avatar-alert alert-dismissable">',
            '<button type="button" class="close" data-dismiss="alert">&times;</button>',
            msg,
            '</div>'
        ].join('');
        this.$avatarUpload.after($alert);
    }
};