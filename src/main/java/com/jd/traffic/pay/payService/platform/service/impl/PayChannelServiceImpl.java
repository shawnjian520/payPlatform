package com.jd.traffic.pay.payService.platform.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import com.jd.framework.util.Pager;
import com.jd.system.service.BaseAbstractService;
import com.jd.traffic.pay.payService.platform.dao.service.PayChannelDao;
import com.jd.traffic.pay.payService.platform.model.PayChannel;
import com.jd.traffic.pay.payService.platform.service.PayChannelService;

@Service
public class PayChannelServiceImpl extends BaseAbstractService implements PayChannelService{

	@Autowired
	private PayChannelDao payChannelDao;

	public void createPayChannel(PayChannel payChannel) {
		if(payChannel.getId()==null||payChannel.getId()==""){
			payChannelDao.insert(payChannel);
		}else{
			payChannelDao.update(payChannel);
			payChannelDao.updateStatusById(payChannel.getId(), payChannel.getStatus());
		}
	}

	public void deletePayChannel(String id) {
		payChannelDao.deleteById(id);
	}

	public void updatePayChannel(PayChannel payChannel) {
		payChannelDao.update(payChannel);
	}

	public void updatePayChannel(String id, int status) {
		payChannelDao.updateStatusById(id, status);
	}

	public PayChannel getPayChannelByPrimaryKey(String id) {
		return payChannelDao.selectById(id);
	}

	public List<PayChannel> getPayChannel(Set<String> channelIds) {
		if (channelIds.size() == 0) {
			return new ArrayList<PayChannel>();
		}
		String ids = StringUtils.join(channelIds, ",");
		return payChannelDao.getPayChannelList(ids);
	}
	
	public List showPayChannelList(ModelMap modelmap, Pager pager, HttpServletRequest request){
		return payChannelDao.list(modelmap, pager,request);
	}

	@Override
	public List getPayChannel(ModelMap modelMap, Pager pager) {
		return payChannelDao.getPayChannel(modelMap,pager);
	}
	
}
