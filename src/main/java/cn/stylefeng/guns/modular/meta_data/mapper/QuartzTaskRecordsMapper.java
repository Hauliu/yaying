package cn.stylefeng.guns.modular.meta_data.mapper;

import cn.stylefeng.guns.modular.meta_data.entity.QuartzTaskRecords;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface QuartzTaskRecordsMapper extends BaseMapper<QuartzTaskRecords> {
    int deleteByPrimaryKey(Long id);
    int insertSelective(QuartzTaskRecords record);

    QuartzTaskRecords selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(QuartzTaskRecords record);

    int updateByPrimaryKey(QuartzTaskRecords record);

    List<QuartzTaskRecords> getTaskRecordsByTaskNo(String taskNo);

    Page<Map<String,Object>> selectByCondition(@Param("page") Page page, @Param("condition") String condition);
}
