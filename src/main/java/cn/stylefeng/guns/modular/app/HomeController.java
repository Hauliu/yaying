package cn.stylefeng.guns.modular.app;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import cn.stylefeng.guns.modular.app.service.AppMemberService;
import cn.stylefeng.guns.modular.base.state.Constant;
import cn.stylefeng.guns.modular.base.state.PromotionFactory;
import cn.stylefeng.guns.modular.base.util.RedisUtil;
import cn.stylefeng.guns.modular.base.util.Result;
import cn.stylefeng.guns.modular.base.util.UrlUtil;
import cn.stylefeng.guns.modular.bulletin.entity.AppMember;
import cn.stylefeng.guns.modular.meta_data.constant.factory.MetaDataFactory;
import cn.stylefeng.guns.modular.system.service.LoginLogService;
import cn.stylefeng.roses.core.util.ToolUtil;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.UnsupportedEncodingException;
import java.security.AlgorithmParameters;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.NoSuchProviderException;
import java.security.Security;
import java.security.spec.InvalidParameterSpecException;
import java.util.Arrays;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;


import org.bouncycastle.jce.provider.BouncyCastleProvider;
import org.codehaus.xfire.util.Base64;


@Controller
@RequestMapping(value = "/running")
public class HomeController {



    @Autowired
    RedisUtil redisUtil;

    @Autowired
    AppMemberService appMemberService;


    @Autowired
    LoginLogService loginLogService;
//
//    @RequestMapping(value = "/login", method = RequestMethod.POST)
//    @ResponseBody
//    public Result login(AppMember member) {
//        AppMember appMember = new AppMember();
//        if (member == null) {
//            return Result.fail(404, "登录用户数据为空");
//        }
//
//        if (StringUtils.isNotBlank(member.getAccount())) {
//            appMember.setAccount(member.getAccount());
//        }
//        if (StringUtils.isNotBlank(member.getPhone())) {
//            appMember.setPhone(member.getPhone());
//        }
//        if (StringUtils.isNotBlank(member.getEmail())) {
//            appMember.setEmail(member.getEmail());
//        }
//        if (StringUtils.isBlank(member.getAccount()) && StringUtils.isBlank(member.getPhone()) && StringUtils.isBlank(member.getEmail())) {
//            return Result.fail(500, "错误,请查看是否存在微信号、电话号、QQ邮箱等");
//        }
//        QueryWrapper<AppMember> queryWrapper = new QueryWrapper(appMember);
//        AppMember newMember = appMemberService.getOne(queryWrapper);
//        String token = UUID.randomUUID().toString().replaceAll("-", "");
//
//        if (newMember != null) {
//            //更新最近一次登录
//            newMember.setLastLogin(new Date());
//            newMember.setUpdateUser(newMember.getMemberId());
//            appMemberService.updateById(newMember);
//            redisUtil.set(token, newMember.getMemberId() + "", Constant.SAVEUSERTIME);//30分钟
//        } else { //为空的话注册用户
//            appMember.setHead(member.getHead());
//            appMember.setName(member.getName());
//            appMember.setOpenid(member.getOpenid());
//            appMember.setCreateUser(-1L);
//
//            //更新最近一次登录
//            appMember.setLastLogin(new Date());
//            //授权日期
//            appMember.setRegisterTime(new Date());
//
//            //注册前再验证是否存在重复现象
//            if (StringUtils.isNotBlank(appMember.getAccount())) {
//                AppMember tmpQ = new AppMember();
//                tmpQ.setAccount(appMember.getAccount());
//                AppMember result = appMemberService.getOne(new QueryWrapper<>(tmpQ));
//                if (result != null)
//                    return Result.fail(500, "微信账号授权失败");
//            }
//            if (StringUtils.isNotBlank(appMember.getPhone())) {
//                AppMember tmpQ = new AppMember();
//                tmpQ.setPhone(appMember.getPhone());
//                AppMember result = appMemberService.getOne(new QueryWrapper<>(tmpQ));
//                if (result != null)
//                    return Result.fail(500, "手机号授权失败");
//            }
//            if (StringUtils.isNotBlank(appMember.getEmail())) {
//                AppMember tmpQ = new AppMember();
//                tmpQ.setEmail(appMember.getEmail());
//                AppMember result = appMemberService.getOne(new QueryWrapper<>(tmpQ));
//                if (result != null)
//                    return Result.fail(500, "邮箱授权失败");
//            }
//            boolean isSave = appMemberService.save(appMember);
//            if (isSave) {
//                AppMember query = new AppMember();
//                query.setAccount(appMember.getAccount());
//                query.setPhone(appMember.getPhone());
//                query.setEmail(appMember.getEmail());
//                //获取新注册用户id
//                AppMember register = appMemberService.getOne(new QueryWrapper(query));
//                if (register == null) {
//                    Result.fail(500, "注册用户失败");
//                }
//                redisUtil.set(token, register.getMemberId() + "", Constant.SAVEUSERTIME);
//            }
//        }
//
//
//        Map<String, Object> map = new HashMap<>();
//        map.put("token", token);
//        return Result.success("登录成功", map);
//    }


    /**
     * 必须传入参数 ：openid -
     *
     * @param member
     * @return
     */
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    @ResponseBody
    public Result login(AppMember member) {
        AppMember appMember = new AppMember();
        if (member == null) {
            return Result.fail(404, "登录用户数据为空");
        }

        if (StringUtils.isNotBlank(member.getOpenid())) {
            appMember.setOpenid(member.getOpenid());
        }

        QueryWrapper<AppMember> queryWrapper = new QueryWrapper(appMember);
        AppMember newMember = appMemberService.getOne(queryWrapper);
        String token = UUID.randomUUID().toString().replaceAll("-", "");

        if (newMember != null) {
            //更新最近一次登录
            newMember.setLastLogin(new Date());
            newMember.setUpdateUser(newMember.getMemberId());
            /**
             * 如果用户换头像了，更新一下用户昵称和头像
             */
            if(member.getHead()!=null)
            {
                newMember.setHead(member.getHead());
            }
            if(member.getName()!=null)
            {
                newMember.setName(member.getName());
            }
            appMemberService.updateById(newMember);
            redisUtil.set(token, newMember.getMemberId() + "", Constant.SAVEUSERTIME);//30分钟
        } else { //为空的话注册用户
            appMember.setHead(member.getHead());
            appMember.setName(member.getName());
            appMember.setOpenid(member.getOpenid());
            appMember.setCreateUser(-1L);

            //更新最近一次登录
            appMember.setLastLogin(new Date());
            //授权日期
            appMember.setRegisterTime(new Date());


            if (StringUtils.isNotBlank(appMember.getPhone())) {
                AppMember tmpQ = new AppMember();
                tmpQ.setPhone(appMember.getPhone());
                AppMember result = appMemberService.getOne(new QueryWrapper<>(tmpQ));
                if (result != null)
                    return Result.fail(500, "手机号授权失败");
            }
            if (StringUtils.isNotBlank(appMember.getEmail())) {
                AppMember tmpQ = new AppMember();
                tmpQ.setEmail(appMember.getEmail());
                AppMember result = appMemberService.getOne(new QueryWrapper<>(tmpQ));
                if (result != null)
                    return Result.fail(500, "邮箱授权失败");
            }
            boolean isSave = appMemberService.save(appMember);
            if (isSave) {
                AppMember query = new AppMember();
                query.setAccount(appMember.getAccount());
                query.setPhone(appMember.getPhone());
                query.setEmail(appMember.getEmail());
                //获取新注册用户id
                AppMember register = appMemberService.getOne(new QueryWrapper(query));
                if (register == null) {
                    Result.fail(500, "注册用户失败");
                }
                redisUtil.set(token, register.getMemberId() + "", Constant.SAVEUSERTIME);
            }
        }


        Map<String, Object> map = new HashMap<>();
        map.put("token", token);
        return Result.success("登录成功", map);
    }


    @RequestMapping(value = "/getId", method = RequestMethod.POST)
    @ResponseBody
    public Result getId(@RequestHeader(value = "token") String token, String phone, String password) {
        Map<String, Object> map = new HashMap<String, Object>();
        String mId = (String) redisUtil.get(token);
        map.put("mId", mId);
        return Result.success("success getId!!!", map);
    }

    //上传照片
    @RequestMapping(value = "/addPhoto", method = RequestMethod.POST)
    public @ResponseBody
    String uploadImg(
            @RequestParam("file") MultipartFile file
            , HttpSession session,
            HttpServletRequest request) {
        String str = "{\"code\": -1,\"msg\": \"上传失败\",\"data\":null}";
        //  String league_id=request.getSession().getAttribute("leagueID").toString();
        //System.out.println("id："+league_id);
        String url = request.getRequestURI();
        System.out.println("URL:" + url);
        try {
            if (null != file) {
                //获得当前项目所在路径
                String pathRoot = request.getSession().getServletContext().getRealPath("");
                System.out.println("当前项目所在路径：" + pathRoot);
                //生成uuid作为文件名称
                String uuid = UUID.randomUUID().toString().replaceAll("-", "");
                System.out.println("文件名称：" + uuid);
                //获得文件类型（判断如果不是图片文件类型，则禁止上传）
                String contentType = file.getContentType();
                System.out.println("文件类型：" + contentType);

                //获得文件后缀名称
                String imageName = contentType.substring(contentType.indexOf("/") + 1);
                System.out.println("文件后缀名称：" + imageName);
//		                if(ImageUtils.isImage(imageName)) {
                String filePath = "static/upload/images/";
                //根据日期来创建对应的文件夹
                String datePath = new SimpleDateFormat("yyyy/MM/dd/").format(new Date());
                System.out.println("日期：" + datePath);
                //根据id分类来创建对应的文件夹
                //  String leagueIdPath=league_id+"/";
                //日期
                String path = filePath + datePath;
                //联赛id
                //String path=filePath+leagueIdPath;
                //如果不存在，则创建新文件夹
                File f = new File(pathRoot + path);
                if (!f.exists()) {
                    f.mkdirs();
                }
                //新生成的文件名称
                String fileName = uuid + "." + imageName;
                System.out.println("新生成的文件名称：" + fileName);
                session.setAttribute("fileName", fileName);

                //图片保存的完整路径
                String pathName = path + fileName;
                System.out.println(pathName);

                //获取所属联赛ID
                // int leagueID=Integer.parseInt(league_id);
                //图片的静态资源路径
                String staticPath = "/upload/images/" + datePath + "/" + fileName;
                System.out.println("静态资源路径：" + staticPath);

                //复制操作
                //将图片从源位置复制到目标位置
                file.transferTo(new File(pathRoot + pathName));

                str = "{\"code\": 0,\"msg\": \"\",\"data\": {\"src\":\"" + "/" + pathName + "\"}}";

            }
            // }
        } catch (IOException e) {
            e.printStackTrace();
            return str;
        }
        return str;
    }


    private JSONObject getUserWXLoginInfo(String wxCode) {
        String requestUrl = MetaDataFactory.me().getValueByCode("REQUEST_URL");
        Map<String, String> requestUrlParam = new HashMap<>();
        requestUrlParam.put("appid", MetaDataFactory.me().getValueByCode("APPID"));    //开发者设置中的appId
        requestUrlParam.put("secret", MetaDataFactory.me().getValueByCode("APP_SECRET"));    //开发者设置中的appSecret
        requestUrlParam.put("js_code", wxCode);    //小程序调用wx.login返回的code
        requestUrlParam.put("grant_type", "authorization_code");    //默认参数
        //发送post请求读取调用微信 https://api.weixin.qq.com/sns/jscode2session 接口获取openid用户唯一标识
        JSONObject jsonObject = JSON.parseObject(UrlUtil.sendPost(requestUrl, requestUrlParam));
        return jsonObject;
    }



    private JSONObject getUserWXAccessToken(String wxCode) {
//        String requestUrl = MetaDataFactory.me().getValueByCode("GET_ACCESS_TOKEN_URL");
        String requestUrl = "https://api.weixin.qq.com/cgi-bin/token";

        Map<String, String> requestUrlParam = new HashMap<>();
        requestUrlParam.put("appid", MetaDataFactory.me().getValueByCode("APPID"));    //开发者设置中的appId
        requestUrlParam.put("secret", MetaDataFactory.me().getValueByCode("APP_SECRET"));    //开发者设置中的appSecret
        requestUrlParam.put("code", wxCode);    //小程序调用wx.login返回的code
        requestUrlParam.put("grant_type", "client_credential");    //默认参数
        //发送post请求读取调用微信 https://api.weixin.qq.com/sns/jscode2session 接口获取openid用户唯一标识
        JSONObject jsonObject = JSON.parseObject(UrlUtil.sendPost(requestUrl, requestUrlParam));
        return jsonObject;
    }

     private JSONObject getUserWXInfo(String accessToken,String openId) {
//        String requestUrl = MetaDataFactory.me().getValueByCode("GET_ACCESS_TOKEN_URL");
        String requestUrl = "https://api.weixin.qq.com/cgi-bin/user/info";

        Map<String, String> requestUrlParam = new HashMap<>();
        requestUrlParam.put("access_token", accessToken);
        requestUrlParam.put("openid", openId);
        requestUrlParam.put("lang", "zh_CN");
        //发送post请求读取调用微信 https://api.weixin.qq.com/sns/jscode2session 接口获取openid用户唯一标识
        JSONObject jsonObject = JSON.parseObject(UrlUtil.sendPost(requestUrl, requestUrlParam));
        return jsonObject;
    }




    /**
     * 登录 - 根据临时凭证
     *
     * @param code
     * @return
     */
    @RequestMapping("/auth")
    @ResponseBody
    public Result login(String code, String encryptedData, String iv) {
        //请求微信api获取用户的openid和sessionKey
        JSONObject jsonObject = getUserWXLoginInfo(code);

        /**
         * TODO:测试
         */
        JSONObject jsonObject2 = getUserWXAccessToken(code);

        JSONObject jsonObject3=getUserWXInfo((String)jsonObject2.get("access_token"),(String)jsonObject.get("openid"));

        if (jsonObject != null && !jsonObject.containsKey("openid")) {
            System.err.println("---error---");
            Integer errcode = (Integer) jsonObject.get("errcode");
            String errmsg = (String) jsonObject.get("errmsg");
            return Result.fail(errcode, errmsg);
        }
        String openid = (String) jsonObject.get("openid");
        String sessionKey = (String) jsonObject.get("session_key");
        //通过openid查询数据库是否有此用户
        AppMember query = new AppMember();
        query.setOpenid(openid);
        AppMember result = appMemberService.getOne(new QueryWrapper<>(query));
        if (result != null) {//用户已存在
            /**
             * 判断是否为禁用用户
             */
            if(result.getStatus().equals("N"))
            {
                return Result.fail(5003,"用户已被系统冻结，请联系管理员");
            }
            //更新最近一次登录
            result.setLastLogin(new Date());
            result.setUpdateUser(result.getMemberId());
            /**
             * 如果用户换头像了，更新一下用户昵称和头像
             */
            JSONObject decodeResult =new JSONObject();
            if(encryptedData!=null&&iv!=null)
            {
                decodeResult = getUserInfo(encryptedData, sessionKey, iv);
            }else{

            }
            if (null != decodeResult && decodeResult.containsKey("openId")) {

                JSONObject userInfoJSON = new JSONObject(decodeResult);
                result.setHead((String)userInfoJSON.get("avatarUrl"));
                result.setName((String)userInfoJSON.get("nickName"));
            }
            appMemberService.updateById(result);

            String token = UUID.randomUUID().toString().replaceAll("-", "");
            redisUtil.set(token, result.getMemberId() + "", Long.parseLong(PromotionFactory.me().getSysConfigValueByCode("TOKEN_EXPIRE")));

            Map<String, Object> map = new HashMap<>();
            map.put("token", token);
            map.put("userInfo",result);
            loginLogService.saveLogin(result.getMemberId(),ToolUtil.getIP());
            return Result.success("登录成功", map);
        }

        //不存在则注册新用户
        AppMember appMember = new AppMember();
        /**
         *
         * 获取其他数据存入
         */
        /***
         * ===============================华丽分割线==================================================================、
         *
         *
         *对encryptedData加密数据进行AES解密
         */
        Map userInfo = new HashMap();
        JSONObject decodeResult =new JSONObject();
        if(encryptedData!=null&&iv!=null)
        {
            decodeResult = getUserInfo(encryptedData, sessionKey, iv);
        }else{

        }


        if (null != decodeResult && decodeResult.containsKey("openId")) {

            Map<String, Object> userMap = new HashMap<>();
            userMap.put("obj", decodeResult);
            JSONObject userInfoJSON = new JSONObject(decodeResult);


            userInfo.put("openId", userInfoJSON.get("openId"));
            userInfo.put("nickName", userInfoJSON.get("nickName"));
            userInfo.put("gender", userInfoJSON.get("gender"));
            userInfo.put("city", userInfoJSON.get("city"));
            userInfo.put("province", userInfoJSON.get("province"));
            userInfo.put("country", userInfoJSON.get("country"));
            userInfo.put("avatarUrl", userInfoJSON.get("avatarUrl"));


            appMember.setHead((String)userInfoJSON.get("avatarUrl"));
            appMember.setName((String)userInfoJSON.get("nickName"));

        } else {
//                map.put("status", 0);
//                map.put("msg", "解密失败");
        }


        /***
         * ===============================华丽分割线==================================================================、
         *
         */

        appMember.setOpenid(openid);
        appMember.setCreateUser(-1L);
        //更新最近一次登录
        appMember.setLastLogin(new Date());
        //授权日期
        appMember.setRegisterTime(new Date());

        appMemberService.save(appMember);

        AppMember tmpQ = new AppMember();
        tmpQ.setOpenid(openid);
        AppMember newUser = appMemberService.getOne(new QueryWrapper<>(tmpQ));
        String token = UUID.randomUUID().toString().replaceAll("-", "");
        redisUtil.set(token, newUser.getMemberId() + "", Long.parseLong(PromotionFactory.me().getSysConfigValueByCode("TOKEN_EXPIRE")));
        Map<String, Object> map = new HashMap<>();
        map.put("token", token);
        map.put("userInfo", userInfo);
        loginLogService.saveLogin(newUser.getMemberId(),ToolUtil.getIP());
        return Result.success("登录成功", map);
    }


    /**
     * 获取信息
     */
    public JSONObject getUserInfo(String encryptedData, String sessionkey, String iv) {
        // 被加密的数据
        byte[] dataByte = Base64.decode(encryptedData);
        // 加密秘钥
        byte[] keyByte = Base64.decode(sessionkey);
        // 偏移量
        byte[] ivByte = Base64.decode(iv);
        try {
            // 如果密钥不足16位，那么就补足.  这个if 中的内容很重要
            int base = 16;
            if (keyByte.length % base != 0) {
                int groups = keyByte.length / base + (keyByte.length % base != 0 ? 1 : 0);
                byte[] temp = new byte[groups * base];
                Arrays.fill(temp, (byte) 0);
                System.arraycopy(keyByte, 0, temp, 0, keyByte.length);
                keyByte = temp;
            }
            // 初始化
            Security.addProvider(new BouncyCastleProvider());
            Cipher cipher = Cipher.getInstance("AES/CBC/PKCS7Padding", "BC");
            SecretKeySpec spec = new SecretKeySpec(keyByte, "AES");
            AlgorithmParameters parameters = AlgorithmParameters.getInstance("AES");
            parameters.init(new IvParameterSpec(ivByte));
            cipher.init(Cipher.DECRYPT_MODE, spec, parameters);// 初始化
            byte[] resultByte = cipher.doFinal(dataByte);
            if (null != resultByte && resultByte.length > 0) {
                String result = new String(resultByte, "UTF-8");
                return JSONObject.parseObject(result);
            }
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        } catch (NoSuchPaddingException e) {
            e.printStackTrace();
        } catch (InvalidParameterSpecException e) {
            e.printStackTrace();
        } catch (IllegalBlockSizeException e) {
            e.printStackTrace();
        } catch (BadPaddingException e) {
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (InvalidKeyException e) {
            e.printStackTrace();
        } catch (InvalidAlgorithmParameterException e) {
            e.printStackTrace();
        } catch (NoSuchProviderException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 测试 获取用户信息
     */
    @RequestMapping("/getInfo")
    public Result getInfo(String openId){

        return Result.fail(404,"空");
    }

}
