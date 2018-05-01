package com.kirin;

import com.fr.web.ReportServlet;
import com.kirin.modules.report.servlet.MyReportServlet;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.boot.web.servlet.ServletRegistrationBean;
import org.springframework.boot.web.support.SpringBootServletInitializer;
import org.springframework.context.annotation.Bean;


@SpringBootApplication
@ServletComponentScan
public class KirinApplication extends SpringBootServletInitializer {

	public static void main(String[] args) {
		SpringApplication.run(KirinApplication.class, args);
	}

	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(KirinApplication.class);
	}

//	@Bean
//	public ServletRegistrationBean servletRegistrationBean() {
//		return new ServletRegistrationBean(new ReportServlet(), "/ReportServer");
////		return new ServletRegistrationBean(new MyReportServlet(), "/ReportServer");
//	}

}
