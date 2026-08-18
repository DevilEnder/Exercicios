package br.edu.unifaj.cc.poo.aula5;

import java.util.Arrays;
import java.util.List;

public class Main {

    public static void main(String[] args) {
        System.out.println("________________________________________");
        System.out.println("  SISTEMA DE INVENTARIO - InventarioProj");
        System.out.println("  RA: 12529615 | Aluno: Joao Gabriel Brandao");

        Funcionario f1 = new Funcionario(
            "Ana Lima mey", "111.222.333-44", "ana.lima@empresa.com",
            "F001", "Analista de TI"
        );
        Funcionario f2 = new Funcionario(
            "Carlos Alberto", "222.333.444-55", "carlos.souza@empresa.com",
            "F002", "Gerente Comercial"
        );

        Cliente cl1 = new Cliente(
            "Beatriz beatrizes", "333.444.555-66", "beatriz@email.com",
            "(11) 91234-5678"
        );
        Cliente cl2 = new Cliente(
            "Roberto Carlos", "444.555.666-77", "roberto@email.com",
            "(11) 98765-4321"
        );

        Movel m1 = new Movel(
             1200.00, "MOV-A1", "Mesa escritorio 6 lugares", "MDF"
        );
        Movel m2 = new Movel(
            350.00, "MOV-B2", "Cadeira ergonomica", "Tecido"
        );

        Alocacao aloc1 = new Alocacao(m1, "Mesa principal sala de reunioes");
        aloc1.adicionarFuncionario(f1);
        aloc1.adicionarFuncionario(f2);

        Alocacao aloc2 = new Alocacao(m2, "Cadeira de uso exclusivo");
        aloc2.adicionarFuncionario(f1);

        Contrato co1 = new Contrato(
            "CT-2025-001", 85000.00,  f1, cl1
        );

        ContaMarketing ct1 = new ContaMarketing(
            "Instagram",  "Carlos Souza", f2, cl2
        );

        List<ItemPatrimonio> todosItens = Arrays.asList(m1, m2);
        RelatorioGeral relatorio = new RelatorioGeral(todosItens);

        System.out.println("--- FUNCIONARIOS ---");
        f1.exibirInfo();
        f2.exibirInfo();

        System.out.println("\n--- CLIENTES ---");
        cl1.exibirInfo();
        cl2.exibirInfo();

        System.out.println("\n--- ALOCACOES DE PATRIMONIO ---");
        System.out.println("\n[Alocacao 1]");
        aloc1.exibirAlocacao();
        System.out.println("\n[Alocacao 2]");
        aloc2.exibirAlocacao();

        System.out.println("\n--- CONTRATOS ---");
        co1.exibirContrato();

        System.out.println("\n--- CONTAS MARKETING ---");
        ct1.exibirConta();

        System.out.println("\n--- RELATORIO GERAL DE PATRIMONIO ---");
        relatorio.gerarRelatorio();

        System.out.println("\n==============================================");
        System.out.println("  FIM DO RELATORIO");
        System.out.println("  RA: 12529615 | Joao Gabriel Brandao");
        System.out.println("==============================================");
    }
}
