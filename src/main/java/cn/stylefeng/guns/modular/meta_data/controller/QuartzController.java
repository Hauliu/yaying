package cn.stylefeng.guns.modular.meta_data.controller;

import cn.hutool.core.bean.BeanUtil;
import cn.stylefeng.guns.core.common.annotion.Permission;
import cn.stylefeng.guns.core.common.page.LayuiPageFactory;
import cn.stylefeng.guns.core.log.LogObjectHolder;
import cn.stylefeng.guns.core.shiro.ShiroKit;
import cn.stylefeng.guns.modular.meta_data.entity.QuartzTaskErrors;
import cn.stylefeng.guns.modular.meta_data.entity.QuartzTaskInformations;
import cn.stylefeng.guns.modular.meta_data.entity.QuartzTaskRecords;
import cn.stylefeng.guns.modular.meta_data.model.QuartzTaskErrorsDto;
import cn.stylefeng.guns.modular.meta_data.model.QuartzTaskInformationsDto;
import cn.stylefeng.guns.modular.meta_data.model.QuartzTaskRecordsVo;
import cn.stylefeng.guns.modular.meta_data.service.QuartzService;
import cn.stylefeng.guns.modular.meta_data.service.QuartzTaskErrorsService;
import cn.stylefeng.guns.modular.meta_data.service.QuartzTaskInformationsService;
import cn.stylefeng.guns.modular.meta_data.service.QuartzTaskRecordsService;
import cn.stylefeng.guns.modular.meta_data.util.ResultEnum;
import cn.stylefeng.guns.modular.meta_data.util.ResultUtil;
import cn.stylefeng.guns.modular.meta_data.wrapper.QuartzTaskInformationsWrappeer;
import cn.stylefeng.guns.modular.meta_data.wrapper.QuartzTaskRecordsWrappeer;
import cn.stylefeng.roses.core.base.controller.BaseController;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @ClassName QuartzController
 * @Description quartz controller主要逻辑
 */
@Controller
@RequestMapping(value = {"/quartz","/task"})
public class QuartzController extends BaseController {


    private static final Logger logger = LoggerFactory.getLogger(QuartzController.class);

    private static String PREFIX_INFORMATIONS = "/modular/meta_data/quartz/informations/";
    private static String PREFIX_RECORDS = "/modular/meta_data/quartz/records/";

    @Autowired
    private QuartzService quartzService;
    @Autowired
    private QuartzTaskInformationsService quartzTaskInformationsService;

    @Autowired
    private QuartzTaskErrorsService quartzTaskErrorsService;

    @Autowired
    private QuartzTaskRecordsService quartzTaskRecordsService;


    /**
     * 跳转到信息管理的首页
     */
    @RequestMapping("/info")
    public String index_info() {
        return PREFIX_INFORMATIONS + "informations.html";
    }

    /**
     * 跳转到添加
     */
    @RequestMapping("/info_add")
    public String informationsAdd() {
        return PREFIX_INFORMATIONS + "informations_add.html";
    }

    /**
     * 跳转到修改
     */
    @RequestMapping("/info_edit")
    public String informationsEdit(Long Id, Model model) {
        QuartzTaskInformations condition = quartzTaskInformationsService.getById(Id);
        model.addAllAttributes(BeanUtil.beanToMap(condition));
        LogObjectHolder.me().set(condition);
        return PREFIX_INFORMATIONS+"informations_edit.html";
    }


    /**
     * 查询任务列表
     */
    @SuppressWarnings({"unchecked", "rawtypes"})
    @RequestMapping("/info/list")
    @Permission
    @ResponseBody
    public Object info_list(@RequestParam(required = false) String condition) {

        //根据条件查询
        Page<Map<String, Object>> result = quartzTaskInformationsService.selectByCondition(condition);
        Page wrapped = new QuartzTaskInformationsWrappeer(result).wrap();
        return LayuiPageFactory.createPageInfo(wrapped);
    }

    /**
     * 立即运行一次定时任务
     *
     * @param taskNo
     * @param model
     * @return
     */
    @ResponseBody
    @Permission
    @RequestMapping(value = "/info/start_now",method = {RequestMethod.GET,RequestMethod.POST})
    public String infoStartNow(@RequestParam(value = "taskNo", required = false) String taskNo, Model model) {
        logger.info("---任务编号 taskNo={} 立即执行 ",taskNo);
        try {
            if (StringUtils.isEmpty(taskNo)) {
                return ResultUtil.success(ResultEnum.PARAM_EMPTY.getCode(), ResultEnum.PARAM_EMPTY.getMessage());
            }
            return quartzService.runTaskRightNow(taskNo);
        } catch (Exception e) {
            logger.error("");
            return ResultUtil.success(ResultEnum.FAIL.getCode(), ResultEnum.FAIL.getMessage());
        }
    }

    /**
     * 启动 或者 暂定定时任务
     *
     * @param taskNo
     * @return
     */
    @ResponseBody
    @Permission
    @RequestMapping(value = "/info/option_task", method = {RequestMethod.GET,RequestMethod.POST})
    public String optionTask(String taskNo) {
        logger.info("启动 或者 暂定定时任务");
        if (StringUtils.isEmpty(taskNo)) {
            return ResultUtil.success(ResultEnum.PARAM_EMPTY.getCode(), ResultEnum.PARAM_EMPTY.getMessage());
        }
        try {
            return quartzService.startJob(taskNo);
        } catch (Exception e) {
            logger.error("/list/optionjob exception={}", e);
            return ResultUtil.fail();
        }
    }

    /**
     * 详情
     */
    @RequestMapping(value = "/info/detail/{id}")
    @Permission
    @ResponseBody
    public Object detail(@PathVariable("id") Long id) {
        QuartzTaskInformations condition = quartzTaskInformationsService.getById(id);
        QuartzTaskInformationsDto conditionDto = new QuartzTaskInformationsDto();
        BeanUtil.copyProperties(condition, conditionDto);
        return conditionDto;
    }

    /**
     * 任务添加
     * @param taskInformations
     * @return
     */
    @ResponseBody
    @Permission
    @RequestMapping(value = "/info/add", method = RequestMethod.POST)
    public String infoAdd(QuartzTaskInformations taskInformations) {
        //默认为冻结状态
        taskInformations.setFrozenstatus(ResultEnum.FROZEN.getMessage());
        taskInformations.setVersion(1);
        taskInformations.setExecutorno(ShiroKit.getUser().getId().toString());
        taskInformations.setTimekey("yyyy-MM-dd HH:mm:ss");
        try {
            String result = quartzTaskInformationsService.insert(taskInformations);
            return result;
        } catch (Exception e) {
            logger.error("/add/task exception={}", e);
            return ResultUtil.fail();
        }
    }

    /**
     * 任务编辑
     * @param taskInformations
     * @return
     */
    @ResponseBody
    @Permission
    @RequestMapping(value = "/info/edit", method = RequestMethod.POST)
    public String infoEdit(QuartzTaskInformations taskInformations) {
        QuartzTaskInformations condition=quartzTaskInformationsService.getById(taskInformations.getId());
        if(condition==null)
        {
            return ResultUtil.fail();
        }
        try {
            condition.setTaskno(taskInformations.getTaskno());
            condition.setTaskname(taskInformations.getTaskname());
            condition.setExecuteparamter(taskInformations.getExecuteparamter());
            condition.setSchedulerrule(taskInformations.getSchedulerrule());
            condition.setSendtype(taskInformations.getSendtype());
            condition.setUrl(taskInformations.getUrl());
            String result = quartzTaskInformationsService.updateTask(condition);
            return result;
        } catch (Exception e) {
            logger.error("/edit/task exception={}", e);
            return ResultUtil.fail();
        }
    }

    /**
     * 跳转到执行详情管理的首页
     */
    @RequestMapping("/record")
    public String index_record() {
        return PREFIX_RECORDS + "records.html";
    }

    /**
     * 跳转到执行详情管理的首页
     */
    @RequestMapping("/record/records_detail")
    public String record_detail() {
        return PREFIX_RECORDS + "records_detail.html";
    }

    /**
     * 查询列表
     */
    @SuppressWarnings({"unchecked", "rawtypes"})
    @RequestMapping("/record/list")
    @Permission
    @ResponseBody
    public Object record_list(@RequestParam(required = false) String condition) {

        //根据条件查询
        Page<Map<String, Object>> result = quartzTaskRecordsService.selectByCondition(condition);
        Page wrapped = new QuartzTaskRecordsWrappeer(result).wrap();
        return LayuiPageFactory.createPageInfo(wrapped);
    }

    /**
     * 出错时 错误详情
     */
    @RequestMapping(value = "/record/detail/{id}")
    @Permission
    @ResponseBody
    public Object errorDetail(@PathVariable("id") Long id) {
        QuartzTaskErrors quartzTaskErrors=new QuartzTaskErrors();
        quartzTaskErrors.setTaskexecuterecordid(id.toString());
        QueryWrapper<QuartzTaskErrors> queryWrapper=new QueryWrapper<>(quartzTaskErrors);
        QuartzTaskErrors condition = quartzTaskErrorsService.getOne(queryWrapper);
        QuartzTaskErrorsDto conditionDto = new QuartzTaskErrorsDto();
        BeanUtil.copyProperties(condition, conditionDto);
        return conditionDto;
    }

    @RequestMapping(value = "/add/taskpage", method = RequestMethod.GET)
    public String addTaskpage() {
        return "addtask";
    }

    @ResponseBody
    @RequestMapping(value = "/add/task", method = RequestMethod.POST)
    public String addTask(QuartzTaskInformations taskInformations) {
        try {
            String result = quartzTaskInformationsService.insert(taskInformations);
            return result;
        } catch (Exception e) {
            logger.error("/add/task exception={}", e);
            return ResultUtil.fail();
        }
    }

    @RequestMapping(value = "/edit/taskpage", method = RequestMethod.GET)
    public String editTaskpage(Model model, String id) {
        QuartzTaskInformations taskInformation = quartzTaskInformationsService.getTaskById(id);
        model.addAttribute("taskInformation", taskInformation);
        return "updatetask";
    }

    @ResponseBody
    @RequestMapping(value = "/edit/task", method = RequestMethod.POST)
    public String editTask(QuartzTaskInformations taskInformations) {
        try {
            String result = quartzTaskInformationsService.updateTask(taskInformations);
            return result;
        } catch (Exception e) {
            logger.error("/edit/task exception={}", e);
            return ResultUtil.fail();
        }
    }

    /**
     * 启动 或者 暂定定时任务
     *
     * @param taskNo
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/list/optionjob", method = RequestMethod.GET)
    public String optionJob(String taskNo) {
        logger.info("启动 或者 暂定定时任务");
        if (StringUtils.isEmpty(taskNo)) {
            return ResultUtil.success(ResultEnum.PARAM_EMPTY.getCode(), ResultEnum.PARAM_EMPTY.getMessage());
        }
        try {
            return quartzService.startJob(taskNo);
        } catch (Exception e) {
            logger.error("/list/optionjob exception={}", e);
            return ResultUtil.fail();
        }
    }

    /**
     * 定时任务执行情况
     *
     * @param taskNo
     * @param model
     * @return
     */
    @RequestMapping(value = "/taskrecords", method = RequestMethod.GET)
    public String taskRecordsPage(@RequestParam(value = "taskno", required = false) String taskNo, Model model) {
        logger.info("");
        try {
            if (StringUtils.isEmpty(taskNo)) {
                return "redirect:/";
            }
            List<QuartzTaskRecords> quartzTaskRecords = quartzTaskRecordsService.listTaskRecordsByTaskNo(taskNo);
            QuartzTaskRecordsVo recordsVo = null;
            List<QuartzTaskRecordsVo> voList = new ArrayList<>();
            for (QuartzTaskRecords quartzTaskRecord : quartzTaskRecords) {
                recordsVo = new QuartzTaskRecordsVo();
                BeanUtils.copyProperties(quartzTaskRecord, recordsVo);
                recordsVo.setTime(quartzTaskRecord.getLastmodifytime() - quartzTaskRecord.getCreatetime());
                voList.add(recordsVo);
            }
            model.addAttribute("quartzTaskRecords", voList);
        } catch (Exception e) {
            logger.error("");
            return "redirect:/";
        }
        return "/taskrecords";
    }

    /**
     * 立即运行一次定时任务
     *
     * @param taskNo
     * @param model
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/runtask/rightnow", method = RequestMethod.GET)
    public String runTaskRightNow(@RequestParam(value = "taskNo", required = false) String taskNo, Model model) {
        logger.info("");
        try {
            if (StringUtils.isEmpty(taskNo)) {
                return ResultUtil.success(ResultEnum.PARAM_EMPTY.getCode(), ResultEnum.PARAM_EMPTY.getMessage());
            }
            return quartzService.runTaskRightNow(taskNo);
        } catch (Exception e) {
            logger.error("");
            return ResultUtil.success(ResultEnum.FAIL.getCode(), ResultEnum.FAIL.getMessage());
        }
    }

    /**
     * 定时任务失败详情
     *
     * @param recordId
     * @param model
     * @return
     */
    @RequestMapping(value = "/task/errors", method = RequestMethod.GET)
    public String detailTaskErrors(@RequestParam(value = "recordid", required = false) String recordId, Model model) {
        logger.info("失败详情");
        try {
            if (StringUtils.isEmpty(recordId)) {
                return ResultUtil.success(ResultEnum.PARAM_EMPTY.getCode(), ResultEnum.PARAM_EMPTY.getMessage());
            }
            QuartzTaskErrors taskErrors = quartzService.detailTaskErrors(recordId);
            model.addAttribute("taskErrors", taskErrors);
            return "taskerrors";
        } catch (Exception e) {
            logger.error("");
            return "redirect:/";
        }
    }


}