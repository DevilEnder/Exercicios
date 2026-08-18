package br.edu.unifaj.cc.poo.exercicio.deitel;

public class Aula6Exercicio714 {

    public static long product(int... numeros) {
        long resultado = 1;
        for (int n : numeros) {
            resultado *= n;
        }
        return resultado;
    }

    public static void main(String[] args) {
        System.out.println("RA: 12529615 | Nome: Joao Gabriel Brandao");
        System.out.println("=== Exercicio 7.14 - Varargs: Produto de Inteiros ===\n");


        System.out.printf("product(2)             = %d%n", product(2));
        System.out.printf("product(2, 3)           = %d%n", product(2, 3));
        System.out.printf("product(2, 3, 4)        = %d%n", product(2, 3, 4));
        System.out.printf("product(1, 2, 3, 4, 5)  = %d%n", product(1, 2, 3, 4, 5));
        System.out.printf("product(5, 10, 2)       = %d%n", product(5, 10, 2));
        System.out.printf("product(3, 3, 3, 3)     = %d%n", product(3, 3, 3, 3));
        System.out.printf("product()               = %d%n", product());
    }
}
