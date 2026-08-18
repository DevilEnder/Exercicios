package br.edu.unifaj.cc.poo.exercicio.deitel;

public class Aula6Exercicio715 {

    public static void main(String[] args) {
        System.out.println("RA: 12529615 | Nome: Joao Gabriel Brandao");
        System.out.println("=== Exercicio 7.15 - Argumentos de Linha de Comando ===\n");

        int tamanho;

        if (args.length > 0) {
            try {
                tamanho = Integer.parseInt(args[0]);
                System.out.println("Tamanho lido da linha de comando: " + tamanho);
            } catch (NumberFormatException e) {
                System.out.println("Argumento invalido. Usando tamanho padrao: 10");
                tamanho = 10;
            }
        } else {
            tamanho = 10;
            System.out.println("Nenhum argumento fornecido. Usando tamanho padrao: " + tamanho);
        }

        int[] array = new int[tamanho];
        for (int i = 0; i < array.length; i++) {
            array[i] = 2 + 2 * i;
        }

        System.out.println("\nIndice  Valor");
        System.out.println("-------------");
        for (int i = 0; i < array.length; i++) {
            System.out.printf("%-8d%d%n", i, array[i]);
        }
    }
}
