package cn.stylefeng.guns.modular.meta_data.mapper;

import cn.stylefeng.guns.modular.meta_data.entity.QuartzTaskInformations;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface QuartzTaskInformationsMapper extends BaseMapper<QuartzTaskInformations> {
    int deleteByPrimaryKey(Long id);

    int insert(QuartzTaskInformations record);

    int insertSelective(QuartzTaskInformations record);

    QuartzTaskInformations selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(QuartzTaskInformations record);

    int updateByPrimaryKey(QuartzTaskInformations record);

    List<QuartzTaskInformations> selectList(Map<String, Object> map);

    Integer selectByTaskNo(String taskNo);

    QuartzTaskInformations getTaskByTaskNo(String taskNo);

    List<QuartzTaskInformations> getUnfrozenTasks(String status);

    Page<Map<String,Object>> selectByCondition(@Param("page") Page page, @Param("condition") String condition);
}
