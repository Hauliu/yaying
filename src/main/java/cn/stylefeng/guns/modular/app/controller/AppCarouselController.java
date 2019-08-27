package cn.stylefeng.guns.modular.app.controller;


import cn.stylefeng.guns.modular.app.service.AppCarouselService;
import cn.stylefeng.guns.modular.base.util.Result;
import cn.stylefeng.roses.core.base.controller.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 轮播图接口
 */
@RestController
@RequestMapping("/running/v1/carousel")
public class AppCarouselController extends BaseController {


    @Autowired
    AppCarouselService appCarouselService;

    /**
     * 获取轮播图列表
     * @return
     */
    @RequestMapping("/list")
    public Result list(){
        return  appCarouselService.getList();
    }


    @RequestMapping("/detail")
    public Result detail(Long carouselId){
        return appCarouselService.detail(carouselId);
    }

}
