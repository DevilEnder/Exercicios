package br.edu.unifaj.cc.poo.aula5;

import java.util.ArrayList;
import java.util.List;

public class Alocacao {
    private ItemPatrimonio item;
    private List<Funcionario> funcionarios;

    public Alocacao(ItemPatrimonio item, String observacao) {
        this.item         = item;
        this.funcionarios = new ArrayList<>();
    }

    public void adicionarFuncionario(Funcionario f) {
        funcionarios.add(f);
    }

    public void exibirAlocacao() {
        System.out.println("    Item alocado:");
        item.gerarRelatorio();
        System.out.println("    Funcionario(s) responsável(is):");
        for (Funcionario f : funcionarios) {
            f.exibirInfo();
        }
    }

    public ItemPatrimonio getItem()              {
        return item;
    }
    public List<Funcionario> getFuncionarios()   {
        return funcionarios;
    }
}//fim alocacao
