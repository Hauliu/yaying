package cn.stylefeng.guns.modular.meta_data.controller;

import cn.hutool.core.bean.BeanUtil;
import cn.stylefeng.guns.core.common.annotion.BussinessLog;
import cn.stylefeng.guns.core.common.annotion.Permission;
import cn.stylefeng.guns.core.common.constant.factory.ConstantFactory;
import cn.stylefeng.guns.core.common.exception.BizExceptionEnum;
import cn.stylefeng.guns.core.common.page.LayuiPageFactory;
import cn.stylefeng.guns.core.log.LogObjectHolder;

import cn.stylefeng.guns.modular.bulletin.model.JsonResult;
import cn.stylefeng.guns.modular.meta_data.constant.RegionMap;
import cn.stylefeng.guns.modular.meta_data.entity.Region;
import cn.stylefeng.guns.modular.meta_data.model.RegionDto;
import cn.stylefeng.guns.modular.meta_data.service.RegionService;
import cn.stylefeng.guns.modular.meta_data.wrapper.RegionWrapper;
import cn.stylefeng.roses.core.base.controller.BaseController;
import cn.stylefeng.roses.core.reqres.response.ResponseData;
import cn.stylefeng.roses.core.util.ToolUtil;
import cn.stylefeng.roses.kernel.model.exception.ServiceException;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/commonApi/region")
public class RegionController extends BaseController {
    private static String PREFIX = "/modular/promotion/region/";
    /**
     * 字典 PK id
     */
    final String keyId = "regionId";


    @Autowired
    private RegionService baseService;

    /**
     * 跳转到管理的首页
     */
    @RequestMapping("")
    public String index() {
        return PREFIX + "region.html";
    }


    /**
     * 跳转到添加
     */
    @RequestMapping("/region_add")
    public String stepAdd() {
        return PREFIX + "region_add.html";
    }

    /**
     * 跳转到详情
     */
    @RequestMapping("/region_detail")
    public String stepDetail() {
        return PREFIX + "region_detail.html";
    }

    /**
     * 跳转到修改
     */
    @RequestMapping("/region_edit")
    public String stepEdit(@RequestParam("regionId") Long id, Model model) {

        Region condition = this.baseService.getById(id);
        model.addAllAttributes(BeanUtil.beanToMap(condition));
        LogObjectHolder.me().set(condition);
        return PREFIX + "region_edit.html";
    }

    /**
     * 跳转到审核
     */
    @RequestMapping("/region_option")
    public String stepOption(@RequestParam("regionId") Long id, Model model) {

        Region condition = this.baseService.getById(id);
        model.addAllAttributes(BeanUtil.beanToMap(condition));
        LogObjectHolder.me().set(condition);
        return PREFIX + "region_option.html";
    }

    /**
     * 详情
     */
    @RequestMapping(value = "/detail/{regionId}")
    @ResponseBody
    public Object detail(@PathVariable("regionId") Long id) {
        Region region = baseService.getById(id);
        RegionDto conditionDto = new RegionDto();
//        conditionDto.setBusinessStatusValue(ConstantFactory.me().getDictsByName("店铺营业状态",region.getBusinessStatus()));
        BeanUtil.copyProperties(region, conditionDto);
        return conditionDto;
    }

    /**
     * 查询列表
     */
    @SuppressWarnings({"unchecked", "rawtypes"})
    @RequestMapping("/list")
    @ResponseBody
    public Object list(@RequestParam(required = false) String condition) {
        //根据条件查询
        Page<Map<String, Object>> result = baseService.selectByCondition(condition);
        Page wrapped = new RegionWrapper(result).wrap();
        return LayuiPageFactory.createPageInfo(wrapped);
    }

    /**
     * 查询列表
     */

    @SuppressWarnings({"unchecked", "rawtypes"})
    @RequestMapping("/apiList")
    @ResponseBody
    public JsonResult apiList(@RequestParam(required = false) String condition) {
        List<Region> list=baseService.list(null);
        JsonResult result = new JsonResult();
        result.setCode(200);
        result.setData(list);
        return result;
    }


    /**
     * 编辑
     */
    @RequestMapping("/edit")
    @BussinessLog(value = "编辑", key = keyId, dict = RegionMap.class)
    @Permission
    @ResponseBody
    public ResponseData edit(Region condition) {
        baseService.updateById(condition);
        return SUCCESS_TIP;
    }

    /**
     * 添加
     */
    @RequestMapping("/add")
    @BussinessLog(value = "添加", key = keyId, dict = RegionMap.class)
    @Permission
    @ResponseBody
    public ResponseData add(Region condition, BindingResult result) {
        if (result.hasErrors()) {
            throw new ServiceException(BizExceptionEnum.REQUEST_NULL);
        }
        if (condition == null) {
            return ResponseData.error("参数不能为空");
        }
        return this.baseService.addRegion(condition);
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @BussinessLog(value = "删除", key = keyId, dict = RegionMap.class)
    @Permission
    @ResponseBody
    public ResponseData delete(@RequestParam("regionId") Long id) {
        if (ToolUtil.isEmpty(id)) {
            throw new ServiceException(BizExceptionEnum.REQUEST_NULL);
        }
        return this.baseService.deleteRegion(id);
    }


}