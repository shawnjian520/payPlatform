package com.jd.traffic.pay.payService.wechat.request;


import com.jd.traffic.pay.payService.wechat.model.WechatPayPrePayModel;
import com.jd.traffic.pay.payService.wechat.response.WechatPayPrePayResponse;

/**
 * 微信统一下单接口
 */
public class WechatPayPrePayRequest implements WechatPayRequest<WechatPayPrePayModel, WechatPayPrePayResponse> {
    private WechatPayPrePayModel model;

    @Override
    public String getApiAction() {
        return "/pay/unifiedorder";
    }

    @Override
    public WechatPayPrePayModel getModel() {
        return this.model;
    }

    @Override
    public void setModel(WechatPayPrePayModel model) {
        this.model = model;
    }

    @Override
    public Class<WechatPayPrePayModel> getObjectClass() {
        return WechatPayPrePayModel.class;
    }

    @Override
    public Class<WechatPayPrePayResponse> getResponseClass() {
        return WechatPayPrePayResponse.class;
    }

    @Override
    public boolean requireCert() {
        return false;
    }
}
