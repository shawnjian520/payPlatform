package com.jd.traffic.pay.payService.platform.service.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;

import com.jd.framework.util.Pager;
import com.jd.system.service.BaseAbstractService;
import com.jd.traffic.pay.payApiModel.util.MD5Util;
import com.jd.traffic.pay.payService.platform.dao.service.PayMerchantDao;
import com.jd.traffic.pay.payService.platform.model.PayMerchant;
import com.jd.traffic.pay.payService.platform.service.PayMerchantService;

@Service("payMerchantService")
public class PayMerchantServiceImpl extends BaseAbstractService implements PayMerchantService {

	@Autowired
	private PayMerchantDao payMerchantDao;

	public List getPayMerchantList(ModelMap modelmap, Pager pager,HttpServletRequest request) {
		return payMerchantDao.list(modelmap, pager,request);
	}

	public PayMerchant getPayMerchantByPrimeryKey(String id) {
		return payMerchantDao.selectById(id);
	}

	public PayMerchant getPayMerchant(String merchantId) {
		return payMerchantDao.selectByMerchantId(merchantId);
	}

	@Override
	public PayMerchant getByName(String name) {
		return payMerchantDao.selectByName(name);
	}
	
	public String generateApiKey() {
		return MD5Util.md5(System.currentTimeMillis() + "").toLowerCase();
	}

	public void createPayMerchant(PayMerchant payMerchant) {
		if (payMerchant.getId() == null || payMerchant.getId() == "") {
			payMerchantDao.insert(payMerchant);
		} else {
			payMerchantDao.update(payMerchant);
			payMerchantDao.updateStatusById(payMerchant.getId(), payMerchant.getStatus());
		}
	}

	public void updatePayMerchant(PayMerchant payMerchant) {
		payMerchantDao.update(payMerchant);
	}

	public void updatePayMerchant(String id, int status) {
		payMerchantDao.updateStatusById(id, status);
	}

	@Transactional
	public void deletePayMerchant(String id) {
		payMerchantDao.deleteById(id);
	}

	

}
