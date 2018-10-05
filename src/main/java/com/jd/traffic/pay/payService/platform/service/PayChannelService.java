package com.jd.traffic.pay.payService.platform.service;

import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import com.jd.framework.util.Pager;
import com.jd.traffic.pay.payService.platform.model.PayChannel;

@Service
public interface PayChannelService {

	public void createPayChannel(PayChannel payChannel);

	public void deletePayChannel(String id);

	public void updatePayChannel(PayChannel payChannel);

	public void updatePayChannel(String id, int status);

	public PayChannel getPayChannelByPrimaryKey(String id);

	public List<PayChannel> getPayChannel(Set<String> channelIds);
	
	public List showPayChannelList(ModelMap modelmap, Pager pager, HttpServletRequest request);
	
	public List getPayChannel(ModelMap modelMap, Pager pager);
}
