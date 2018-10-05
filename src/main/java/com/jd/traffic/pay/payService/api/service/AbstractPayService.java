package com.jd.traffic.pay.payService.api.service;

import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jd.traffic.pay.payApiModel.api.ApiRequest;
import com.jd.traffic.pay.payApiModel.api.ApiResponse;
import com.jd.traffic.pay.payApiModel.platform.enums.ResultCode;
import com.jd.traffic.pay.payApiModel.util.BeanUtil;
import com.jd.traffic.pay.payApiModel.util.SignUtils;
import com.jd.traffic.pay.payService.platform.model.PayMerchant;
import com.jd.traffic.pay.payService.platform.service.PayMerchantChannelService;
import com.jd.traffic.pay.payService.platform.service.PayMerchantService;

/**
 * 提供给业务方 签名方式
 * <p/>
 * 如果参数的值为空不参与签名
 * 参数名区分大小写
 */
@Service
public class AbstractPayService {
    private Log logger = LogFactory.getLog(this.getClass());

    @Autowired
    protected PayMerchantService payMerchantService;
    @Autowired
    protected PayMerchantChannelService payMerchantChannelService;

    /**
     * 生成签名,同样规则适用于request
     *
     * @param response
     * @param key
     * @return
     */
    protected String sign(ApiResponse response, String key) {
        Map<String, String> data = BeanUtil.object2Map(response);
        return SignUtils.md5(data, key);
    }

    /**
     * 校验签名
     *
     * @param request
     * @param key
     * @return
     */
    protected boolean checkSign(ApiRequest request, String key) {
        Map<String, String> data = BeanUtil.object2Map(request);
        return SignUtils.md5(data, key).equalsIgnoreCase(request.getSign());
    }

    /**
     * 参数校验， 如果校验通过则返回null，否则构建response，设置为fail，直接返回
     *
     * @param merchant
     * @param request
     * @param clazz
     * @return
     */
    protected ApiResponse validate(PayMerchant merchant, ApiRequest request, Class<? extends ApiResponse> clazz) {
        if (merchant == null || merchant.getStatus() != PayMerchant.STATUS_ACTIVE) {
            return newInstance(clazz, ResultCode.FAIL.getValue(), "商户不存在");
        }
        request.validate();

        if (!checkSign(request, merchant.getApiKey())) {
            return newInstance(clazz, ResultCode.FAIL.getValue(), "签名校验不通过");
        }

        return null;
    }

    private ApiResponse newInstance(Class<? extends ApiResponse> clazz, String code, String msg) {
        try {
            ApiResponse response = clazz.newInstance();
            response.setMsg(msg);
            response.setCode(code);
            return response;
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
            throw new RuntimeException(e);
        }
    }
}
