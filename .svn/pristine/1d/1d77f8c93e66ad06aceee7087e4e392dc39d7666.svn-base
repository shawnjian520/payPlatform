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
import com.jd.traffic.pay.payService.platform.dao.service.PayChannelDao;
import com.jd.traffic.pay.payService.platform.model.PayChannel;
import com.jd.util.StringUtil;

@Repository
public class PayChannelDaoImpl extends BaseAbstractService implements PayChannelDao {

	@Override
	public void insert(PayChannel payChannel) {
		payChannel.setId(SeqFactory.getNewSequenceAlone());
		getBaseDao().save(payChannel);
	}

	@Override
	public void deleteById(String id) {
		String sql = "delete from pay_channel where id = ?";
		List<Object> params = new ArrayList<Object>();
		params.add(id);
		DBUtil.executeSQL(sql, params.toArray());
	}

	@Override
	public void update(PayChannel payChannel) {
		getBaseDao().update(payChannel);

	}

	@Override
	public void updateStatusById(String id, Integer status) {
		String sql = "update PAY_CHANNEL set STATUS=? where id=?";
		List<Object> params = new ArrayList<Object>();
		params.add(status);
		params.add(id);
		DBUtil.executeSQL(sql, params.toArray());
	}

	@Override
	public void updateByPayTypeId(int payTypeId, String payTypeName, String payTypeCode) {
		String sql = "update pay_channel set pay_type_name=?, pay_type_code=? where pay_type_id = ?";
		List<Object> params = new ArrayList<Object>();
		params.add(payTypeName);
		params.add(payTypeCode);
		params.add(payTypeId);
		DBUtil.executeSQL(sql, params.toArray());

	}

	@Override
	public PayChannel selectById(String id) {
		String sql = "select * from PAY_CHANNEL where id = ?";
		List<Object> params = new ArrayList<Object>();
		params.add(id);
		PayChannel payChannel = DBUtil.queryBean(sql, PayChannel.class, params.toArray());
		return payChannel;
	}

	@Override
	public List<PayChannel> getPayChannelList(String ids) {
		String sql = "select t.* from pay_channel t where id in (?)";
		List<Object> params = new ArrayList<Object>();
		params.add(ids);
		List<PayChannel> payChannels = DBUtil.queryAllBeanList(sql, PayChannel.class, params.toArray());
		return payChannels;
	}

	@Override
	public List list(ModelMap modelMap, Pager pager, HttpServletRequest request) {
		PayChannel object = (PayChannel) modelMap.get("object");
		List<Object> params = new ArrayList<Object>();
		String sql = "select * from pay_channel p where 1=1 ";
		if (StringUtil.isNotBlank(object.getPayTypeName())) {
			sql += " AND p.pay_type_name LIKE ?";
			params.add("%" + object.getPayTypeName() + "%");
		}
		if (StringUtil.isNotBlank(object.getPayChannelName())) {
			sql += " AND p.PAY_CHANNEL_NAME LIKE ?";
			params.add("%" + object.getPayChannelName() + "%");
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
	public List getPayChannel(ModelMap modelMap, Pager pager) {
		PayChannel object = (PayChannel) modelMap.get("object");
		List<Object> params = new ArrayList<Object>();
		String sql = "select * from pay_channel p where 1=1 ";
		List<Map<String, String>> models =  com.jd.traffic.pay.util.DBUtil.queryPageForList(null, sql, params.toArray());
		return models;
	}
	
	

}
