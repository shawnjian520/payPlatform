package com.jd.traffic.pay.payService.platform.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.ModelMap;

import com.jd.framework.util.Pager;
import com.jd.traffic.pay.payService.platform.model.PayOrder;
import com.jd.traffic.pay.payService.platform.model.RefundOrder;

public interface RefundOrderService {

	/**
	 * tradeRefundNo 业务方 退款订单号
	 * <p/>
	 * 创建退款订单
	 *
	 * @param payOrder
	 * @param payChannelId
	 * @param tradeRefundNo
	 * @param refundAmount
	 * @param refundReason
	 * @return
	 */
	public RefundOrder createRefundOrder(PayOrder payOrder, String payChannelId, String tradeRefundNo, int refundAmount,
			String refundReason);

	public void createRefundOrder(RefundOrder refundOrder);

	public RefundOrder getRefundOrderByPk(String id);

	public RefundOrder getRefundOrder(String refundOrderNo);

	public List<RefundOrder> getRefundOrderByPayOrderNo(String payOrderNo);

	public List<RefundOrder> getRefundOrderByPayOrderNo(String payOrderNo, int status);

	public List getRefundOrderList(ModelMap modelMap, Pager pager, HttpServletRequest request);

	public void updateRefundOrder(RefundOrder refundOrder);

	public void updateRefundAmount(RefundOrder refundOrder);

	public void updateStatus(String id, int status, String errorCode, String errorMsg);

	public void deleteRefundOrder(String id);

	public RefundOrder getRefundOrderByTradeRefundNoMchId(String tradeRefundNo, String merchantId);
}
