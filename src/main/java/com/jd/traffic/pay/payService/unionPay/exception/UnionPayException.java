package com.jd.traffic.pay.payService.unionPay.exception;

public class UnionPayException extends Exception {
	private String errCode;
	private String errMsg;
	
	public UnionPayException(){};
	
	public UnionPayException(String errCode,String errMsg){
		this.errCode = errCode;
		this.errMsg = errMsg;
	}
	
	public UnionPayException(Throwable cause){
		super(cause);
		this.errMsg = cause.getMessage();
	}
	
	
	public UnionPayException(String errMsg,Throwable throwable){
		super(throwable);
		this.errMsg = errMsg;
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
