package com.jd.traffic.pay.payService.platform.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;


/**
 * @ClassName: PayChannel
 * @Description:支付渠道,存储微信、支付宝  apikey，公钥私钥等信息。支付宝支付采用了RSA加密签名的安全通信机制，开发者可以通过支付宝的公钥验证消息的来源，同时使用自己的私钥进行信息加密
 * @author: zhangjian
 * @date: 2018年4月27日 下午5:29:43
 */
@Entity
@Table(name = "PAY_CHANNEL")
public class PayChannel implements java.io.Serializable {
	/**主键**/
	private String id;
	/**PayTypeCode.id**/
	private Integer payTypeId;
	/**PayTypeCode.name**/
	private String payTypeName;
	/**支付类型**/
	private String payTypeCode;
	/**支付描述， 如 官方app支付， 扫码支付等**/
	private String payChannelName;
	/**加密方式，如 MD5 微信,  RSA 支付宝**/
	private String signType;
	/**仅微信使用，凭证文件Id，对应 FileResources**/
	private String certFileId;
	/**仅微信使用，开通微信支付后，会把 微信支付的账号，密码，以及 apikey发给开发者。  用于签名**/
	private String apiKey;
	/**微信为公众账号Id，  支付宝为20开头的一串数字（管理中心-我的应用）**/
	private String appId;
	/**商户Id/合作伙伴Id， 例如 微信为12开头的一串数字(账户信息-微信支付商户号)，支付宝为（从我的应用-查看-使用者管理-使用者Id）**/
	private String mchId;
	/**1正常，2 不可用**/
	private Integer status;
	/**商户私钥，  商户公钥需要在支付宝开放平台设置，**/
	private String mchKey;
	/**支付宝公钥，  由支付宝开放平台提供**/
	private String platformKey;
	/**对应PayChannel,0表示本身， 在调用支付宝查询订单(AliPayService.synchronize)功能时候，对应的开放平台秘钥Id**/
	private String queryChannelId;

	private Date createtime;
	// Constructors

	/** default constructor */
	public PayChannel() {
	}

	/** minimal constructor */
	public PayChannel(String id, Integer payTypeId, String signType,
	        String appId, String mchId, Integer status) {
		this.id = id;
		this.payTypeId = payTypeId;
		this.signType = signType;
		this.appId = appId;
		this.mchId = mchId;
		this.status = status;
	}

	/** full constructor */
	public PayChannel(String id, Integer payTypeId, String payTypeName,
	        String payTypeCode, String payChannelName, String signType,
	        String certFileId, String apiKey, String appId, String mchId,
	        Integer status, String mchKey, String platformKey,
	        String queryChannelId) {
		this.id = id;
		this.payTypeId = payTypeId;
		this.payTypeName = payTypeName;
		this.payTypeCode = payTypeCode;
		this.payChannelName = payChannelName;
		this.signType = signType;
		this.certFileId = certFileId;
		this.apiKey = apiKey;
		this.appId = appId;
		this.mchId = mchId;
		this.status = status;
		this.mchKey = mchKey;
		this.platformKey = platformKey;
		this.queryChannelId = queryChannelId;
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

	@Column(name = "PAY_TYPE_ID", nullable = false, precision = 0)

	public Integer getPayTypeId() {
		return this.payTypeId;
	}

	public void setPayTypeId(Integer payTypeId) {
		this.payTypeId = payTypeId;
	}

	@Column(name = "PAY_TYPE_NAME")

	public String getPayTypeName() {
		return this.payTypeName;
	}

	public void setPayTypeName(String payTypeName) {
		this.payTypeName = payTypeName;
	}

	@Column(name = "PAY_TYPE_CODE")

	public String getPayTypeCode() {
		return this.payTypeCode;
	}

	public void setPayTypeCode(String payTypeCode) {
		this.payTypeCode = payTypeCode;
	}

	@Column(name = "PAY_CHANNEL_NAME")

	public String getPayChannelName() {
		return this.payChannelName;
	}

	public void setPayChannelName(String payChannelName) {
		this.payChannelName = payChannelName;
	}

	@Column(name = "SIGN_TYPE", nullable = false)

	public String getSignType() {
		return this.signType;
	}

	public void setSignType(String signType) {
		this.signType = signType;
	}

	@Column(name = "CERT_FILE_ID", length = 32)

	public String getCertFileId() {
		return this.certFileId;
	}

	public void setCertFileId(String certFileId) {
		this.certFileId = certFileId;
	}

	@Column(name = "API_KEY")

	public String getApiKey() {
		return this.apiKey;
	}

	public void setApiKey(String apiKey) {
		this.apiKey = apiKey;
	}

	@Column(name = "APP_ID", nullable = false)

	public String getAppId() {
		return this.appId;
	}

	public void setAppId(String appId) {
		this.appId = appId;
	}

	@Column(name = "MCH_ID", nullable = false)

	public String getMchId() {
		return this.mchId;
	}

	public void setMchId(String mchId) {
		this.mchId = mchId;
	}

	@Column(name = "STATUS", nullable = false, precision = 0)

	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	@Column(name = "MCH_KEY", length = 1024)

	public String getMchKey() {
		return this.mchKey;
	}

	public void setMchKey(String mchKey) {
		this.mchKey = mchKey;
	}

	@Column(name = "PLATFORM_KEY", length = 1024)

	public String getPlatformKey() {
		return this.platformKey;
	}

	public void setPlatformKey(String platformKey) {
		this.platformKey = platformKey;
	}

	@Column(name = "QUERY_CHANNEL_ID", length = 32)
	public String getQueryChannelId() {
		return this.queryChannelId;
	}

	public void setQueryChannelId(String queryChannelId) {
		this.queryChannelId = queryChannelId;
	}
	
	@Column(name = "CREATETIME", length = 7)
	public Date getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}

}