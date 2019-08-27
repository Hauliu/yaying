package cn.stylefeng.guns.modular.system.service;

import cn.stylefeng.guns.modular.base.state.PromotionFactory;
import cn.stylefeng.guns.modular.system.entity.LoginLog;
import cn.stylefeng.guns.modular.system.mapper.LoginLogMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 登录记录 服务实现类
 * </p>
 */
@Service
public class LoginLogService extends ServiceImpl<LoginLogMapper, LoginLog> {

    /**
     * 获取登录日志列表
     */
    @SuppressWarnings("rawtypes")
	public List<Map<String, Object>> getLoginLogs(Page page, String beginTime, String endTime, String logName) {
        return this.baseMapper.getLoginLogs(page, beginTime, endTime, logName);
    }

    public void saveLogin(Long memberId, String ip) {
        LoginLog loginLog=new LoginLog();
        loginLog.setCreateTime(new Date());
        loginLog.setIpAddress(ip);
        loginLog.setLogName("登录小程序");
        String msg="用户名："+PromotionFactory.me().getMemberNameById(memberId)+" 头像"+PromotionFactory.me().getMemberById(memberId).getHead();
        loginLog.setMessage(msg);
        loginLog.setSucceed("成功");
        loginLog.setUserId(memberId);
        this.baseMapper.saveAppLogin(loginLog);
    }
}
