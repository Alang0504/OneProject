package com.ssm.controller.converter;

import org.springframework.core.convert.converter.Converter;

public class CustomStringConverter implements Converter<String, String>{

	public String convert(String source) {
		try {
			//去掉字符串两边空格，如果去除后为空设置为null
			if(source!=null){
				source = source.trim();
				if(source.equals("")){
					return null;
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return source;
	}

}
