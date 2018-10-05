package com.jd.traffic.pay.payService.platform.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.ModelMap;

import com.jd.framework.util.Pager;
import com.jd.traffic.pay.payService.platform.model.PayOrder;

public interface PayOrderService {

	// 创建支付订单，同时生成 第三方订单号
	public void createPayOrder(PayOrder order);

	public PayOrder getPayOrderByPk(String id);

	public PayOrder getPayOrder(String payOrderNo);

	public List<PayOrder> getPayOrders(String mchId, String tradeOrderNo);

	public List getPayOrderList(ModelMap modelmap, Pager pager, HttpServletRequest request);

	public void updatePayType(String id, String payTypeCode, String tradeType);

	public void updatePayRequest(String id, String prePayId, String codeUrl);

	public void updateStatus(String id, int status, String errorCode, String errorMsg);

	public void updateRefund(String id, int status, int refundAmount);

	// 更新订单退款状态（全部退款，部分退款）， 同时更新 payOrder的已退款金额
	public void updateRefundStatus(String payOrderNo, int refundAmount);

	public void updatePayOrder(PayOrder order);

	public void delete(String id);
}
