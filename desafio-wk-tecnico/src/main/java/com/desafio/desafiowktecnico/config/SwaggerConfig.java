package com.desafio.desafiowktecnico.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import io.swagger.v3.oas.models.OpenAPI;
import io.swagger.v3.oas.models.info.Contact;
import io.swagger.v3.oas.models.info.Info;
import io.swagger.v3.oas.models.info.License;

@Configuration
public class SwaggerConfig {

	@Bean
	public OpenAPI DesafioOpenAPI() {
		return new OpenAPI().info(new Info()
				.title("API do Desafio técnico Wk")
				.description("Esta API é utilizada no desafio ténico da Wk ").version("v0.0.1")
				.contact(new Contact().name("Marcos Vinicius Sousa do Rosário").email("rosario.marcosv@gmail.com"))
				.license(new License().name("Apache 2.0").url("http://springdoc.org")));
	}
}
