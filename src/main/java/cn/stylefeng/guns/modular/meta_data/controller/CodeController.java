package cn.stylefeng.guns.modular.meta_data.controller;

import cn.stylefeng.guns.core.common.annotion.Permission;
import cn.stylefeng.guns.core.common.constant.Const;
import cn.stylefeng.guns.core.common.exception.BizExceptionEnum;
import cn.stylefeng.guns.core.common.exception.BussinessException;
import cn.stylefeng.guns.core.template.ContextConfig;
import cn.stylefeng.guns.core.template.engine.SimpleTemplateEngine;
import cn.stylefeng.guns.core.template.engine.base.GunsTemplateEngine;
import cn.stylefeng.guns.modular.system.entity.LyyGen;
import cn.stylefeng.roses.core.base.controller.BaseController;

import cn.stylefeng.roses.core.util.ToolUtil;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 代码生成控制器
 *
 * @author yaying.liu
 * @Date 2019-08-08 00:03
 */
@Controller
@RequestMapping("/code")
public class CodeController extends BaseController {
    private String PREFIX = "/modular/system/code/";

    /**
     * 跳转到代码生成首页
     */
    @RequestMapping("")
    public String index() {
        return PREFIX + "code.html";
    }

    /**
     * 代码生成
     */
    @ApiOperation("生成代码")
    @RequestMapping(value = "/generate", method = RequestMethod.POST)
    @ResponseBody
    @Permission(Const.ADMIN_NAME)
    public Object add(LyyGen lyyGen) {
        String bizChName=lyyGen.getBizChName();
        String bizEnName=lyyGen.getBizEnName();
        String moduleName=lyyGen.getModuleName();
        String path=lyyGen.getPath();
        if (ToolUtil.isOneEmpty(bizChName, bizEnName)) {
            throw new BussinessException(BizExceptionEnum.REQUEST_NULL);
        }
        ContextConfig contextConfig = new ContextConfig();
        contextConfig.setBizChName(bizChName);
        contextConfig.setBizEnName(bizEnName);
        contextConfig.setModuleName(moduleName);
        if (ToolUtil.isNotEmpty(path)) {
            contextConfig.setProjectPath(path);
        }

        GunsTemplateEngine gunsTemplateEngine = new SimpleTemplateEngine();
        gunsTemplateEngine.setContextConfig(contextConfig);
        gunsTemplateEngine.start();

        return super.SUCCESS_TIP;
    }
}