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
import com.jd.traffic.pay.payService.platform.model.PayChannel;
import com.jd.traffic.pay.payService.platform.model.PayMerchant;
import com.jd.traffic.pay.payService.platform.model.PayMerchantChannel;
import com.jd.traffic.pay.payService.platform.model.PayOrder;
import com.jd.traffic.pay.payService.platform.service.PayChannelService;
import com.jd.traffic.pay.payService.platform.service.PayMerchantChannelService;
import com.jd.traffic.pay.payService.platform.service.PayMerchantService;

import net.sf.json.JSONObject;

/**
 * 商户与支付渠道关联
 *
 */
@Controller
@RequestMapping("/biz/my-mer-cha")
public class MypayMerChaController {
	@Autowired
	private PayMerchantService payMerService;

	@Autowired
	private PayChannelService payChaService;

	@Autowired
	private PayMerchantChannelService payMerChaService;

	// 分配渠道
	@RequestMapping(value = "/allocationMerCha")
	public @ResponseBody void allocationMerCha(String id, ModelMap modelMap, HttpServletResponse response,
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

	@RequestMapping("/MerCha/{ids}")
	public String input2(@PathVariable("ids") String id, ModelMap modelmap, HttpServletResponse response,
			HttpServletRequest request) {

		PayMerchant merobj = payMerService.getPayMerchantByPrimeryKey(id);
		modelmap.put("merobj", merobj);
		return "my-pay-merchant/input2.jsp";
	}

	//准备数据
	@ModelAttribute("getChannels")
	public List getChannels(@ModelAttribute("object") PayChannel object, Pager pager, ModelMap modelmap,
			HttpServletRequest request, HttpServletResponse response) {
		List list = payChaService.getPayChannel(modelmap, null);
		return list;
	}

	// 保存
	@RequestMapping(value = "/save", produces = { "application/json;charset=UTF-8" })
	public @ResponseBody void save(PayMerchantChannel object, HttpServletResponse response, HttpServletRequest request)
			throws IOException {
		JSONObject jsonObject = new JSONObject();
		try {
			object.setPayMerchantId(request.getParameter("merid"));
			String payTN=request.getParameter("payTypeName");
			System.out.println(payTN+"--------");
			if("微信扫码支付".equals(payTN)){
				System.out.println("11111111");
				object.setPayChannelId("1");
				object.setPayTypeId(1);
			}else if("微信H5支付".equals(payTN)){
				System.out.println("222222222");
				object.setPayChannelId("2");
				object.setPayTypeId(1);
			}else if("支付宝WEB支付".equals(payTN)){
				System.out.println("444444444");
				object.setPayChannelId("4");
				object.setPayTypeId(2);
			}else if("支付宝H5支付".equals(payTN)){
				System.out.println("5");
				object.setPayChannelId("5");
				object.setPayTypeId(2);
			}else if("银联聚合支付".equals(payTN)){
				System.out.println("6");
				object.setPayChannelId("6");
				object.setPayTypeId(3);
			}
			payMerChaService.createPayMerchantChannel(object);
			jsonObject.put("res", true);
			jsonObject.put("data", object);
		} catch (Exception e) {
			jsonObject.put("res", false);
			jsonObject.put("msg", e.getMessage());
		}
		CommonQuery.printjson(response, jsonObject.toString());
	}

	// 查看商户支付渠道
	@RequestMapping(value = "/showMC")
	public @ResponseBody void showMC(String id, ModelMap modelMap, HttpServletResponse response,
			HttpServletRequest request) throws IOException {
		JSONObject jsonObject = new JSONObject();
		try {
			List ls = payMerChaService.getPayMerchantChannels(id);
			jsonObject.put("res", true);
			jsonObject.put("list", ls);
		} catch (Exception e) {
			jsonObject.put("res", false);
			jsonObject.put("msg", e.getMessage());
		}
		CommonQuery.printjson(response, jsonObject.toString());
	}

	@RequestMapping("/showMerCha/{ids}")
	public String showMerCha(@PathVariable("ids") String id, ModelMap modelmap, HttpServletResponse response,
			HttpServletRequest request) {
		List ls = payMerChaService.getPayMerchantChannels(id);
		PayMerchant pm=payMerService.getPayMerchantByPrimeryKey(id);
		modelmap.put("ls", ls);
		modelmap.put("pm", pm);
		return "my-pay-merchant/input3.jsp";
	}
	
}
