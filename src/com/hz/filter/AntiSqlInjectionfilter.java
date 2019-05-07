package com.hz.filter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

public class AntiSqlInjectionfilter implements Filter {

	// 用于创建MultipartHttpServletRequest
	// private MultipartResolver multipartResolver = null;

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		// MultipartResolver multipartResolver = ((MultipartResolver)
		// ApplicationContextUtil
		// .getContext().getBean("multipartResolver",
		// MultipartResolver.class));

		if (request instanceof HttpServletRequest) {
			String urlPath = ((HttpServletRequest) request).getServletPath();

			// 过滤上传图片
			if (urlPath.indexOf("/file/upload") >= 1) {
				chain.doFilter(request, response);
				return ;
			} else {
				CommonsMultipartResolver commonsMultipartResolver = new CommonsMultipartResolver();
				MultipartResolver multipartResolver = (MultipartResolver) commonsMultipartResolver;
				ServletRequest req = null;
				String enctype = request.getContentType();
				if (StringUtils.isNotBlank(enctype)
						&& enctype.contains("multipart/form-data")) {
					req = (multipartResolver
							.resolveMultipart((HttpServletRequest) request));
				} else {
					req = (HttpServletRequest) request;
				}
				HttpServletResponse res = (HttpServletResponse) response;
				// 获得所有请求参数名
				Enumeration params = req.getParameterNames();
				String sql = "";
				List<String> list=new ArrayList<String>();
				list.add("studycontent");
				list.add("deeds");
				list.add("content");
				list.add("measure");
				list.add("progress");
				list.add("introduce");
				while (params.hasMoreElements()) {
					// 得到参数名
					String name = params.nextElement().toString();
					if(!list.contains(name)){
						// 得到参数对应值
						String[] value = req.getParameterValues(name);
						for (int i = 0; i < value.length; i++) {
							sql = sql + value[i];
						}
					}
				}
				// 有sql关键字，跳转到error.html
				if (sqlValidate(sql)) {
					throw new IOException("您发送请求中的参数中含有非法字符：" + sql);
				} else {
					chain.doFilter(req, res);
				}
			}
		}
	}

	@Override
	public void destroy() {
	}

	// 效验
	protected static boolean sqlValidate(String str) {
		str = str.toLowerCase();// 统一转为小写
		String badStr = "'|select|update|delete|insert|truncate|char|into"
				+ "|substr|declare|exec|master|drop|execute|"
				+ "union|;|--|#|*|$|\"|<|>";// 过滤掉的sql关键字，可以手动添加
		String[] badStrs = badStr.split("\\|");
		for (int i = 0; i < badStrs.length; i++) {
			if (str.indexOf(badStrs[i]) >= 0) {
				return true;
			}
		}
		return false;
	}

}
