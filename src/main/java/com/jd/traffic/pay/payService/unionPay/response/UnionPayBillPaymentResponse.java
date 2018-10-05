package com.jd.traffic.pay.payService.unionPay.response;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

/**
 * @ClassName: BillPaymentResponse
 * @Description:聚合支付支付详情
 * @author: zhangjian
 * @date: 2018年5月29日 下午6:01:33
 */
@JsonIgnoreProperties
public class UnionPayBillPaymentResponse {
	private String buyerUsername;
	private String payTime;
	private String paySeqId;
	private String invoiceAmount;
	private String settleDate;
	private String buyerId;
	private String totalAmount;
	private String couponAmount;
	private String billBizType;
	private String buyerPayAmount;
	private String targetOrderId;
	private String payDetail;
	private String status;
	private String targetSys;
	public String getPayTime() {
		return payTime;
	}
	public void setPayTime(String payTime) {
		this.payTime = payTime;
	}
	public String getPaySeqId() {
		return paySeqId;
	}
	public void setPaySeqId(String paySeqId) {
		this.paySeqId = paySeqId;
	}
	public String getInvoiceAmount() {
		return invoiceAmount;
	}
	public void setInvoiceAmount(String invoiceAmount) {
		this.invoiceAmount = invoiceAmount;
	}
	public String getSettleDate() {
		return settleDate;
	}
	public void setSettleDate(String settleDate) {
		this.settleDate = settleDate;
	}
	public String getBuyerId() {
		return buyerId;
	}
	public void setBuyerId(String buyerId) {
		this.buyerId = buyerId;
	}
	public String getTotalAmount() {
		return totalAmount;
	}
	public void setTotalAmount(String totalAmount) {
		this.totalAmount = totalAmount;
	}
	public String getCouponAmount() {
		return couponAmount;
	}
	public void setCouponAmount(String couponAmount) {
		this.couponAmount = couponAmount;
	}
	public String getBillBizType() {
		return billBizType;
	}
	public void setBillBizType(String billBizType) {
		this.billBizType = billBizType;
	}
	public String getBuyerPayAmount() {
		return buyerPayAmount;
	}
	public void setBuyerPayAmount(String buyerPayAmount) {
		this.buyerPayAmount = buyerPayAmount;
	}
	public String getTargetOrderId() {
		return targetOrderId;
	}
	public void setTargetOrderId(String targetOrderId) {
		this.targetOrderId = targetOrderId;
	}
	public String getPayDetail() {
		return payDetail;
	}
	public void setPayDetail(String payDetail) {
		this.payDetail = payDetail;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getTargetSys() {
		return targetSys;
	}
	public void setTargetSys(String targetSys) {
		this.targetSys = targetSys;
	}
	public String getBuyerUsername() {
		return buyerUsername;
	}
	public void setBuyerUsername(String buyerUsername) {
		this.buyerUsername = buyerUsername;
	}
}
