package com.jd.traffic.pay.payService.platform.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.jd.traffic.pay.payApiModel.platform.enums.PayStatus;
import com.jd.traffic.pay.payApiModel.platform.enums.PayTypeCode;
import com.jd.traffic.pay.payApiModel.platform.enums.TradeTypeCode;

/**
 * @ClassName: PayOrder
 * @Description:支付订单
 * @author: zhangjian
 * @date: 2018年4月27日 下午5:41:24
 */
@Entity
@Table(name = "PAY_ORDER")
public class PayOrder implements java.io.Serializable {
	/**主键**/
	private String id;
	/**PayTypeCode， 支付类型，微信 ，支付宝**/
	private String payTypeCode;
	/**用于微信，支付宝的  商户交易流水号， 唯一索引。  out_trade_no**/
	private String payOrderNo;
	/**业务方 支付订单号**/
	private String tradePayNo;
	/**微信、支付宝返回的 给app或者网页的支付凭证，  客户端通过此信息调起支付界面**/
	private String prePayId;
	/**微信支付内部订单号(transaction_id)，  支付宝内部交易号(trade_no)，  一般使用 payOrderNo,**/
	private String payId;
	/**客户端IP**/
	private String userIp;
	/**支付金额，精确到分**/
	private Integer payAmount;
	/**支付时间**/
	private Date payTime;
	/**支付状态,2支付成功**/
	private Integer status;
	/**如果创建订单失败，则保存第三方返回的失败错误码**/
	private String errorCode;
	/**如果创建订单失败，则保存第三方返回的错误描述**/
	private String errorMsg;
	/**支付申请时间**/
	private Date startTime;
	/**支付过期时间， 默认为2小时**/
	private Date expireTime;
	/**微信为用户的openId，支付宝为buyer_id	买家支付宝用户号**/
	private String openId;
	/**支付宝中：买家支付宝账号**/
	private String buyerLogonId;
	/**回调业务方的url**/
	private String notifyUrl;
	/**附加信息， 支付完成后通知时候会原封不动返回业务方。**/
	private String extra;
	/**订单标题，微信中对应body字段**/
	private String subject;
	/**订单描述，微信中对应detail字段，为json格式。 支付宝中对应 body字段，表示描述，字符串**/
	private String detail;
	/**二维码链接**/
	private String codeUrl;
	/**业务方 商户号 ,PayMerchant**/
	private String merchantId;
	/**TradeTypeCode，支付类型，如扫码，app支付，wap支付等。**/
	private String tradeType;
	/**支付成功页，  支付宝：页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问，  微信需要在前端自己设置**/
	private String returnUrl;
	/** 退款额度，精确到分**/
	private Integer refundAmount;

	private String merchantName;

	public String getMerchantName() {
		return merchantName;
	}

	public void setMerchantName(String merchantName) {
		this.merchantName = merchantName;
	}

	/** default constructor */
	public PayOrder() {
	}

	/** minimal constructor */
	public PayOrder(String id, String payOrderNo) {
		this.id = id;
		this.payOrderNo = payOrderNo;
	}

	/** full constructor */
	public PayOrder(String id, String payTypeCode, String payOrderNo,
	        String tradePayNo, String prePayId, String payId, String userIp,
	        Integer payAmount, Date payTime, Integer status,
	        String errorCode, String errorMsg, Date startTime,
	        Date expireTime, String openId, String buyerLogonId,
	        String notifyUrl, String extra, String subject, String detail,
	        String codeUrl, String merchantId, String tradeType,
	        String returnUrl, Integer refundAmount) {
		this.id = id;
		this.payTypeCode = payTypeCode;
		this.payOrderNo = payOrderNo;
		this.tradePayNo = tradePayNo;
		this.prePayId = prePayId;
		this.payId = payId;
		this.userIp = userIp;
		this.payAmount = payAmount;
		this.payTime = payTime;
		this.status = status;
		this.errorCode = errorCode;
		this.errorMsg = errorMsg;
		this.startTime = startTime;
		this.expireTime = expireTime;
		this.openId = openId;
		this.buyerLogonId = buyerLogonId;
		this.notifyUrl = notifyUrl;
		this.extra = extra;
		this.subject = subject;
		this.detail = detail;
		this.codeUrl = codeUrl;
		this.merchantId = merchantId;
		this.tradeType = tradeType;
		this.returnUrl = returnUrl;
		this.refundAmount = refundAmount;
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

	@Column(name = "PAY_TYPE_CODE", length = 50)

	public String getPayTypeCode() {
		return this.payTypeCode;
	}

	public void setPayTypeCode(String payTypeCode) {
		this.payTypeCode = payTypeCode;
	}

	@Column(name = "PAY_ORDER_NO", nullable = false)

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

	@Column(name = "PRE_PAY_ID", length = 100)

	public String getPrePayId() {
		return this.prePayId;
	}

	public void setPrePayId(String prePayId) {
		this.prePayId = prePayId;
	}

	@Column(name = "PAY_ID", length = 100)

	public String getPayId() {
		return this.payId;
	}

	public void setPayId(String payId) {
		this.payId = payId;
	}

	@Column(name = "USER_IP", length = 50)

	public String getUserIp() {
		return this.userIp;
	}

	public void setUserIp(String userIp) {
		this.userIp = userIp;
	}

	@Column(name = "PAY_AMOUNT", precision = 0)

	public Integer getPayAmount() {
		return this.payAmount;
	}

	public void setPayAmount(Integer payAmount) {
		this.payAmount = payAmount;
	}

	@Column(name = "PAY_TIME", length = 7)

	public Date getPayTime() {
		return this.payTime;
	}

	public void setPayTime(Date payTime) {
		this.payTime = payTime;
	}

	@Column(name = "STATUS", precision = 0)

	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	@Column(name = "ERROR_CODE", length = 32)

	public String getErrorCode() {
		return this.errorCode;
	}

	public void setErrorCode(String errorCode) {
		this.errorCode = errorCode;
	}

	@Column(name = "ERROR_MSG", length = 128)

	public String getErrorMsg() {
		return this.errorMsg;
	}

	public void setErrorMsg(String errorMsg) {
		this.errorMsg = errorMsg;
	}

	@Column(name = "START_TIME", length = 7)

	public Date getStartTime() {
		return this.startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	@Column(name = "EXPIRE_TIME", length = 7)

	public Date getExpireTime() {
		return this.expireTime;
	}

	public void setExpireTime(Date expireTime) {
		this.expireTime = expireTime;
	}

	@Column(name = "OPEN_ID")

	public String getOpenId() {
		return this.openId;
	}

	public void setOpenId(String openId) {
		this.openId = openId;
	}

	@Column(name = "BUYER_LOGON_ID")

	public String getBuyerLogonId() {
		return this.buyerLogonId;
	}

	public void setBuyerLogonId(String buyerLogonId) {
		this.buyerLogonId = buyerLogonId;
	}

	@Column(name = "NOTIFY_URL")

	public String getNotifyUrl() {
		return this.notifyUrl;
	}

	public void setNotifyUrl(String notifyUrl) {
		this.notifyUrl = notifyUrl;
	}

	@Column(name = "EXTRA", length = 100)

	public String getExtra() {
		return this.extra;
	}

	public void setExtra(String extra) {
		this.extra = extra;
	}

	@Column(name = "SUBJECT", length = 100)

	public String getSubject() {
		return this.subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	@Column(name = "DETAIL", length = 500)

	public String getDetail() {
		return this.detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	@Column(name = "CODE_URL")

	public String getCodeUrl() {
		return this.codeUrl;
	}

	public void setCodeUrl(String codeUrl) {
		this.codeUrl = codeUrl;
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

	@Column(name = "RETURN_URL")

	public String getReturnUrl() {
		return this.returnUrl;
	}

	public void setReturnUrl(String returnUrl) {
		this.returnUrl = returnUrl;
	}

	@Column(name = "REFUND_AMOUNT", precision = 0)

	public Integer getRefundAmount() {
		return this.refundAmount;
	}
	
	public void setRefundAmount(Integer refundAmount) {
		this.refundAmount = refundAmount;
	}
	
	@Transient
	public TradeTypeCode getTradeTypeCodeEnum() {
        return TradeTypeCode.getTradeTypeCode(tradeType);
	}

	
	@Transient
    public String getStatusDesc() {
        PayStatus s = PayStatus.getPayStatus(status);
        if (s != null) {
            return s.getName();
        }
        return "";
    }
    
    @Transient
    public PayTypeCode getPayTypeCodeEnum() {
        return PayTypeCode.getPayType(payTypeCode);
    }
}