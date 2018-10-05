package com.jd.traffic.pay.web;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jd.framework.util.Pager;
import com.jd.system.util.CommonQuery;
import com.jd.traffic.pay.payService.platform.model.PayMerchant;
import com.jd.traffic.pay.payService.platform.model.PayOrder;
import com.jd.traffic.pay.payService.platform.model.RefundOrder;
import com.jd.traffic.pay.payService.platform.service.PayMerchantService;
import com.jd.traffic.pay.payService.platform.service.RefundOrderService;

import com.alibaba.fastjson.JSONObject;

@Controller
@RequestMapping("/biz/my-refund-order")
public class MyRefundOrderController {

	@Autowired
	private RefundOrderService refOrderService;

	@Autowired
    private PayMerchantService payMerService;
	
	// 查
	@RequestMapping("/list")
	public String paramList(@ModelAttribute("object") RefundOrder object, @ModelAttribute("pager") Pager pager,
			ModelMap modelmap, HttpServletRequest request, HttpServletResponse response) {
		try {
			if((object.getMerchantName()!=null)&&(!"".equals(object.getMerchantName()))){
				PayMerchant pmer=payMerService.getByName(object.getMerchantName());
				if(pmer!=null){
					object.setMerchantId(pmer.getMerchantId());
				}else{
					object.setMerchantId(new SimpleDateFormat().format(new Date()));
				}
			}
			List OrderList=refOrderService.getRefundOrderList(modelmap, pager, request);
			List ls=new ArrayList();
			for (Object obj : OrderList) {
				RefundOrder refundOrder=JSONObject.parseObject(JSONObject.toJSONString(obj),RefundOrder.class);
				PayMerchant merchant=payMerService.getPayMerchant(refundOrder.getMerchantId());
				refundOrder.setMerchantName(merchant.getName());
				ls.add(refundOrder);
			}
			modelmap.addAttribute("resultData", ls);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "my-refund-order/list.jsp";
	}

	@RequestMapping(value = "/getFlag")
	public @ResponseBody void getFlag(String id, ModelMap modelMap, HttpServletResponse response,
			HttpServletRequest request) throws IOException {
		JSONObject jsonObject = new JSONObject();
		try {
			RefundOrder obj = refOrderService.getRefundOrderByPk(id);
			jsonObject.put("res", true);
			jsonObject.put("list", obj);
		} catch (Exception e) {
			jsonObject.put("res", false);
			jsonObject.put("msg", e.getMessage());
		}
		CommonQuery.printjson(response, jsonObject.toString());

	}

	@RequestMapping("/input/{id}")
	public String input(@PathVariable("id") String id, ModelMap modelmap, HttpServletResponse response,
			HttpServletRequest request) {
		RefundOrder object = refOrderService.getRefundOrderByPk(id);
		modelmap.put("object", object);
		return "my-refund-order/input.jsp";
	}

}
