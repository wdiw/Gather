package com.Gather;

import javax.servlet.Filter;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.filter.HiddenHttpMethodFilter;

@SpringBootApplication
public class GatherApplication {

	public static void main(String[] args) {
		SpringApplication.run(GatherApplication.class, args);
		System.out.println("test");
	}

	@Bean
	FilterRegistrationBean<Filter> hiddenHttpMethodFilter() {
		FilterRegistrationBean<Filter> filterBean = new FilterRegistrationBean<>();
		filterBean.setFilter(new HiddenHttpMethodFilter());
		return filterBean;
	}


}
