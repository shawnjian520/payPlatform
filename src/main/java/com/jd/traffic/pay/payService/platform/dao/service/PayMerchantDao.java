package com.jd.traffic.pay.payService.platform.dao.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.ModelMap;

import com.jd.framework.util.Pager;
import com.jd.traffic.pay.payService.platform.model.PayMerchant;

public interface PayMerchantDao {
	// 查询所有
	public List list(ModelMap modelMap, Pager pager,HttpServletRequest request);

	// 根据id查询
	public PayMerchant selectById(String id);

	// 根据商户号查询
	public PayMerchant selectByMerchantId(String merchantId);
	
	// 根据商户名称
	public PayMerchant selectByName(String name);

	// 新增
	public void insert(PayMerchant payMerchant);

	// 更新
	public void update(PayMerchant payMerchant);

	// 根据id更新状态
	public void updateStatusById(String id, int status);

	// 根据id删除
	public void deleteById(String id);

}
