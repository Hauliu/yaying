package cn.stylefeng.guns.modular.bulletin.controller;

import cn.stylefeng.guns.modular.app.service.AppMemberService;
import cn.stylefeng.guns.modular.bulletin.constant.AppMemberMap;
import cn.stylefeng.guns.modular.bulletin.entity.AppCarousel;
import cn.stylefeng.guns.modular.bulletin.entity.AppMember;
import cn.stylefeng.guns.modular.bulletin.model.AppMemberDto;
import cn.stylefeng.guns.modular.bulletin.wrapper.AppMemberWrapper;
import cn.stylefeng.roses.core.base.controller.BaseController;
import cn.stylefeng.roses.core.reqres.response.ResponseData;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.validation.BindingResult;
import cn.hutool.core.bean.BeanUtil;
import cn.stylefeng.guns.core.common.page.LayuiPageFactory;
import cn.stylefeng.guns.core.common.annotion.BussinessLog;
import cn.stylefeng.guns.core.common.annotion.Permission;
import cn.stylefeng.guns.core.common.constant.Const;
import cn.stylefeng.guns.core.common.exception.BizExceptionEnum;
import cn.stylefeng.guns.core.common.page.LayuiPageFactory;
import cn.stylefeng.guns.core.log.LogObjectHolder;
import cn.stylefeng.roses.core.util.ToolUtil;
import cn.stylefeng.roses.kernel.model.exception.ServiceException;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import java.util.Map;

/**
 * 用户信息控制器
 *
 * @author yaying.liu
 * @Date 2019-08-13 09:23:15
 */
@Controller
@RequestMapping("/app_member")
public class AppMemberController extends BaseController {

    private String PREFIX = "/modular/bulletin/app_member/";

     @Autowired
     private AppMemberService app_memberService;

    /**
     * 跳转到用户信息首页
     */
    @RequestMapping("")
    public String index() {
        return PREFIX + "app_member.html";
    }

    /**
     * 跳转到添加用户信息
     */
    @RequestMapping("/app_member_add")
    public String app_memberAdd() {
        return PREFIX + "app_member_add.html";
    }

    /**
     * 跳转到修改用户信息
     */
    @RequestMapping("/app_member_edit")
    public String app_memberEdit(Long memberId, Model model) {
        AppMember condition = this.app_memberService.getById(memberId);
        model.addAllAttributes(BeanUtil.beanToMap(condition));
        LogObjectHolder.me().set(condition);
        return PREFIX + "app_member_edit.html";
    }

    /**
     * 用户信息详情
     */
    @RequestMapping(value = "/detail/{memberId}")
    @ResponseBody
    public Object detail(@PathVariable("memberId") Long app_memberId) {
        AppMember entity = app_memberService.getById(app_memberId);
        AppMemberDto conditionDto = new AppMemberDto();
        BeanUtil.copyProperties(entity, conditionDto);
        return conditionDto;
    }


    /**
     * 查询用户信息列表
     */
    @SuppressWarnings({"unchecked", "rawtypes"})
    @RequestMapping("/list")
    @ResponseBody
    public Object list(@RequestParam(required = false) String condition, @RequestParam(required = false) String timeLimit) {
        //拼接查询条件
        String beginTime = "";
        String endTime = "";

        if (ToolUtil.isNotEmpty(timeLimit)) {
            String[] split = timeLimit.split(" - ");
            beginTime = split[0];
            endTime = split[1];
        }
        //根据条件查询
        Page<Map<String, Object>> result = app_memberService.selectByCondition(condition,beginTime,endTime);
        Page wrapped = new AppMemberWrapper(result).wrap();
        return LayuiPageFactory.createPageInfo(wrapped);
    }

    /**
     * 编辑用户信息
     */
    @RequestMapping("/edit")
    @BussinessLog(value = "编辑参数", key = "memberId", dict = AppMemberMap.class)
    @ResponseBody
    public ResponseData edit(AppMember app_member) {
        app_memberService.updateById(app_member);
        return SUCCESS_TIP;
    }

    /**
     * 添加用户信息
     */
    @RequestMapping("/add")
    @BussinessLog(value = "添加用户信息", key = "name", dict = AppMemberMap.class)
    @ResponseBody
    public ResponseData add(AppMember app_member, BindingResult result) {
        if (result.hasErrors()) {
            throw new ServiceException(BizExceptionEnum.REQUEST_NULL);
        }
        if (app_member == null) {
            return ResponseData.error("参数不能为空");
        }
        this.app_memberService.addAppMember(app_member);
        return SUCCESS_TIP;
    }

    /**
     * 删除用户信息
     */
    @RequestMapping("/delete")
    @BussinessLog(value = "删除用户信息", key = "memberId", dict = AppMemberMap.class)
    @ResponseBody
    public ResponseData delete(@RequestParam Long memberId) {
        if (ToolUtil.isEmpty(memberId)) {
            throw new ServiceException(BizExceptionEnum.REQUEST_NULL);
        }
        this.app_memberService.deleteAppMember(memberId);
        return SUCCESS_TIP;
    }


    /**
     * 修改状态
     * @param status
     * @param memberId
     * @return
     */
    @RequestMapping("/status/{status}")
    @ResponseBody
    public ResponseData status(@PathVariable("status") String status,@RequestParam Long memberId) {
        AppMember entity = app_memberService.getById(memberId);
        entity.setStatus(status);
        app_memberService.updateById(entity);
        return SUCCESS_TIP;
    }

}