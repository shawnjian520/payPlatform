package com.jd.traffic.pay.payService.platform.dao.service;

import java.util.List;

import org.springframework.ui.ModelMap;

import com.jd.framework.util.Pager;
import com.jd.traffic.pay.payService.platform.model.PayMerchantChannel;

public interface PayMerchantChannelDao {
	
	public void insert(PayMerchantChannel payMerchantChannel);

	public void deleteById(String id);
	
	public void deleteByMerId(String merchantId);
	
	public void deleteByChaId(String channelId);

	public PayMerchantChannel selectById(String id);

	public List<PayMerchantChannel> selectByMerchantId(String merchantId);

	public List<PayMerchantChannel> selectByTradeType(String merchantId, String tradeType);

	public PayMerchantChannel selectByPayType(String merchantId, int payTypeId, String tradeType);

	public  List pramList(ModelMap modelmap,Pager pager);

//	public PayMerchantChannel selectByPayChannelId(String payChannelId);
	
}
