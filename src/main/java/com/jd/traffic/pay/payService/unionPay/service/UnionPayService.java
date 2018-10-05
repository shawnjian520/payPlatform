package com.jd.traffic.pay.payService.unionPay.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jd.traffic.pay.payApiModel.api.response.PayNotifyResponse;
import com.jd.traffic.pay.payApiModel.platform.enums.PayException;
import com.jd.traffic.pay.payApiModel.platform.enums.PayStatus;
import com.jd.traffic.pay.payService.api.service.InternalPayService;
import com.jd.traffic.pay.payService.platform.model.PayChannel;
import com.jd.traffic.pay.payService.platform.model.PayOrder;
import com.jd.traffic.pay.payService.platform.service.PayOrderService;
import com.jd.traffic.pay.payService.unionPay.client.UnionPayClient;
import com.jd.traffic.pay.payService.unionPay.exception.UnionPayException;
import com.jd.traffic.pay.payService.unionPay.request.UnionPayQueryRequest;
import com.jd.traffic.pay.payService.unionPay.request.UnionPayRequest;
import com.jd.traffic.pay.payService.unionPay.response.UnionPayBillPaymentResponse;
import com.jd.traffic.pay.payService.unionPay.response.UnionPayQueryResponse;
import com.jd.traffic.pay.payService.unionPay.response.UnionPayResponse;
import com.jd.util.StringUtil;

@Service
public class UnionPayService implements InternalPayService {
	private Log logger = LogFactory.getLog(this.getClass());
	
	@Autowired
	private PayOrderService payOrderService;
	

	@Override
	public Object pay(PayChannel payChannel, PayOrder order) {
		switch (order.getTradeTypeCodeEnum()) {
		case NATIVE: {
			if (order.getStatus() == PayStatus.CREATE_PAYMENT_SUCCESS
			        .getValue()) {
				return order.getCodeUrl();
			} else if (order.getStatus() == PayStatus.CREATE_PAYMENT
			        .getValue()) {
				return getNativePayUrl(payChannel, order);
			} else {
				throw new PayException("订单状态异常");
			}
		}
		case WAP: {
			throw new PayException("支付类型不支持");
		}
		case APP: {
			throw new PayException("支付类型不支持");
		}
		}
		return null;
	}

	private String getNativePayUrl(PayChannel payChannel, PayOrder order) {
		UnionPayRequest unionPayRequest = new UnionPayRequest();
		if (order.getStatus() == PayStatus.CREATE_PAYMENT.getValue()) {
			UnionPayClient client = new UnionPayClient(payChannel.getMchId(),
			        payChannel.getAppId(), "QRPAYDEFAULT", "WWW.GZETC12122.COM",
			        "3003", payChannel.getApiKey());
			unionPayRequest.setMsgId(getMsgId(client.getSystemCode()));
			unionPayRequest.setMsgSrc(client.getMsgSrc());
			unionPayRequest.setMsgType("bills.getQRCode");
			unionPayRequest.setRequestTimestamp(getTimestamp());
			unionPayRequest.setMid(client.getMid());
			unionPayRequest.setInstMid(client.getInstMid());
			unionPayRequest.setBillNo(getBillNo("3050"));
			unionPayRequest.setBillDate(getBillDate());
			unionPayRequest.setBillDesc(order.getSubject());
			unionPayRequest.setTotalAmount(order.getPayAmount().toString());
			unionPayRequest.setNotifyUrl(order.getNotifyUrl());
			unionPayRequest.setExpireTime(formatExpireTime(order.getExpireTime()));
			unionPayRequest.setTid(client.getTid());
			// 统一下单
			UnionPayResponse response = null;
			try {
				response = client.execute(unionPayRequest);
			} catch (UnionPayException e) {
				// 支付失败
				logger.error(e.getMessage(), e);
				order.setStatus(PayStatus.CREATE_PAYMENT_FAIL.getValue());
				order.setErrorMsg(e.getErrMsg());
				order.setErrorCode(StringUtil.isEmpty(e.getErrCode()) ? "": e.getErrCode());
				payOrderService.updateStatus(order.getId(),PayStatus.CREATE_PAYMENT_FAIL.getValue(),e.getErrCode(), e.getErrMsg());
				throw new PayException(e.getErrMsg());
			}
			
			if(response.isValidResponse(client)){
				order.setStatus(PayStatus.CREATE_PAYMENT_SUCCESS.getValue());
				order.setCodeUrl(response.getBillQRCode());
				payOrderService.updatePayRequest(order.getId(),response.getBillNo(), response.getBillQRCode());
			} else {
				order.setStatus(PayStatus.CREATE_PAYMENT_FAIL.getValue());
				order.setErrorCode(response.getErrCode());
				order.setErrorMsg(response.getErrMsg());
				payOrderService.updateStatus(order.getId(),PayStatus.CREATE_PAYMENT_FAIL.getValue(),response.getErrCode(), response.getErrMsg());
				throw new PayException(response.getErrMsg());
			}

		}
		// 如果已经下过单，则直接返回
		if (order.getStatus() != PayStatus.CREATE_PAYMENT_SUCCESS.getValue()) {
			throw new PayException("订单状态异常");
		}

		switch (order.getTradeTypeCodeEnum()) {
		case NATIVE:
			return order.getCodeUrl();
		default:
			throw new PayException("交易类型不存在");
		}
	}

	private String getMsgId(String systemCode) {
		StringBuffer sb = new StringBuffer();
		if (StringUtil.isNotEmpty(systemCode)) {
			sb.append(systemCode);
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddmmHHssSSS");
		String time = sdf.format(new Date());
		sb.append(time);
		Random random = new Random();
		for (int i = 0; i < 7; i++) {
			sb.append(random.nextInt(10));
		}
		return sb.toString();
	}

	private String getTimestamp() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String requestTimestamp = sdf.format(new Date());
		return requestTimestamp;
	}

	/**
	 * 
	 * @Title: getBillNo
	 * @Description:生成银联二维码要求的订单号,格式={系统编号(4位)}{时间(yyyyMMddmmHHssSSS)(17位)}{7位随机数}
	 * @param systemCode
	 * @return
	 * @return: String
	 */
	private String getBillNo(String systemCode) {
		StringBuffer sb = new StringBuffer();
		if (StringUtil.isNotEmpty(systemCode)) {
			sb.append(systemCode);
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddmmHHssSSS");
		String time = sdf.format(new Date());
		sb.append(time);
		Random random = new Random();
		for (int i = 0; i < 7; i++) {
			sb.append(random.nextInt(10));
		}
		return sb.toString();
	}

	private String getBillDate() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String billDate = sdf.format(new Date());
		return billDate;
	}
	
	private String getBillDate(Date date){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String billDate = sdf.format(date);
		return billDate;
	}
	
	private String formatExpireTime(Date expireTime){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String strExpireTime = sdf.format(expireTime);
		return strExpireTime;
	}

	@Override
	public String getOutTradeNo(String notify) {
		return null;
	}

	@Override
	public PayNotifyResponse parse(PayChannel channel, PayOrder order,
	        String notify) {
		return null;
	}

	@Override
	public boolean synchronize(PayChannel payChannel, PayOrder order) {
		UnionPayClient client = new UnionPayClient(payChannel.getMchId(),payChannel.getAppId(), "QRPAYDEFAULT", "WWW.GZETC12122.COM",
		        "3003", payChannel.getApiKey());
		UnionPayQueryRequest queryRequest = new UnionPayQueryRequest();
		queryRequest.setMid(client.getMid());
		queryRequest.setTid(client.getTid());
		queryRequest.setInstMid(client.getInstMid());
		queryRequest.setBillNo(order.getPrePayId());
		queryRequest.setBillDate(getBillDate(order.getStartTime()));
		queryRequest.setRequestTimestamp(getTimestamp());


		// 统一下单
		UnionPayQueryResponse response = null;
		try {
			response = client.execute(queryRequest);
		} catch (UnionPayException e) {
            // 支付失败
            logger.error(e.getMessage(), e);
            throw new RuntimeException(e.getMessage());
        }

		  if (PayStatus.CREATE_PAYMENT.getValue() == order.getStatus()
	                || PayStatus.CREATE_PAYMENT_SUCCESS.getValue() == order.getStatus()
	                || PayStatus.PAY_CHECKING.getValue() == order.getStatus()) {
	            if (querySuccess(response)) {
	            	UnionPayBillPaymentResponse unionPayBillPaymentResponse = response.getUnionPayBillPaymentResponse();
	            	if(unionPayBillPaymentResponse.getTargetSys().equals("WXPay")){
	            		setOrderPaySuccessWithWebChat(order, unionPayBillPaymentResponse.getBuyerId(), unionPayBillPaymentResponse.getPayTime(), response.getBillNo());
	            	}else{
	            		setOrderPaySuccessWithAli(order, unionPayBillPaymentResponse.getBuyerId(),unionPayBillPaymentResponse.getBuyerUsername() ,unionPayBillPaymentResponse.getPayTime(),response.getBillNo());
	            	}
	                return true;
	            } else if (queryNotpay(response)) {
	                Date now = new Date();
	                if (now.after(order.getExpireTime())) {
	                    payOrderService.updateStatus(order.getId(), PayStatus.PAY_CLOSE.getValue(), null, null);
	                    return true;
	                } else {
	                    return false;
	                }
	            } else {
	                payOrderService.updateStatus(order.getId(), PayStatus.PAY_CLOSE.getValue(), null, null);
	                return true;
	            }
	        }
	        return false;
	}
	
	
    // 订单支付成功， 设置payOrder状态
    private void setOrderPaySuccessWithWebChat(PayOrder order, String openId, String payTime, String transactionId) {
    	SimpleDateFormat sdf =  new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        order.setStatus(PayStatus.PAY_SUCCESS.getValue());
        order.setOpenId(openId);
        try {
			order.setPayTime(sdf.parse(payTime));
		} catch (ParseException e) {
			e.printStackTrace();
		}
        order.setPayId(transactionId);
        payOrderService.updatePayOrder(order);
    }
    
    // 订单支付成功， 设置payOrder状态
    private void setOrderPaySuccessWithAli(PayOrder order, String buyerId, String buyerLogonId, String payTime, String tradeNo) {
    	SimpleDateFormat sdf =  new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	order.setStatus(PayStatus.PAY_SUCCESS.getValue());
        order.setOpenId(buyerId);
        order.setBuyerLogonId(buyerLogonId);
        try {
			order.setPayTime(sdf.parse(payTime));
		} catch (ParseException e) {
			e.printStackTrace();
		}
        order.setPayId(tradeNo);
        payOrderService.updatePayOrder(order);
    }
    
    

    // 支付成功
    public boolean querySuccess(UnionPayQueryResponse response) {
        return response != null &&("SUCCESS".equals(response.getErrCode())) && (
                "PAID".equals(response.getBillStatus()));
    }

    

    //支付中
    public boolean queryNotpay(UnionPayQueryResponse response) {
        return response != null &&
                "SUCESS".equals(response.getErrCode()) &&
                "UNPAID".equals(response.getBillStatus());
    }
}


