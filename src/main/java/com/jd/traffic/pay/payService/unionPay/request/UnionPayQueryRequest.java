package com.jd.traffic.pay.payService.unionPay.request;

public class UnionPayQueryRequest {
	private String msgType = "bills.query";
	private String requestTimestamp = null;
	private String msgSrc = "WWW.GZETC12122.COM";
	private String mid = null;
	private String tid = null;
	private String instMid = null;
	private String billNo = null;
	private String billDate = null;
	private String sign = null;
	
	public UnionPayQueryRequest(){
		
	}
	
	public UnionPayQueryRequest(String mid,String tid,String instMid,String billNo,String billDate){
		this.mid = mid;
		this.tid = tid;
		this.instMid = instMid;
		this.billDate = billDate;
		this.billNo = billNo;
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
	public String getBillNo() {
		return billNo;
	}
	public void setBillNo(String billNo) {
		this.billNo = billNo;
	}
	public String getBillDate() {
		return billDate;
	}
	public void setBillDate(String billDate) {
		this.billDate = billDate;
	}
	public String getSign() {
		return sign;
	}
	public void setSign(String sign) {
		this.sign = sign;
	}
}
