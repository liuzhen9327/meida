package com.jfinal.weixin.sdk.kit;

import java.io.ByteArrayInputStream;
import java.io.IOException;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.xml.sax.SAXException;

/**
 * 
 * @author liuzhen
 * @version 
 * Jul 1, 2015 11:08:21 AM
 */
public class XmlKit {
	
	public static Document parse(String xml) throws ParserConfigurationException, SAXException, IOException  {
		DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
		DocumentBuilder db = dbf.newDocumentBuilder();
		return db.parse(new ByteArrayInputStream(xml.getBytes()));
	}

	public static String getElementText(Element element, String tagName) {
		return element.getElementsByTagName(tagName).item(0).getTextContent();
	}
}
