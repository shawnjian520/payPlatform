package com.jd.traffic.pay.payService.unionPay.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.jd.traffic.pay.payApiModel.api.response.RefundResponse;
import com.jd.traffic.pay.payApiModel.platform.enums.PayException;
import com.jd.traffic.pay.payApiModel.platform.enums.RefundStatus;
import com.jd.traffic.pay.payService.api.service.InternalRefundService;
import com.jd.traffic.pay.payService.platform.model.PayChannel;
import com.jd.traffic.pay.payService.platform.model.RefundOrder;
import com.jd.traffic.pay.payService.platform.service.PayChannelService;
import com.jd.traffic.pay.payService.platform.service.PayOrderService;
import com.jd.traffic.pay.payService.platform.service.RefundOrderService;
import com.jd.traffic.pay.payService.unionPay.client.UnionPayClient;
import com.jd.traffic.pay.payService.unionPay.exception.UnionPayException;
import com.jd.traffic.pay.payService.unionPay.request.UnionRefundRequest;
import com.jd.traffic.pay.payService.unionPay.response.UnionRefundResponse;

/**
 * @ClassName: UnionRefundService
 * @Description:银联支付退款
 * @author: zhangjian
 * @date: 2018年5月30日 上午9:22:40
 */
@Service
public class UnionRefundService implements InternalRefundService {
    private Log logger = LogFactory.getLog(this.getClass());
    
    @Autowired
    private PayChannelService payChannelService;
    
    @Autowired
    private RefundOrderService refundOrderService;
    
    @Autowired
    private PayOrderService payOrderService;
    
	@Override
	public Object refund(PayChannel payChannel, RefundOrder refundOrder) {
		if (!"0".equals(payChannel.getQueryChannelId())) {
			payChannel = payChannelService.getPayChannelByPrimaryKey(payChannel.getQueryChannelId());
		}
		UnionPayClient client = new UnionPayClient(payChannel.getMchId(),
		        payChannel.getAppId(), "QRPAYDEFAULT", "WWW.GZETC12122.COM",
		        "3003", payChannel.getApiKey());
		 	
		UnionRefundRequest request = new UnionRefundRequest(client.getMid(), client.getTid(), client.getInstMid(), refundOrder.getPayId(), getBillDate(refundOrder.getCreateTime()), refundOrder.getRefundAmount().toString());
		request.setRequestTimestamp(getRequestTimestamp());
		UnionRefundResponse response;
        try {
            logger.info("request=" + JSON.toJSONString(request, SerializerFeature.WriteDateUseDateFormat));
            response = client.execute(request);
            logger.info("response=" + JSON.toJSONString(response, SerializerFeature.WriteDateUseDateFormat));
        } catch (UnionPayException e) {
            logger.error(e.getMessage(), e);
            refundOrderService.updateStatus(refundOrder.getId(), RefundStatus.REFUND_FAIL.getValue(), e.getErrCode(), e.getErrMsg());
            throw new PayException(e);
        }
        if (response.isSuccess(client)) {
            refundOrder.setRefundTime(getRefundTime(response.getRefundPayTime()));
            refundOrder.setStatus(RefundStatus.REFUND_SUCCESS.getValue());
            refundOrderService.updateRefundOrder(refundOrder);
            payOrderService.updateRefundStatus(refundOrder.getPayOrderNo(), refundOrder.getRefundAmount());
            return true;
        } else {
            refundOrder.setErrorCode(response.getErrCode());
            refundOrder.setErrorMsg("退款失败,状态码:" + response.getErrCode());
            refundOrder.setStatus(RefundStatus.REFUND_FAIL.getValue());
            refundOrderService.updateRefundOrder(refundOrder);
        }
        throw new PayException("不支持退款");
	}

	@Override
	public RefundResponse parse(PayChannel channel, RefundOrder refundOrder,
	        String notify) {
		return null;
	}
	
	private String getBillDate(Date date){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String billDate = sdf.format(date);
		return billDate;
	}
	
	private String getRequestTimestamp() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String requestTimestamp = sdf.format(new Date());
		return requestTimestamp;
	}
	
	private Date getRefundTime(String time){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date refundTime = null;
		try {
			refundTime = sdf.parse(time);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return refundTime;
				
	}
}
