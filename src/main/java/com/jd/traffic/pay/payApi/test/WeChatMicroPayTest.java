package com.jd.traffic.pay.payApi.test;

import com.alibaba.fastjson.JSON;
import com.jd.traffic.pay.payApiModel.platform.enums.PayException;
import com.jd.traffic.pay.payService.platform.model.PayChannel;
import com.jd.traffic.pay.payService.wechat.client.WechatPayClient;
import com.jd.traffic.pay.payService.wechat.exception.WechatPayException;
import com.jd.traffic.pay.payService.wechat.model.WechatPayMicroPayModel;
import com.jd.traffic.pay.payService.wechat.request.WechatPayMicroPayRequest;
import com.jd.traffic.pay.payService.wechat.response.WechatPayMicroPayResponse;
import com.jd.traffic.pay.util.LocalIPUtil;

/**
 * @ClassName: WeChatMicroPayTest
 * @Description: 测试刷卡支付
 * @author: zhangjian
 * @date: 2018年5月2日 上午11:07:36
 */
public class WeChatMicroPayTest {
	static com.jd.traffic.pay.payApiModel.util.ConsoleLogger logger = new com.jd.traffic.pay.payApiModel.util.ConsoleLogger();

	/**
	 * @Title: testPay
	 * @Description:测试支付
	 * @return: void
	 */
	public void testPay() {
		PayChannel payChannel = new PayChannel();
		payChannel.setAppId("");
		payChannel.setApiKey("");
		payChannel.setMchId("");
		WechatPayClient client = new WechatPayClient(payChannel.getAppId(),
		        payChannel.getMchId(), payChannel.getApiKey());
		WechatPayMicroPayRequest request = new WechatPayMicroPayRequest();
		// model中 appId,sign,mchId,nonceStr 在WechatClient中设置
		WechatPayMicroPayModel model = new WechatPayMicroPayModel();
		model.setOutTradeNo("kk_micr" + System.currentTimeMillis());
		model.setSpbillCreateIp(LocalIPUtil.getLocalAddr());
		model.setBody("刷卡支付测试");
		model.setDetail("刷卡支付测试");
		model.setTotalFee(1);

		// !!!!
		model.setAuthCode("");

		request.setModel(model);

		// 统一下单
		WechatPayMicroPayResponse response;
		try {
			response = client.execute(request);
		} catch (WechatPayException e) {
			// 支付失败
			logger.error(e.getMessage(), e);
			throw new PayException(e.getErrMsg());
		}
		logger.info(JSON.toJSONString(response));
	}
}
