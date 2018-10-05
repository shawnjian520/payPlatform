package com.jd.traffic.pay.payService.wechat.service;

import java.util.Date;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jd.traffic.pay.payApiModel.api.response.RefundResponse;
import com.jd.traffic.pay.payApiModel.platform.enums.PayException;
import com.jd.traffic.pay.payApiModel.platform.enums.PayStatus;
import com.jd.traffic.pay.payApiModel.platform.enums.RefundStatus;
import com.jd.traffic.pay.payService.api.service.InternalRefundService;
import com.jd.traffic.pay.payService.platform.model.FileResource;
import com.jd.traffic.pay.payService.platform.model.PayChannel;
import com.jd.traffic.pay.payService.platform.model.RefundOrder;
import com.jd.traffic.pay.payService.platform.service.FileResourceService;
import com.jd.traffic.pay.payService.platform.service.PayOrderService;
import com.jd.traffic.pay.payService.platform.service.RefundOrderService;
import com.jd.traffic.pay.payService.wechat.client.WechatPayClient;
import com.jd.traffic.pay.payService.wechat.exception.WechatPayException;
import com.jd.traffic.pay.payService.wechat.model.WechatPayRefundModel;
import com.jd.traffic.pay.payService.wechat.request.WechatPayRefundRequest;
import com.jd.traffic.pay.payService.wechat.response.WechatPayRefundResponse;

/**
 * 微信退款相关
 */
@Service
public class WechatRefundService implements InternalRefundService {
    private Log logger = LogFactory.getLog(this.getClass());

    @Autowired
    private PayOrderService payOrderService;
    @Autowired
    private RefundOrderService refundOrderService;
    @Autowired
    private FileResourceService fileResourceService;

    @Override
    public Object refund(PayChannel payChannel, RefundOrder refundOrder) {
        FileResource resource = fileResourceService.getFileResource(payChannel.getCertFileId());
        WechatPayRefundRequest refundRequest = new WechatPayRefundRequest();
        WechatPayRefundModel refundModel = new WechatPayRefundModel();
        refundRequest.setModel(refundModel);
        refundModel.setOutTradeNo(refundOrder.getPayOrderNo());
        refundModel.setTransactionId(refundOrder.getPayId());
        refundModel.setOutRefundNo(refundOrder.getRefundOrderNo());
        refundModel.setTotalFee(refundOrder.getPayAmount());
        refundModel.setRefundFee(refundOrder.getRefundAmount());
        refundModel.setOpUserId(payChannel.getMchId());
        WechatPayClient client = new WechatPayClient(payChannel.getAppId(), payChannel.getMchId(), payChannel.getApiKey(), resource.getFileData());
        WechatPayRefundResponse refundResponse;
        try {
            refundResponse = client.execute(refundRequest);
        } catch (WechatPayException e) {
            logger.error(e.getMessage(), e);
            refundOrder.setStatus(PayStatus.CREATE_PAYMENT_FAIL.getValue());
            refundOrder.setErrorMsg(e.getErrMsg());
            refundOrder.setErrorCode(e.getErrCode());
            refundOrderService.updateStatus(refundOrder.getId(), RefundStatus.REFUND_FAIL.getValue(), e.getErrCode(), e.getErrMsg());
            throw new PayException(e.getErrMsg());
        }

        if (refundResponse.isSuccess()) {
            refundOrder.setStatus(RefundStatus.REFUND_SUCCESS.getValue());
            refundOrder.setRefundTime(new Date());
            refundOrder.setRefundId(refundResponse.getRefundId());
            refundOrderService.updateRefundOrder(refundOrder);
            // 更新payOrder的状态和退款额度字段，
            payOrderService.updateRefundStatus(refundOrder.getPayOrderNo(), refundOrder.getRefundAmount());
            return true;
        } else {
            refundOrder.setStatus(RefundStatus.REFUND_FAIL.getValue());
            refundOrder.setRefundId(refundResponse.getRefundId());
            refundOrder.setErrorCode(refundResponse.getErrCode());
            refundOrder.setErrorMsg(refundResponse.getErrCodeDes());
            refundOrderService.updateStatus(refundOrder.getId(), RefundStatus.REFUND_FAIL.getValue(), refundResponse.getErrCode(), refundResponse.getErrCodeDes());

            throw new PayException("微信退款失败：" + refundResponse.getErrCode() + "," + refundResponse.getErrCodeDes());
        }

    }

    @Override
    public RefundResponse parse(PayChannel channel, RefundOrder refundOrder, String notify) {
        throw new PayException("此方法不支持");
    }
}
