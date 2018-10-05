package com.jd.traffic.pay.payService.platform.dao.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.ModelMap;

import com.jd.framework.util.Pager;
import com.jd.traffic.pay.payService.platform.model.PayOrder;

public interface PayOrderDao {
	public void insert(PayOrder payOrder);

	public PayOrder selectById(String id);

	public PayOrder selectByPayOrderNo(String payOrderNo);

	public PayOrder selectByPrePayId(String prePayId);

	public List<PayOrder> selectByTradeOrderNo(String mchId, String tradePayNo);

	public List parmList(ModelMap modelMap, Pager pager, HttpServletRequest request);

	public void update(PayOrder payOrder);

	public void updatePrePayById(String id, String prePayId, String codeUrl, Integer status);

	public void updatePayTypeById(String id, String payTypeCode, String tradeType);

	public void updateStatusById(String id, int status, String errorCode, String errorMsg);

	public void updateRefundById(String id, int status, int refundAmount);

	public void deleteById(String id);
}
