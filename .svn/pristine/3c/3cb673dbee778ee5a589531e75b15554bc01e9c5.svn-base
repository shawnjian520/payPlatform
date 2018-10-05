package com.jd.traffic.pay.payService.api.service;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import com.jd.traffic.pay.payApiModel.api.request.PayTypeRequest;
import com.jd.traffic.pay.payApiModel.api.response.PayTypeResponse;
import com.jd.traffic.pay.payApiModel.platform.enums.PayTypeCode;
import com.jd.traffic.pay.payApiModel.platform.enums.ResultCode;
import com.jd.traffic.pay.payApiModel.platform.enums.TradeTypeCode;
import com.jd.traffic.pay.payService.platform.model.PayMerchant;
import com.jd.traffic.pay.payService.platform.model.PayMerchantChannel;

@Service
public class ConfigService extends AbstractPayService {

    public PayTypeResponse getPayTypes(PayTypeRequest request) {
        PayMerchant merchant = payMerchantService.getPayMerchant(request.getMerchantId());

        PayTypeResponse response = (PayTypeResponse) validate(merchant, request, PayTypeResponse.class);
        if (response != null) {
            return response;
        }

        response = new PayTypeResponse();

        List<PayMerchantChannel> merchantChannels;
        if (StringUtils.isNotBlank(request.getTradeType())) {
            merchantChannels = payMerchantChannelService.getPayMerchantChannelByMchIdAndTradeType(merchant.getId(), request.getTradeType());
        } else {
            merchantChannels = payMerchantChannelService.getPayMerchantChannels(merchant.getId());
        }

        for (PayMerchantChannel merchantChannel : merchantChannels) {
            PayTypeCode type = PayTypeCode.getPayType(merchantChannel.getPayTypeId());
            TradeTypeCode tradeType = TradeTypeCode.getTradeTypeCode(merchantChannel.getTradeType());
            response.addPayType(type, tradeType);
        }
        response.setMerchantId(request.getMerchantId());
        response.setCode(ResultCode.SUCCESS.getValue());
        response.setMsg(ResultCode.SUCCESS.getValue());
        response.setSign(sign(response, merchant.getApiKey()));
        return response;
    }
}
