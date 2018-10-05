package com.jd.traffic.pay.payService.wechat.response;

public enum ResultCode {
    SUCCESS("SUCCESS"),FAIL("FAIL"), ;
    private String value;

    ResultCode(String value) {
        this.value = value;
    }

    public String getValue() {
        return value;
    }
}
