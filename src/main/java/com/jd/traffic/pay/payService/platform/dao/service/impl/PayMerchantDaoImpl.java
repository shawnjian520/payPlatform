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
import com.jd.traffic.pay.payService.platform.dao.service.PayMerchantDao;
import com.jd.traffic.pay.payService.platform.model.PayMerchant;
import com.jd.util.StringUtil;

@Repository("payMerchantDao")
public class PayMerchantDaoImpl extends BaseAbstractService implements PayMerchantDao {

	@Override
	public List list(ModelMap modelMap, Pager pager,HttpServletRequest request) {
		PayMerchant object = (PayMerchant) modelMap.get("object");
		List<Object> params = new ArrayList<Object>();
		String sql = "select * from PAY_MERCHANT p where 1=1 ";
		if (StringUtil.isNotBlank(object.getMerchantId())) {
			sql += " AND p.MERCHANT_ID LIKE ?";
			params.add("%" + object.getMerchantId() + "%");
		}
		if (StringUtil.isNotBlank(object.getName())) {
			sql += " AND p.NAME LIKE ?";
			params.add("%" + object.getName() + "%");
		}
		if (StringUtil.isNotBlank(request.getParameter("startTime"))) {
			sql += " AND p.createtime >= to_date(?,'yyyy-mm-dd hh24:mi:ss') ";
			params.add(request.getParameter("startTime"));
		}
		if (StringUtil.isNotBlank(request.getParameter("endTime"))) {
			sql += " AND p.createtime <= to_date(?,'yyyy-mm-dd hh24:mi:ss') ";
			params.add(request.getParameter("endTime"));
		}
		sql+=" ORDER BY p.CREATETIME desc ";
		pager.setTotalRows(DBUtil.count("select count(1) from( " + sql + " )", params.toArray()));
		List<Map<String, String>> models = com.jd.traffic.pay.util.DBUtil.queryPageForList(pager, sql, params.toArray());
		return models;
	}

	@Override
	public PayMerchant selectById(String id) {
		String sql = "select * from PAY_MERCHANT where id=?";
		List<Object> params = new ArrayList<Object>();
		params.add(id);
		PayMerchant payMerchant = DBUtil.queryBean(sql, PayMerchant.class, params.toArray());
		return payMerchant;
	}

	@Override
	public PayMerchant selectByMerchantId(String merchantId) {
		String sql = "select * from PAY_MERCHANT where MERCHANT_ID=?";
		List<Object> params = new ArrayList<Object>();
		params.add(merchantId);
		PayMerchant payMerchant = DBUtil.queryBean(sql, PayMerchant.class, params.toArray());
		return payMerchant;
	}

	@Override
	public PayMerchant selectByName(String name) {
		String sql = "select * from PAY_MERCHANT where NAME like ?";
		List<Object> params = new ArrayList<Object>();
		params.add("%" + name + "%");
		PayMerchant payMerchant = DBUtil.queryBean(sql, PayMerchant.class, params.toArray());
		return payMerchant;
	}
	
	@Override
	public void insert(PayMerchant payMerchant) {
		payMerchant.setId(SeqFactory.getNewSequenceAlone());
		getBaseDao().save(payMerchant);
	}

	@Override
	public void update(PayMerchant payMerchant) {
		String sql = "update pay_merchant set name=?, api_key=? where id=?";
		List<Object> params = new ArrayList<Object>();
		params.add(payMerchant.getName());
		params.add(payMerchant.getApiKey());
		params.add(payMerchant.getId());
		DBUtil.executeSQL(sql, params.toArray());
	}

	@Override
	public void updateStatusById(String id, int status) {
		String sql = "update pay_merchant set status=? where id=?";
		List<Object> params = new ArrayList<Object>();
		params.add(status);
		params.add(id);
		DBUtil.executeSQL(sql, params.toArray());
	}

	@Override
	public void deleteById(String id) {
		String sql = "delete from pay_merchant where id=?";
		List<Object> params = new ArrayList<Object>();
		params.add(id);
		DBUtil.executeSQL(sql, params.toArray());
	}

	

}
