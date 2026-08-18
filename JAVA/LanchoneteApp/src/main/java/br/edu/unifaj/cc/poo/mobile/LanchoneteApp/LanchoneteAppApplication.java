package br.edu.unifaj.cc.poo.mobile.LanchoneteApp;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class LanchoneteAppApplication {

	public static void main(String[] args) {
		System.out.println("==========================================");
		System.out.println("  Lanchonete REST Server");
		System.out.println("  RA: 12529615 | Joao Gabriel Brandao");
		System.out.println("==========================================");
		SpringApplication.run(LanchoneteAppApplication.class, args);
	}

}
