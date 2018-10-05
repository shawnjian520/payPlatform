package com.jd.traffic.pay.payService.platform.service.impl;

import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import com.jd.framework.util.Pager;
import com.jd.system.service.BaseAbstractService;
import com.jd.traffic.pay.payApiModel.platform.enums.PayTypeCode;
import com.jd.traffic.pay.payApiModel.platform.enums.TradeTypeCode;
import com.jd.traffic.pay.payApiModel.validate.CollectionUtils;
import com.jd.traffic.pay.payService.platform.dao.service.PayMerchantChannelDao;
import com.jd.traffic.pay.payService.platform.model.PayChannel;
import com.jd.traffic.pay.payService.platform.model.PayMerchant;
import com.jd.traffic.pay.payService.platform.model.PayMerchantChannel;
import com.jd.traffic.pay.payService.platform.service.PayChannelService;
import com.jd.traffic.pay.payService.platform.service.PayMerchantChannelService;
import com.jd.traffic.pay.payService.platform.service.PayMerchantService;

@Service
public class PayMerchantChannelServiceImpl extends BaseAbstractService implements PayMerchantChannelService {
	@Autowired
	private PayMerchantChannelDao payMerchantChannelDao;
	@Autowired
	private PayChannelService payChannelService;
	@Autowired
	private PayMerchantService payMerchantService;

	public void createPayMerchantChannel(PayMerchantChannel payMerchantChannel) {
		payMerchantChannelDao.insert(payMerchantChannel);
	}

	public void delete(String id) {
		payMerchantChannelDao.deleteById(id);
	}

	public void deleteByMerId(String merchantId){
		payMerchantChannelDao.deleteByMerId(merchantId);
	}
	
	public void deleteByChaId(String channelId){
		payMerchantChannelDao.deleteByChaId(channelId);
	}
	
	public PayMerchantChannel getPayMerchantChannel(String id) {
		PayMerchantChannel merchantChannel = payMerchantChannelDao.selectById(id);
		merchantChannel.setPayMerchant(payMerchantService.getPayMerchant(merchantChannel.getPayMerchantId()));
		merchantChannel.setPayChannel(payChannelService.getPayChannelByPrimaryKey(merchantChannel.getPayChannelId()));
		return merchantChannel;
	}

	public List<PayMerchantChannel> getPayMerchantChannels(String merchantId) {
		List<PayMerchantChannel> merchantChannels = payMerchantChannelDao.selectByMerchantId(merchantId);
		return setPayChannels(merchantChannels);
	}

	public List<PayMerchantChannel> getPayMerchantChannelByMchIdAndTradeType(String merchantId, String tradeType) {
		List<PayMerchantChannel> merchantChannels = payMerchantChannelDao.selectByTradeType(merchantId, tradeType);
		return setPayChannels(merchantChannels);
	}

	public PayMerchantChannel getPayMerchantChannel(String merchantId, int payTypeId, TradeTypeCode tradeType) {
		PayMerchantChannel merchantChannel = payMerchantChannelDao.selectByPayType(merchantId, payTypeId,
				tradeType.toString());
		if (merchantChannel == null) {
			return null;
		}
		merchantChannel.setPayChannel(payChannelService.getPayChannelByPrimaryKey(merchantChannel.getPayChannelId()));
		return merchantChannel;
	}

	public PayMerchantChannel getPayMerchantChannel(String merchantId, PayTypeCode payTypeCode,
			TradeTypeCode tradeType) {
		PayMerchant payMerchant = payMerchantService.getPayMerchant(merchantId);
		PayMerchantChannel merchantChannel = this.getPayMerchantChannel(payMerchant.getId(), payTypeCode.getId(),
				tradeType);
		if (merchantChannel == null) {
			return null;
		}
		merchantChannel.setPayMerchant(payMerchant);
		return merchantChannel;
	}

	@Override
	public List getMerChaList(ModelMap modelmap,Pager pager) {
		return payMerchantChannelDao.pramList(modelmap,pager);
		 
	}
	
	private List<PayMerchantChannel> setPayChannels(List<PayMerchantChannel> merchantChannels) {
		if (CollectionUtils.isEmpty(merchantChannels)) {
			return merchantChannels;
		}
		Set<String> channelIds = new HashSet<String>();
		for (PayMerchantChannel merchantChannel : merchantChannels) {
			channelIds.add(merchantChannel.getPayChannelId());
		}
		List<PayChannel> channels = payChannelService.getPayChannel(channelIds);
		Map<String, PayChannel> channelMap = new HashMap<String, PayChannel>(channels.size());
		for (PayChannel channel : channels) {
			channelMap.put(channel.getId(), channel);
		}
		for (PayMerchantChannel merchantChannel : merchantChannels) {
			merchantChannel.setPayChannel(channelMap.get(merchantChannel.getPayChannelId()));
		}
		return merchantChannels;
	}

//	@Override
//	public PayMerchantChannel selectByPayChannelId(String payChannelId) {
//		return payMerchantChannelDao.selectByPayChannelId(payChannelId);
//	}

	

}
