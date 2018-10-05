package com.jd.traffic.pay.payService.unionPay.response;

import com.jd.traffic.pay.payService.unionPay.client.UnionPayClient;

public class UnionRefundResponse {
	private String msgType;
	private String msgSrc;
	private String mid;
	private String refundStatus;
	private String billDate;
	private String tid;
	private String instMid;
	private String refundOrderId;
	private String refundTargetOrderId;
	private String responseTimestamp;
	private String errCode;
	private String billStatus;
	private String refundPayTime;
	private String billNo;
	private String billQRCode;
	private String merOrderId;
	private String refundAmount;
	private String sign;
	
	public boolean isSuccess(UnionPayClient client) {
		
		boolean isValid = true;
		if(!"SUCCESS".equals(getErrCode())||  !"SUCCESS".equals(getRefundStatus())){
			isValid = false;
			return isValid;
		}
		/*Map<String,String> params = BeanUtil.object2Map(this);
		params.remove("sign");
		String signCheck = SignUtil.signWithMd5(params, client.getApiKey(), "UTF-8");
		if(!signCheck.equals(sign)){
			isValid = false;
		}*/
		return isValid;
	}
	
	
	public String getMsgType() {
		return msgType;
	}
	public void setMsgType(String msgType) {
		this.msgType = msgType;
	}
	public String getMsgSrc() {
		return msgSrc;
	}
	public void setMsgSrc(String msgSrc) {
		this.msgSrc = msgSrc;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getRefundStatus() {
		return refundStatus;
	}
	public void setRefundStatus(String refundStatus) {
		this.refundStatus = refundStatus;
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
	public String getRefundOrderId() {
		return refundOrderId;
	}
	public void setRefundOrderId(String refundOrderId) {
		this.refundOrderId = refundOrderId;
	}
	public String getRefundTargetOrderId() {
		return refundTargetOrderId;
	}
	public void setRefundTargetOrderId(String refundTargetOrderId) {
		this.refundTargetOrderId = refundTargetOrderId;
	}
	public String getResponseTimestamp() {
		return responseTimestamp;
	}
	public void setResponseTimestamp(String responseTimestamp) {
		this.responseTimestamp = responseTimestamp;
	}
	public String getErrCode() {
		return errCode;
	}
	public void setErrCode(String errCode) {
		this.errCode = errCode;
	}
	public String getBillStatus() {
		return billStatus;
	}
	public void setBillStatus(String billStatus) {
		this.billStatus = billStatus;
	}
	public String getRefundPayTime() {
		return refundPayTime;
	}
	public void setRefundPayTime(String refundPayTime) {
		this.refundPayTime = refundPayTime;
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
	public String getMerOrderId() {
		return merOrderId;
	}
	public void setMerOrderId(String merOrderId) {
		this.merOrderId = merOrderId;
	}
	public String getRefundAmount() {
		return refundAmount;
	}
	public void setRefundAmount(String refundAmount) {
		this.refundAmount = refundAmount;
	}
	public String getSign() {
		return sign;
	}
	public void setSign(String sign) {
		this.sign = sign;
	}

}
