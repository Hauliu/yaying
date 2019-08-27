/**
 * 代码生成管理初始化
 */
layui.use(['layer', 'form', 'admin', 'ax'], function () {
    var $ = layui.jquery;
    var $ax = layui.ax;
    var form = layui.form;
    var admin = layui.admin;
    var layer = layui.layer;

    // 让当前iframe弹层高度适应
    admin.iframeAuto();

    // 表单提交事件
    form.on('submit(btnSubmit)', function (data) {
        var ajax = new $ax(Feng.ctxPath + "/code/generate", function (data) {
            Feng.success("添加成功！");

            //传给上个页面，刷新table用
            admin.putTempData('formOk', true);

            //关掉对话框
            admin.closeThisDialog();
        }, function (data) {
            Feng.error("添加失败！" + data.responseJSON.message)
        });
        ajax.set(data.field);
        ajax.start();
    });

    // var Code = {
    //
    // };
    //
    // /**
    //  * 提交代码生成
    //  */
    // Code.generate = function () {
    //     var baseAjax = Feng.baseAjax("/code/generate","生成代码");
    //     baseAjax.set("bizChName");
    //     baseAjax.set("bizEnName");
    //     baseAjax.set("path");
    //     baseAjax.set("moduleName");
    //     baseAjax.start();
    // };
});
