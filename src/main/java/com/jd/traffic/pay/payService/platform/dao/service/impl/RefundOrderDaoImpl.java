package com.jd.traffic.pay.payService.platform.dao.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Repository;
import org.springframework.ui.ModelMap;

import com.jd.framework.util.DBUtil;
import com.jd.framework.util.Pager;
import com.jd.framework.util.SeqFactory;
import com.jd.system.service.BaseAbstractService;
import com.jd.traffic.pay.payService.platform.dao.service.RefundOrderDao;
import com.jd.traffic.pay.payService.platform.model.RefundOrder;
import com.jd.util.StringUtil;

@Repository
public class RefundOrderDaoImpl extends BaseAbstractService implements RefundOrderDao {

	@Override
	public void insert(RefundOrder refundOrder) {
		refundOrder.setId(SeqFactory.getNewSequenceAlone());
		getBaseDao().save(refundOrder);
	}

	@Override
	public RefundOrder selectById(String id) {
		String sql = "select * from REFUND_ORDER where id = ?";
		List<Object> params = new ArrayList<Object>();
		params.add(id);
		RefundOrder refundOrder = DBUtil.queryBean(sql, RefundOrder.class, params.toArray());
		return refundOrder;
	}

	@Override
	public RefundOrder selectByRefundOrderNo(String refundOrderNo) {
		String sql = "select * from refund_order where refund_order_no = ?";
		List<Object> params = new ArrayList<Object>();
		params.add(refundOrderNo);
		RefundOrder refundOrder = DBUtil.queryBean(sql, RefundOrder.class, params.toArray());
		return refundOrder;
	}

	@Override
	public List<RefundOrder> selectByPayOrderNo(String payOrderNo) {
		String sql = "select * from refund_order where pay_order_no = ?";
		List<Object> params = new ArrayList<Object>();
		params.add(payOrderNo);
		List<RefundOrder> refundOrders = DBUtil.queryAllBeanList(sql, RefundOrder.class, params.toArray());
		return refundOrders;
	}

	@Override
	public List<RefundOrder> selectByStatus(String payOrderNo, int status) {
		String sql = "select * from refund_order where pay_order_no = ? and status = ?";
		List<Object> params = new ArrayList<Object>();
		params.add(payOrderNo);
		params.add(status);
		List<RefundOrder> refundOrders = DBUtil.queryAllBeanList(sql, RefundOrder.class, params.toArray());
		return refundOrders;
	}

	@Override
	public RefundOrder getRefundOrderByTradeRefundNoMchId(String tradeRefundNo, String merchantId) {
		String sql = "select * from refund_order where trade_refund_no = ? and merchant_id=?";
		List<Object> params = new ArrayList<Object>();
		params.add(tradeRefundNo);
		params.add(merchantId);
		RefundOrder refundOrder = DBUtil.queryBean(sql, RefundOrder.class, params.toArray());
		return refundOrder;
	}

	@Override
	public List parmList(ModelMap modelMap, Pager pager, HttpServletRequest request) {
		RefundOrder object = (RefundOrder) modelMap.get("object");
		List<Object> params = new ArrayList<Object>();
		String sql = "select * from refund_order p where 1=1 ";
		if (StringUtil.isNotBlank(object.getMerchantId())) {
			sql += " AND p.MERCHANT_ID LIKE ?";
			params.add("%" + object.getMerchantId() + "%");
		}
		if (StringUtil.isNotBlank(object.getRefundOrderNo())) {
			sql += " AND p.REFUND_ORDER_NO LIKE ?";
			params.add("%" + object.getRefundOrderNo() + "%");
		}
		if (StringUtil.isNotBlank(request.getParameter("staTime"))) {
			sql += " AND p.REFUND_TIME >= to_date(?,'yyyy-mm-dd hh24:mi:ss') ";
			params.add(request.getParameter("staTime"));
		}
		if (StringUtil.isNotBlank(request.getParameter("endTime"))) {
			sql += " AND p.REFUND_TIME <= to_date(?,'yyyy-mm-dd hh24:mi:ss') ";
			params.add(request.getParameter("endTime"));
		}
		sql+=" ORDER BY p.CREATE_TIME desc ";
		pager.setTotalRows(DBUtil.count("select count(1) from( " + sql + " )", params.toArray()));
		List<Map<String, String>> models = com.jd.traffic.pay.util.DBUtil.queryPageForList(pager, sql, params.toArray());
		return models;
	}

	@Override
	public void updateRefundAmount(RefundOrder refundOrder) {
		String sql = "update refund_order set refund_amount = ? where id = ?";
		List<Object> params = new ArrayList<Object>();
		params.add(refundOrder.getRefundAmount());
		params.add(refundOrder.getId());
		DBUtil.executeSQL(sql, params.toArray());
	}

	@Override
	public void update(RefundOrder refundOrder) {
		getBaseDao().update(refundOrder);
	}

	@Override
	public void updateStatusById(String id, int status, String errorCode, String errorMsg) {
		String sql = "update refund_order set status=?,error_code=?,error_msg=? where id=?";
		List<Object> params = new ArrayList<Object>();
		params.add(status);
		params.add(errorCode);
		params.add(errorMsg);
		params.add(id);
		DBUtil.executeSQL(sql, params.toArray());
	}

	@Override
	public void deleteById(String id) {
		String sql = "delete from refund_order where id=?";
		List<Object> params = new ArrayList<Object>();
		params.add(id);
		DBUtil.executeSQL(sql, params.toArray());
	}
}
