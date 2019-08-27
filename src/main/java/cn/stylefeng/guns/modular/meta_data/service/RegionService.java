package cn.stylefeng.guns.modular.meta_data.service;

import cn.stylefeng.guns.core.common.page.LayuiPageFactory;
import cn.stylefeng.guns.modular.meta_data.entity.Region;
import cn.stylefeng.guns.modular.meta_data.mapper.RegionMapper;
import cn.stylefeng.roses.core.reqres.response.ResponseData;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
public class RegionService extends ServiceImpl<RegionMapper,Region> {

    public ResponseData addRegion(Region condition) {
        return null;
    }

    public ResponseData deleteRegion(Long id) {
        return null;
    }
    public Page<Map<String,Object>> selectByCondition(String condition) {
        Page page = LayuiPageFactory.defaultPage();
        return this.baseMapper.selectByCondition(page,condition);
    }
}
