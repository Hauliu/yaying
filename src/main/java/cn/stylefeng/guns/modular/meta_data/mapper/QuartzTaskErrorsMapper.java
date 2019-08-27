package cn.stylefeng.guns.modular.meta_data.mapper;

import cn.stylefeng.guns.modular.meta_data.entity.QuartzTaskErrors;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

public interface QuartzTaskErrorsMapper extends BaseMapper<QuartzTaskErrors> {
    int deleteByPrimaryKey(Long id);

    int insert(QuartzTaskErrors record);

    int insertSelective(QuartzTaskErrors record);

    QuartzTaskErrors selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(QuartzTaskErrors record);

    int updateByPrimaryKeyWithBLOBs(QuartzTaskErrors record);

    int updateByPrimaryKey(QuartzTaskErrors record);

    QuartzTaskErrors detailTaskErrors(String recordId);

}
