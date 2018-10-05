package com.jd.traffic.pay.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.util.Map;
import java.util.Map.Entry;

import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSession;
import javax.net.ssl.SSLSocketFactory;
import javax.net.ssl.TrustManager;


/**
 * @ClassName: HttpUtil
 * @Description:http或https辅助工工具类
 * @author: zhangjian
 * @date: 2018年3月29日 下午2:09:36
 */
public class HttpUtil {
	
	/**默认编码格式**/
    private static final String DEFAULT_CHARSET = "UTF-8";
    /**GET请求方式**/
    private static final String _GET = "GET"; 
    /**POST请求方式**/
    private static final String _POST = "POST";
    /**连接超时时间,单位毫秒**/
    public static final int DEF_CONN_TIMEOUT = 30000;
    /**读取超时超时时间,单位毫秒**/
    public static final int DEF_READ_TIMEOUT = 30000;

  
    /**
     * @Title: initHttp
     * @Description:初始化http请求参数
     * @param url:请求地址
     * @param method:请求方法
     * @param headers:请求头
     * @return
     * @throws Exception
     * @return: HttpURLConnection
     * @throws IOException 
     */
    private static HttpURLConnection initHttp(String url, String method,
            Map<String, String> headers) throws IOException {
        URL _url = new URL(url);
        HttpURLConnection http = (HttpURLConnection) _url.openConnection();
        // 连接超时
        http.setConnectTimeout(DEF_CONN_TIMEOUT);
        // 读取超时 --服务器响应比较慢，增大时间
        http.setReadTimeout(DEF_READ_TIMEOUT);
        http.setUseCaches(false);
        http.setRequestMethod(method);
        http.setRequestProperty("Content-Type",
                "application/x-www-form-urlencoded");
        http.setRequestProperty("User-Agent","Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.146 Safari/537.36");
        if (null != headers && !headers.isEmpty()) {
            for (Entry<String, String> entry : headers.entrySet()) {
                http.setRequestProperty(entry.getKey(), entry.getValue());
            }
        }
        http.setDoOutput(true);
        http.setDoInput(true);
        http.connect();
        return http;
    }

    
    /**
     * @Title: initHttps
     * @Description:初始化https请求参数
     * @param url
     * @param method
     * @param headers
     * @return
     * @throws Exception
     * @return: HttpsURLConnection
     * @throws NoSuchAlgorithmException 
     * @throws KeyManagementException 
     */
    private static HttpsURLConnection initHttps(String url, String method,
            Map<String, String> headers) throws IOException, NoSuchAlgorithmException, KeyManagementException{
        TrustManager[] tm = { new MyX509TrustManager() };
        System.setProperty("https.protocols", "TLSv1");
        SSLContext sslContext = SSLContext.getInstance("TLS");
        sslContext.init(null, tm, new java.security.SecureRandom());
        // 从上述SSLContext对象中得到SSLSocketFactory对象
        SSLSocketFactory ssf = sslContext.getSocketFactory();
        URL _url = new URL(url);
        HttpsURLConnection http = (HttpsURLConnection) _url.openConnection();
        // 设置域名校验
        http.setHostnameVerifier(new HttpUtil().new TrustAnyHostnameVerifier());
        // 连接超时
        http.setConnectTimeout(DEF_CONN_TIMEOUT);
        // 读取超时 --服务器响应比较慢，增大时间
        http.setReadTimeout(DEF_READ_TIMEOUT);
        http.setUseCaches(false);
        http.setRequestMethod(method);
        http.setRequestProperty("Content-Type","application/x-www-form-urlencoded");
        http.setRequestProperty("User-Agent",
                "Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.146 Safari/537.36");
        if (null != headers && !headers.isEmpty()) {
            for (Entry<String, String> entry : headers.entrySet()) {
                http.setRequestProperty(entry.getKey(), entry.getValue());
            }
        }
        http.setSSLSocketFactory(ssf);
        http.setDoOutput(true);
        http.setDoInput(true);
        http.connect();
        return http;
    }

   
    /**
     * @Title: get
     * @Description:GET 请求
     * @param url:访问地址
     * @param params:参数
     * @param headers:头信息
     * @return
     * @throws Exception
     * @return: String
     * @throws IOException 
     * @throws NoSuchAlgorithmException 
     * @throws KeyManagementException 
     */
    public static String get(String url, Map<String, String> params,
            Map<String, String> headers) throws Exception {
        HttpURLConnection http = null;
        if (isHttps(url)) {
            http = initHttps(initParams(url, params), _GET, headers);
        } else {
            http = initHttp(initParams(url, params), _GET, headers);
        }
        InputStream in = http.getInputStream();
        BufferedReader read = new BufferedReader(new InputStreamReader(in,DEFAULT_CHARSET));
        String valueString = null;
        StringBuffer bufferRes = new StringBuffer();
        while ((valueString = read.readLine()) != null) {
            bufferRes.append(valueString);
        }
        in.close();
        if (http != null) {
            http.disconnect();// 关闭连接
        }
        return bufferRes.toString();
    }

    public static String get(String url) throws Exception {
        return get(url, null);
    }

    public static String get(String url, Map<String, String> params)
            throws Exception {
        return get(url, params, null);
    }
    
    /**
     * @Title: post
     * @Description:POST请求
     * @param url:请求路径
     * @param params:参数
     * @return
     * @throws Exception
     * @return: String
     */
    public static String post(String url, String params)
            throws Exception {
        HttpURLConnection http = null;
        if (isHttps(url)) {
            http = initHttps(url, _POST, null);
        } else {
            http = initHttp(url, _POST, null);
        }
        OutputStream out = http.getOutputStream();
        out.write(params.getBytes(DEFAULT_CHARSET));
        out.flush();
        out.close();
        InputStream in = http.getInputStream();
        BufferedReader read = new BufferedReader(new InputStreamReader(in,DEFAULT_CHARSET));
        String valueString = null;
        StringBuffer bufferRes = new StringBuffer();
        while ((valueString = read.readLine()) != null) {
            bufferRes.append(valueString);
        }
        in.close();
        if (http != null) {
            http.disconnect();// 关闭连接
        }
        return bufferRes.toString();
    }

    /**
     * @Title: initParams
     * @Description:GET请求方式参数初始化
     * @param url:请求路径
     * @param params:参数
     * @return
     * @throws Exception
     * @return: String
     */
    public static String initParams(String url, Map<String, String> params)
            throws Exception {
        if (null == params || params.isEmpty()) {
            return url;
        }
        StringBuilder sb = new StringBuilder(url);
        if (url.indexOf("?") == -1) {
            sb.append("?");
        }
        sb.append(map2Url(params));
        return sb.toString();
    }

    
    /**
     * @Title: map2Url
     * @Description:map构造URL
     * @param paramToMap
     * @return
     * @throws Exception
     * @return: String
     */
    public static String map2Url(Map<String, String> paramToMap)
            throws Exception {
        if (null == paramToMap || paramToMap.isEmpty()) {
            return null;
        }
        StringBuffer url = new StringBuffer();
        boolean isfist = true;
        for (Entry<String, String> entry : paramToMap.entrySet()) {
            if (isfist) {
                isfist = false;
            } else {
                url.append("&");
            }
            url.append(entry.getKey()).append("=");
            String value = entry.getValue();
            if (value != null && !"".equals(value.trim())) {
                url.append(URLEncoder.encode(value, DEFAULT_CHARSET));
            }
        }
        return url.toString();
    }

    
    /**
     * @Title: isHttps
     * @Description:判断请求是否是https请求
     * @param url:请求地址
     * @return
     * @return: boolean
     */
    private static boolean isHttps(String url) {
        return url.startsWith("https");
    }
    
    
    /**
     * 
     * @Title: isConnected
     * @Description:检测网络,设置超时时间60秒
     * @param remoteInetAddr
     * @return
     * @return: boolean
     */
    public static boolean isConnected(String remoteInetAddr) {
    	boolean connected = false;
    	URL url = null;
    	try {
    		 url = new URL(remoteInetAddr);
    		 HttpURLConnection conn = (HttpURLConnection)url.openConnection();  
    		 if(200 != conn.getResponseCode()){  
    			 connected = false;  
             }else{
            	 connected = true;
             }
    	 } catch (IOException e) {
    		 connected = false;  
        }
    	return connected;
    }

    /**
     * @ClassName: TrustAnyHostnameVerifier
     * @Description:https域名校验
     * @author: zhangjian
     * @date: 2018年3月29日 下午2:31:39
     */
    public class TrustAnyHostnameVerifier implements HostnameVerifier {
        public boolean verify(String hostname, SSLSession session) {
            return true;// 直接返回true
        }
    }
    
    
    
}
