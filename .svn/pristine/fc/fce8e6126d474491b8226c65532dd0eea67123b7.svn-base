package com.jd.traffic.pay.payService.platform.service;

import java.util.List;

import org.springframework.ui.ModelMap;

import com.jd.framework.util.Pager;
import com.jd.traffic.pay.payApiModel.platform.enums.PayTypeCode;
import com.jd.traffic.pay.payApiModel.platform.enums.TradeTypeCode;
import com.jd.traffic.pay.payService.platform.model.PayMerchantChannel;

public interface PayMerchantChannelService {

	public void createPayMerchantChannel(PayMerchantChannel payMerchantChannel);

	public void delete(String id);
	
	public void deleteByMerId(String merchantId);
	
	public void deleteByChaId(String channelId);

	public PayMerchantChannel getPayMerchantChannel(String id);

	public List<PayMerchantChannel> getPayMerchantChannels(String merchantId);

	public List<PayMerchantChannel> getPayMerchantChannelByMchIdAndTradeType(String merchantId, String tradeType);

	public PayMerchantChannel getPayMerchantChannel(String merchantId, int payTypeId, TradeTypeCode tradeType);

	public PayMerchantChannel getPayMerchantChannel(String merchantId, PayTypeCode payTypeCode,TradeTypeCode tradeType);
	
	public List getMerChaList(ModelMap modelmap,Pager pager);

//	public PayMerchantChannel selectByPayChannelId(String payChannelId);
	// private List<PayMerchantChannel> setPayChannels(List<PayMerchantChannel>
	// merchantChannels);

}
