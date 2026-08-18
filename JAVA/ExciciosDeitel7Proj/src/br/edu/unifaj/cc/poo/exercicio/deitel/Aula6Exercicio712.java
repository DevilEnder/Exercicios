package br.edu.unifaj.cc.poo.exercicio.deitel;

import java.util.Scanner;

public class Aula6Exercicio712 {

    public static void main(String[] args) {
        System.out.println("RA: 12529615 | Nome: Joao Gabriel Brandao");
        System.out.println("=== Exercicio 7.12 - Eliminacao de Duplicatas ===\n");

        int[] unicos = new int[5];
        int totalUnicos = 0;
        Scanner scanner = new Scanner(System.in);

        System.out.println("Digite 5 numeros entre 10 e 100:");

        for (int i = 0; i < 5; i++) {
            System.out.printf("Numero %d: ", i + 1);
            int numero = scanner.nextInt();

            if (numero < 10 || numero > 100) {
                System.out.println("  Numero fora do intervalo (10-100), ignorado.");
                i--;
                continue;
            }

            boolean duplicado = false;
            for (int j = 0; j < totalUnicos; j++) {
                if (unicos[j] == numero) {
                    duplicado = true;
                    break;
                }
            }

            if (!duplicado) {
                unicos[totalUnicos++] = numero;
                System.out.println("  Numero aceito!");
            } else {
                System.out.println("  Duplicado! Numero ignorado.");
            }

            System.out.print("  Valores unicos ate agora: ");
            for (int j = 0; j < totalUnicos; j++) {
                System.out.print(unicos[j] + " ");
            }
            System.out.println();
        }

        System.out.println("\n--- Conjunto final de valores unicos ---");
        for (int i = 0; i < totalUnicos; i++) {
            System.out.print(unicos[i] + " ");
        }
        System.out.println();

        scanner.close();
    }
}
