package br.edu.unifaj.cc.poo.aula5;

public class Funcionario extends Pessoa {
    private String matricula;
    private String cargo;

    public Funcionario(String nome, String cpf, String email,String matricula, String cargo) {
        super(nome, cpf, email);
        this.matricula    = matricula;
        this.cargo        = cargo;
    }

    @Override
    public void exibirInfo() {
        System.out.println("  [Funcionario] " + getNome()
            + " | Matrícula: " + matricula
            + " | Cargo: " + cargo
            + " | CPF: " + getCpf()
            + " | Email: " + getEmail());
    }

    public String getMatricula()    { return matricula; }
    public String getCargo()        { return cargo; }
}
