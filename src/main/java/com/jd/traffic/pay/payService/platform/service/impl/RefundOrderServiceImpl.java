package com.jd.traffic.pay.payService.platform.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.RandomStringUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import com.jd.framework.util.Pager;
import com.jd.system.service.BaseAbstractService;
import com.jd.traffic.pay.payApiModel.platform.enums.PayStatus;
import com.jd.traffic.pay.payApiModel.platform.enums.RefundStatus;
import com.jd.traffic.pay.payService.platform.dao.service.RefundOrderDao;
import com.jd.traffic.pay.payService.platform.model.PayOrder;
import com.jd.traffic.pay.payService.platform.model.RefundOrder;
import com.jd.traffic.pay.payService.platform.service.RefundOrderService;
import com.jd.traffic.pay.payService.platform.utils.SnUtils;

@Service
public class RefundOrderServiceImpl extends BaseAbstractService implements RefundOrderService {
	private Log logger = LogFactory.getLog(this.getClass());

	@Autowired
	private RefundOrderDao refundOrderDao;

	// 用于 微信支付宝 退款的 退款订单号, batch_no
	private String generateRefundOrderNo() {
		Date now = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String no = sdf.format(now);
		no += RandomStringUtils.randomNumeric(4) + "2000";
		no += RandomStringUtils.randomNumeric(32 - no.length());
		return no;
	}

	// 业务方 退款订单号
	private String generateTradeRefundNo() {
		return SnUtils.generateOrderNo("3101");
	}

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
			String refundReason) {
		if (payOrder == null) {
			throw new IllegalArgumentException("支付订单不存在");
		}
		if (payOrder.getStatus() == PayStatus.REFUND_SUCCESS.getValue()) {
			throw new IllegalArgumentException("支付订单已全部退款");
		}
		if (payOrder.getStatus() != PayStatus.PAY_SUCCESS.getValue()
				&& payOrder.getStatus() != PayStatus.REFUND_PART.getValue()) {
			throw new IllegalArgumentException("支付订单当前状态不能退款:" + payOrder.getStatusDesc());
		}
		// 支持部分退款， 故需要判断， 目前只判断了退款成功的。
		List<RefundOrder> refundOrders = this.getRefundOrderByPayOrderNo(payOrder.getPayOrderNo(),
				RefundStatus.REFUND_SUCCESS.getValue());
		if (refundOrders != null && refundOrders.size() > 0) {
			int amount = 0;
			for (RefundOrder order : refundOrders) {
				amount += order.getRefundAmount();
			}
			if (amount + refundAmount > payOrder.getPayAmount()) {
				throw new IllegalArgumentException("退款金额大于支付金额");
			}
		}
		RefundOrder refundOrder = new RefundOrder();
		if (StringUtils.isBlank(tradeRefundNo)) {
			tradeRefundNo = generateTradeRefundNo();
		}
		refundOrder.setRefundReason(refundReason); // 退款原因
		refundOrder.setTradeRefundNo(tradeRefundNo);

		refundOrder.setPayOrderNo(payOrder.getPayOrderNo());
		refundOrder.setPayAmount(payOrder.getPayAmount());
		refundOrder.setPayTypeCode(payOrder.getPayTypeCode());
		refundOrder.setTradePayNo(payOrder.getTradePayNo());
		refundOrder.setPayId(payOrder.getPayId());

		refundOrder.setMerchantId(payOrder.getMerchantId());
		refundOrder.setTradeType(payOrder.getTradeType());

		refundOrder.setRefundAmount(refundAmount);
		refundOrder.setPayChannelId(payChannelId);
		createRefundOrder(refundOrder);
		return refundOrder;
	}

	public void createRefundOrder(RefundOrder refundOrder) {
		refundOrder.setStatus(RefundStatus.CREATE_REFUND_SUCCESS.getValue());
		refundOrder.setRefundOrderNo(generateRefundOrderNo());
		refundOrder.setCreateTime(new Date());
		refundOrderDao.insert(refundOrder);
	}

	public RefundOrder getRefundOrderByPk(String id) {
		return refundOrderDao.selectById(id);
	}

	public RefundOrder getRefundOrder(String refundOrderNo) {
		return refundOrderDao.selectByRefundOrderNo(refundOrderNo);
	}

	public List<RefundOrder> getRefundOrderByPayOrderNo(String payOrderNo) {
		return refundOrderDao.selectByPayOrderNo(payOrderNo);
	}

	public List<RefundOrder> getRefundOrderByPayOrderNo(String payOrderNo, int status) {
		return refundOrderDao.selectByStatus(payOrderNo, status);
	}

	@Override
	public List getRefundOrderList(ModelMap modelMap, Pager pager, HttpServletRequest request) {
		return refundOrderDao.parmList(modelMap, pager,request);
	}

	public void updateRefundOrder(RefundOrder refundOrder) {
		refundOrderDao.update(refundOrder);
	}

	public void updateRefundAmount(RefundOrder refundOrder) {
		refundOrderDao.updateRefundAmount(refundOrder);
	}

	public void updateStatus(String id, int status, String errorCode, String errorMsg) {
		refundOrderDao.updateStatusById(id, status, errorCode, errorMsg);
	}

	public void deleteRefundOrder(String id) {
		refundOrderDao.deleteById(id);
	}

	public RefundOrder getRefundOrderByTradeRefundNoMchId(String tradeRefundNo, String merchantId) {
		return refundOrderDao.getRefundOrderByTradeRefundNoMchId(tradeRefundNo, merchantId);
	}

}
