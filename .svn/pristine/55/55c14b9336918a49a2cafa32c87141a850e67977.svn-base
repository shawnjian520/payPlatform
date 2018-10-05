package com.jd.traffic.pay.payService.unionPay.response;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.jd.traffic.pay.payService.unionPay.client.UnionPayClient;

@JsonIgnoreProperties
public class UnionPayResponse  extends UnionPayBaseResponse{
	/**订单号**/
	private String qrCodeId;
	/**消息类型**/
	private String msgType;
	/**商户号**/
	private String mid;
	/**消息ID**/
	private String msgId;
	/**账单日期**/
	private String billDate;
	/**终端号**/
	private String tid;
	/**机构商户号**/
	private String instMid;
	/**报文应答时间,格式yyyy-MM-dd HH:mm:ss**/
	private String responseTimestamp;
	/**账单号**/
	private String billNo;
	/**账单二维码**/
	private String billQRCode;
	/**签名**/
	private String sign;
	
	public UnionPayResponse(){}
	
	public UnionPayResponse(String qrCodeId,String msgType,String mid,String billDate,String tid,String instMid,
			String responseTimestamp,String billNo,String billQRCode,String sign,String errCode,String errMsg){
		super(errCode, errMsg);
		this.qrCodeId = qrCodeId;
		this.msgType = msgType;
		this.mid = mid;
		this.billDate = billDate;
		this.tid = tid;
		this.instMid = instMid;
		this.responseTimestamp = responseTimestamp;
		this.billNo = billNo;
		this.billQRCode = billQRCode;
		this.sign = sign;
	}
	


	@Override
	public boolean isValidResponse(UnionPayClient client) {
		boolean isValid = true;
		if(!"SUCCESS".equals(getErrCode())){
			isValid = false;
			return isValid;
		}
		/*Map<String,String> params = BeanUtil.object2Map(this);
		String signCheck = SignUtil.signWithMd5(params, client.getApiKey(), "UTF-8");
		if(!signCheck.equals(sign)){
			isValid = false;
		}*/
		return isValid;
	}
	
	
	
	
	public String getQrCodeId() {
		return qrCodeId;
	}
	public void setQrCodeId(String qrCodeId) {
		this.qrCodeId = qrCodeId;
	}
	public String getMsgType() {
		return msgType;
	}
	public void setMsgType(String msgType) {
		this.msgType = msgType;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getMsgId() {
		return msgId;
	}
	public void setMsgId(String msgId) {
		this.msgId = msgId;
	}
	public String getBillDate() {
		return billDate;
	}
	public void setBillDate(String billDate) {
		this.billDate = billDate;
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
	public String getResponseTimestamp() {
		return responseTimestamp;
	}
	public void setResponseTimestamp(String responseTimestamp) {
		this.responseTimestamp = responseTimestamp;
	}
	public String getBillNo() {
		return billNo;
	}
	public void setBillNo(String billNo) {
		this.billNo = billNo;
	}
	public String getBillQRCode() {
		return billQRCode;
	}
	public void setBillQRCode(String billQRCode) {
		this.billQRCode = billQRCode;
	}
	public String getSign() {
		return sign;
	}
	public void setSign(String sign) {
		this.sign = sign;
	}


}
