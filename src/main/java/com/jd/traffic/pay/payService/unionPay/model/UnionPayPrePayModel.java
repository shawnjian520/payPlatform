package com.jd.traffic.pay.payService.unionPay.model;

import java.util.Date;

public class UnionPayPrePayModel {
	/**消息ID**/
	private String msgId;
	
	/**消息来源**/
	private String msgSrc;
	
	/**报文类型**/
	private String msgType;
	
	/**请求时间**/
	private String requestTimestamp;
	
	/**商户号**/
	private String mid;
	
	/**终端号**/
	private String tid;
	
	/**机构商户号**/
	private String instMid;
	
	/**账单号**/
	private String billNo;
	
	/**账单日期,格式yyyy-MM-dd**/
	private String billDate;
	
	/**账单描述**/
	private String billDesc;
	
	/**支付总金额**/
	private String totalAmount;
	
	/**账单过期时间，为空则不过期，格式yyyy-MM-dd HH:mm:ss**/
	private Date expireTime;
	
	/**支付结果通知地址**/
	private String notifyUrl;

	public String getMsgId() {
		return msgId;
	}

	public void setMsgId(String msgId) {
		this.msgId = msgId;
	}

	public String getMsgSrc() {
		return msgSrc;
	}

	public void setMsgSrc(String msgSrc) {
		this.msgSrc = msgSrc;
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

	public String getBillDesc() {
		return billDesc;
	}

	public void setBillDesc(String billDesc) {
		this.billDesc = billDesc;
	}

	public String getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(String totalAmount) {
		this.totalAmount = totalAmount;
	}

	public Date getExpireTime() {
		return expireTime;
	}

	public void setExpireTime(Date expireTime) {
		this.expireTime = expireTime;
	}

	public String getNotifyUrl() {
		return notifyUrl;
	}

	public void setNotifyUrl(String notifyUrl) {
		this.notifyUrl = notifyUrl;
	}
	
}
