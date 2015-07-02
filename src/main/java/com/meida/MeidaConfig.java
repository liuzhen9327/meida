package com.meida;

import java.util.Properties;

import com.jfinal.config.Constants;
import com.jfinal.config.Handlers;
import com.jfinal.config.Interceptors;
import com.jfinal.config.JFinalConfig;
import com.jfinal.config.Plugins;
import com.jfinal.config.Routes;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.activerecord.cache.EhCache;
import com.jfinal.plugin.c3p0.C3p0Plugin;
import com.jfinal.plugin.ehcache.EhCachePlugin;
import com.jfinal.render.ViewType;
import com.jfinal.weixin.demo.WechatApiController;
import com.jfinal.weixin.sdk.api.ApiConfigKit;
import com.meida.controller.AddressController;
import com.meida.controller.UserController;
import com.meida.controller.WechatMsgController;
import com.meida.model.Address;

/**
 * 
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

		// ApiConfigKit 设为开发模式可以在开发阶段输出请求交互的 xml 与 json 数据
		ApiConfigKit.setDevMode(me.getDevMode());

		me.setViewType(ViewType.JSP);
		me.setBaseViewPath("/WEB-INF/views/");

		me.setError401View("/401.html");
		me.setError403View("/403.html");
		me.setError404View("/404.html");
		me.setError500View("/500.html");
	}

	public void configRoute(Routes me) {
		me.add("/ajax/wechat", WechatMsgController.class);
		me.add("/api", WechatApiController.class, "/api");
		
		me.add("/address", AddressController.class);
		me.add("/user", UserController.class);
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
		arpMysql.addMapping("tb_address", Address.class);
	}

	public void configInterceptor(Interceptors me) {

	}

	public void configHandler(Handlers me) {

	}

	// public static void main(String[] args) {
	// JFinal.start("webapp", 8080, "/", 5);
	// }
}