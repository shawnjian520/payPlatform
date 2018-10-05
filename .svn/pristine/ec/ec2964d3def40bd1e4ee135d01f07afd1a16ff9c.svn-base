package com.jd.traffic.pay.payService.platform.dao.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Repository;
import org.springframework.ui.ModelMap;

import com.jd.framework.util.DBUtil;
import com.jd.framework.util.Pager;
import com.jd.framework.util.SeqFactory;
import com.jd.system.service.BaseAbstractService;
import com.jd.traffic.pay.payService.platform.dao.service.PayOrderDao;
import com.jd.traffic.pay.payService.platform.model.PayOrder;
import com.jd.util.StringUtil;

@Repository
public class PayOrderDaoImpl extends BaseAbstractService implements PayOrderDao {

	@Override
	public void insert(PayOrder payOrder) {
		payOrder.setId(SeqFactory.getNewSequenceAlone());
		getBaseDao().save(payOrder);
	}

	@Override
	public PayOrder selectById(String id) {
		String sql = "select * from PAY_ORDER where id = ?";
		List<Object> params = new ArrayList<Object>();
		params.add(id);
		PayOrder payOrder = DBUtil.queryBean(sql, PayOrder.class, params.toArray());
		return payOrder;
	}

	@Override
	public PayOrder selectByPayOrderNo(String payOrderNo) {
		String sql = "select * from pay_order where pay_order_no = ?";
		List<Object> params = new ArrayList<Object>();
		params.add(payOrderNo);
		PayOrder payOrder = DBUtil.queryBean(sql, PayOrder.class, params.toArray());
		return payOrder;
	}

	@Override
	public PayOrder selectByPrePayId(String prePayId) {
		String sql = "select * from pay_order where pre_pay_id = ?";
		List<Object> params = new ArrayList<Object>();
		params.add(prePayId);
		PayOrder payOrder = DBUtil.queryBean(sql, PayOrder.class, params.toArray());
		return payOrder;
	}

	@Override
	public List<PayOrder> selectByTradeOrderNo(String mchId, String tradePayNo) {
		String sql = "select  * from pay_order where trade_pay_no = ? and merchant_id=?";
		List<Object> params = new ArrayList<Object>();
		params.add(tradePayNo);
		params.add(mchId);
		List<PayOrder> payOrders = DBUtil.queryAllBeanList(sql, PayOrder.class, params.toArray());
		return payOrders;
	}

	@Override
	public List parmList(ModelMap modelMap, Pager pager, HttpServletRequest request) {
		PayOrder object = (PayOrder) modelMap.get("object");
		List<Object> params = new ArrayList<Object>();
		String sql = "select * from PAY_ORDER p where 1=1 ";
		if (StringUtil.isNotBlank(object.getMerchantId())) {
			sql += " AND p.MERCHANT_ID LIKE ?";
			params.add("%" + object.getMerchantId() + "%");
		}
		if (StringUtil.isNotBlank(object.getPayOrderNo())) {
			sql += " AND p.PAY_ORDER_NO LIKE ?";
			params.add("%" + object.getPayOrderNo() + "%");
		}
		if (StringUtil.isNotBlank(request.getParameter("staTime"))) {
			sql += " AND p.PAY_TIME >= to_date(?,'yyyy-mm-dd hh24:mi:ss') ";
			params.add(request.getParameter("staTime"));
		}
		if (StringUtil.isNotBlank(request.getParameter("endTime"))) {
			sql += " AND p.PAY_TIME <= to_date(?,'yyyy-mm-dd hh24:mi:ss') ";
			params.add(request.getParameter("endTime"));
		}
		sql+=" ORDER BY p.start_time desc ";
		pager.setTotalRows(DBUtil.count("select count(1) from( " + sql + " )", params.toArray()));
		List<Map<String, String>> models = com.jd.traffic.pay.util.DBUtil.queryPageForList(pager, sql, params.toArray());
		return models;
	}

	@Override
	public void update(PayOrder payOrder) {
		getBaseDao().update(payOrder);
	}

	@Override
	public void updatePrePayById(String id, String prePayId, String codeUrl, Integer status) {
		StringBuffer sb = new StringBuffer("update pay_order set");
		List<Object> params = new ArrayList<Object>();
		if (StringUtil.isNotEmpty(prePayId)) {
			sb.append(" ").append("pre_pay_id = ?").append(",");
			params.add(prePayId);
		}
		if (StringUtil.isNotEmpty(codeUrl)) {
			sb.append(" ").append("code_url = ?").append(",");
			params.add(codeUrl);
		}
		if (status != null) {
			sb.append(" ").append("status = ? ").append(",");
			params.add(status);
		}
		if (sb.toString().endsWith(",")) {
			sb = new StringBuffer(sb.substring(0, sb.toString().lastIndexOf(",")));
		}
		sb.append(" ").append("where id = ?");
		params.add(id);
		DBUtil.executeSQL(sb.toString(), params.toArray());
	}

	@Override
	public void updatePayTypeById(String id, String payTypeCode, String tradeType) {
		String sql = "update pay_order set pay_type_code = ?, trade_type = ? where id = ?";
		List<Object> params = new ArrayList<Object>();
		params.add(payTypeCode);
		params.add(tradeType);
		params.add(id);
		DBUtil.executeSQL(sql, params.toArray());
	}

	@Override
	public void updateStatusById(String id, int status, String errorCode, String errorMsg) {
		List<Object> params = new ArrayList<Object>();
		StringBuffer sb = new StringBuffer("update pay_order set status = ?");
		params.add(status);
		if (StringUtils.isNotEmpty(errorCode)) {
			sb.append(" ").append(",").append("error_code = ?");
			params.add(errorCode);
		}
		if (StringUtil.isNotEmpty(errorMsg)) {
			sb.append(" ").append(",").append(" error_msg = ?");
			params.add(errorMsg);
		}
		sb.append(" ").append("where id = ?");
		params.add(id);
		DBUtil.executeSQL(sb.toString(), params.toArray());
	}

	@Override
	public void updateRefundById(String id, int status, int refundAmount) {
		String sql = "update pay_order set status = ?, refund_amount = ? where id = ?";
		List<Object> params = new ArrayList<Object>();
		params.add(status);
		params.add(refundAmount);
		params.add(id);
		DBUtil.executeSQL(sql, params.toArray());
	}

	@Override
	public void deleteById(String id) {
		String sql = "delete from pay_order where id =?";
		List<Object> params = new ArrayList<Object>();
		params.add(id);
		DBUtil.executeSQL(sql, params.toArray());
	}

}
