package cn.stylefeng.guns.modular.app.controller.pay;

public class WechatConfig {
    //小程序appid  开发者自己拥有的
    public static final String appid = "";
    //微信支付的商户id   开发者去问自己id的前端同事或者领导。
    public static final String mch_id = "";
    //微信支付的商户密钥  开发者问领导，去微信商户平台去申请（要下插件等等）
    public static final String key = "";
    //支付成功后的服务器回调url，这里填PayController里的回调函数地址
    public static final String notify_url = "";
    //签名方式，固定值
    public static final String SIGNTYPE = "MD5";
    //交易类型，小程序支付的固定值为JSAPI
    public static final String TRADETYPE = "JSAPI";
    //微信统一下单接口地址
    public static final String pay_url = "https://api.mch.weixin.qq.com/pay/unifiedorder";

}
