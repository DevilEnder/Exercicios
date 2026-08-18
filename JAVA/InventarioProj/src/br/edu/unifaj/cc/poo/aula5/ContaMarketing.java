package br.edu.unifaj.cc.poo.aula5;

public class ContaMarketing {
    private String plataforma;
    private String responsavel;
    private Funcionario funcionario;
    private Cliente cliente;

    public ContaMarketing(String plataforma, String responsavel,Funcionario funcionario, Cliente cliente) {
        this.plataforma  = plataforma;
        this.responsavel = responsavel;
        this.funcionario = funcionario;
        this.cliente     = cliente;
    }

    public void exibirConta() {
        System.out.println("  ContaMarketing, Plataforma: " + plataforma + " | Responsável: " + responsavel);
        System.out.println("    Funcionário:");
        funcionario.exibirInfo();
        System.out.println("    Cliente:");
        cliente.exibirInfo();
    }

    public String getPlataforma()     {
        return plataforma;
    }
    public Funcionario getFuncionario() {
        return funcionario;
    }
    public Cliente getCliente()         {
        return cliente;
    }
}
