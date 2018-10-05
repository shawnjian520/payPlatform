package com.jd.traffic.pay.payService.platform.dao.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.ModelMap;

import com.jd.framework.util.Pager;
import com.jd.traffic.pay.payService.platform.model.PayChannel;

public interface PayChannelDao {
	
	//增
	public void insert(PayChannel payChannel);

	//刪
	public void deleteById(String id);

	//改
	public void update(PayChannel payChannel);

	public void updateStatusById(String id, Integer status);

	public void updateByPayTypeId(int payTypeId, String payTypeName, String payTypeCode);

	//查
	public PayChannel selectById(String id);

	public List<PayChannel> getPayChannelList(String ids);
	
	public List list(ModelMap modelMap, Pager pager, HttpServletRequest request);
	
	public List getPayChannel(ModelMap modelMap, Pager pager);
}
