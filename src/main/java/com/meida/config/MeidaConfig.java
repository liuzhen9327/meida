package com.meida.config;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import com.jfinal.aop.Before;
import com.jfinal.config.Constants;
import com.jfinal.config.Handlers;
import com.jfinal.config.Interceptors;
import com.jfinal.config.JFinalConfig;
import com.jfinal.config.Plugins;
import com.jfinal.config.Routes;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.activerecord.cache.EhCache;
import com.jfinal.plugin.activerecord.tx.Tx;
import com.jfinal.plugin.c3p0.C3p0Plugin;
import com.jfinal.plugin.ehcache.EhCachePlugin;
import com.jfinal.render.ViewType;
import com.jfinal.weixin.demo.WechatApiController;
import com.jfinal.weixin.sdk.api.ApiConfigKit;
import com.meida.controller.*;
import com.meida.interceptor.AuthInterceptor;
import com.meida.interceptor.ExceptionInterceptor;
import com.meida.model.*;
import com.meida.service.ExpressService;
import org.apache.commons.io.FileUtils;
import org.jsoup.Jsoup;
import org.jsoup.helper.StringUtil;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

/**
 * @author liuzhen
 * @version Apr 9, 2015 11:22:00 AM
 */
public class MeidaConfig extends JFinalConfig {

    public Properties loadProp(String pro, String dev) {
        try {
            return loadPropertyFile(pro);
        } catch (Exception e) {
            return loadPropertyFile(dev);
        }
    }

    public void configConstant(Constants me) {
        // 如果生产环境配置文件存在，则优先加载该配置，否则加载开发环境配置文件
        loadProp("config_pro.properties", "config.properties");
        me.setDevMode(getPropertyToBoolean("devMode", true));
        Constant.init();
        // ApiConfigKit 设为开发模式可以在开发阶段输出请求交互的 xml 与 json 数据
        ApiConfigKit.setDevMode(me.getDevMode());

        me.setViewType(ViewType.JSP);
        me.setBaseViewPath("/WEB-INF/views/");

        me.setError401View("/401.html");
        me.setError403View("/403.html");
        me.setError404View("/404.jsp");
        me.setError500View("/500.jsp");
    }

    public void configRoute(Routes me) {
        me.add("/wechat", WechatMsgController.class);
        me.add("/api", WechatApiController.class, "/api");

        me.add("/redirect", RedirectController.class);
        me.add("/", IndexController.class);
//		me.add("/address", AddressController.class);
        me.add("/user", UserController.class);

        me.add("/order", OrderController.class);
        me.add("/original", OriginalController.class);
        me.add("/transit", TransitController.class);

        me.add("/so", SearchController.class);
        me.add("/download", DownloadController.class);
//        me.add("/express", ExpressController.class);
    }

    public void configPlugin(Plugins me) {
        C3p0Plugin c3p0Plugin = new C3p0Plugin(getProperty("jdbcUrl"),
                getProperty("user"), getProperty("password").trim());
        me.add(c3p0Plugin);

		EhCachePlugin ecp = new EhCachePlugin();
		me.add(ecp);

        ActiveRecordPlugin arpMysql = new ActiveRecordPlugin("mysql", c3p0Plugin);
        me.add(arpMysql);
		arpMysql.setCache(new EhCache());
//		arpMysql.addMapping(Address.TABLE_NAME, Address.class);
        arpMysql.addMapping(Order.TABLE_NAME, Order.class);
        arpMysql.addMapping(Express.TABLE_NAME, Express.class);
        arpMysql.addMapping(OriginalLogistic.TABLE_NAME, OriginalLogistic.class);
        arpMysql.addMapping(TransitLogistic.TABLE_NAME, TransitLogistic.class);
        arpMysql.addMapping(User.TABLE_NAME, User.class);
        arpMysql.addMapping(UserFriend.TABLE_NAME, UserFriend.class);
        arpMysql.addMapping(Menu.TABLE_NAME, Menu.class);
        arpMysql.addMapping(Receiver.TABLE_NAME, Receiver.class);

    }

    @Before(Tx.class)
    private void importExpress() {
        try {
            Document root = Jsoup.parse(FileUtils.readFileToString(new File("C:\\Users\\liuzhen\\Desktop\\allkuaidi.html"), "UTF-8"));
            Elements elements = root.select("dd");
            Date now = new Date();
            Map<String, String> map = new HashMap<>();
            for (Element element : elements) {
                Elements kuaidi = element.select("a");
                for (Element k : kuaidi) {
                    String code = k.attr("data-code");
                    if (map.containsKey(code)) continue;
                    String text = k.text();
                    map.put(code, text);
                    if (StringUtil.isBlank(text)) continue;
//                    href = href.substring(href.lastIndexOf("/") + 1, href.indexOf("."));
                    new Express().set(Express.code, code)
                            .set(Express.name, text)
                            .set("creater", 0)
                            .set("updater", 0)
                            .set("updateTime", now)
                            .save();
                    System.out.println(code + "->" + text);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void configInterceptor(Interceptors me) {
        me.addGlobalActionInterceptor(new AuthInterceptor());
        me.addGlobalActionInterceptor(new ExceptionInterceptor());
    }

    public void configHandler(Handlers me) {
//        importExpress();
        ExpressService.saveExpress2Cache();
    }


    // public static void main(String[] args) {
    // JFinal.start("webapp", 8080, "/", 5);
    // }
}