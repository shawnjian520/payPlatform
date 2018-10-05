package com.jd.traffic.pay.payService.platform.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.ModelMap;

import com.jd.framework.util.Pager;
import com.jd.traffic.pay.payService.platform.model.PayMerchant;

public interface PayMerchantService {
	
	public List getPayMerchantList(ModelMap modelmap, Pager pager,HttpServletRequest request);

	public PayMerchant getPayMerchantByPrimeryKey(String id);

	public PayMerchant getPayMerchant(String merchantId);
	
	public PayMerchant getByName(String name);

	public void createPayMerchant(PayMerchant payMerchant);

	public void updatePayMerchant(PayMerchant payMerchant);

	public void updatePayMerchant(String id, int status);

	public void deletePayMerchant(String id);

}
