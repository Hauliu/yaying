package cn.stylefeng.guns.core.template;

import lombok.Data;

/**
 * 页面 模板生成的配置
 *
 * @author yaying.liu
 * @date 2019-08-10
 */
@Data
public class PageConfig {

    private ContextConfig contextConfig;

    private String pagePathTemplate;
    private String pageAddPathTemplate;
    private String pageEditPathTemplate;
    private String pageJsPathTemplate;
    private String pageInfoJsPathTemplate;
    private String pageAddJsPathTemplate;
    private String pageEditJsPathTemplate;

    public void init() {
        pagePathTemplate = "\\src\\main\\webapp\\WEB-INF\\view\\" + contextConfig.getModuleName() + "\\{}\\{}.html";
        pageAddPathTemplate = "\\src\\main\\webapp\\WEB-INF\\view\\" + contextConfig.getModuleName() + "\\{}\\{}_add.html";
        pageEditPathTemplate = "\\src\\main\\webapp\\WEB-INF\\view\\" + contextConfig.getModuleName() + "\\{}\\{}_edit.html";
        pageJsPathTemplate = "\\src\\main\\webapp\\assets\\modular\\" + contextConfig.getModuleName() + "\\{}\\{}.js";
        pageInfoJsPathTemplate = "\\src\\main\\webapp\\assets\\modular\\" + contextConfig.getModuleName() + "\\{}\\{}_info.js";
        pageAddJsPathTemplate = "\\src\\main\\webapp\\assets\\modular\\" + contextConfig.getModuleName() + "\\{}\\{}_add.js";
        pageEditJsPathTemplate = "\\src\\main\\webapp\\assets\\modular\\" + contextConfig.getModuleName() + "\\{}\\{}_edit.js";

    }

}