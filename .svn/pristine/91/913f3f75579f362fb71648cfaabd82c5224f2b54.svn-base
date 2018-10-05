package com.jd.traffic.pay.payCaller.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.IOUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.alibaba.fastjson.JSON;
import com.jd.traffic.pay.payApiModel.api.ApiResponse;
import com.jd.traffic.pay.payApiModel.api.response.PayNotifyResponse;
import com.jd.traffic.pay.payApiModel.util.BeanUtil;
import com.jd.traffic.pay.payApiModel.util.SignUtils;
import com.jd.traffic.pay.payCaller.util.Consts;
import com.jd.traffic.pay.util.JsonUtil;

/**
 * 支付成功后 回调接口
 */
@Controller
@RequestMapping("/caller/notify")
public class NotifyController {
    private Log logger = LogFactory.getLog(this.getClass());


    @RequestMapping(value = "", method = {RequestMethod.GET, RequestMethod.POST})
    public Object receiveNotify(HttpServletRequest request) {
        try {
            String data = IOUtils.toString(request.getInputStream());
            logger.info("pay notify result is：" + data);

            PayNotifyResponse response = JSON.parseObject(data, PayNotifyResponse.class);

            logger.info(JSON.toJSONString(response));

            logger.info(ApiResponse.isSuccess(response.getCode()));

            String sign = "";

            Map<String, String> map = new HashMap<String, String>();
            // 校验签名
            if (ApiResponse.isSuccess(response.getCode())) {
                map = BeanUtil.object2Map(response);
                sign = SignUtils.md5(map, Consts.apiKey);
                if (!sign.equals(response.getSign())) {
                    logger.info("签名不正确,sign=" + sign);
                }
            }
            // 推荐使用json方式来校验签名
            if (ApiResponse.isSuccess(response.getCode())) {
                map = BeanUtil.jsonStr2Map(data);
                sign = SignUtils.md5(map, Consts.apiKey);
                if (!sign.equals(response.getSign())) {
                    logger.info("json签名不正确,sign=" + sign);
                } else {
                    logger.info("使用json来校验签名，签名正确");
                }
            }

            return JsonUtil.getOkJson();
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
            return JsonUtil.getErrJson();
        }

    }
}
