package cn.stylefeng.guns.modular.meta_data.service;

import cn.stylefeng.guns.core.common.page.LayuiPageFactory;
import cn.stylefeng.guns.modular.meta_data.entity.QuartzTaskRecords;
import cn.stylefeng.guns.modular.meta_data.mapper.QuartzTaskRecordsMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class QuartzTaskRecordsService extends ServiceImpl<QuartzTaskRecordsMapper,QuartzTaskRecords> {
    public long addTaskRecords(QuartzTaskRecords quartzTaskRecords) {
        baseMapper.insert(quartzTaskRecords);
        return 1;
    }

    public Integer updateTaskRecords(QuartzTaskRecords quartzTaskRecords) {
        return baseMapper.updateByPrimaryKeySelective(quartzTaskRecords);
    }

    public List<QuartzTaskRecords> listTaskRecordsByTaskNo(String taskNo) {
        return baseMapper.getTaskRecordsByTaskNo(taskNo);
    }

    public Page<Map<String,Object>> selectByCondition(String condition) {
        Page page = LayuiPageFactory.defaultPage();
        return this.baseMapper.selectByCondition(page,condition);

    }

}
