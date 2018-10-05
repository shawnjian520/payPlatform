package com.jd.traffic.pay.payApi.controller.api;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.IOUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.jd.traffic.pay.payApiModel.api.ApiResponse;
import com.jd.traffic.pay.payApiModel.api.request.RefundQueryRequest;
import com.jd.traffic.pay.payApiModel.api.request.RefundRequest;
import com.jd.traffic.pay.payApiModel.api.response.RefundQueryResponse;
import com.jd.traffic.pay.payApiModel.api.response.RefundResponse;
import com.jd.traffic.pay.payService.api.service.RefundService;

/**
 * 订单退款
 */
@Controller
@RequestMapping("/refund")
public class RefundController {
    private Log logger = LogFactory.getLog(this.getClass());
    @Autowired
    private RefundService refundService;

    @RequestMapping(value = "/request", method = RequestMethod.POST,produces = "application/json;charset=utf-8")
    @ResponseBody
    public Object request(HttpServletRequest request) {
        String data = null;
        RefundRequest req = null;
        try {
            data = IOUtils.toString(request.getInputStream());
            logger.info("data is " + data);
            req = JSON.parseObject(data, RefundRequest.class);
            RefundResponse refundResponse = refundService.request(req);
            return refundResponse.toJsonString();
        } catch (Exception e) {
        	e.printStackTrace();
            logger.error(e.getMessage(), e);
            return ApiResponse.createErrorResponse(e.getMessage()).toJsonString();
        }
    }

    /**
     * 退款查询
     *
     * @param request
     * @return
     */
    @RequestMapping(value = "/query", method = RequestMethod.POST,produces = "application/json;charset=utf-8")
    @ResponseBody
    public Object query(HttpServletRequest request) {
        String data = null;

        RefundQueryRequest req = null;
        try {
            data = IOUtils.toString(request.getInputStream());

            logger.info("data is " + data);
            req = JSON.parseObject(data, RefundQueryRequest.class);
            RefundQueryResponse response = refundService.query(req);
            return response.toJsonString();
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
            return ApiResponse.createErrorResponse(e.getMessage()).toJsonString();
        }
    }
}
