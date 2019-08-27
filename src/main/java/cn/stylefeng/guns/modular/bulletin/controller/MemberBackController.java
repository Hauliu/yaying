package cn.stylefeng.guns.modular.bulletin.controller;


import cn.stylefeng.guns.modular.app.service.AppMemberService;
import cn.stylefeng.guns.modular.bulletin.constant.AppMemberMap;
import cn.stylefeng.guns.modular.bulletin.entity.AppMember;
import cn.stylefeng.guns.modular.bulletin.model.AppMemberDto;
import cn.stylefeng.guns.modular.bulletin.wrapper.AppMemberWrapper;
import cn.stylefeng.roses.core.base.controller.BaseController;
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

import cn.stylefeng.roses.core.reqres.response.ResponseData;

/**
 * 用户统计控制器
 *
 * @author yaying.liu
 * @Date 2019-08-13 22:49:29
 */
@Controller
@RequestMapping("/member")
public class MemberBackController extends BaseController {

    private String PREFIX = "/modular/bulletin/member/";

    @Autowired
    private AppMemberService memberService;

    /**
     * 跳转到用户统计首页
     */
    @RequestMapping("")
    public String index() {
        return PREFIX + "member.html";
    }

    /**
     * 跳转到添加用户统计
     */
    @RequestMapping("/member_add")
    public String memberAdd() {
        return PREFIX + "member_add.html";
    }

    /**
     * 跳转到修改用户统计
     */
    @RequestMapping("/member_edit")
    public String memberEdit(Long memberId, Model model) {
        AppMember condition = this.memberService.getById(memberId);
        model.addAllAttributes(BeanUtil.beanToMap(condition));
        LogObjectHolder.me().set(condition);
        return PREFIX + "member_edit.html";
    }

    /**
     * 用户统计详情
     */
    @RequestMapping(value = "/detail/{memberId}")
    @ResponseBody
    public Object detail(@PathVariable("memberId") Long memberId) {
        AppMember entity = memberService.getById(memberId);
        AppMemberDto conditionDto = new AppMemberDto();
        BeanUtil.copyProperties(entity, conditionDto);
        return conditionDto;
    }


    /**
     * 查询用户统计列表
     */
    @SuppressWarnings({"unchecked", "rawtypes"})
    @RequestMapping("/list")
    @ResponseBody
    public Object list(@RequestParam(required = false) String condition) {
        //根据条件查询
        Page<Map<String, Object>> result = memberService.selectByConditionSum(condition);
        Page wrapped = new AppMemberWrapper(result).wrap();
        return LayuiPageFactory.createPageInfo(wrapped);
    }

    /**
     * 编辑用户统计
     */
    @RequestMapping("/edit")
    @BussinessLog(value = "编辑参数", key = " memberId", dict = AppMemberMap.class)
    @ResponseBody
    public ResponseData edit(AppMember member) {
        memberService.updateById(member);
        return SUCCESS_TIP;
    }

    /**
     * 添加用户统计
     */
    @RequestMapping("/add")
//    @BussinessLog(value = "添加用户统计", key = "name", dict = AppMemberMap.class)
    @ResponseBody
    public ResponseData add(AppMember member, BindingResult result) {
        if (result.hasErrors()) {
            throw new ServiceException(BizExceptionEnum.REQUEST_NULL);
        }
        if (member == null) {
            return ResponseData.error("参数不能为空");
        }
//        this.memberService.addMember(member);
        return SUCCESS_TIP;
    }

    /**
     * 删除用户统计
     */
    @RequestMapping("/delete")
    @BussinessLog(value = "删除用户统计", key = "memberId", dict = AppMemberMap.class)
    @ResponseBody
    public ResponseData delete(@RequestParam Long memberId) {
        if (ToolUtil.isEmpty(memberId)) {
            throw new ServiceException(BizExceptionEnum.REQUEST_NULL);
        }
//        this.memberService.deleteMember(memberId);
        return SUCCESS_TIP;
    }

}