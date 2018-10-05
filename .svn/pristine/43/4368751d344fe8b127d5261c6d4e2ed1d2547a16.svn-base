package com.jd.traffic.pay.payService.wechat.request;

import com.jd.traffic.pay.payService.wechat.model.WechatPayRefundModel;
import com.jd.traffic.pay.payService.wechat.response.WechatPayRefundResponse;

/**
 * 微信退款接口
 */
public class WechatPayRefundRequest implements WechatPayRequest<WechatPayRefundModel, WechatPayRefundResponse> {
    private WechatPayRefundModel wechatPayRefundModel;

    @Override
    public WechatPayRefundModel getModel() {
        return this.wechatPayRefundModel;
    }

    @Override
    public void setModel(WechatPayRefundModel model) {
        this.wechatPayRefundModel = model;
    }

    @Override
    public String getApiAction() {
        return "/secapi/pay/refund";
    }

    @Override
    public Class<WechatPayRefundModel> getObjectClass() {
        return WechatPayRefundModel.class;
    }

    @Override
    public Class<WechatPayRefundResponse> getResponseClass() {
        return WechatPayRefundResponse.class;
    }

    /**
     * 微信退款需要数字证书！！！！！！
     *
     * @return
     */
    @Override
    public boolean requireCert() {
        return true;
    }
}
