package cn.stylefeng.guns.modular.bulletin.mapper;


import cn.stylefeng.guns.modular.bulletin.entity.AppMember;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.ibatis.annotations.Param;

import java.util.Map;

public interface AppMemberMapper extends BaseMapper<AppMember> {
    Page<Map<String, Object>> selectByCondition(@Param("page") Page page,
                                                @Param("condition") String condition,
                                                @Param("beginTime") String beginTime,
                                                @Param("endTime") String endTime);

    Page<Map<String, Object>> selectByConditionSum(@Param("page") Page page, @Param("condition") String condition);

}