/**
 * Copyright (c) 2011-2014, James Zhan 詹波 (jfinal@126.com).
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 */

package com.jfinal.weixin.sdk.msg;

import java.io.IOException;

import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.xml.sax.SAXException;

import com.jfinal.kit.StrKit;
import com.jfinal.weixin.sdk.kit.XmlKit;
import com.jfinal.weixin.sdk.msg.in.InImageMsg;
import com.jfinal.weixin.sdk.msg.in.InLinkMsg;
import com.jfinal.weixin.sdk.msg.in.InLocationMsg;
import com.jfinal.weixin.sdk.msg.in.InMsg;
import com.jfinal.weixin.sdk.msg.in.InTextMsg;
import com.jfinal.weixin.sdk.msg.in.InVideoMsg;
import com.jfinal.weixin.sdk.msg.in.InVoiceMsg;
import com.jfinal.weixin.sdk.msg.in.event.InFollowEvent;
import com.jfinal.weixin.sdk.msg.in.event.InLocationEvent;
import com.jfinal.weixin.sdk.msg.in.event.InMassEvent;
import com.jfinal.weixin.sdk.msg.in.event.InMenuEvent;
import com.jfinal.weixin.sdk.msg.in.event.InQrCodeEvent;
import com.jfinal.weixin.sdk.msg.in.event.InTemplateMsgEvent;
import com.jfinal.weixin.sdk.msg.in.speech_recognition.InSpeechRecognitionResults;

public class InMsgParser {
	
	private InMsgParser() {}
	
	/**
	 * 从 xml 中解析出各类消息与事件
	 */
	public static InMsg parse(String xml) {
		try {
			return doParse(xml);
		} catch (ParserConfigurationException | SAXException | IOException e) {
			throw new RuntimeException(e);
		}
	}
	
	/**
	 * 消息类型
	 * 1：text 文本消息
	 * 2：image 图片消息
	 * 3：voice 语音消息
	 * 4：video 视频消息
	 * 5：location 地址位置消息
	 * 6：link 链接消息
	 * 7：event 事件
	 * @throws IOException 
	 * @throws SAXException 
	 * @throws ParserConfigurationException 
	 */
	private static InMsg doParse(String xml) throws ParserConfigurationException, SAXException, IOException {
		Document document = XmlKit.parse(xml);
		Element root = document.getDocumentElement();
		
//		Document doc = DocumentHelper.parseText(xml);
//        Element root = doc.getRootElement();
        String toUserName = XmlKit.getElementText(root, "ToUserName");
        String fromUserName = XmlKit.getElementText(root, "FromUserName");
        Integer createTime = Integer.parseInt(XmlKit.getElementText(root, "CreateTime"));
        String msgType = XmlKit.getElementText(root, "MsgType");
        if ("text".equals(msgType))
        	return parseInTextMsg(root, toUserName, fromUserName, createTime, msgType);
        if ("image".equals(msgType))
        	return parseInImageMsg(root, toUserName, fromUserName, createTime, msgType);
        if ("voice".equals(msgType))
        	return parseInVoiceMsgAndInSpeechRecognitionResults(root, toUserName, fromUserName, createTime, msgType);
        if ("video".equals(msgType))
        	return parseInVideoMsg(root, toUserName, fromUserName, createTime, msgType);
        if ("location".equals(msgType))
        	return parseInLocationMsg(root, toUserName, fromUserName, createTime, msgType);
        if ("link".equals(msgType))
        	return parseInLinkMsg(root, toUserName, fromUserName, createTime, msgType);
        if ("event".equals(msgType))
        	return parseInEvent(root, toUserName, fromUserName, createTime, msgType);
        throw new RuntimeException("无法识别的消息类型 " + msgType + "，请查阅微信公众平台开发文档");
	}
	
	private static InMsg parseInTextMsg(Element root, String toUserName, String fromUserName, Integer createTime, String msgType) {
		InTextMsg msg = new InTextMsg(toUserName, fromUserName, createTime, msgType);
		msg.setContent(XmlKit.getElementText(root, "Content"));
		msg.setMsgId(XmlKit.getElementText(root, "MsgId"));
		return msg;
	}
	
	private static InMsg parseInImageMsg(Element root, String toUserName, String fromUserName, Integer createTime, String msgType) {
		InImageMsg msg = new InImageMsg(toUserName, fromUserName, createTime, msgType);
		msg.setPicUrl(XmlKit.getElementText(root, "PicUrl"));
		msg.setMediaId(XmlKit.getElementText(root, "MediaId"));
		msg.setMsgId(XmlKit.getElementText(root, "MsgId"));
		return msg;
	}
	
	private static InMsg parseInVoiceMsgAndInSpeechRecognitionResults(Element root, String toUserName, String fromUserName, Integer createTime, String msgType) {
		String recognition = XmlKit.getElementText(root, "Recognition");
		if (StrKit.isBlank(recognition)) {
			InVoiceMsg msg = new InVoiceMsg(toUserName, fromUserName, createTime, msgType);
			msg.setMediaId(XmlKit.getElementText(root, "MediaId"));
			msg.setFormat(XmlKit.getElementText(root, "Format"));
			msg.setMsgId(XmlKit.getElementText(root, "MsgId"));
			return msg;
		}
		else {
			InSpeechRecognitionResults msg = new InSpeechRecognitionResults(toUserName, fromUserName, createTime, msgType);
			msg.setMediaId(XmlKit.getElementText(root, "MediaId"));
			msg.setFormat(XmlKit.getElementText(root, "Format"));
			msg.setMsgId(XmlKit.getElementText(root, "MsgId"));
			msg.setRecognition(recognition);			// 与 InVoiceMsg 唯一的不同之处
			return msg;
		}
	}
	
	private static InMsg parseInVideoMsg(Element root, String toUserName, String fromUserName, Integer createTime, String msgType) {
		InVideoMsg msg = new InVideoMsg(toUserName, fromUserName, createTime, msgType);
		msg.setMediaId(XmlKit.getElementText(root, "MediaId"));
		msg.setThumbMediaId(XmlKit.getElementText(root, "ThumbMediaId"));
		msg.setMsgId(XmlKit.getElementText(root, "MsgId"));
		return msg;
	}
	
	private static InMsg parseInLocationMsg(Element root, String toUserName, String fromUserName, Integer createTime, String msgType) {
		InLocationMsg msg = new InLocationMsg(toUserName, fromUserName, createTime, msgType);
		msg.setLocation_X(XmlKit.getElementText(root, "Location_X"));
		msg.setLocation_Y(XmlKit.getElementText(root, "Location_Y"));
		msg.setScale(XmlKit.getElementText(root, "Scale"));
		msg.setLabel(XmlKit.getElementText(root, "Label"));
		msg.setMsgId(XmlKit.getElementText(root, "MsgId"));
		return msg;
	}
	
	private static InMsg parseInLinkMsg(Element root, String toUserName, String fromUserName, Integer createTime, String msgType) {
		InLinkMsg msg = new InLinkMsg(toUserName, fromUserName, createTime, msgType);
		msg.setTitle(XmlKit.getElementText(root, "Title"));
		msg.setDescription(XmlKit.getElementText(root, "Description"));
		msg.setUrl(XmlKit.getElementText(root, "Url"));
		msg.setMsgId(XmlKit.getElementText(root, "MsgId"));
		return msg;
	}
	
	// 解析四种事件
	private static InMsg parseInEvent(Element root, String toUserName, String fromUserName, Integer createTime, String msgType) {
		String event = XmlKit.getElementText(root, "Event");
		String eventKey = XmlKit.getElementText(root, "EventKey");
		
		// 关注/取消关注事件（包括二维码扫描关注，二维码扫描关注事件与扫描带参数二维码事件是两回事）
		if (("subscribe".equals(event) || "unsubscribe".equals(event)) && StrKit.isBlank(eventKey)) {
			InFollowEvent e = new InFollowEvent(toUserName, fromUserName, createTime, msgType);
			e.setEvent(event);
			return e;
		}
		
		// 扫描带参数二维码事件之一		1: 用户未关注时，进行关注后的事件推送
		String ticket = XmlKit.getElementText(root, "Ticket");
		if ("subscribe".equals(event) && StrKit.notBlank(eventKey) && eventKey.startsWith("qrscene_")) {
			InQrCodeEvent e = new InQrCodeEvent(toUserName, fromUserName, createTime, msgType);
			e.setEvent(event);
			e.setEventKey(eventKey);
			e.setTicket(ticket);
			return e;
		}
		// 扫描带参数二维码事件之二		2: 用户已关注时的事件推送
		if ("SCAN".equals(event)) {
			InQrCodeEvent e = new InQrCodeEvent(toUserName, fromUserName, createTime, msgType);
			e.setEvent(event);
			e.setEventKey(eventKey);
			e.setTicket(ticket);
			return e;
		}
		
		// 上报地理位置事件
		if ("LOCATION".equals(event)) {
			InLocationEvent e = new InLocationEvent(toUserName, fromUserName, createTime, msgType);
			e.setEvent(event);
			e.setLatitude(XmlKit.getElementText(root, "Latitude"));
			e.setLongitude(XmlKit.getElementText(root, "Longitude"));
			e.setPrecision(XmlKit.getElementText(root, "Precision"));
			return e;
		}
		
		// 自定义菜单事件之一			1：点击菜单拉取消息时的事件推送
		if ("CLICK".equals(event)) {
			InMenuEvent e = new InMenuEvent(toUserName, fromUserName, createTime, msgType);
			e.setEvent(event);
			e.setEventKey(eventKey);
			return e;
		}
		// 自定义菜单事件之二			2：点击菜单跳转链接时的事件推送
		if ("VIEW".equals(event)) {
			InMenuEvent e = new InMenuEvent(toUserName, fromUserName, createTime, msgType);
			e.setEvent(event);
			e.setEventKey(eventKey);
			return e;
		}
		// 模板消息是否送达成功通知事件
		if ("TEMPLATESENDJOBFINISH".equals(event)) {
			InTemplateMsgEvent e = new InTemplateMsgEvent(toUserName, fromUserName, createTime, msgType);
			e.setEvent(event);
			e.setMsgId(XmlKit.getElementText(root, "MsgID"));
			e.setStatus(XmlKit.getElementText(root, "Status"));
			return e;
		}
		// 群发任务结束时是否送达成功通知事件
		if ("MASSSENDJOBFINISH".equals(event)) {
			InMassEvent e = new InMassEvent(toUserName, fromUserName, createTime, msgType);
			e.setEvent(event);
			e.setMsgId(XmlKit.getElementText(root, "MsgID"));
			e.setStatus(XmlKit.getElementText(root, "Status"));
			e.setTotalCount(XmlKit.getElementText(root, "TotalCount"));
			e.setFilterCount(XmlKit.getElementText(root, "FilterCount"));
			e.setSentCount(XmlKit.getElementText(root, "SentCount"));
			e.setErrorCount(XmlKit.getElementText(root, "ErrorCount"));
			return e;
		}

		throw new RuntimeException("无法识别的事件类型" + event + "，请查阅微信公众平台开发文档");
	}
	
	@SuppressWarnings("unused")
	public static void main(String[] args) throws ParserConfigurationException, SAXException, IOException {
		String xml = 
			"<xml>\n" +
				"<ToUserName><![CDATA[James]]></ToUserName>\n" +
				"<FromUserName><![CDATA[JFinal]]></FromUserName>\n" +
				"<CreateTime>1348831860</CreateTime>\n" +
				"<MsgType><![CDATA[text]]></MsgType>\n" +
					"<Content><![CDATA[this is a test]]></Content>\n" +
					"<MsgId>1234567890123456</MsgId>\n" +
			"</xml>";
		
//		InTextMsg msg = (InTextMsg)parse(xml);
//		System.out.println(msg.getToUserName());
//		System.out.println(msg.getFromUserName());
//		System.out.println(msg.getContent());
		
		
		String xml_2 = 
				"<xml>\n" +
					"<ToUserName><![CDATA[James]]></ToUserName>\n" +
					"<FromUserName><![CDATA[JFinal]]></FromUserName>\n" +
					"<CreateTime>1348831860</CreateTime>\n" +
					"<MsgType><![CDATA[text]]></MsgType>\n" +
						"<Content><![CDATA[this is a test]]></Content>\n" +
						"<MsgId>1234567890123456</MsgId>\n" +
				"</xml>";
		
		Document doc = XmlKit.parse(xml_2);
        Element root = doc.getDocumentElement();
        String value = XmlKit.getElementText(root, "ToUserName");
        System.out.println(value);
	}
}


