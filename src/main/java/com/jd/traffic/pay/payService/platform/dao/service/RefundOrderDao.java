package com.jd.traffic.pay.payService.platform.dao.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.ModelMap;

import com.jd.framework.util.Pager;
import com.jd.traffic.pay.payService.platform.model.RefundOrder;

public interface RefundOrderDao {
	public void insert(RefundOrder refundOrder);

	public RefundOrder selectById(String id);

	public RefundOrder selectByRefundOrderNo(String refundOrderNo);

	public RefundOrder getRefundOrderByTradeRefundNoMchId(String tradeRefundNo, String merchantId);

	public List<RefundOrder> selectByPayOrderNo(String payOrderNo);

	public List<RefundOrder> selectByStatus(String payOrderNo, int status);

	public List parmList(ModelMap modelMap, Pager pager, HttpServletRequest request);

	public void updateRefundAmount(RefundOrder refundOrder);

	public void update(RefundOrder refundOrder);

	public void updateStatusById(String id, int status, String errorCode, String errorMsg);

	public void deleteById(String id);
}
