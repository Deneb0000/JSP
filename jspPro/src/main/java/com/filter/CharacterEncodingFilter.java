package com.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class CharacterEncodingFilter implements Filter{
	private String encoding;

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		System.out.println(">CharacterEncodingFilter.init()...");
		//web.xml	init-param UTF-8
		this.encoding =	filterConfig.getInitParameter("encoding");
		if( this.encoding == null ) this.encoding = "UTF-8";	// 기본값을 UTF-8로 설정한 안전장치(?)
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		System.out.println(">CharacterEncodingFilter.doFillter()... ");
		
		request.setCharacterEncoding(encoding);
		chain.doFilter(request, response);
		
	}
	
	@Override
	public void destroy() {
		System.out.println(">CharacterEncodingFilter.destroy()...");
	}


}
