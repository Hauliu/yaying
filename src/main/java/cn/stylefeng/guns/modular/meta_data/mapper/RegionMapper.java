package cn.stylefeng.guns.modular.meta_data.mapper;

import cn.stylefeng.guns.modular.meta_data.entity.Region;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;

import java.util.Map;

public interface RegionMapper extends BaseMapper<Region> {

    Page<Map<String,Object>> selectByCondition(Page page, String condition);
}
