package com.jd.traffic.pay.util;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.Hashtable;
import java.util.Properties;


public class EnvironmentConfig {
	 public static volatile  EnvironmentConfig ec;
	 private static Hashtable<String, Properties> register = new Hashtable<String, Properties>();
	 
	 private EnvironmentConfig() {
	  super();
	 }
	 
	 public static EnvironmentConfig getInstance() {
		 EnvironmentConfig innerEc = null;
		 if (ec == null){
			 synchronized (EnvironmentConfig.class){
				 innerEc = ec;
				 if(innerEc == null){
					 innerEc = new EnvironmentConfig();
					 ec = innerEc;
				 }
			 }
		 }
	  	return ec;
	 }
	 
	
	 /**
	  * 
	  * @Title: getProperties
	  * @Description:获取配置文件的所有资源
	  * @param fileName
	  * @return
	  * @return: Properties
	  */
	@SuppressWarnings("resource")
	public Properties getProperties(String fileName) {
		InputStream is = null;
		Properties p = null;
		try {
			p = (Properties) register.get(fileName);
			if (p == null) {
				try {
					is = new FileInputStream(fileName);
				} catch (Exception e) {
					if (fileName.startsWith("/"))
					    // 用getResourceAsStream()方法用于定位并打开外部文件。
					    is = EnvironmentConfig.class.getResourceAsStream(fileName);
					else
						is = EnvironmentConfig.class.getResourceAsStream("/" + fileName);
				}
				p = new Properties();
				p.load(is);
				register.put(fileName, p);
				is.close();
			}
		} catch (Exception e) {
			e.printStackTrace(System.out);
		}
		return p;
	}
	
	
	/**
	 * 
	 * @Title: getPropertyValue
	 * @Description:获取配置文件中具体某个配置属性
	 * @param fileName
	 * @param strKey
	 * @return
	 * @return: String
	 */
	public String getPropertyValue(String fileName, String strKey) {
		Properties p = getProperties(fileName);
		try {
			return (String) p.getProperty(strKey);
		} catch (Exception e) {
			e.printStackTrace(System.out);
		}
		return null;
	 }
	 
	 /**
	  * 
	  * @Title: getPropertyValueForChar
	  * @Description:获取配置文件中配置为字符的属性的值
	  * @param fileName
	  * @param strKey
	  * @return
	  * @return: char
	  */
	 public char getPropertyValueForChar(String fileName, String strKey){
		 Properties p = getProperties(fileName);
		 char[] charArr = new char[1];
		  try {
		   charArr = p.getProperty(strKey).toCharArray();
		   return charArr[0];
		  } catch (Exception e) {
		   e.printStackTrace(System.out);
		  }
		  return charArr[0];
	 }
	 
	 /**
	  * 
	  * @Title: getPropertyValueForBoolean
	  * @Description: 获取配置文件boolean类型的值
	  * @param fileName
	  * @param strKey
	  * @return
	  * @return: Boolean
	  */
	 public Boolean getPropertyValueForBoolean(String fileName, String strKey){
		 Properties p = getProperties(fileName);
		  try {
		   return Boolean.parseBoolean(p.getProperty(strKey));
		  } catch (Exception e) {
		   e.printStackTrace(System.out);
		  }
		  return null;
	 }
	 
	 
	 /**
	  * 
	  * @Title: getPropertyValueForInt
	  * @Description:获取配置文件Integer类型的值
	  * @param fileName
	  * @param strKey
	  * @return
	  * @return: Integer
	  */
	 public Integer getPropertyValueForInt(String fileName, String strKey){
		 Properties p = getProperties(fileName);
		  try {
		   return Integer.parseInt(p.getProperty(strKey));
		  } catch (Exception e) {
		   e.printStackTrace(System.out);
		  }
		  return null;
	 }
	 
	 
	 /**
	  * 
	  * @Title: getPropertyValueForShort
	  * @Description:获取配置文件Short类型的值
	  * @param fileName
	  * @param strKey
	  * @return
	  * @return: Short
	  */
	 public Short getPropertyValueForShort(String fileName, String strKey){
		 Properties p = getProperties(fileName);
		  try {
			  return Short.parseShort(p.getProperty(strKey));
		  } catch (Exception e) {
		   e.printStackTrace(System.out);
		  }
		  return null;
	 }
}
