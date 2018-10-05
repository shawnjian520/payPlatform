package com.jd.traffic.pay.payService.platform.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * @ClassName: PayMerchant
 * @Description:支付平台对外提供的商户号
 * @author: zhangjian
 * @date: 2018年4月27日 下午5:35:01
 */
@Entity
@Table(name = "PAY_MERCHANT")
public class PayMerchant implements java.io.Serializable {
    public static int STATUS_ACTIVE = 1;
	/**主键**/
	private String id;
	/**商户名称**/
	private String name;
	/**商户Id**/
	private String merchantId;
	/** 秘钥**/
	private String apiKey;
	/**1正常，2 不可用**/
	private Integer status;
	
	private Date createtime;

	// Constructors

	/** default constructor */
	public PayMerchant() {
	}

	/** full constructor */
	public PayMerchant(String id, String name, String merchantId, String apiKey,
	        Integer status) {
		this.id = id;
		this.name = name;
		this.merchantId = merchantId;
		this.apiKey = apiKey;
		this.status = status;
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

	@Column(name = "NAME", nullable = false)

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "MERCHANT_ID", nullable = false, length = 19)

	public String getMerchantId() {
		return this.merchantId;
	}

	public void setMerchantId(String merchantId) {
		this.merchantId = merchantId;
	}

	@Column(name = "API_KEY", nullable = false, length = 32)

	public String getApiKey() {
		return this.apiKey;
	}

	public void setApiKey(String apiKey) {
		this.apiKey = apiKey;
	}

	@Column(name = "STATUS", nullable = false, precision = 0)

	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}
	
	 public String toString() {
	        return "PayMerchant{" +
	                "id=" + id +
	                ", name='" + name + '\'' +
	                ", status=" + status +
	                ", merchantId='" + merchantId + '\'' +
	                ", apiKey='" + apiKey + '\'' +
	                '}';
    }
	 
	@Column(name = "CREATETIME", length = 7)
	public Date getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}
}