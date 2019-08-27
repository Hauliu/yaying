package cn.stylefeng.guns.modular.base.state;

import cn.stylefeng.guns.modular.base.util.Result;
import cn.stylefeng.guns.modular.bulletin.entity.*;
import cn.stylefeng.guns.modular.bulletin.mapper.*;
import cn.stylefeng.guns.modular.meta_data.constant.ConfigMap;
import cn.stylefeng.guns.modular.meta_data.entity.Config;
import cn.stylefeng.guns.modular.meta_data.mapper.ConfigMapper;
import cn.stylefeng.roses.core.util.SpringContextHolder;
import cn.stylefeng.roses.core.util.ToolUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.springframework.context.annotation.DependsOn;
import org.springframework.stereotype.Component;

import javax.tools.Tool;
import java.util.List;

@Component
@DependsOn("springContextHolder")
public class PromotionFactory implements IPromotionFactory {


    public static PromotionFactory me() {
        return SpringContextHolder.getBean("promotionFactory");
    }





    private AppMemberMapper appMemberMapper = SpringContextHolder.getBean(AppMemberMapper.class);



    private ConfigMapper configMapper=SpringContextHolder.getBean(ConfigMapper.class);





    /**
     * 获取系统参数配置信息
     * @param code
     * @return
     */
    public String getSysConfigValueByCode(String code)
    {
        Config config=new Config();
        config.setCode(code);

        Config result=configMapper.selectOne(new QueryWrapper<>(config));
        if(result!=null)
        {
            return result.getValue();
        }
        return "";
    }


    /**
     * 根据id获取用户信息
     *
     * @param memberId
     * @return
     */
    public AppMember getMemberById(Long memberId) {
        return appMemberMapper.selectById(memberId);
    }

    /**
     * 根据id获取用户信息
     *
     * @param memberId
     * @return
     */
    public String getMemberNameById(Long memberId) {

        AppMember appMember = appMemberMapper.selectById(memberId);
        if (appMember == null) {
            return "";
        }
        return appMember.getName();

    }


}
