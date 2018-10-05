package com.jd.traffic.pay.payService.unionPay.response;

import com.jd.traffic.pay.payService.unionPay.client.UnionPayClient;

public class UnionPayBaseResponse {
	/**平台错误码**/
	private String errCode;
	/**平台错误信息 **/
	private String errMsg;
	
	
	public UnionPayBaseResponse(){}
	
	public UnionPayBaseResponse(String errCode,String errMsg){
		this.errCode = errCode;
		this.errMsg = errMsg;
	}
	
	public boolean isValidResponse(UnionPayClient client){
		return false;
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
}
