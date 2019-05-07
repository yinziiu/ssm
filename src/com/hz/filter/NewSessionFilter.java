package com.hz.filter;

import java.io.IOException;
import java.util.*;
import java.util.Map.Entry;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class NewSessionFilter implements Filter {
	
    static ServletRequest request;
    private static final Logger logger = LoggerFactory.getLogger(NewSessionFilter.class);  
    public static final String NEW_SESSION_INDICATOR = "com.crm.filter.NewSessionFilter"; 
        
        static HttpServletRequest request2 = (HttpServletRequest) request;
        public static void newSession(){  
            HttpSession session = request2.getSession(true);  
            session.setAttribute(NEW_SESSION_INDICATOR, true);  
       }  

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		 //缺少跨帧脚本编制防御 ,加x-frame-options防止（限制）在 iFrame 中嵌入页面
		 HttpServletResponse httpResponse = (HttpServletResponse) response;
		 httpResponse.addHeader("x-frame-options","SAMEORIGIN");
		
		 if (request instanceof HttpServletRequest) {  
             HttpServletRequest httpRequest = (HttpServletRequest) request;  
               
             //取的url相对地址  
             String url = httpRequest.getRequestURI();    
  
             if (httpRequest.getSession() != null) {  
                // System.out.println("httpRequest.getSession().getId()"+ httpRequest.getSession().getId());  
                //--------复制 session到临时变量  
                 HttpSession session = httpRequest.getSession();  
                 HashMap old = new HashMap();  
                 Enumeration keys = (Enumeration) session.getAttributeNames();
                   
                 while (keys.hasMoreElements()){  
                     String key = (String) keys.nextElement();  
                     if (!NEW_SESSION_INDICATOR.equals(key)){  
                         old.put(key, session.getAttribute(key));
                         // session.removeAttribute(key);
                     }  
                 }

                 /*for (Object key : old.keySet()) {
                     session.removeAttribute((String) key);
                 }*/


                 if (httpRequest.getMethod().equals("POST") && httpRequest.getSession() != null   
                         && !httpRequest.getSession().isNew() && httpRequest.getRequestURI().endsWith(url)){  
                     session.invalidate();  
                     session=httpRequest.getSession(true);  
                     logger.debug("new Session:" + session.getId());  
                 }  
                   
                //-----------------复制session  
                 for (Iterator it = old.entrySet().iterator(); it.hasNext();) {  
                     Map.Entry entry = (Entry) it.next();  
                     session.setAttribute((String) entry.getKey(), entry.getValue());  
                 }  
             }  
         }  
           
         chain.doFilter(request, httpResponse);  
    }  
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
	}
	
	@Override
	public void destroy() {
	}

}
