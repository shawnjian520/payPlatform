package com.jd.traffic.pay.web;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

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
import com.jd.traffic.pay.payApi.test.util.Consts;
import com.jd.traffic.pay.payApiModel.api.request.RefundRequest;
import com.jd.traffic.pay.payApiModel.util.BeanUtil;
import com.jd.traffic.pay.payApiModel.util.SignUtils;
import com.jd.traffic.pay.payService.api.service.RefundService;
import com.jd.traffic.pay.payService.platform.model.PayMerchant;
import com.jd.traffic.pay.payService.platform.model.PayOrder;
import com.jd.traffic.pay.payService.platform.service.PayMerchantService;
import com.jd.traffic.pay.payService.platform.service.PayOrderService;

import com.alibaba.fastjson.JSONObject;

@Controller
@RequestMapping("/biz/my-pay-order")
public class MyPayOrderController {

	@Autowired
	private PayOrderService payOrderService;

	@Autowired
    private RefundService refundService;
	
	@Autowired
    private PayMerchantService payMerService;
	
	// 查
	@RequestMapping("/list")
	public String paramList(@ModelAttribute("object") PayOrder object, @ModelAttribute("pager") Pager pager,
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
			List OrderList=payOrderService.getPayOrderList(modelmap, pager, request);
			List ls=new ArrayList();
			for (Object obj : OrderList) {
				PayOrder payOrder=JSONObject.parseObject(JSONObject.toJSONString(obj),PayOrder.class);
				PayMerchant merchant=payMerService.getPayMerchant(payOrder.getMerchantId());
				payOrder.setMerchantName(merchant.getName());
				ls.add(payOrder);
			}
			modelmap.addAttribute("resultData", ls);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "my-pay-order/list.jsp";
	}

	@RequestMapping(value = "/getFlag")
	public @ResponseBody void getFlag(String id, ModelMap modelMap, HttpServletResponse response,
			HttpServletRequest request) throws IOException {
		JSONObject jsonObject = new JSONObject();
		try {
			PayOrder obj = payOrderService.getPayOrderByPk(id);
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
		PayOrder object = payOrderService.getPayOrderByPk(id);
		modelmap.put("object", object);
		return "my-pay-order/input.jsp";
	}

	@RequestMapping(value = "/refundMony")
	public @ResponseBody void allocationMerCha(ModelMap modelMap, HttpServletResponse response,
			HttpServletRequest request) throws IOException {
		JSONObject jsonObject = new JSONObject();
//		request.setCharacterEncoding("utf-8");
		try {
			
			String id = request.getParameter("id");
			String reason = request.getParameter("reason");
			PayOrder payOrder = payOrderService.getPayOrderByPk(id);
			RefundRequest refundReq = new RefundRequest();
			refundReq.setMerchantId(payOrder.getMerchantId());
			refundReq.setPayOrderNo(payOrder.getPayOrderNo());
			refundReq.setRefundReason(reason);
			if (payOrder.getPayAmount() == null) {
				refundReq.setRefundAmount(0);
			} else {
				refundReq.setRefundAmount(payOrder.getPayAmount());
			}
			refundReq.validate();
			Map<String, String> data = BeanUtil.object2Map(refundReq);
	        String sign = SignUtils.md5(data, Consts.apiKey);
	        refundReq.setSign(sign);
			refundService.request(refundReq).toJsonString();
			jsonObject.put("res", true);
			jsonObject.put("list", refundReq);
		} catch (Exception e) {
			jsonObject.put("res", false);
			jsonObject.put("msg", e.getMessage());
		}
		CommonQuery.printjson(response, jsonObject.toString());
	}
	
	
}
