package com.kh.final6.configuration;

import org.springframework.context.annotation.Bean;

import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;


@EnableSwagger2 //swagger에서 사용하는 자원들을 활성화 시키는 옵션
public class SwaggerCustomConfiguration {

	
//	//<bean id="passwordEncoder" class="????.BCryptPasswordEncoder"/>
//	@Bean
//	public BCryptPasswordEncoder passwordEncoder() {
//		return new BCryptPasswordEncoder();
//	}
	
	//<bean ic="api" class="springfox.documentation.spring.web.plugins.Docket"/>
	@Bean
	public Docket api() {
		return new Docket(DocumentationType.SWAGGER_2) //문서화 유형 설정
							.select() //추임새
//								.apis(RequestHandlerSelectors.any()) //분석할 패키지 유형
								.apis(RequestHandlerSelectors.basePackage("com.kh.final6.rest")) //패키지 특정
//								.apis(RequestHandlerSelectors.withClassAnnotation(RestController.class)) //특정 클래스
								.paths(PathSelectors.any()) //분석할 주소 유형
							.build()
								.apiInfo( //문서의 대표정보
										new ApiInfoBuilder()
														.title("Final6 REST API")
														.description("제작한 홈페이지 내부 REST API")
														.version("0.0.1")
														.license("MIT License")
													.build()
										)
								.useDefaultResponseMessages(false) //기본메세지 OFF
								;
	}


}
