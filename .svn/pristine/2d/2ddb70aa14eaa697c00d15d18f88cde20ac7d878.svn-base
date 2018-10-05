package com.jd.traffic.pay.payService.platform.dao.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;
import org.springframework.ui.ModelMap;

import com.jd.framework.util.DBUtil;
import com.jd.framework.util.Pager;
import com.jd.framework.util.SeqFactory;
import com.jd.system.service.BaseAbstractService;
import com.jd.traffic.pay.payService.platform.dao.service.PayMerchantChannelDao;
import com.jd.traffic.pay.payService.platform.model.PayMerchantChannel;
import com.jd.util.StringUtil;

@Repository
public class PayMerchantChannelDaoImpl extends BaseAbstractService implements PayMerchantChannelDao {

	@Override
	public void insert(PayMerchantChannel payMerchantChannel) {
		payMerchantChannel.setId(SeqFactory.getNewSequenceAlone());
		getBaseDao().save(payMerchantChannel);
	}

	@Override
	public void deleteById(String id) {
		String sql = "delete from pay_merchant_channel where id = ?";
		List<Object> params = new ArrayList<Object>();
		params.add(id);
		DBUtil.executeSQL(sql, params.toArray());
	}
	
	@Override
	public void deleteByMerId(String merchantId) {
		String sql = "delete from pay_merchant_channel where pay_merchant_id = ?";
		List<Object> params = new ArrayList<Object>();
		params.add(merchantId);
		DBUtil.executeSQL(sql, params.toArray());
	}
	
	@Override
	public void deleteByChaId(String channelId) {
		String sql = "delete from pay_merchant_channel where pay_channel_id = ?";
		List<Object> params = new ArrayList<Object>();
		params.add(channelId);
		DBUtil.executeSQL(sql, params.toArray());
	}

	@Override
	public PayMerchantChannel selectById(String id) {
		String sql = "select * from PAY_MERCHANT_CHANNEL where id = ?";
		List<Object> params = new ArrayList<Object>();
		params.add(id);
		PayMerchantChannel payMerchantChannel = DBUtil.queryBean(sql, PayMerchantChannel.class, params.toArray());
		return payMerchantChannel;
	}

	@Override
	public List<PayMerchantChannel> selectByMerchantId(String merchantId) {
		String sql = "select * from pay_merchant_channel where pay_merchant_id = ?";
		List<Object> params = new ArrayList<Object>();
		params.add(merchantId);
		List<PayMerchantChannel> payMerchantChannels = DBUtil.queryAllBeanList(sql, PayMerchantChannel.class,
				params.toArray());
		return payMerchantChannels;
	}

	@Override
	public List<PayMerchantChannel> selectByTradeType(String merchantId, String tradeType) {
		String sql = "select * from pay_merchant_channel where pay_merchant_id = ? and trade_type = ?";
		List<Object> params = new ArrayList<Object>();
		params.add(merchantId);
		params.add(tradeType);
		List<PayMerchantChannel> payMerchantChannels = DBUtil.queryAllBeanList(sql, PayMerchantChannel.class,
				params.toArray());
		return payMerchantChannels;
	}

	@Override
	public PayMerchantChannel selectByPayType(String merchantId, int payTypeId, String tradeType) {
		String sql = "select * from pay_merchant_channel where pay_merchant_id = ? and pay_type_id = ? and trade_type = ?";
		List<Object> params = new ArrayList<Object>();
		params.add(merchantId);
		params.add(payTypeId);
		params.add(tradeType);
		PayMerchantChannel payMerchantChannel = DBUtil.queryBean(sql, PayMerchantChannel.class, params.toArray());
		return payMerchantChannel;
	}

	@Override
	public List pramList(ModelMap modelmap,Pager pager) {
		PayMerchantChannel object = (PayMerchantChannel) modelmap.get("object");
		List<Object> params = new ArrayList<Object>();
		String sql = "select * from pay_merchant_channel p where 1=1 ";
		if (StringUtil.isNotBlank(object.getPayMerchantId())) {
			sql += " AND p.pay_merchant_id LIKE ?";
			params.add("%" + object.getPayMerchantId() + "%");
		}
		pager.setTotalRows(DBUtil.count("select count(1) from( " + sql + " )", params.toArray()));
		List<Map<String, String>> models = com.jd.traffic.pay.util.DBUtil.queryPageForList(pager, sql, params.toArray());
		return models;
	}

//	@Override
//	public PayMerchantChannel selectByPayChannelId(String payChannelId) {
//		String sql = "select count(*) from pay_merchant_channel where pay_channel_id = ? ";
//		List<Object> params = new ArrayList<Object>();
//		params.add(payChannelId);
//		PayMerchantChannel payMerchantChannel = DBUtil.queryBean(sql, PayMerchantChannel.class, params.toArray());
//		return payMerchantChannel;
//	}

}
