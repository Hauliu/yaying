package cn.stylefeng.guns.modular.meta_data.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;

@TableName("sys_region")
@Data
public class Region implements Serializable {

    @TableId(value = "region_id")
    private Integer regionId;

    @TableField("name")
    private String name;

    @TableField("parent_id")
    private Integer parentId;
    @TableField("short_name")
    private String shortName;
    @TableField("level_type")
    private Integer levelType;
    @TableField("city_code")
    private String cityCode;
    @TableField("zip_code")
    private String zipCode;
    @TableField("merger_name")
    private String mergerName;
    @TableField("lng")
    private Float lng;
    @TableField("lat")
    private Float lat;
    @TableField("pinyin")
    private String pinyin;

}
