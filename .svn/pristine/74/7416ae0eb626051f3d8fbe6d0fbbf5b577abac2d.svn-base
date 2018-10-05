package com.jd.traffic.pay.payApi.test;

import java.util.Map;

import com.alibaba.fastjson.JSON;
import com.jd.traffic.pay.payApi.test.util.Consts;
import com.jd.traffic.pay.payApiModel.api.ApiResponse;
import com.jd.traffic.pay.payApiModel.api.request.RefundQueryRequest;
import com.jd.traffic.pay.payApiModel.api.request.RefundRequest;
import com.jd.traffic.pay.payApiModel.api.response.PayResponse;
import com.jd.traffic.pay.payApiModel.api.response.RefundQueryResponse;
import com.jd.traffic.pay.payApiModel.api.response.RefundResponse;
import com.jd.traffic.pay.payApiModel.util.BeanUtil;
import com.jd.traffic.pay.payApiModel.util.HttpClientUtil;
import com.jd.traffic.pay.payApiModel.util.SignUtils;

/**
 * 退款接口测试
 */
public class RefundTest {
    static com.jd.traffic.pay.payApiModel.util.ConsoleLogger logger = new com.jd.traffic.pay.payApiModel.util.ConsoleLogger();
    	
    public static void main(String[] args) {
    	testRefundQuery();
	}

    
    /**
     * @Title: testRefund
     * @Description:微信，支付宝  退款
     * @return: void
     */
    public static void testRefund() {
        String url = Consts.domain + "/refund/request";

        RefundRequest request = new RefundRequest();
        request.setMerchantId(Consts.mchId);

        request.setPayOrderNo("10018194201805301351153774870775");
        request.setRefundAmount(1);
        request.setRefundReason("测试");

        request.validate();
        // 生成签名
        Map<String, String> data = BeanUtil.object2Map(request);
        String sign = SignUtils.md5(data, Consts.apiKey);

        request.setSign(sign);


        String ret = HttpClientUtil.postData(url, request.toJsonString());
        logger.info("ret=" + ret);
        RefundResponse response = JSON.parseObject(ret, RefundResponse.class);
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
     * @Title: testRefundQuery
     * @Description:微信  退款查询
     * @return: void
     */
    public static void testRefundQuery() {
        String url = Consts.domain + "/refund/query";

        RefundQueryRequest request = new RefundQueryRequest();
        request.setMerchantId(Consts.mchId);

        request.setRefundOrderNo("20180530154826556820007720624462");
//        request.setTradeRefundNo("");

        request.validate();
        // 生成签名
        Map<String, String> data = BeanUtil.object2Map(request);
        String sign = SignUtils.md5(data, Consts.apiKey);

        request.setSign(sign);


        String ret = HttpClientUtil.postData(url, request.toJsonString());

        logger.info("ret=" + ret);

        RefundQueryResponse response = JSON.parseObject(ret, RefundQueryResponse.class);

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


}
