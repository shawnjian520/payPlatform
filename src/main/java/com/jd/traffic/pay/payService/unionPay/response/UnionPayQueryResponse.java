package com.jd.traffic.pay.payService.unionPay.response;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties
public class UnionPayQueryResponse {
	private String msgType;
	private String billDesc;
	private String msgSrc;
	private String merName;
	private String mid;
	private String billDate;
	private String tid;
	private String instMid;
	private String totalAmount;
	private String createTime;
	private String responseTimestamp;
	private String billStatus;
	private String billNo;
	private String billQRCode;
	private String sign;
	private String errCode;
	private String errMsg;
	private String billPayment;
	private UnionPayBillPaymentResponse unionPayBillPaymentResponse;
	
	public String getMsgType() {
		return msgType;
	}
	public void setMsgType(String msgType) {
		this.msgType = msgType;
	}
	public String getBillDesc() {
		return billDesc;
	}
	public void setBillDesc(String billDesc) {
		this.billDesc = billDesc;
	}
	public String getMsgSrc() {
		return msgSrc;
	}
	public void setMsgSrc(String msgSrc) {
		this.msgSrc = msgSrc;
	}
	public String getMerName() {
		return merName;
	}
	public void setMerName(String merName) {
		this.merName = merName;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
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
	public String getTotalAmount() {
		return totalAmount;
	}
	public void setTotalAmount(String totalAmount) {
		this.totalAmount = totalAmount;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public String getResponseTimestamp() {
		return responseTimestamp;
	}
	public void setResponseTimestamp(String responseTimestamp) {
		this.responseTimestamp = responseTimestamp;
	}
	public String getBillStatus() {
		return billStatus;
	}
	public void setBillStatus(String billStatus) {
		this.billStatus = billStatus;
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
	public String getErrCode() {
		return errCode;
	}
	public void setErrCode(String errCode) {
		this.errCode = errCode;
	}
	public String getErrMsg() {
		return errMsg;
	}
	public void setErrMsg(String errMsg) {
		this.errMsg = errMsg;
	}
	public String getBillPayment() {
		return billPayment;
	}
	public void setBillPayment(String billPayment) {
		this.billPayment = billPayment;
	}
	public UnionPayBillPaymentResponse getUnionPayBillPaymentResponse() {
		return unionPayBillPaymentResponse;
	}
	public void setUnionPayBillPaymentResponse(
	        UnionPayBillPaymentResponse unionPayBillPaymentResponse) {
		this.unionPayBillPaymentResponse = unionPayBillPaymentResponse;
	}
}
