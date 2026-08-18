package br.edu.unifaj.cc.poo.exercicio.deitel;

public class Aula6Exercicio713 {

    public static void main(String[] args) {
        System.out.println("RA: 12529615 | Nome: Joao Gabriel Brandao");
        System.out.println("=== Exercicio 7.13 - Array Bidimensional 3x5 ===\n");

        int[][] sales = new int[3][5];
        int ordem = 1;

        int[][] rotulos = new int[3][5];
        for (int row = 0; row < sales.length; row++) {
            for (int col = 0; col < sales[row].length; col++) {
                sales[row][col] = 0;
                rotulos[row][col] = ordem++;
            }
        }

        System.out.println("Ordem em que os elementos sao configurados como zero:");
        System.out.println();
        System.out.printf("%-10s", "");
        for (int col = 0; col < 5; col++) {
            System.out.printf("col%-7d", col);
        }
        System.out.println();
        System.out.println("-".repeat(45));

        for (int row = 0; row < 3; row++) {
            System.out.printf("row %-6d", row);
            for (int col = 0; col < 5; col++) {
                System.out.printf("%-10d", rotulos[row][col]);
            }
            System.out.println();
        }

        System.out.println("\nOs elementos sao zerados linha por linha, da esquerda para direita.");
        System.out.println("Primeiro elemento zerado: sales[0][0] (ordem 1)");
        System.out.println("Ultimo elemento zerado:   sales[2][4] (ordem 15)");
    }
}
