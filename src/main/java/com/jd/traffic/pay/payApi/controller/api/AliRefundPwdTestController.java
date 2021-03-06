package com.jd.traffic.pay.payApi.controller.api;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.jd.traffic.pay.payApiModel.api.request.RefundRequest;
import com.jd.traffic.pay.payService.alipay.service.AliRefundService;
import com.jd.traffic.pay.payService.api.service.RefundService;
import com.jd.traffic.pay.payService.platform.model.PayChannel;
import com.jd.traffic.pay.payService.platform.model.PayMerchantChannel;
import com.jd.traffic.pay.payService.platform.model.PayOrder;
import com.jd.traffic.pay.payService.platform.model.RefundOrder;
import com.jd.traffic.pay.payService.platform.service.PayChannelService;
import com.jd.traffic.pay.payService.platform.service.PayMerchantChannelService;
import com.jd.traffic.pay.payService.platform.service.PayMerchantService;
import com.jd.traffic.pay.payService.platform.service.PayOrderService;
import com.jd.traffic.pay.payService.platform.service.RefundOrderService;

@Controller
@RequestMapping("/refund")
public class AliRefundPwdTestController {
    private Log logger = LogFactory.getLog(this.getClass());
    @Autowired
    private RefundService refundService;

    @Autowired
    private PayOrderService payOrderService;
    @Autowired
    private RefundOrderService refundOrderService;
    @Autowired
    private PayChannelService payChannelService;

    @Autowired
    protected PayMerchantService payMerchantService;
    @Autowired
    protected PayMerchantChannelService payMerchantChannelService;

    @Autowired
    AliRefundService aliRefundService;

    /**
     * 支付宝 即时到账有密退款接口
     * <p/>
     * 后端，前端都可以拼 退款链接。
     *
     * @param request
     * @return
     */
    @RequestMapping(value = "/ali_pwd_test", method = RequestMethod.GET)
    public ModelAndView ali_pwd(HttpServletRequest request,
                                @RequestParam("payOrderNo") String payOrderNo) throws UnsupportedEncodingException {
        RefundRequest req = new RefundRequest();
        req.setPayOrderNo(payOrderNo);

        PayOrder payOrder = payOrderService.getPayOrder(req.getPayOrderNo());

        req.setMerchantId(payOrder.getMerchantId());
        req.setPayAmount(payOrder.getPayAmount());
        req.setRefundAmount(payOrder.getPayAmount());
        req.setRefundReason("即时到账有密退款接口测试");

        PayMerchantChannel merchantChannel = payMerchantChannelService.getPayMerchantChannel(payOrder.getMerchantId(), payOrder.getPayTypeCodeEnum(), payOrder.getTradeTypeCodeEnum());
        PayChannel payChannel = merchantChannel.getPayChannel();

        RefundOrder refundOrder = refundOrderService.createRefundOrder(payOrder, payChannel.getId(), req.getTradeRefundNo(), req.getRefundAmount(), req.getRefundReason());

        Map<String, String> params = aliRefundService.refundWithPwd(payChannel, refundOrder);

        String url = "https://mapi.alipay.com/gateway.do";
        String querys = convert(params); //拼参数时候，需要urlencode, 计算签名时候不用urlencode

        String redirectUrl = url + "?" + querys;
        logger.info(redirectUrl);

        return new ModelAndView(new RedirectView(redirectUrl));
    }

    public static String convert(Map<String, String> params) throws UnsupportedEncodingException {
        StringBuilder buf = new StringBuilder();
        Iterator<Map.Entry<String, String>> it = params.entrySet().iterator();
        while (it.hasNext()) {
            Map.Entry<String, String> entry = it.next();
            String k = entry.getKey();
            if (StringUtils.isBlank(k)) {
                continue;
            }
            String v = entry.getValue();
            if (StringUtils.isBlank(v)) {
                continue;
            }
            buf.append(k);
            buf.append("=");
            buf.append(URLEncoder.encode(v, "utf-8")); // important
            buf.append("&");
        }

        buf = buf.deleteCharAt(buf.length() - 1);
        return buf.toString();
    }

}
