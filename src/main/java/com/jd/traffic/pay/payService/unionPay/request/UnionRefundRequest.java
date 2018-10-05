package com.jd.traffic.pay.payService.unionPay.request;

public class UnionRefundRequest {
	private String msgType = "bills.refund";
	private String requestTimestamp = null;
	private String msgSrc = "WWW.GZETC12122.COM";
	private String mid = null;
	private String billDate = null;
	private String billNo = null;
	private String tid = null;
	private String instMid = null;
	private String refundAmount = null;
	private String sign = null;
	
	public UnionRefundRequest(){}
	
	public UnionRefundRequest(String mid,String tid,String instMid,String billNo,String billDate,String refundAmount){
		this.mid = mid;
		this.tid = tid;
		this.instMid = instMid;
		this.billNo = billNo;
		this.billDate = billDate;
		this.refundAmount = refundAmount;
	}
	
	public String getMsgType() {
		return msgType;
	}
	public void setMsgType(String msgType) {
		this.msgType = msgType;
	}
	public String getRequestTimestamp() {
		return requestTimestamp;
	}
	public void setRequestTimestamp(String requestTimestamp) {
		this.requestTimestamp = requestTimestamp;
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
	public String getBillDate() {
		return billDate;
	}
	public void setBillDate(String billDate) {
		this.billDate = billDate;
	}
	public String getBillNo() {
		return billNo;
	}
	public void setBillNo(String billNo) {
		this.billNo = billNo;
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
