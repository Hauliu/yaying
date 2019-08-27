package cn.stylefeng.guns.modular.app.controller;


import cn.stylefeng.guns.modular.app.service.PersonalService;
import cn.stylefeng.guns.modular.base.util.Result;
import cn.stylefeng.roses.core.base.controller.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 用户个人中心模块控制器
 */
@RestController
@RequestMapping("/running/personal")
public class PersonalController extends BaseController {

    @Autowired
    PersonalService personalService;

    /**
     * 联系客服
     */
    @RequestMapping("/contact")
    public Result contact()
    {
        return  personalService.contact();
    }


    /**
     * 业务文章
     * @param articleType
     * @return
     */
    @RequestMapping("/article")
    public Result article(String articleType)
    {
        return personalService.getArticle(articleType);
    }


}
