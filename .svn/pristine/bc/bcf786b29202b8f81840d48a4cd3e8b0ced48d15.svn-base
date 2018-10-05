package com.jd.traffic.pay.payService.platform.service.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import com.jd.framework.util.Pager;
import com.jd.system.service.BaseAbstractService;
import com.jd.traffic.pay.payApiModel.platform.enums.PayStatus;
import com.jd.traffic.pay.payService.platform.dao.service.PayOrderDao;
import com.jd.traffic.pay.payService.platform.model.PayOrder;
import com.jd.traffic.pay.payService.platform.service.PayOrderService;
import com.jd.traffic.pay.payService.platform.utils.SnUtils;

@Service
public class PayOrderServiceImpl extends BaseAbstractService implements PayOrderService {
	@Autowired
	private PayOrderDao payOrderDao;

	private String generatePayOrderNo() {
		return SnUtils.generateOrderNo("1001");
	}

	// 创建支付订单，同时生成 第三方订单号
	public void createPayOrder(PayOrder order) {
		order.setPayOrderNo(generatePayOrderNo());
		payOrderDao.insert(order);
	}

	public PayOrder getPayOrderByPk(String id) {
		return payOrderDao.selectById(id);
	}

	public PayOrder getPayOrder(String payOrderNo) {
		return payOrderDao.selectByPayOrderNo(payOrderNo);
	}

	public List<PayOrder> getPayOrders(String mchId, String tradeOrderNo) {
		return payOrderDao.selectByTradeOrderNo(mchId, tradeOrderNo);
	}

	@Override
	public List getPayOrderList(ModelMap modelmap, Pager pager, HttpServletRequest request) {
		return payOrderDao.parmList(modelmap, pager,request);
	}

	public void updatePayType(String id, String payTypeCode, String tradeType) {
		payOrderDao.updatePayTypeById(id, payTypeCode, tradeType);
	}

	public void updatePayRequest(String id, String prePayId, String codeUrl) {
		payOrderDao.updatePrePayById(id, prePayId, codeUrl, PayStatus.CREATE_PAYMENT_SUCCESS.getValue());
	}

	public void updateStatus(String id, int status, String errorCode, String errorMsg) {
		payOrderDao.updateStatusById(id, status, errorCode, errorMsg);
	}

	public void updateRefund(String id, int status, int refundAmount) {
		payOrderDao.updateRefundById(id, status, refundAmount);
	}

	// 更新订单退款状态（全部退款，部分退款）， 同时更新 payOrder的已退款金额
	public void updateRefundStatus(String payOrderNo, int refundAmount) {
		PayOrder payOrder = getPayOrder(payOrderNo);
		int status = PayStatus.REFUND_SUCCESS.getValue();
		int rfamount = (payOrder.getRefundAmount() == null ? 0 : payOrder.getRefundAmount()) + refundAmount;
		if (rfamount < payOrder.getPayAmount()) {
			status = PayStatus.REFUND_PART.getValue();
		}
		updateRefund(payOrder.getId(), status, rfamount);
	}

	public void updatePayOrder(PayOrder order) {
		payOrderDao.update(order);
	}

	public void delete(String id) {
		payOrderDao.deleteById(id);
	}

}
