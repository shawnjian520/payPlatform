package com.jd.traffic.pay.payApi.test;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import com.alibaba.fastjson.JSON;
import com.google.gson.GsonBuilder;
import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.common.BitMatrix;
import com.jd.traffic.pay.payApi.test.util.Consts;
import com.jd.traffic.pay.payApiModel.api.ApiResponse;
import com.jd.traffic.pay.payApiModel.api.request.PayQueryRequest;
import com.jd.traffic.pay.payApiModel.api.request.PayRequest;
import com.jd.traffic.pay.payApiModel.api.response.PayNotifyResponse;
import com.jd.traffic.pay.payApiModel.api.response.PayQueryResponse;
import com.jd.traffic.pay.payApiModel.api.response.PayResponse;
import com.jd.traffic.pay.payApiModel.api.response.PaySynResponse;
import com.jd.traffic.pay.payApiModel.platform.enums.PayTypeCode;
import com.jd.traffic.pay.payApiModel.platform.enums.TradeTypeCode;
import com.jd.traffic.pay.payApiModel.util.BeanUtil;
import com.jd.traffic.pay.payApiModel.util.HttpClientUtil;
import com.jd.traffic.pay.payApiModel.util.SignUtils;
import com.jd.traffic.pay.util.MatrixToImageWriter;

/**
 * 调用的时候，如果使用sdk，那么 依赖的model 一定要和后端的保持一致，否则签名错误，不推荐
 * <p/>
 * 如果校验签名 直接用json来校验则没有问题。  推荐
 */
public class PayTest {
    static com.jd.traffic.pay.payApiModel.util.ConsoleLogger logger = new com.jd.traffic.pay.payApiModel.util.ConsoleLogger();
    public static void main(String[] args) {
    	/**************1.微信扫码支付*******************************/
    	testWeChatNativePay();
    	
    	/*************2.微信扫码支付结果查询*******************************/
    	
    	/*************3.微信支付结果同步*********************************/
    	//testSync();
    	
    	/*************4.微信 h5支付*********************************/
    	//testWeChatWapPay();
    	
    	/*************5.微信 App支付*********************************/
    	//testWeChatAppPay();
    	
    	/*************6.支付宝支付测试*********************************/
    	//testAliNativePay();
    	
    	/*************7.支付宝账单同步测试*********************************/
    	//testSync();
    	
    	/*************8.支付宝支付账单查询*********************************/
    	//testQuery();
    	
    	/*************9.支付宝H5集成支付*********************************/
    	//testAliWapPay();
    	
    	/*************10.银联聚合支付*********************************/
    	//testUnionPay();
    	/*String qrCodeUrl = "https://qr.alipay.com/bax018638g0u2qxzujyr0062";
    	String filePath = "D:/testAliPay.jpg";
    	 try {
             String content = qrCodeUrl;
             MultiFormatWriter multiFormatWriter = new MultiFormatWriter();
             Map hints = new HashMap();
             hints.put(EncodeHintType.CHARACTER_SET, "UTF-8");
             BitMatrix bitMatrix = multiFormatWriter.encode(content, BarcodeFormat.QR_CODE, 400, 400, hints);
             File file = new File(filePath);
             MatrixToImageWriter.writeToFile(bitMatrix, "jpg", file);
             
         } catch (IOException e) {
             e.printStackTrace();
         } catch (Exception e) {
             e.printStackTrace();
         }*/
         
    	//ZxingUtils.getQRCodeImge(qrCodeUrl, 256, filePath);
    }
    
    /**
     * @Title: testNotifySign
     * @Description:测试通知签名校验
     * @return: void
     */
    public static  void testNotifySign() {
        String notify = "{\"payType\":\"WECHAT_PAY\",\"extra\":\"extra.env\\u003dtest\",\"payAmount\":1,\"tradePayNo\":\"kk_test1472636613445\",\"payOrderNo\":\"10019022201608311739103793520313\",\"status\":\"SUCCESS\",\"payTime\":\"2016-08-31 17:39:52\",\"code\":\"SUCCESS\",\"msg\":\"SUCCESS\",\"sign\":\"CF50C168ADD457884C1A0F140F9C219F\",\"merchantId\":\"0001\"}";
        PayNotifyResponse response = JSON.parseObject(notify, PayNotifyResponse.class);
        logger.info(JSON.toJSONString(response, true));

        Map<String, String> data = BeanUtil.object2Map(response);
        String sign = SignUtils.md5(data, Consts.apiKey);

        logger.info(sign.equals(response.getSign()));

        data = new HashMap<String, String>();
        data.put("key", "a=1");

        logger.info(new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create().toJson(data));
        logger.info(JSON.toJSONString(data));
    }

    /**
     * @Title: testWeChatNativePay
     * @Description:微信扫码支付测试
     * @return: void
     */
    public static void testWeChatNativePay() {
        String url = Consts.domain + "/pay/request";

        PayRequest request = new PayRequest();
        request.setMerchantId(Consts.mchId);
        request.setTradePayNo("kk_test" + System.currentTimeMillis());
//        request.setTradePayNo("kk_test1472552781014");
        request.setPayAmount(1);
        request.setPayType(PayTypeCode.WECHAT_PAY);
        request.setTradeType(TradeTypeCode.NATIVE);
        request.setSubject("test subject");
        request.setDetail("test detail");
        // 支付成功后回调url
        request.setNotifyUrl(Consts.notifyUrl);
        request.setExtra("extra.env=test");

        request.validate();
        // 生成签名
        Map<String, String> data = BeanUtil.object2Map(request);
        String sign = SignUtils.md5(data, Consts.apiKey);

        request.setSign(sign);


        String ret = HttpClientUtil.postData(url, request.toJsonString());

        logger.info("ret=" + ret);

        PayResponse response = JSON.parseObject(ret, PayResponse.class);

        logger.info(JSON.toJSONString(response));

        logger.info(PayResponse.isSuccess(response.getCode()));

        // 校验签名
        if (ApiResponse.isSuccess(response.getCode())) {
            data = BeanUtil.object2Map(response);
            sign = SignUtils.md5(data, Consts.apiKey);
            if (!sign.equals(response.getSign())) {
                logger.info("签名不正确,sign=" + sign);
            }
        }
        if (ApiResponse.isSuccess(response.getCode())) {
            data = BeanUtil.jsonStr2Map(ret);
            sign = SignUtils.md5(data, Consts.apiKey);
            if (!sign.equals(response.getSign())) {
                logger.info("签名不正确,sign=" + sign);
            } else {
                logger.info("使用json来校验签名，签名正确");
            }
        }
    }
    
    /**
     * @Title: testUnionPay
     * @Description:银联聚合支付
     * @return: void
     */
    public static void testUnionPay(){
		String url = Consts.domain + "/pay/request";
		PayRequest request = new PayRequest();
		request.setMerchantId(Consts.mchId);
		request.setTradePayNo("kk_test" + System.currentTimeMillis());
		// request.setTradePayNo("kk_test1472552781014");
		request.setPayAmount(1);
		request.setPayType(PayTypeCode.UNION_PAY);
		request.setTradeType(TradeTypeCode.NATIVE); // !!
		request.setSubject("TEST");
		request.setDetail("TEST");
		// 支付成功后回调url
		request.setNotifyUrl(Consts.notifyUrl);
		request.setExtra("extra.env=test");
		request.validate();

		// 生成签名
		Map<String, String> data = BeanUtil.object2Map(request);
		String sign = SignUtils.md5(data, Consts.apiKey);

		request.setSign(sign);

		String ret = HttpClientUtil.postData(url, request.toJsonString());

		logger.info("ret=" + ret);

		PayResponse response = JSON.parseObject(ret, PayResponse.class);

		logger.info(JSON.toJSONString(response));

		logger.info(PayResponse.isSuccess(response.getCode()));

		// 校验签名
		if (ApiResponse.isSuccess(response.getCode())) {
			data = BeanUtil.object2Map(response);
			sign = SignUtils.md5(data, Consts.apiKey);
			if (!sign.equals(response.getSign())) {
				logger.info("签名不正确,sign=" + sign);
			}
		}
		if (ApiResponse.isSuccess(response.getCode())) {
			data = BeanUtil.jsonStr2Map(ret);
			sign = SignUtils.md5(data, Consts.apiKey);
			if (!sign.equals(response.getSign())) {
				logger.info("json签名不正确,sign=" + sign);
			} else {
				logger.info("使用json来校验签名，签名正确");
			}
		}
    }


    /**
     * @Title: testWeChatWapPay
     * @Description:微信 h5支付
     * @return: void
     */
    public static void testWeChatWapPay() {
        String url = Consts.domain + "/pay/request";

        PayRequest request = new PayRequest();
        request.setMerchantId(Consts.mchId);
        request.setTradePayNo("kk_test" + System.currentTimeMillis());
//        request.setTradePayNo("kk_test1472552781014");
        request.setPayAmount(1);
        request.setPayType(PayTypeCode.WECHAT_PAY);

        request.setTradeType(TradeTypeCode.WAP); //!!

        request.setSubject("kk网页测试标题");
        request.setDetail("kk网页测试详情");
        // 支付成功后回调url
        request.setNotifyUrl(Consts.notifyUrl);
        request.setExtra("extra.env=test");

        request.setOpenId(Consts.openId);// !!

        request.validate();

        // 生成签名
        Map<String, String> data = BeanUtil.object2Map(request);
        String sign = SignUtils.md5(data, Consts.apiKey);

        request.setSign(sign);


        String ret = HttpClientUtil.postData(url, request.toJsonString());

        logger.info("ret=" + ret);

        PayResponse response = JSON.parseObject(ret, PayResponse.class);

        logger.info(JSON.toJSONString(response));

        logger.info(PayResponse.isSuccess(response.getCode()));

        // 校验签名
        if (ApiResponse.isSuccess(response.getCode())) {
            data = BeanUtil.object2Map(response);
            sign = SignUtils.md5(data, Consts.apiKey);
            if (!sign.equals(response.getSign())) {
                logger.info("签名不正确,sign=" + sign);
            }
        }
        if (ApiResponse.isSuccess(response.getCode())) {
            data = BeanUtil.jsonStr2Map(ret);
            sign = SignUtils.md5(data, Consts.apiKey);
            if (!sign.equals(response.getSign())) {
                logger.info("json签名不正确,sign=" + sign);
            } else {
                logger.info("使用json来校验签名，签名正确");
            }
        }
    }


    /**
     * @Title: testWeChatAppPay
     * @Description:微信 app支付
     * @return: void
     */
    public static void testWeChatAppPay() {
        String url = Consts.domain + "/pay/request";

        PayRequest request = new PayRequest();
        request.setMerchantId(Consts.mchId);
        request.setTradePayNo("kk_test" + System.currentTimeMillis());
//        request.setTradePayNo("kk_test1472552781014");
        request.setPayAmount(1);
        request.setPayType(PayTypeCode.WECHAT_PAY);
        request.setTradeType(TradeTypeCode.APP);
        request.setSubject("test subject");
        request.setDetail("test Detail");
        // 支付成功后回调url
        request.setNotifyUrl(Consts.notifyUrl);
        request.setExtra("extra.env=test");

        request.validate();
        // 生成签名
        Map<String, String> data = BeanUtil.object2Map(request);
        String sign = SignUtils.md5(data, Consts.apiKey);

        request.setSign(sign);


        String ret = HttpClientUtil.postData(url, request.toJsonString());

        logger.info("ret=" + ret);

        PayResponse response = JSON.parseObject(ret, PayResponse.class);

        logger.info(JSON.toJSONString(response));

        logger.info(PayResponse.isSuccess(response.getCode()));

        // 校验签名
        if (ApiResponse.isSuccess(response.getCode())) {
            data = BeanUtil.object2Map(response);
            sign = SignUtils.md5(data, Consts.apiKey);
            if (!sign.equals(response.getSign())) {
                logger.info("签名不正确,sign=" + sign);
            }
        }
        if (ApiResponse.isSuccess(response.getCode())) {
            data = BeanUtil.jsonStr2Map(ret);
            sign = SignUtils.md5(data, Consts.apiKey);
            if (!sign.equals(response.getSign())) {
                logger.info("签名不正确,sign=" + sign);
            } else {
                logger.info("使用json来校验签名，签名正确");
            }
        }
    }

    /**
     * @Title: testQuery
     * @Description: 账单查询
     * @return: void
     */
    public static  void testQuery() {
        String url = Consts.domain + "/pay/query";
        String payOrderNo = "10018390201805031331557005918113";


        PayQueryRequest request = new PayQueryRequest();
        request.setMerchantId("0001");
        request.setPayOrderNo(payOrderNo);
//        request.setTradePayNo("kk_test1472635152812");

        request.validate();

        // 生成签名
        Map<String, String> data = BeanUtil.object2Map(request);
        String sign = SignUtils.md5(data, Consts.apiKey);

        request.setSign(sign);

        String ret = HttpClientUtil.postData(url, request.toJsonString());

        logger.info("ret=" + ret);

        PayQueryResponse response = JSON.parseObject(ret, PayQueryResponse.class);

        logger.info(JSON.toJSONString(response));

        logger.info(PayResponse.isSuccess(response.getCode()));

        // 校验签名
        if (ApiResponse.isSuccess(response.getCode())) {
            data = BeanUtil.object2Map(response);
            sign = SignUtils.md5(data, Consts.apiKey);
            if (!sign.equals(response.getSign())) {
                logger.info("签名不正确,sign=" + sign);
            }
        }
        if (ApiResponse.isSuccess(response.getCode())) {
            data = BeanUtil.jsonStr2Map(ret);
            sign = SignUtils.md5(data, Consts.apiKey);
            if (!sign.equals(response.getSign())) {
                logger.info("签名不正确,sign=" + sign);
            } else {
                logger.info("使用json来校验签名，签名正确");
            }
        }
    }
    
    /**
     * @Title: testSync
     * @Description:账单同步
     * @return: void
     */
    public static void testSync() {
        String url = Consts.domain + "/pay/synchronize";

        String payOrderNo = "10018194201805301351153774870775";
        PayQueryRequest request = new PayQueryRequest();
        request.setMerchantId(Consts.mchId);
        request.setPayOrderNo(payOrderNo);
//        request.setTradePayNo("kk_test1472635152812");
        // 生成签名
        Map<String, String> data = BeanUtil.object2Map(request);
        String sign = SignUtils.md5(data, Consts.apiKey);

        request.setSign(sign);

        String ret = HttpClientUtil.postData(url, request.toJsonString());

        logger.info("ret=" + ret);

        PaySynResponse response = JSON.parseObject(ret, PaySynResponse.class);

        logger.info(JSON.toJSONString(response));

        logger.info(PayResponse.isSuccess(response.getCode()));

        // 校验签名
        if (ApiResponse.isSuccess(response.getCode())) {
            data = BeanUtil.object2Map(response);
            sign = SignUtils.md5(data, Consts.apiKey);
            if (!sign.equals(response.getSign())) {
                logger.info("签名不正确,sign=" + sign);
            }
        }
        if (ApiResponse.isSuccess(response.getCode())) {
            data = BeanUtil.jsonStr2Map(ret);
            sign = SignUtils.md5(data, Consts.apiKey);
            if (!sign.equals(response.getSign())) {
                logger.info("签名不正确,sign=" + sign);
            } else {
                logger.info("使用json来校验签名，签名正确");
            }
        }
    }

    /**
     * @Title: testAliNativePay
     * @Description:支付宝支付测试
     * @return: void
     */
    public static void testAliNativePay() {
        String url = Consts.domain + "/pay/request";

        PayRequest request = new PayRequest();
        request.setMerchantId(Consts.mchId);
        request.setTradePayNo("kk_test" + System.currentTimeMillis());
        request.setPayAmount(1);
        request.setPayType(PayTypeCode.ALI_PAY);
        request.setTradeType(TradeTypeCode.NATIVE);
        request.setSubject("test Subject");
        request.setDetail("test Detail");
        // 支付成功后回调url
        request.setNotifyUrl(Consts.notifyUrl);
        request.setExtra("extra.env=test");

        request.validate();
        // 生成签名
        Map<String, String> data = BeanUtil.object2Map(request);
        String sign = SignUtils.md5(data, Consts.apiKey);

        request.setSign(sign);


        String ret = HttpClientUtil.postData(url, request.toJsonString());

        logger.info("ret=" + ret);

        PayResponse response = JSON.parseObject(ret, PayResponse.class);

        logger.info(JSON.toJSONString(response));

        logger.info(PayResponse.isSuccess(response.getCode()));

        // 校验签名
        if (ApiResponse.isSuccess(response.getCode())) {
            data = BeanUtil.object2Map(response);
            sign = SignUtils.md5(data, Consts.apiKey);
            if (!sign.equals(response.getSign())) {
                logger.info("签名不正确,sign=" + sign);
            }
        }
        if (ApiResponse.isSuccess(response.getCode())) {
            data = BeanUtil.jsonStr2Map(ret);
            sign = SignUtils.md5(data, Consts.apiKey);
            if (!sign.equals(response.getSign())) {
                logger.info("签名不正确,sign=" + sign);
            } else {
                logger.info("使用json来校验签名，签名正确");
            }
        }
    }

    /**
     * @Title: testAliWapPay
     * @Description: 支付宝 h5支付
     * @return: void
     */
    public static void testAliWapPay() {
        String url = Consts.domain + "/pay/request";

        PayRequest request = new PayRequest();
        request.setMerchantId(Consts.mchId);
        request.setTradePayNo("kk_test" + System.currentTimeMillis());
//        request.setTradePayNo("kk_test1472552781014");
        request.setPayAmount(1);
        request.setPayType(PayTypeCode.ALI_PAY);

        request.setTradeType(TradeTypeCode.WAP); //!!
        request.setReturnUrl("return.url");

        request.setSubject("test subject");
        request.setDetail("test Detail");
        // 支付成功后回调url
        request.setNotifyUrl(Consts.notifyUrl);
        request.setExtra("extra.env=test");

        request.setOpenId(Consts.openId);// !!

        request.validate();

        // 生成签名
        Map<String, String> data = BeanUtil.object2Map(request);
        String sign = SignUtils.md5(data, Consts.apiKey);

        request.setSign(sign);


        String ret = HttpClientUtil.postData(url, request.toJsonString());

        logger.info("ret=" + ret);

        PayResponse response = JSON.parseObject(ret, PayResponse.class);

        logger.info(JSON.toJSONString(response));

        logger.info(PayResponse.isSuccess(response.getCode()));

        // 校验签名
        if (ApiResponse.isSuccess(response.getCode())) {
            data = BeanUtil.object2Map(response);
            sign = SignUtils.md5(data, Consts.apiKey);
            if (!sign.equals(response.getSign())) {
                logger.info("签名不正确,sign=" + sign);
            }
        }
        if (ApiResponse.isSuccess(response.getCode())) {
            data = BeanUtil.jsonStr2Map(ret);
            sign = SignUtils.md5(data, Consts.apiKey);
            if (!sign.equals(response.getSign())) {
                logger.info("json签名不正确,sign=" + sign);
            } else {
                logger.info("使用json来校验签名，签名正确");
            }
        }
    }
}
