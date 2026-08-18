package br.edu.unifaj.cc.poo.exercicio.deitel;

public class Aula6Exercicio711 {

    public static void main(String[] args) {
        System.out.println("RA: 12529615 | Nome: Joao Gabriel Brandao");
        System.out.println("=== Exercicio 7.11 - Operacoes em Arrays ===\n");

        int[] counts = new int[10];
        for (int i = 0; i < counts.length; i++) {
            counts[i] = 0;
        }
        System.out.println("a) Array 'counts' com 10 zeros:");
        for (int i = 0; i < counts.length; i++) {
            System.out.printf("counts[%d] = %d%n", i, counts[i]);
        }

        int[] bonus = new int[15];
        for (int i = 0; i < bonus.length; i++) {
            bonus[i] += 1;
        }
        System.out.println("\nb) Array 'bonus' com 15 elementos apos adicionar 1:");
        for (int i = 0; i < bonus.length; i++) {
            System.out.printf("bonus[%d] = %d%n", i, bonus[i]);
        }

        int[] bestScores = {95, 87, 76, 91, 83};
        System.out.println("\nc) Array 'bestScores' em formato de coluna:");
        System.out.println("Posicao | Valor");
        System.out.println("--------+------");
        for (int i = 0; i < bestScores.length; i++) {
            System.out.printf("   %d    |  %d%n", i, bestScores[i]);
        }
    }
}
