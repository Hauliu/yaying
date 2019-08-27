package cn.stylefeng.guns.modular.meta_data.controller;

import cn.hutool.core.bean.BeanUtil;
import cn.stylefeng.guns.modular.meta_data.constant.factory.MetaDataFactory;
import cn.stylefeng.guns.modular.meta_data.entity.Config;
import cn.stylefeng.guns.modular.meta_data.model.ConfigDto;
import cn.stylefeng.guns.modular.meta_data.service.ConfigService;
import cn.stylefeng.guns.modular.meta_data.util.ResultUtil;
import cn.stylefeng.roses.core.base.controller.BaseController;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 定时任务控制器 -开放功能接口
 */
@Controller
@RequestMapping("/quartzApi")
public class QuartzApiController  extends BaseController {

    private static final Logger logger = LoggerFactory.getLogger(QuartzApiController.class);

    @Autowired
    private ConfigService configService;

//    @Autowired
//    private BulletinService bulletinService;


    /**
     * 详情
     */
    @RequestMapping(value = "/detail/{configId}")
    @ResponseBody
    public Object detail(@PathVariable("configId") Long configId) {
        logger.info("###### 详情 ######");
        Config config = configService.getById(configId);
        ConfigDto conditionDto = new ConfigDto();
        BeanUtil.copyProperties(config, conditionDto);
        return conditionDto;
    }

//    /**
//     * 判断公告是否到期，执行更新公告状态。
//     * @return
//     */
//    @RequestMapping(value = "/bulletin/checkEnd")
//    @ResponseBody
//    public String checkEnd()
//    {
//        Bulletin bulletin=new Bulletin();
//        bulletin.setStatus("PUBLISHED");
//
//        QueryWrapper<Bulletin> queryWrapper=new QueryWrapper(bulletin);
//
//        List<Bulletin> bulletinList=bulletinService.getBaseMapper().selectList(queryWrapper);
//
//        //获取公告持续天数
//        String days= MetaDataFactory.me().getValueByCode("BULLETIN_DAYS");
//        for (Bulletin b:bulletinList) {
//            //首先对结束日期，做判断，如果存在结束日期，则默认使用结束日期来处理公告结束时间
//            long endTime=b.getEndDate().getTime();
//            long currentTime=System.currentTimeMillis();
//
//            long publishTime=b.getPublishDate().getTime();
//            if(endTime!=0)
//            {
//               if(endTime<=currentTime)
//               {
//                   bulletinService.closeBulletin(b.getBulletinId());
//               }
//            }
//            //当超过天数
//             else if(currentTime-publishTime>=(24*3600*1000*Integer.parseInt(days)))
//            {
//                bulletinService.closeBulletin(b.getBulletinId());
//            }
//        }
//        return ResultUtil.success();
//    }


}
