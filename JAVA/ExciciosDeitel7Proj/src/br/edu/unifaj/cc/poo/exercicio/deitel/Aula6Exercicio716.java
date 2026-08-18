package br.edu.unifaj.cc.poo.exercicio.deitel;

public class Aula6Exercicio716 {

    public static void main(String[] args) {
        System.out.println("RA: 12529615 | Nome: Joao Gabriel Brandao");
        System.out.println("=== Exercicio 7.16 - For Aprimorado com Doubles ===\n");

        if (args.length == 0) {
            System.out.println("Nenhum argumento fornecido. Demonstrando com valores fixos:");
            double[] valores = {1.5, 2.3, 4.7, 3.0, 5.5};
            double soma = 0.0;

            System.out.println("Valores:");
            for (double v : valores) {
                System.out.printf("  %.2f%n", v);
                soma += v;
            }
            System.out.printf("%nSoma total: %.2f%n", soma);

        } else {

            double soma = 0.0;
            System.out.println("Valores recebidos:");

            for (String arg : args) {
                double valor = Double.parseDouble(arg);
                System.out.printf("  %.2f%n", valor);
                soma += valor;
            }

            System.out.printf("%nSoma total: %.2f%n", soma);
        }
    }
}
