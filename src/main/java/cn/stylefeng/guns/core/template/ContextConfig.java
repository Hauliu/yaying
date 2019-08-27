package cn.stylefeng.guns.core.template;

import cn.stylefeng.guns.core.util.ToolUtilNew;


/**
 * 全局配置
 *
 * @author yaying.liu
 * @date 2019-08-10
 */
public class ContextConfig {

    private String projectPath = "D:\\ideaSpace\\lyy";//模板输出的项目目录
    private String bizChName;   //业务名称
    private String bizEnName;   //业务英文名称
    private String bizEnBigName;//业务英文名称(大写)
    private String moduleName = "system";  //模块名称

    private Boolean controllerSwitch = true;    //是否生成控制器代码开关
    private Boolean indexPageSwitch = true;     //主页
    private Boolean addPageSwitch = true;       //添加页面
    private Boolean editPageSwitch = true;      //编辑页面
    private Boolean jsSwitch = true;            //js
    private Boolean addJsSwitch = true;            //添加页面 js
    private Boolean editJsSwitch = true;            //编辑页面 js
    private Boolean infoJsSwitch = true;        //详情页面js
    private Boolean mapperSwitch = true;           //mapper
    private Boolean serviceSwitch = true;       //service
    private Boolean wrapperSwitch = true;       //wrapper
    private Boolean mapSwitch = true;       //mapSwitch

    public Boolean getAddJsSwitch() {
        return addJsSwitch;
    }

    public void setAddJsSwitch(Boolean addJsSwitch) {
        this.addJsSwitch = addJsSwitch;
    }

    public Boolean getEditJsSwitch() {
        return editJsSwitch;
    }

    public void setEditJsSwitch(Boolean editJsSwitch) {
        this.editJsSwitch = editJsSwitch;
    }

    public Boolean getWrapperSwitch() {
        return wrapperSwitch;
    }

    public void setWrapperSwitch(Boolean wrapperSwitch) {
        this.wrapperSwitch = wrapperSwitch;
    }

    public String getBizEnBigName() {
        return bizEnBigName;
    }

    public void setBizEnBigName(String bizEnBigName) {
        this.bizEnBigName = bizEnBigName;
    }

    public String getBizChName() {
        return bizChName;
    }

    public void setBizChName(String bizChName) {
        this.bizChName = bizChName;
    }

    public String getBizEnName() {
        return bizEnName;
    }

    public void setBizEnName(String bizEnName) {
        //判断是否存在下划线，如果存在，则根据下划线进行驼峰处理
        if(bizEnName.contains("_"))
        {
            String temp="";
            String[] arr=bizEnName.split("_");
            for(int i=0;i<arr.length;i++)
            {
                temp+=ToolUtilNew.firstLetterToUpper(arr[i]);
            }
            this.bizEnName=ToolUtilNew.firstLetterToLower(temp);
            this.bizEnBigName=temp;
        }
        else {
            this.bizEnName = bizEnName;
            this.bizEnBigName = ToolUtilNew.firstLetterToUpper(this.bizEnName);
        }
    }

    public String getProjectPath() {
        return projectPath;
    }

    public void setProjectPath(String projectPath) {
        this.projectPath = projectPath;
    }

    public String getModuleName() {
        return moduleName;
    }

    public void setModuleName(String moduleName) {
        this.moduleName = moduleName;
    }

    public Boolean getControllerSwitch() {
        return controllerSwitch;
    }

    public void setControllerSwitch(Boolean controllerSwitch) {
        this.controllerSwitch = controllerSwitch;
    }

    public Boolean getIndexPageSwitch() {
        return indexPageSwitch;
    }

    public void setIndexPageSwitch(Boolean indexPageSwitch) {
        this.indexPageSwitch = indexPageSwitch;
    }

    public Boolean getAddPageSwitch() {
        return addPageSwitch;
    }

    public void setAddPageSwitch(Boolean addPageSwitch) {
        this.addPageSwitch = addPageSwitch;
    }

    public Boolean getEditPageSwitch() {
        return editPageSwitch;
    }

    public void setEditPageSwitch(Boolean editPageSwitch) {
        this.editPageSwitch = editPageSwitch;
    }

    public Boolean getJsSwitch() {
        return jsSwitch;
    }

    public void setJsSwitch(Boolean jsSwitch) {
        this.jsSwitch = jsSwitch;
    }

    public Boolean getInfoJsSwitch() {
        return infoJsSwitch;
    }

    public void setInfoJsSwitch(Boolean infoJsSwitch) {
        this.infoJsSwitch = infoJsSwitch;
    }

    public Boolean getMapperSwitch() {
        return mapperSwitch;
    }

    public void setMapperSwitch(Boolean mapperSwitch) {
        this.mapperSwitch = mapperSwitch;
    }

    public Boolean getServiceSwitch() {
        return serviceSwitch;
    }

    public void setServiceSwitch(Boolean serviceSwitch) {
        this.serviceSwitch = serviceSwitch;
    }

    public Boolean getMapSwitch() {
        return mapSwitch;
    }

    public void setMapSwitch(Boolean mapSwitch) {
        this.mapSwitch = mapSwitch;
    }
}