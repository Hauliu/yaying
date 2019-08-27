package cn.stylefeng.guns.modular.app.service;

import cn.stylefeng.guns.modular.bulletin.entity.AppMember;
import cn.stylefeng.guns.modular.bulletin.mapper.AppMemberMapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import cn.stylefeng.guns.core.common.page.LayuiPageFactory;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;

import java.util.Map;

@Service
public class AppMemberService extends ServiceImpl<AppMemberMapper,AppMember> {
    /**
     * 查询用户信息
     */
    public Page<Map<String,Object>> selectByCondition(String condition,
                                                      String beginTime,
                                                      String endTime) {
        Page page = LayuiPageFactory.defaultPage();
        return this.baseMapper.selectByCondition(page,condition,beginTime,endTime);
    }

    /**
     * 删除用户信息
     */
    public void deleteAppMember(Long appMemberId) {
        AppMember config=this.baseMapper.selectById(appMemberId);
        //将删除标志设置为Y，表示删除
        config.setDelFlag("Y");
        this.baseMapper.updateById(config);
    }

    /**
     * 添加用户信息
     */
    public void addAppMember(AppMember appMember) {
        this.baseMapper.insert(appMember);
    }

    /**
     * 用户统计
     * @param condition 条件
     * @return Page
     */
    public Page<Map<String,Object>> selectByConditionSum(String condition) {
        Page page = LayuiPageFactory.defaultPage();
        return this.baseMapper.selectByConditionSum(page,condition);
    }
}
