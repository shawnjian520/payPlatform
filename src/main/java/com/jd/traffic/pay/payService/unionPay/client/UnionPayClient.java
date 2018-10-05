package com.jd.traffic.pay.payService.unionPay.client;

import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.jd.traffic.pay.payApiModel.util.BeanUtil;
import com.jd.traffic.pay.payService.unionPay.exception.UnionPayException;
import com.jd.traffic.pay.payService.unionPay.request.UnionPayQueryRequest;
import com.jd.traffic.pay.payService.unionPay.request.UnionPayRequest;
import com.jd.traffic.pay.payService.unionPay.request.UnionRefundRequest;
import com.jd.traffic.pay.payService.unionPay.response.UnionPayBillPaymentResponse;
import com.jd.traffic.pay.payService.unionPay.response.UnionPayQueryResponse;
import com.jd.traffic.pay.payService.unionPay.response.UnionPayResponse;
import com.jd.traffic.pay.payService.unionPay.response.UnionRefundResponse;
import com.jd.traffic.pay.util.HttpUtil;
import com.jd.traffic.pay.util.SignUtil;

import net.sf.json.JSONObject;

/**
 * @ClassName: UnionPayClient
 * @Description:银联聚合支付封装的客户端
 * @author: zhangjian
 * @date: 2018年5月29日 下午2:55:01
 */
public class UnionPayClient {
	private Log logger = LogFactory.getLog(this.getClass());
	private static final String SERVER_URL = "https://mpos.quanminfu.com:9898/netpay-route-server/api/";
	/** 商户号 **/
	private String mid;
	/** 终端号 **/
	private String tid;
	/** 机构商户号 **/
	private String instMid;
	/** 消息来源 */
	private String msgSrc;
	/** 系统ID **/
	private String systemId;
	/**系统编号**/
	private String systemCode;
	
	/**密钥**/
	private String apiKey;
	public UnionPayClient(String mid,String tid,String instMid,String msgSrc,String systemId,String apiKey){
		this.mid = mid;
		this.tid = tid;
		this.instMid = instMid;
		this.msgSrc = msgSrc;
		this.systemId = systemId;
		this.apiKey = apiKey;
	}
	
	
	public UnionPayResponse execute(UnionPayRequest unionPayRequest) throws UnionPayException{
		Map<String,String> params = BeanUtil.object2Map(unionPayRequest);
		String sign = SignUtil.signWithMd5(params, apiKey, "UTF-8");
		params.put("sign", sign);
		/***************************** 计算签名 ***************************/
		JSONObject jsonParams = JSONObject.fromObject(params);
		String postReponse = null;
		try {
			postReponse = HttpUtil.post(SERVER_URL, jsonParams.toString());
		} catch (Exception e) {
			throw new UnionPayException(e.getMessage(), e);
		}
		logger.info("生成二维码返回===" + postReponse);
		JSONObject jsonResponse = JSONObject.fromObject(postReponse);
		UnionPayResponse unionPayResponse = (UnionPayResponse)JSONObject.toBean(jsonResponse, UnionPayResponse.class);
		return unionPayResponse;
	}
	
	public UnionPayQueryResponse execute(UnionPayQueryRequest unionPayQueryRequest) throws UnionPayException{
		Map<String,String> params = BeanUtil.object2Map(unionPayQueryRequest);
		String sign = SignUtil.signWithMd5(params, apiKey, "UTF-8");
		params.put("sign", sign);
		/***************************** 计算签名 ***************************/
		JSONObject jsonParams = JSONObject.fromObject(params);
		String postReponse = null;
		try {
			postReponse = HttpUtil.post(SERVER_URL, jsonParams.toString());
		} catch (Exception e) {
			throw new UnionPayException(e.getMessage(), e);
		}
		logger.info("账单查询返回===" + postReponse);
		JSONObject jsonResponse = JSONObject.fromObject(postReponse);
		JSONObject jsonResponse_billPayment = null;
		if(jsonResponse.get("billPayment") != null){
			jsonResponse_billPayment = jsonResponse.getJSONObject("billPayment");
		}
		UnionPayQueryResponse unionPayQueryResponse = (UnionPayQueryResponse)JSONObject.toBean(jsonResponse, UnionPayQueryResponse.class);
		if(jsonResponse_billPayment != null){
			UnionPayBillPaymentResponse unionPayBillPaymentResponse = (UnionPayBillPaymentResponse) JSONObject.toBean(jsonResponse_billPayment, UnionPayBillPaymentResponse.class);
			unionPayQueryResponse.setUnionPayBillPaymentResponse(unionPayBillPaymentResponse);
		}
		return unionPayQueryResponse;
	}
	
	public UnionRefundResponse execute(UnionRefundRequest request) throws UnionPayException{
		Map<String,String> params = BeanUtil.object2Map(request);
		String sign = SignUtil.signWithMd5(params, apiKey, "UTF-8");
		params.put("sign", sign);
		/***************************** 计算签名 ***************************/
		JSONObject jsonParams = JSONObject.fromObject(params);
		String postReponse = null;
		try {
			postReponse = HttpUtil.post(SERVER_URL, jsonParams.toString());
		} catch (Exception e) {
			throw new UnionPayException(e.getMessage(), e);
		}
		logger.info("退款返回===" + postReponse);
		//postReponse = "{'msgType':'bills.refund','msgSrc':'WWW.GZETC12122.COM','mid':'898520147840104','refundStatus':'SUCCESS','billDate':'2018-05-30','tid':'01209038','instMid':'QRPAYDEFAULT','refundOrderId':'3050201805301600031772342043','refundTargetOrderId':'2018053021001004390523564333','responseTimestamp':'2018-05-30 16:00:04','errCode':'SUCCESS','billStatus':'REFUND','refundPayTime':'2018-05-30 16:00:09','billNo':'3050201805305113183726841247','billQRCode':'https://qr.chinaums.com/bills/qrCode.do?id=30501805302745118135768108','merOrderId':'30502018053051131837268412470','refundAmount':1,'sign':'C690A65E81BD40127723BE6272528733'}";
		JSONObject jsonResponse = JSONObject.fromObject(postReponse);
		UnionRefundResponse response = (UnionRefundResponse)JSONObject.toBean(jsonResponse, UnionRefundResponse.class);
		return response;
	}

	public Log getLogger() {
		return logger;
	}

	public void setLogger(Log logger) {
		this.logger = logger;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getTid() {
		return tid;
	}

	public void setTid(String tid) {
		this.tid = tid;
	}

	public String getInstMid() {
		return instMid;
	}

	public void setInstMid(String instMid) {
		this.instMid = instMid;
	}

	public String getMsgSrc() {
		return msgSrc;
	}

	public void setMsgSrc(String msgSrc) {
		this.msgSrc = msgSrc;
	}

	public String getSystemId() {
		return systemId;
	}

	public void setSystemId(String systemId) {
		this.systemId = systemId;
	}

	public String getApiKey() {
		return apiKey;
	}

	public void setApiKey(String apiKey) {
		this.apiKey = apiKey;
	}

	public String getSystemCode() {
		return systemCode;
	}

	public void setSystemCode(String systemCode) {
		this.systemCode = systemCode;
	}
}
