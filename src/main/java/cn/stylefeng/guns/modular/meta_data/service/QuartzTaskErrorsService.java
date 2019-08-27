package cn.stylefeng.guns.modular.meta_data.service;

import cn.stylefeng.guns.modular.meta_data.entity.QuartzTaskErrors;
import cn.stylefeng.guns.modular.meta_data.mapper.QuartzTaskErrorsMapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

@Service
public class QuartzTaskErrorsService extends ServiceImpl<QuartzTaskErrorsMapper,QuartzTaskErrors> {


    public Integer addTaskErrorRecord(QuartzTaskErrors quartzTaskErrors) {
        return baseMapper.insert(quartzTaskErrors);
        }

    public QuartzTaskErrors detailTaskErrors(String recordId) {
        return baseMapper.detailTaskErrors(recordId);
        }
}
