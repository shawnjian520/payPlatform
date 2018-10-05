package com.jd.traffic.pay.web;

import java.io.IOException;
import java.text.SimpleDateFormat;

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
import com.jd.traffic.pay.payService.platform.service.PayMerchantChannelService;
import com.jd.traffic.pay.payService.platform.service.PayMerchantService;

import net.sf.json.JSONObject;


/**
 * 商户信息维护
 *
 */
@Controller
@RequestMapping("/biz/my-pay-merchant")
public class MypayMerchantController {
	
	@Autowired
	private PayMerchantService payMerService;
	
	@Autowired
	private PayMerchantChannelService payMerChaService;
	
	//查
	@RequestMapping("/list")
	public String paramList(@ModelAttribute("object") PayMerchant object,@ModelAttribute("pager") Pager pager, 
			ModelMap modelmap, HttpServletRequest request,HttpServletResponse response) {
		try {
			modelmap.addAttribute("resultData", payMerService.getPayMerchantList(modelmap, pager,request));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "my-pay-merchant/list.jsp";
	}
	
	//增
	@RequestMapping("/openCreate")
	public String openCreate(HttpServletResponse response, HttpServletRequest request) {
		return "my-pay-merchant/input.jsp";
	}
	
	//保存
	@RequestMapping(value = "/save", produces = { "application/json;charset=UTF-8" })
	public @ResponseBody void save(PayMerchant object,HttpServletResponse response,HttpServletRequest request) throws IOException{
		JSONObject jsonObject = new JSONObject();
		try {
			object.setCreatetime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(request.getParameter("ct")));
			payMerService.createPayMerchant(object);
			jsonObject.put("res", true);
			jsonObject.put("data", object);
		} catch (Exception e) {
			jsonObject.put("res", false);
			jsonObject.put("msg", e.getMessage());
		}
		CommonQuery.printjson(response, jsonObject.toString());
	}
	
	//改
	@RequestMapping(value = "/getFlag")
	public @ResponseBody void getFlag(String id, ModelMap modelMap, HttpServletResponse response,
			HttpServletRequest request) throws IOException {
		JSONObject jsonObject = new JSONObject();
		try {
			PayMerchant obj = payMerService.getPayMerchantByPrimeryKey(id);
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
		PayMerchant object = payMerService.getPayMerchantByPrimeryKey(id);
		modelmap.put("object", object);
		return "my-pay-merchant/input.jsp";
	}
	
	//删
	@RequestMapping("/remove")
	public void remove(String wid, ModelMap modelmap,HttpServletResponse response, HttpServletRequest request)
			throws Exception {
		JSONObject jsonObject = new JSONObject();
		try {
			payMerService.deletePayMerchant(wid);
			payMerChaService.deleteByMerId(wid);
			jsonObject.put("res", true);
			jsonObject.put("msg", "删除成功!");
		} catch (Exception e) {
			jsonObject.put("res", false);
			jsonObject.put("msg", e.getMessage());
		}
		CommonQuery.printjson(response, jsonObject.toString());
	}
	
	
	
}
