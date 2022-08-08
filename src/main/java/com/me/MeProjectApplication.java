package com.me;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan(basePackages = "com.me.mapper")
public class MeProjectApplication {

	public static void main(String[] args) {
		SpringApplication.run(MeProjectApplication.class, args);
	}

}
