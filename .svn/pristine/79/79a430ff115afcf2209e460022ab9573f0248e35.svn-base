package com.jd.traffic.pay.web;

import java.io.IOException;
import java.text.SimpleDateFormat;
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
import com.jd.traffic.pay.payService.platform.service.PayChannelService;
import com.jd.traffic.pay.payService.platform.service.PayMerchantChannelService;

import net.sf.json.JSONObject;

@Controller
@RequestMapping("/biz/my-pay-channel")
public class MyPayChannelController {

	@Autowired
	private PayChannelService payChaService;

	@Autowired
	private PayMerchantChannelService payMerChaService;
	
	// 查
	@RequestMapping("/list")
	public String paramList(@ModelAttribute("object") PayChannel object, @ModelAttribute("pager") Pager pager,
			ModelMap modelmap, HttpServletRequest request, HttpServletResponse response) {
		try {
			modelmap.addAttribute("resultData", payChaService.showPayChannelList(modelmap, pager,request));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "my-pay-channel/list.jsp";
	}

	//准备数据
	@ModelAttribute("channels")
	public List getChannels(@ModelAttribute("object") PayChannel object, Pager pager, ModelMap modelmap,
			HttpServletRequest request, HttpServletResponse response) {
		List list = payChaService.getPayChannel(modelmap, null);
		return list;
	}
	
	// 增
	@RequestMapping("/openCreate")
	public String openCreate(HttpServletResponse response, HttpServletRequest request) {
		return "my-pay-channel/input.jsp";
	}

	// 保存
	@RequestMapping(value = "/save", produces = { "application/json;charset=UTF-8" })
	public @ResponseBody void save(PayChannel object, HttpServletResponse response, HttpServletRequest request)
			throws IOException {
		JSONObject jsonObject = new JSONObject();
		try {
			String payTN=request.getParameter("payTypeName");
			if(payTN.contains("微信")){
				object.setPayTypeId(1);
				object.setPayTypeCode("WECHAT_PAY");
			}else if(payTN.contains("支付宝")){
				object.setPayTypeId(2);
				object.setPayTypeCode("ALI_PAY");
			}else if(payTN.contains("银联")){
				object.setPayTypeId(3);
				object.setPayTypeCode("UNION_PAY");
			}
			object.setCreatetime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(request.getParameter("ct")));
			payChaService.createPayChannel(object);
			jsonObject.put("res", true);
			jsonObject.put("data", object);
		} catch (Exception e) {
			jsonObject.put("res", false);
			jsonObject.put("msg", e.getMessage());
		}
		CommonQuery.printjson(response, jsonObject.toString());
	}

	// 改
	@RequestMapping(value = "/getFlag")
	public @ResponseBody void getFlag(String id, ModelMap modelMap, HttpServletResponse response,
			HttpServletRequest request) throws IOException {
		JSONObject jsonObject = new JSONObject();
		try {
			PayChannel obj = payChaService.getPayChannelByPrimaryKey(id);
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
		PayChannel object = payChaService.getPayChannelByPrimaryKey(id);
		modelmap.put("object", object);
		return "my-pay-channel/input.jsp";
	}

	// 删
	@RequestMapping("/remove")
	public void remove(String wid, ModelMap modelmap, HttpServletResponse response, HttpServletRequest request)
			throws Exception {
		JSONObject jsonObject = new JSONObject();
		try {
			payChaService.deletePayChannel(wid);
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
