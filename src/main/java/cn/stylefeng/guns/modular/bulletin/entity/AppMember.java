package cn.stylefeng.guns.modular.bulletin.entity;

import cn.stylefeng.guns.modular.base.entity.BaseEntity;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.ToString;

import java.util.Date;

@TableName("app_member")
@Data
@ToString
public class AppMember extends BaseEntity {

    @TableId(value = "member_id", type = IdType.AUTO)
    private Long memberId;

    @TableField("openid")
    private  String openid;

    @TableField("head")
    private String head;

    @TableField("account")
    private String account;

    @TableField("password")
    private String password;

    @TableField("salt")
    private String salt;

    @TableField("name")
    private String name;
    @TableField("birthday")
    private Date birthday;
    @TableField("sex")
    private String sex;
    @TableField("email")
    private String email;
    @TableField("phone")
    private String phone;

    @TableField("country")
    private String country;

    @TableField("province")
    private String province;

    @TableField("city")
    private String city;

    @TableField("language")
    private String language;




    @TableField("level")
    private String level;
    @TableField("register_time")
    private Date registerTime;

    @TableField("last_login")
    private Date lastLogin;

    @TableField("status")
    private String status;
    @TableField("del_flag")
    private String delFlag;
    @TableField("remark")
    private String remark;


}
