package com.jd.traffic.pay.payService.platform.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.jd.traffic.pay.payApiModel.platform.enums.PayTypeCode;
import com.jd.traffic.pay.payApiModel.platform.enums.TradeTypeCode;

/**
 * @ClassName: RefundOrder
 * @Description:退款订单
 * @author: zhangjian
 * @date: 2018年4月27日 下午5:49:26
 */
@Entity
@Table(name = "REFUND_ORDER")
public class RefundOrder implements java.io.Serializable {
	/**主键**/
	private String id;
	/**支付渠道主键**/
	private String payChannelId;
	/**PayTypeCode， 支付类型，微信 1，支付宝 2，  对应 payOrder表**/
	private String payTypeCode;
	/**用于微信，支付宝的  支付交易流水号， 唯一索引。  对应 payOrder表**/
	private String payOrderNo;
	/**业务方 支付订单号，  对应 payOrder表**/
	private String tradePayNo;
	/**微信，支付宝 退款交易流水号，用于退款，  唯一索引**/
	private String refundOrderNo;
	/**业务方 退款订单号，如果业务方不设置则 支付平台自己生成， 和merchantId组成唯一索引。**/
	private String tradeRefundNo;
	/**微信支付内部订单号(transaction_id)，  支付宝内部交易号(trade_no)，  对应 payOrder表**/
	private String payId;
	/**支付金额  对应 payOrder表**/
	private Integer payAmount;
	/**微信退款单号**/
	private String refundId;
	/**退款金额**/
	private Integer refundAmount;
	/**退款状态 RefundStatus， 2退款成功**/
	private Integer status;
	/**如果退款失败，则保存第三方返回的失败错误码**/
	private String errorCode;
	/**如果退款失败，则保存第三方返回的失败描述信息**/
	private String errorMsg;
	/**退款时间**/
	private Date refundTime;
	/** 业务方 商户号 ,PayMerchant， 对应 payOrder表**/
	private String merchantId;
	/**TradeTypeCode，支付类型，如扫码，app支付，wap支付等。  对应 payOrder表**/
	private String tradeType;
	/**退款成功后通知url, 预留字段**/
	private String notifyUrl;
	/** 退款原因**/
	private String refundReason;
	/**创建时间**/
	private Date createTime;

	private String merchantName;

	public String getMerchantName() {
		return merchantName;
	}

	public void setMerchantName(String merchantName) {
		this.merchantName = merchantName;
	}
	
	// Constructors

	/** default constructor */
	public RefundOrder() {
	}

	/** minimal constructor */
	public RefundOrder(String id) {
		this.id = id;
	}

	/** full constructor */
	public RefundOrder(String id, String payChannelId, String payTypeCode,
	        String payOrderNo, String tradePayNo, String refundOrderNo,
	        String tradeRefundNo, String payId, Integer payAmount,
	        String refundId, Integer refundAmount, Integer status,
	        String errorCode, String errorMsg, Date refundTime,
	        String merchantId, String tradeType, String notifyUrl,
	        String refundReason, Date createTime) {
		this.id = id;
		this.payChannelId = payChannelId;
		this.payTypeCode = payTypeCode;
		this.payOrderNo = payOrderNo;
		this.tradePayNo = tradePayNo;
		this.refundOrderNo = refundOrderNo;
		this.tradeRefundNo = tradeRefundNo;
		this.payId = payId;
		this.payAmount = payAmount;
		this.refundId = refundId;
		this.refundAmount = refundAmount;
		this.status = status;
		this.errorCode = errorCode;
		this.errorMsg = errorMsg;
		this.refundTime = refundTime;
		this.merchantId = merchantId;
		this.tradeType = tradeType;
		this.notifyUrl = notifyUrl;
		this.refundReason = refundReason;
		this.createTime = createTime;
	}

	// Property accessors
	@Id

	@Column(name = "ID", unique = true, nullable = false, length = 32)

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Column(name = "PAY_CHANNEL_ID", length = 32)

	public String getPayChannelId() {
		return this.payChannelId;
	}

	public void setPayChannelId(String payChannelId) {
		this.payChannelId = payChannelId;
	}

	@Column(name = "PAY_TYPE_CODE")

	public String getPayTypeCode() {
		return this.payTypeCode;
	}

	public void setPayTypeCode(String payTypeCode) {
		this.payTypeCode = payTypeCode;
	}

	@Column(name = "PAY_ORDER_NO")

	public String getPayOrderNo() {
		return this.payOrderNo;
	}

	public void setPayOrderNo(String payOrderNo) {
		this.payOrderNo = payOrderNo;
	}

	@Column(name = "TRADE_PAY_NO")

	public String getTradePayNo() {
		return this.tradePayNo;
	}

	public void setTradePayNo(String tradePayNo) {
		this.tradePayNo = tradePayNo;
	}

	@Column(name = "REFUND_ORDER_NO")

	public String getRefundOrderNo() {
		return this.refundOrderNo;
	}

	public void setRefundOrderNo(String refundOrderNo) {
		this.refundOrderNo = refundOrderNo;
	}

	@Column(name = "TRADE_REFUND_NO")

	public String getTradeRefundNo() {
		return this.tradeRefundNo;
	}

	public void setTradeRefundNo(String tradeRefundNo) {
		this.tradeRefundNo = tradeRefundNo;
	}

	@Column(name = "PAY_ID")

	public String getPayId() {
		return this.payId;
	}

	public void setPayId(String payId) {
		this.payId = payId;
	}

	@Column(name = "PAY_AMOUNT", precision = 0)

	public Integer getPayAmount() {
		return this.payAmount;
	}

	public void setPayAmount(Integer payAmount) {
		this.payAmount = payAmount;
	}

	@Column(name = "REFUND_ID")

	public String getRefundId() {
		return this.refundId;
	}

	public void setRefundId(String refundId) {
		this.refundId = refundId;
	}

	@Column(name = "REFUND_AMOUNT", precision = 0)

	public Integer getRefundAmount() {
		return this.refundAmount;
	}

	public void setRefundAmount(Integer refundAmount) {
		this.refundAmount = refundAmount;
	}

	@Column(name = "STATUS", precision = 0)

	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	@Column(name = "ERROR_CODE")

	public String getErrorCode() {
		return this.errorCode;
	}

	public void setErrorCode(String errorCode) {
		this.errorCode = errorCode;
	}

	@Column(name = "ERROR_MSG")

	public String getErrorMsg() {
		return this.errorMsg;
	}

	public void setErrorMsg(String errorMsg) {
		this.errorMsg = errorMsg;
	}

	@Column(name = "REFUND_TIME", length = 7)

	public Date getRefundTime() {
		return this.refundTime;
	}

	public void setRefundTime(Date refundTime) {
		this.refundTime = refundTime;
	}

	@Column(name = "MERCHANT_ID")

	public String getMerchantId() {
		return this.merchantId;
	}

	public void setMerchantId(String merchantId) {
		this.merchantId = merchantId;
	}

	@Column(name = "TRADE_TYPE")

	public String getTradeType() {
		return this.tradeType;
	}

	public void setTradeType(String tradeType) {
		this.tradeType = tradeType;
	}

	@Column(name = "NOTIFY_URL")

	public String getNotifyUrl() {
		return this.notifyUrl;
	}

	public void setNotifyUrl(String notifyUrl) {
		this.notifyUrl = notifyUrl;
	}

	@Column(name = "REFUND_REASON")

	public String getRefundReason() {
		return this.refundReason;
	}

	public void setRefundReason(String refundReason) {
		this.refundReason = refundReason;
	}

	@Column(name = "CREATE_TIME", length = 7)

	public Date getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
	@Transient
    public PayTypeCode getPayTypeCodeEnum() {
        return PayTypeCode.getPayType(payTypeCode);
    }
    
	@Transient
    public TradeTypeCode getTradeTypeCodeEnum() {
        return TradeTypeCode.getTradeTypeCode(tradeType);
    }
}