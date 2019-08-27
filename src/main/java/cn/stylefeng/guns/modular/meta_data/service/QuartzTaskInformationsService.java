package cn.stylefeng.guns.modular.meta_data.service;

import cn.stylefeng.guns.core.common.page.LayuiPageFactory;
import cn.stylefeng.guns.modular.meta_data.entity.QuartzTaskInformations;
import cn.stylefeng.guns.modular.meta_data.mapper.QuartzTaskInformationsMapper;
import cn.stylefeng.guns.modular.meta_data.util.ResultEnum;
import cn.stylefeng.guns.modular.meta_data.util.ResultUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class QuartzTaskInformationsService extends ServiceImpl<QuartzTaskInformationsMapper,QuartzTaskInformations> {

    public String insert(QuartzTaskInformations quartzTaskInformations) {
        String taskNo = quartzTaskInformations.getTaskno();
        quartzTaskInformations.setVersion(0);
        quartzTaskInformations.setCreatetime(System.currentTimeMillis());
        quartzTaskInformations.setLastmodifytime(System.currentTimeMillis());
        Integer count = baseMapper.selectByTaskNo(taskNo);
        //判断是否重复任务编号
        if (count > 0) {
            return ResultUtil.success(ResultEnum.TASKNO_EXIST.getCode(), ResultEnum.TASKNO_EXIST.getMessage());
        }
        int insert = baseMapper.insert(quartzTaskInformations);
        if (insert < 1) {
            return ResultUtil.success(ResultEnum.FAIL.getCode(), ResultEnum.FAIL.getMessage());
        }
        return ResultUtil.success(ResultEnum.SUCCESS.getCode(), ResultEnum.SUCCESS.getMessage());
    }


    public List<QuartzTaskInformations> selectList(String taskNo, String currentPage) {
        Map<String, Object> map = new HashMap<>();
        Integer start = Integer.parseInt(currentPage);
        map.put("taskNo", taskNo);
        map.put("startIndex", 10 * (start - 1));
        return baseMapper.selectList(map);
    }


    public QuartzTaskInformations getTaskById(String id) {
        return baseMapper.selectByPrimaryKey(Long.parseLong(id));
    }


    public String updateTask(QuartzTaskInformations quartzTaskInformations) {
        Integer count = baseMapper.selectByTaskNo(quartzTaskInformations.getTaskno());
        //判断是否重复任务编号
        if (count >= 2) {
            return ResultUtil.success(ResultEnum.TASKNO_EXIST.getCode(), ResultEnum.TASKNO_EXIST.getMessage());
        }
        //设置解冻时间或冻结时间及最后修改时间
        if (ResultEnum.FROZEN.name().equals(quartzTaskInformations.getFrozenstatus())) {
            quartzTaskInformations.setFrozentime(System.currentTimeMillis());
        } else if (ResultEnum.UNFROZEN.name().equals(quartzTaskInformations.getFrozenstatus())) {
            quartzTaskInformations.setUnfrozentime(System.currentTimeMillis());
        }
        quartzTaskInformations.setLastmodifytime(System.currentTimeMillis());
        int updateCount = baseMapper.updateByPrimaryKeySelective(quartzTaskInformations);
        //乐观锁控制并发修改
        if (updateCount < 1) {
            return ResultUtil.success(ResultEnum.UPDATE_FAIL.getCode(), ResultEnum.UPDATE_FAIL.getMessage());
        }
        return ResultUtil.success(ResultEnum.SUCCESS.getCode(), ResultEnum.SUCCESS.getMessage());
    }


    public QuartzTaskInformations getTaskByTaskNo(String taskNo) {
        return baseMapper.getTaskByTaskNo(taskNo);
    }


    public Integer updateStatusById(QuartzTaskInformations quartzTaskInformations) {
        return baseMapper.updateByPrimaryKeySelective(quartzTaskInformations);
    }


    public List<QuartzTaskInformations> getUnnfrozenTasks(String status) {
        return baseMapper.getUnfrozenTasks(status);
    }


    public Integer updateModifyTimeById(QuartzTaskInformations quartzTaskInformations) {
        return baseMapper.updateByPrimaryKeySelective(quartzTaskInformations);
    }

    public Page<Map<String,Object>> selectByCondition(String condition) {
        Page page = LayuiPageFactory.defaultPage();
        return this.baseMapper.selectByCondition(page,condition);

    }
}
