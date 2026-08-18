package br.edu.unifaj.cc.poo.exercicio.deitel;

import java.util.Random;

public class Aula6Exercicio717 {

    public static void main(String[] args) {
        System.out.println("RA: 12529615 | Nome: Joao Gabriel Brandao");
        System.out.println("=== Exercicio 7.17 - Jogo de Dados ===\n");

        Random random = new Random();
        final int LANCAMENTOS = 36_000_000;

        int[] contagem = new int[13];

        System.out.println("Simulando " + LANCAMENTOS + " lancamentos de dois dados...");

        for (int i = 0; i < LANCAMENTOS; i++) {
            int dado1 = 1 + random.nextInt(6);
            int dado2 = 1 + random.nextInt(6);
            contagem[dado1 + dado2]++;
        }

        System.out.println("Concluido!\n");

        System.out.printf("%-8s %-15s %-15s%n", "Soma", "Frequencia", "Percentual (%)");
        System.out.println("-".repeat(42));

        for (int soma = 2; soma <= 12; soma++) {
            double percentual = (double) contagem[soma] / LANCAMENTOS * 100;
            System.out.printf("%-8d %-15d %.2f%%%n", soma, contagem[soma], percentual);
        }

        System.out.println("\nNota: A soma 7 deve ser a mais frequente (~16.67%)");
        System.out.println("      As somas 2 e 12 devem ser as menos frequentes (~2.78%)");
    }
}
