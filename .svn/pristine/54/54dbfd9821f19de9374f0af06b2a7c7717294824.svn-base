package com.jd.traffic.pay.payService.platform.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

/**
 * @ClassName: PayMerchantChannel
 * @Description: 商户允许使用的 支付方式，以及对应的 支付账号。每个商户基础配置6个， 微信扫码，微信wap，微信app支付，  支付宝扫码，支付宝wap，支付宝app支付
 * @author: zhangjian
 * @date: 2018年4月27日 下午5:36:59
 */
@Entity
@Table(name = "PAY_MERCHANT_CHANNEL")
public class PayMerchantChannel implements java.io.Serializable {
	/**主键**/
	private String id;
	/**PayTypeCode， 微信 1， 支付宝 2**/
	private Integer payTypeId;
	/**商户号主键**/
	private String payMerchantId;
	/**支付渠道主键**/
	private String payChannelId;
	/**TradeTypeCode， 如扫码支付，app支付等 **/
	private String tradeType;
	/**支付渠道**/
    private PayChannel payChannel;
    /**支付商户**/
    private PayMerchant payMerchant;

	// Constructors

	/** default constructor */
	public PayMerchantChannel() {
	}

	/** minimal constructor */
	public PayMerchantChannel(String id, String payChannelId) {
		this.id = id;
		this.payChannelId = payChannelId;
	}

	/** full constructor */
	public PayMerchantChannel(String id, Integer payTypeId, String payMerchantId,
			String payChannelId, String tradeType) {
		this.id = id;
		this.payTypeId = payTypeId;
		this.payMerchantId = payMerchantId;
		this.payChannelId = payChannelId;
		this.tradeType = tradeType;
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

	@Column(name = "PAY_TYPE_ID", precision = 0)

	public Integer getPayTypeId() {
		return this.payTypeId;
	}

	public void setPayTypeId(Integer payTypeId) {
		this.payTypeId = payTypeId;
	}

	@Column(name = "PAY_MERCHANT_ID", length = 32)
	public String getPayMerchantId() {
		return this.payMerchantId;
	}

	public void setPayMerchantId(String payMerchantId) {
		this.payMerchantId = payMerchantId;
	}

	@Column(name = "PAY_CHANNEL_ID", length = 32)
	public String getPayChannelId() {
		return this.payChannelId;
	}

	public void setPayChannelId(String payChannelId) {
		this.payChannelId = payChannelId;
	}

	@Column(name = "TRADE_TYPE")

	public String getTradeType() {
		return this.tradeType;
	}

	public void setTradeType(String tradeType) {
		this.tradeType = tradeType;
	}
	
	@Transient
	public PayChannel getPayChannel() {
		return payChannel;
	}

	public void setPayChannel(PayChannel payChannel) {
		this.payChannel = payChannel;
	}

	@Transient
	public PayMerchant getPayMerchant() {
		return payMerchant;
	}

	public void setPayMerchant(PayMerchant payMerchant) {
		this.payMerchant = payMerchant;
	}

}