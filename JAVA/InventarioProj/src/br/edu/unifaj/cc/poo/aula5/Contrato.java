package br.edu.unifaj.cc.poo.aula5;

public class Contrato {
    private String numero;
    private double valor;
    private Funcionario funcionario;
    private Cliente cliente;

    public Contrato(String numero, double valor, Funcionario funcionario, Cliente cliente) {
        this.numero      = numero;
        this.valor       = valor;
        this.funcionario = funcionario;
        this.cliente     = cliente;
    }

    public void exibirContrato() {
        System.out.println("  [Contrato] Nº " + numero
            + " | Valor: R$ " + String.format("%.2f", valor));
        System.out.println("    Funcionário:");
        funcionario.exibirInfo();
        System.out.println("    Cliente:");
        cliente.exibirInfo();
    }

    public String getNumero()         {
        return numero;
    }
    public double getValor()          {
        return valor;
    }
    public Funcionario getFuncionario() {
        return funcionario;
    }
    public Cliente getCliente()         {
        return cliente;
    }
}
