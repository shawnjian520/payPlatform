package com.jd.traffic.pay.payApi.test;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSON;
import com.google.gson.GsonBuilder;
import com.jd.traffic.pay.payApiModel.api.request.PayTypeRequest;
import com.jd.traffic.pay.payApiModel.api.response.PayResponse;
import com.jd.traffic.pay.payApiModel.api.response.PayTypeResponse;
import com.jd.traffic.pay.payApiModel.util.BeanUtil;
import com.jd.traffic.pay.payApiModel.util.HttpClientUtil;
import com.jd.traffic.pay.payApiModel.util.SignUtils;
import com.jd.traffic.pay.payCaller.util.Consts;

/**
 * @ClassName: ConfigTest
 * @Description:配置测试
 * @author: zhangjian
 * @date: 2018年5月2日 上午10:55:53
 */
public class ConfigTest {
	public static void main(String[] args) {
		  String url = Consts.domain + "/config/payTypes";

	        PayTypeRequest request = new PayTypeRequest();
//	        request.setTradeType("WAP");
	        request.setMerchantId(Consts.mchId);

	        // 生成签名
	        Map<String, String> data = BeanUtil.object2Map(request);
	        String sign = SignUtils.md5(data, Consts.apiKey);

	        request.setSign(sign);


	        String ret = HttpClientUtil.postData(url, request.toJsonString());

	        PayTypeResponse response = JSON.parseObject(ret, PayTypeResponse.class);

	        System.out.println(JSON.toJSONString(response));

	        System.out.println(PayTypeResponse.isSuccess(response.getCode()));

	        // 校验签名
	        if (PayTypeResponse.isSuccess(response.getCode())) {
	            data = BeanUtil.object2Map(response);
	            System.out.println(data);
	            sign = SignUtils.md5(data, Consts.apiKey);
	            if (!sign.equals(response.getSign())) {
	                System.out.println("签名不正确,sign=" + sign);
	            }
	        }
	        if (PayResponse.isSuccess(response.getCode())) {
	            data = BeanUtil.jsonStr2Map(ret);
	            System.out.println(data);
	            sign = SignUtils.md5(data, Consts.apiKey);
	            if (!sign.equals(response.getSign())) {
	                System.out.println("签名不正确,sign=" + sign);
	            } else {
	                System.out.println("使用json来校验签名，签名正确");
	            }
	        }

	        List<Integer> ss = new ArrayList<Integer>();
	        ss.add(1);
	        ss.add(2);
	        System.out.println(ss);
	        System.out.println(new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create().toJson(ss));
	}
}