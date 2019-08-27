package cn.stylefeng.guns.modular.base.state;

/**
 * 广告推广枚举
 */
public enum  PromotionEnum {
    /**
     * 会员等级枚举
     */
    NONE("NONE","非会员"),NORMAL("NORMAL", "普通会员"), VIP("VIP", "高级会员"), SUPER("SUPER", "超级会员");


    String code;
    String message;

    PromotionEnum(String code, String message) {
        this.code = code;
        this.message = message;
    }

    public static String getDescription(String value) {
        if (value == null) {
            return "";
        } else {
            for (PromotionEnum ms : PromotionEnum.values()) {
                if (ms.getCode().equals(value)) {
                    return ms.getMessage();
                }
            }
            return "";
        }
    }

    public String getCode() {
        return code;
    }

    public String getMessage() {
        return message;
    }





}
