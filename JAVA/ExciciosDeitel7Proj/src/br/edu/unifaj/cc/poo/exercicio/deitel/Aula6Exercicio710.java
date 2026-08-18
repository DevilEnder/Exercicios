package br.edu.unifaj.cc.poo.exercicio.deitel;

import java.util.Scanner;

public class Aula6Exercicio710 {

    public static void main(String[] args) {
        System.out.println("RA: 12529615 | Nome: Joao Gabriel Brandao");
        System.out.println("=== Exercicio 7.10 - Comissoes de Vendas ===\n");

        int[] contadores = new int[9];
        Scanner scanner = new Scanner(System.in);

        System.out.println("Digite as vendas brutas semanais (0 para encerrar):");

        double vendas;
        while (true) {
            System.out.print("Vendas brutas (R$): ");
            vendas = scanner.nextDouble();
            if (vendas <= 0)
                break;

            int salario = (int) (200 + 0.09 * vendas);

            if      (salario <= 299) contadores[0]++;
            else if (salario <= 399) contadores[1]++;
            else if (salario <= 499) contadores[2]++;
            else if (salario <= 599) contadores[3]++;
            else if (salario <= 699) contadores[4]++;
            else if (salario <= 799) contadores[5]++;
            else if (salario <= 899) contadores[6]++;
            else if (salario <= 999) contadores[7]++;
            else                     contadores[8]++;
        }

        System.out.println("\n--- Resultado ---");
        System.out.printf("%-20s %s%n", "Intervalo (R$)", "Vendedores");
        System.out.println("----------------------------");

        String[] intervalos = {
            "200 - 299", "300 - 399", "400 - 499",
            "500 - 599", "600 - 699", "700 - 799",
            "800 - 899", "900 - 999", "1000 e acima"
        };

        for (int i = 0; i < contadores.length; i++) {
            System.out.printf("%-20s %d%n", intervalos[i], contadores[i]);
        }

        scanner.close();
    }
}
